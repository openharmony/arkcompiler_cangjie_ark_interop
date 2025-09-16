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
class View_EmptyAttrs_Border {
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
                    ObservedArrayList<(String, Any, String, String, String)>(Border_Prop_List),
                    itemGeneratorFunc: {
                        Border_Prop: (String, Any, String, String, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Blank(min: 10)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Blank(min: 10)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Checkbox()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Checkbox()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                CheckboxGroup()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                CheckboxGroup()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                DataPanel(values: [30.0])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                DataPanel(values: [30.0])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                DatePicker()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                DatePicker()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Divider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Divider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "ImageSpan") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[0],
                                            color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[1],
                                            radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[3]
                                        )
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[0],
                                            color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[1],
                                            radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[3]
                                        )
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                LoadingProgress()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                LoadingProgress()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + Border_Prop[0])
                                            .border(
                                                width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                    .getOrThrow())[0],
                                                color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                    .getOrThrow())[1],
                                                radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                    .getOrThrow())[2],
                                                style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                    .getOrThrow())[3]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + Border_Prop[0])
                                            .border(
                                                width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                    .getOrThrow())[0],
                                                color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                    .getOrThrow())[1],
                                                radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                    .getOrThrow())[2],
                                                style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                    .getOrThrow())[3]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[0],
                                            color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[1],
                                            radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[0],
                                            color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[1],
                                            radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Progress(value: 10.0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Progress(value: 10.0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                QRCode(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                QRCode(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Radio(group: "1", value: "A")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Radio(group: "1", value: "A")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Rating(rating: 3.5, indicator: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Rating(rating: 3.5, indicator: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                RichEditor(richEditorController)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                RichEditor(richEditorController)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
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
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
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
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
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
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
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
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Search(value: "", placeholder: "Type to search")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Search(value: "", placeholder: "Type to search")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Slider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Slider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[0],
                                            color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[1],
                                            radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[0],
                                            color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[1],
                                            radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Text(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Text(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                TextArea(text: targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                TextArea(text: targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                TextClock()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                TextClock()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                TextInput(placeholder: "TextInput")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                TextInput(placeholder: "TextInput")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Toggle(ToggleType.Switch, isOn: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Toggle(ToggleType.Switch, isOn: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[0],
                                            color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[1],
                                            radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[0],
                                            color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[1],
                                            radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[0],
                                            color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[1],
                                            radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[0],
                                            color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[1],
                                            radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
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
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
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
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + Border_Prop[0])
                                            .border(
                                                width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                    .getOrThrow())[0],
                                                color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                    .getOrThrow())[1],
                                                radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                    .getOrThrow())[2],
                                                style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                    .getOrThrow())[3]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + Border_Prop[0])
                                            .border(
                                                width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                    .getOrThrow())[0],
                                                color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                    .getOrThrow())[1],
                                                radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                    .getOrThrow())[2],
                                                style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                    .getOrThrow())[3]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[0],
                                            color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[1],
                                            radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[0],
                                            color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[1],
                                            radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "TabContent") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[0],
                                            color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[1],
                                            radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow(
                                            ))[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + Border_Prop[0])
                                        .border(
                                            width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[0],
                                            color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[1],
                                            radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[2],
                                            style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                                .getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Circle()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Circle()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Rect()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Rect()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (Border_Prop[1] is (Length, Color, Length, BorderStyle)) {
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, Color, Length, BorderStyle)).getOrThrow())[3]
                                    )
                            } else if (Border_Prop[1] is (Length, AppResource, Length, BorderStyle)) {
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Border_Prop[0])
                                    .border(
                                        width: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[0],
                                        color: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[1],
                                        radius: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[2],
                                        style: ((Border_Prop[1] as (Length, AppResource, Length, BorderStyle))
                                            .getOrThrow())[3]
                                    )
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
