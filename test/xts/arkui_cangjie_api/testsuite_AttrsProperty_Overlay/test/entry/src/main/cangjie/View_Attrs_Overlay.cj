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
class View_EmptyAttrs_Overlay {
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
                    ObservedArrayList<(String, (String, Alignment, OverlayOffset), String)>(Overlay_Prop_List),
                    itemGeneratorFunc: {
                        Overlay_Prop: (String, (String, Alignment, OverlayOffset), String), idx: Int64 => if (this
                            .renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            Text("AlphabetIndexer : ${Overlay_Prop[0]}")
                            AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Blank") {
                            Text("Blank : ${Overlay_Prop[0]}")
                            Blank(min: 10)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Button") {
                            Text("Button : ${Overlay_Prop[0]}")
                            Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                .shape(ButtonType.Normal)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Checkbox") {
                            Text("Checkbox : ${Overlay_Prop[0]}")
                            Checkbox()
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "CheckboxGroup") {
                            Text("CheckboxGroup : ${Overlay_Prop[0]}")
                            CheckboxGroup()
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "DataPanel") {
                            Text("DataPanel : ${Overlay_Prop[0]}")
                            DataPanel(values: [30.0])
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "DatePicker") {
                            Text("DatePicker : ${Overlay_Prop[0]}")
                            DatePicker()
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Divider") {
                            Text("Divider : ${Overlay_Prop[0]}")
                            Divider()
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Gauge") {
                            Text("Gauge : ${Overlay_Prop[0]}")
                            Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Image") {
                            Text("Image : ${Overlay_Prop[0]}")
                            Image(@r(app.media.startIcon))
                                .objectFit(ImageFit.Contain)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "ImageSpan") {
                            Text("ImageSpan : ${Overlay_Prop[0]}")
                            Text() {
                                ImageSpan(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .id(this.targetView + Overlay_Prop[0])
                                    .overlay(
                                        value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                        align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                        offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                    )
                            }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "LoadingProgress") {
                            Text("LoadingProgress : ${Overlay_Prop[0]}")
                            LoadingProgress()
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Menu") {
                            Text("Menu : ${Overlay_Prop[0]}")
                            Menu() {
                                MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                    MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "MenuItem") {
                            Text("MenuItem : ${Overlay_Prop[0]}")
                            Menu() {
                                MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                    MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                        .id(this.targetView + Overlay_Prop[0])
                                        .overlay(
                                            value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                            align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                            offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow(
                                            ))[2]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "MenuItemGroup") {
                            Text("MenuItemGroup : ${Overlay_Prop[0]}")
                            Menu() {
                                MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                    MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Overlay_Prop[0])
                                    .overlay(
                                        value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                        align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                        offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                    )
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Progress") {
                            Text("Progress : ${Overlay_Prop[0]}")
                            Progress(value: 10.0)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "QRCode") {
                            Text("QRCode : ${Overlay_Prop[0]}")
                            QRCode(targetView)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Radio") {
                            Text("Radio : ${Overlay_Prop[0]}")
                            Radio(group: "1", value: "A")
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Rating") {
                            Text("Rating : ${Overlay_Prop[0]}")
                            Rating(rating: 3.5, indicator: false)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Refresh") {
                            Text("Refresh : ${Overlay_Prop[0]}")
                            Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "RichEditor") {
                            Text("RichEditor : ${Overlay_Prop[0]}")
                            RichEditor(richEditorController)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "RowSplit") {
                            Text("RowSplit : ${Overlay_Prop[0]}")
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
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "ScrollBar") {
                            Text("ScrollBar : ${Overlay_Prop[0]}")

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
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Search") {
                            Text("Search : ${Overlay_Prop[0]}")
                            Search(value: "", placeholder: "Type to search")
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Slider") {
                            Text("Slider : ${Overlay_Prop[0]}")
                            Slider()
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Stepper") {
                            Text("Stepper : ${Overlay_Prop[0]}")
                            Stepper(index:0) {
                                StepperItem() {
                                    Text("Page One")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "StepperItem") {
                            Text("StepperItem : ${Overlay_Prop[0]}")
                            Stepper(index:0) {
                                StepperItem() {
                                    Text("Page One")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Overlay_Prop[0])
                                    .overlay(
                                        value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                        align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                        offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                    )
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Text") {
                            Text("Text : ${Overlay_Prop[0]}")
                            Text(targetView)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "TextArea") {
                            Text("TextArea : ${Overlay_Prop[0]}")
                            TextArea(text: targetView)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "TextClock") {
                            Text("TextClock : ${Overlay_Prop[0]}")
                            TextClock()
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "TextInput") {
                            Text("TextInput : ${Overlay_Prop[0]}")
                            TextInput(placeholder: "TextInput")
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "TextPicker") {
                            Text("TextPicker : ${Overlay_Prop[0]}")
                            TextPicker(range:["apple", "banana", "orange", "peach"])
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "TextTimer") {
                            Text("TextTimer : ${Overlay_Prop[0]}")
                            TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Toggle") {
                            Text("Toggle : ${Overlay_Prop[0]}")
                            Toggle(ToggleType.Switch, isOn: false)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Web") {
                            Text("Web : ${Overlay_Prop[0]}")
                            Web(src: "www.baidu.com", controller: webController)
                                .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Select") {
                            Text("Select : ${Overlay_Prop[0]}")
                            Select(
                                [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                    SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                .value("Select")
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Badge") {
                            Text("Badge : ${Overlay_Prop[0]}")
                            Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                Button("message").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Column") {
                            Text("Column : ${Overlay_Prop[0]}")

                            Column() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Grid") {
                            Text("Grid : ${Overlay_Prop[0]}")
                            Grid (child:{=>
                                        GridItem ({=>
                                    Text("Message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            })
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "GridItem") {
                            Text("GridItem : ${Overlay_Prop[0]}")
                            Grid (child:{=>
                                        GridItem ({=>
                                    Text("Message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                })
                                    .id(this.targetView + Overlay_Prop[0])
                                    .overlay(
                                        value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                        align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                        offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                    )
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "GridRow") {
                            Text("GridRow : ${Overlay_Prop[0]}")
                            GridRow() {
                                GridCol() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "GridCol") {
                            Text("GridCol : ${Overlay_Prop[0]}")
                            GridRow() {
                                GridCol() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Overlay_Prop[0])
                                    .overlay(
                                        value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                        align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                        offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                    )
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Flex") {
                            Text("Flex : ${Overlay_Prop[0]}")
                            Flex() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "List") {
                            Text("List : ${Overlay_Prop[0]}")
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
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "ListItem") {
                            Text("ListItem : ${Overlay_Prop[0]}")
                            List() {
                                ListItemGroup() {
                                    ListItem() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[3])
                                    }
                                        .id(this.targetView + Overlay_Prop[0])
                                        .overlay(
                                            value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                            align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                            offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow(
                                            ))[2]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "ListItemGroup") {
                            Text("ListItemGroup : ${Overlay_Prop[0]}")
                            List() {
                                ListItemGroup() {
                                    ListItem() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[3])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Overlay_Prop[0])
                                    .overlay(
                                        value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                        align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                        offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                    )
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "RelativeContainer") {
                            Text("RelativeContainer : ${Overlay_Prop[0]}")

                            RelativeContainer() {
                                Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Row") {
                            Text("Row : ${Overlay_Prop[0]}")

                            Row() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Scroll") {
                            Text("Scroll : ${Overlay_Prop[0]}")

                            Scroll() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Stack") {
                            Text("Stack : ${Overlay_Prop[0]}")

                            Stack() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Swiper") {
                            Text("Swiper : ${Overlay_Prop[0]}")

                            Swiper(controller:SwiperController()) {
                                Text("1").width(80.percent).height(80.percent)
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Tabs") {
                            Text("Tabs : ${Overlay_Prop[0]}")
                            Tabs() {
                                TabContent {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "TabContent") {
                            Text("TabContent : ${Overlay_Prop[0]}")
                            Tabs() {
                                TabContent {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }
                                    .tabBar("1")
                                    .id(this.targetView + Overlay_Prop[0])
                                    .overlay(
                                        value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                        align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                        offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                    )
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Circle") {
                            Text("Circle : ${Overlay_Prop[0]}")
                            Circle()
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Line") {
                            Text("Line : ${Overlay_Prop[0]}")
                            Line()
                                .startPoint((0.0, 0.0))
                                .endPoint((10.0, 20.0))
                                .stroke(Color.Black)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Rect") {
                            Text("Rect : ${Overlay_Prop[0]}")
                            Rect()
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Shape") {
                            Text("Shape : ${Overlay_Prop[0]}")
                            Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        } else if (this.targetView == "Path") {
                            Text("Path : ${Overlay_Prop[0]}")
                            Path()
                                .commands("M0 0 H200 V200 H0 Z")
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Overlay_Prop[0])
                                .overlay(
                                    value: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[0],
                                    align: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[1],
                                    offset: ((Overlay_Prop[1] as (String, Alignment, OverlayOffset)).getOrThrow())[2]
                                )
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
