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
import ohos.base.Color
import ohos.arkui.state_macro_manage.*
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.base.*
import ohos.arkui.ui_context.Router
@Entry
@Component
class View_EmptyAttrs_ZIndex {
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
                Stack() {
                    if (this.renderFlag) {}
                    else if (this.targetView == "AlphabetIndexer") {
                        Text("AlphabetIndexer : ZIndex(0)")
                        AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Button") {
                        Text("Button : ZIndex(0)")
                        Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                            .shape(ButtonType.Normal)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                            .shape(ButtonType.Normal)
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                            .shape(ButtonType.Normal)
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Checkbox") {
                        Text("Checkbox : ZIndex(0)")
                        Checkbox()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Checkbox()
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Checkbox()
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "CheckboxGroup") {
                        Text("CheckboxGroup : ZIndex(0)")
                        CheckboxGroup()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        CheckboxGroup()
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        CheckboxGroup()
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "DataPanel") {
                        Text("DataPanel : ZIndex(0)")
                        DataPanel(values: [30.0])
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        DataPanel(values: [30.0])
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        DataPanel(values: [30.0])
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "DatePicker") {
                        Text("DatePicker : ZIndex(0)")
                        DatePicker()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        DatePicker()
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        DatePicker()
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Divider") {
                        Text("Divider : ZIndex(0)")
                        Divider()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Divider()
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Divider()
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Gauge") {
                        Text("Gauge : ZIndex(0)")
                        Gauge(value: 50.0, min: 0.0, max: 100.0) {
                            Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Gauge(value: 50.0, min: 0.0, max: 100.0) {
                            Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Gauge(value: 50.0, min: 0.0, max: 100.0) {
                            Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Image") {
                        Text("Image : ZIndex(0)")
                        Image(@r(app.media.startIcon))
                            .objectFit(ImageFit.Contain)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Image(@r(app.media.startIcon))
                            .objectFit(ImageFit.Contain)
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Image(@r(app.media.startIcon))
                            .objectFit(ImageFit.Contain)
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "LoadingProgress") {
                        Text("LoadingProgress : ZIndex(0)")
                        LoadingProgress()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        LoadingProgress()
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        LoadingProgress()
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Menu") {
                        Text("Menu : ZIndex(0)")

                        Menu() {
                            MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Menu() {
                            MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Menu() {
                            MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Progress") {
                        Text("Progress : ZIndex(0)")
                        Progress(value: 10.0)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Progress(value: 10.0)
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Progress(value: 10.0)
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "QRCode") {
                        Text("QRCode : ZIndex(0)")
                        QRCode(targetView)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        QRCode(targetView)
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        QRCode(targetView)
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Radio") {
                        Text("Radio : ZIndex(0)")
                        Radio(group: "1", value: "A")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Radio(group: "1", value: "A")
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Radio(group: "1", value: "A")
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Rating") {
                        Text("Rating : ZIndex(0)")
                        Rating(rating: 3.5, indicator: false)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Rating(rating: 3.5, indicator: false)
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Rating(rating: 3.5, indicator: false)
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Refresh") {
                        Text("Refresh : ZIndex(0)")
                        Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                            Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                            Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                            Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "RichEditor") {
                        Text("RichEditor : ZIndex(0)")
                        RichEditor(richEditorController)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        RichEditor(richEditorController)
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        RichEditor(richEditorController)
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "RowSplit") {
                        Text("RowSplit : ZIndex(0)")
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
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

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
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

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
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "ScrollBar") {
                        Text("ScrollBar : ZIndex(0)")

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
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

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
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

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
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Search") {
                        Text("Search : ZIndex(0)")
                        Search(value: "", placeholder: "Type to search")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Search(value: "", placeholder: "Type to search")
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Search(value: "", placeholder: "Type to search")
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Slider") {
                        Text("Slider : ZIndex(0)")
                        Slider()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Slider()
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Slider()
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Stepper") {
                        Text("Stepper : ZIndex(0)")

                        Stepper(index:0) {
                            StepperItem() {
                                Text("Page One").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Stepper(index:0) {
                            StepperItem() {
                                Text("Page One").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Stepper(index:0) {
                            StepperItem() {
                                Text("Page One").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Text") {
                        Text("Text : ZIndex(0)")
                        Text(targetView)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Text(targetView)
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Text(targetView)
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "TextArea") {
                        Text("TextArea : ZIndex(0)")
                        TextArea(text: targetView)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        TextArea(text: targetView)
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        TextArea(text: targetView)
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "TextClock") {
                        Text("TextClock : ZIndex(0)")
                        TextClock()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        TextClock()
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        TextClock()
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "TextInput") {
                        Text("TextInput : ZIndex(0)")
                        TextInput(placeholder: "TextInput")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        TextInput(placeholder: "TextInput")
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        TextInput(placeholder: "TextInput")
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "TextPicker") {
                        Text("TextPicker : ZIndex(0)")
                        TextPicker(range:["apple", "banana", "orange", "peach"])
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        TextPicker(range:["apple", "banana", "orange", "peach"])
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        TextPicker(range:["apple", "banana", "orange", "peach"])
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "TextTimer") {
                        Text("TextTimer : ZIndex(0)")
                        TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Toggle") {
                        Text("Toggle : ZIndex(0)")
                        Toggle(ToggleType.Switch, isOn: false)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Toggle(ToggleType.Switch, isOn: false)
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Toggle(ToggleType.Switch, isOn: false)
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Web") {
                        Text("Web : ZIndex(0)")
                        Web(src: "www.baidu.com", controller: webController)
                            .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                            .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Web(src: "www.baidu.com", controller: webController)
                            .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                            .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Web(src: "www.baidu.com", controller: webController)
                            .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                            .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Select") {
                        Text("Select : ZIndex(0)")
                        Select(
                            [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                            .value("Select")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Select(
                            [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                            .value("Select")
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Select(
                            [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                            .value("Select")
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Badge") {
                        Text("Badge : ZIndex(0)")
                        Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                            Button("message").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                            Button("message").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                            Button("message").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Column") {
                        Text("Column : ZIndex(0)")

                        Column() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Column() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Column() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Grid") {
                        Text("Grid : ZIndex(0)")

                        Grid ( child:{=>
                            GridItem ({=>
                                Text("Message").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        })
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Grid( child:{=>
                            GridItem ({=>
                                Text("Message").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        })
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Grid( child:{=>
                            GridItem ({=>
                                Text("Message").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        })
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "GridRow") {
                        Text("GridRow : ZIndex(0)")

                        GridRow() {
                            GridCol() {
                                Row().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        GridRow() {
                            GridCol() {
                                Row().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        GridRow() {
                            GridCol() {
                                Row().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Flex") {
                        Text("Flex : ZIndex(0)")
                        Flex() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Flex() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Flex() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "List") {
                        Text("List : ZIndex(0)")

                        List() {
                            ListItemGroup() {
                                ListItem() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[3])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        List() {
                            ListItemGroup() {
                                ListItem() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[3])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        List() {
                            ListItemGroup() {
                                ListItem() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[3])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "RelativeContainer") {
                        Text("RelativeContainer : ZIndex(0)")

                        RelativeContainer() {
                            Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        RelativeContainer() {
                            Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        RelativeContainer() {
                            Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Row") {
                        Text("Row : ZIndex(0)")

                        Row() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Row() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Row() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Scroll") {
                        Text("Scroll : ZIndex(0)")

                        Scroll() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Scroll() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Scroll() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Stack") {
                        Text("Stack : ZIndex(0)")

                        Stack() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Stack() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Stack() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Swiper") {
                        Text("Swiper : ZIndex(0)")

                        Swiper(controller:SwiperController()) {
                            Text("1").width(80.percent).height(80.percent)
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Swiper(controller:SwiperController()) {
                            Text("1").width(80.percent).height(80.percent)
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Swiper(controller:SwiperController()) {
                            Text("1").width(80.percent).height(80.percent)
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Tabs") {
                        Text("Tabs : ZIndex(0)")

                        Tabs() {
                            TabContent {
                                Column().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.tabBar("1").backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Tabs() {
                            TabContent {
                                Column().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.tabBar("1").backgroundColor(this.Colors[1])
                        }
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Tabs() {
                            TabContent {
                                Column().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.tabBar("1").backgroundColor(this.Colors[1])
                        }
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Circle") {
                        Text("Circle : ZIndex(0)")
                        Circle()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Circle()
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Circle()
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Line") {
                        Text("Line : ZIndex(0)")
                        Line()
                            .startPoint((0.0, 0.0))
                            .endPoint((10.0, 20.0))
                            .stroke(Color.Black)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Line()
                            .startPoint((0.0, 0.0))
                            .endPoint((10.0, 20.0))
                            .stroke(Color.Black)
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Line()
                            .startPoint((0.0, 0.0))
                            .endPoint((10.0, 20.0))
                            .stroke(Color.Black)
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Rect") {
                        Text("Rect : ZIndex(0)")
                        Rect()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Rect()
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Rect()
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Shape") {
                        Text("Shape : ZIndex(0)")
                        Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    } else if (this.targetView == "Path") {
                        Text("Path : ZIndex(0)")
                        Path()
                            .commands("M0 0 H200 V200 H0 Z")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                            .id(this.targetView + "ZIndex0")
                            .zIndex(0)

                        Path()
                            .commands("M0 0 H200 V200 H0 Z")
                            .width(60.percent)
                            .height(80)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "ZIndex2")
                            .zIndex(2)

                        Path()
                            .commands("M0 0 H200 V200 H0 Z")
                            .width(70.percent)
                            .height(90)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "ZIndex1")
                            .zIndex(1)
                    }
                }
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
