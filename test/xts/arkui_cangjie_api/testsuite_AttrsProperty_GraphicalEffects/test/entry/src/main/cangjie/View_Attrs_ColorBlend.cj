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
class View_EmptyAttrs_ColorBlend {
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
                    ObservedArrayList<(String, Any, String)>(ColorBlend_Prop_List),
                    itemGeneratorFunc: {
                        ColorBlend_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "ImageSpan") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                        .width(150)
                                        .height(50)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                        .width(150)
                                        .height(50)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                        .width(150)
                                        .height(50)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + ColorBlend_Prop[0])
                                            .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                            .width(150)
                                            .height(50)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + ColorBlend_Prop[0])
                                            .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                            .width(150)
                                            .height(50)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + ColorBlend_Prop[0])
                                            .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                            .width(150)
                                            .height(50)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
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
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
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
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
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
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
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
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
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
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
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
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
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
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
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
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
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
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
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
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
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
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
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
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + ColorBlend_Prop[0])
                                            .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                            .width(150)
                                            .height(50)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + ColorBlend_Prop[0])
                                            .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                            .width(150)
                                            .height(50)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + ColorBlend_Prop[0])
                                            .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                            .width(150)
                                            .height(50)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "TabContent") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + ColorBlend_Prop[0])
                                        .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (ColorBlend_Prop[1] is Color) {
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as Color).getOrThrow())
                            } else if (ColorBlend_Prop[1] is AppResource) {
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as AppResource).getOrThrow())
                            } else if (ColorBlend_Prop[1] is UInt32) {
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ColorBlend_Prop[0])
                                    .colorBlend((ColorBlend_Prop[1] as UInt32).getOrThrow())
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
