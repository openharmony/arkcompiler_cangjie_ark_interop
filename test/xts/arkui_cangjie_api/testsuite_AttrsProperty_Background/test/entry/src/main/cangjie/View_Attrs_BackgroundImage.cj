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
class View_EmptyAttrs_BackgroundImage {
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
                    ObservedArrayList<(String, Any, String)>(BackgroundImage_Prop_List),
                    itemGeneratorFunc: {
                        BackgroundImage_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("AlphabetIndexer : ${BackgroundImage_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("AlphabetIndexer : ${BackgroundImage_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Blank : ${BackgroundImage_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Blank : ${BackgroundImage_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Button : ${BackgroundImage_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Button : ${BackgroundImage_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Checkbox : ${BackgroundImage_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Checkbox : ${BackgroundImage_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("CheckboxGroup : ${BackgroundImage_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("CheckboxGroup : ${BackgroundImage_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("DataPanel : ${BackgroundImage_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("DataPanel : ${BackgroundImage_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("DatePicker : ${BackgroundImage_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("DatePicker : ${BackgroundImage_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Divider : ${BackgroundImage_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Divider : ${BackgroundImage_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Gauge : ${BackgroundImage_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Gauge : ${BackgroundImage_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Image : ${BackgroundImage_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Image : ${BackgroundImage_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "ImageSpan") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("ImageSpan : ${BackgroundImage_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                        )
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("ImageSpan : ${BackgroundImage_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow(
                                            ))[1]
                                        )
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("LoadingProgress : ${BackgroundImage_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("LoadingProgress : ${BackgroundImage_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Menu : ${BackgroundImage_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Menu : ${BackgroundImage_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("MenuItem : ${BackgroundImage_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundImage_Prop[0])
                                            .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                                ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("MenuItem : ${BackgroundImage_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundImage_Prop[0])
                                            .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat))
                                                    .getOrThrow())[0],
                                                ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat))
                                                    .getOrThrow())[1]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("MenuItemGroup : ${BackgroundImage_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("MenuItemGroup : ${BackgroundImage_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow(
                                            ))[1]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Progress : ${BackgroundImage_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Progress : ${BackgroundImage_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("QRCode : ${BackgroundImage_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("QRCode : ${BackgroundImage_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Radio : ${BackgroundImage_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Radio : ${BackgroundImage_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Rating : ${BackgroundImage_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Rating : ${BackgroundImage_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Refresh : ${BackgroundImage_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Refresh : ${BackgroundImage_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("RichEditor : ${BackgroundImage_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("RichEditor : ${BackgroundImage_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("RichText : ${BackgroundImage_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("RichText : ${BackgroundImage_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("RowSplit : ${BackgroundImage_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("RowSplit : ${BackgroundImage_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("ScrollBar : ${BackgroundImage_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("ScrollBar : ${BackgroundImage_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Search : ${BackgroundImage_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Search : ${BackgroundImage_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Slider : ${BackgroundImage_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Slider : ${BackgroundImage_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Stepper : ${BackgroundImage_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Stepper : ${BackgroundImage_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("StepperItem : ${BackgroundImage_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("StepperItem : ${BackgroundImage_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow(
                                            ))[1]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Text : ${BackgroundImage_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Text : ${BackgroundImage_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("TextArea : ${BackgroundImage_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("TextArea : ${BackgroundImage_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("TextClock : ${BackgroundImage_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("TextClock : ${BackgroundImage_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("TextInput : ${BackgroundImage_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("TextInput : ${BackgroundImage_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("TextPicker : ${BackgroundImage_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("TextPicker : ${BackgroundImage_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("TextTimer : ${BackgroundImage_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("TextTimer : ${BackgroundImage_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Toggle : ${BackgroundImage_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Toggle : ${BackgroundImage_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Web : ${BackgroundImage_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Web : ${BackgroundImage_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Select : ${BackgroundImage_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Select : ${BackgroundImage_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Badge : ${BackgroundImage_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Badge : ${BackgroundImage_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Column : ${BackgroundImage_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Column : ${BackgroundImage_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Grid : ${BackgroundImage_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Grid : ${BackgroundImage_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("GridItem : ${BackgroundImage_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("GridItem : ${BackgroundImage_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow(
                                            ))[1]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("GridRow : ${BackgroundImage_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("GridRow : ${BackgroundImage_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("GridCol : ${BackgroundImage_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("GridCol : ${BackgroundImage_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow(
                                            ))[1]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Flex : ${BackgroundImage_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Flex : ${BackgroundImage_Prop[0]}")
                                Flex(){
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("List : ${BackgroundImage_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("List : ${BackgroundImage_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("ListItem : ${BackgroundImage_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundImage_Prop[0])
                                            .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                                ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("ListItem : ${BackgroundImage_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundImage_Prop[0])
                                            .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat))
                                                    .getOrThrow())[0],
                                                ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat))
                                                    .getOrThrow())[1]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("ListItemGroup : ${BackgroundImage_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("ListItemGroup : ${BackgroundImage_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow(
                                            ))[1]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("RelativeContainer : ${BackgroundImage_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("RelativeContainer : ${BackgroundImage_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Row : ${BackgroundImage_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Row : ${BackgroundImage_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Scroll : ${BackgroundImage_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Scroll : ${BackgroundImage_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Stack : ${BackgroundImage_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Stack : ${BackgroundImage_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Swiper : ${BackgroundImage_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Swiper : ${BackgroundImage_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Tabs : ${BackgroundImage_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Tabs : ${BackgroundImage_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "TabContent") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("TabContent : ${BackgroundImage_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("TabContent : ${BackgroundImage_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundImage_Prop[0])
                                        .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                            ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow(
                                            ))[1]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Circle : ${BackgroundImage_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Circle : ${BackgroundImage_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Line : ${BackgroundImage_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Line : ${BackgroundImage_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Rect : ${BackgroundImage_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Rect : ${BackgroundImage_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Shape : ${BackgroundImage_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Shape : ${BackgroundImage_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (BackgroundImage_Prop[1] is (String, ImageRepeat)) {
                                Text("Path : ${BackgroundImage_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (String, ImageRepeat)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImage_Prop[1] is (AppResource, ImageRepeat)) {
                                Text("Path : ${BackgroundImage_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + BackgroundImage_Prop[0])
                                    .backgroundImage(((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[0],
                                        ((BackgroundImage_Prop[1] as (AppResource, ImageRepeat)).getOrThrow())[1]
                                    )
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
