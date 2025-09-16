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
class View_EmptyAttrs_DisplayPriority {
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
                if (this.renderFlag) {}
                else if (this.targetView == "AlphabetIndexer") {
                    Row() {
                        AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Blank") {
                    Row() {
                        Blank(min: 10)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Blank(min: 10)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Button") {
                    Row() {
                        Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                            .shape(ButtonType.Normal)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                            .shape(ButtonType.Normal)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Checkbox") {
                    Row() {
                        Checkbox()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Checkbox()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "CheckboxGroup") {
                    Row() {
                        CheckboxGroup()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        CheckboxGroup()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "DataPanel") {
                    Row() {
                        DataPanel(values: [30.0])
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        DataPanel(values: [30.0])
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "DatePicker") {
                    Row() {
                        DatePicker()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        DatePicker()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Divider") {
                    Row() {
                        Divider()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Divider()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Gauge") {
                    Row() {
                        Gauge(value: 50.0, min: 0.0, max: 100.0) {
                            Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Gauge(value: 50.0, min: 0.0, max: 100.0) {
                            Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Image") {
                    Row() {
                        Image(@r(app.media.startIcon))
                            .objectFit(ImageFit.Contain)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Image(@r(app.media.startIcon))
                            .objectFit(ImageFit.Contain)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "LoadingProgress") {
                    Row() {
                        LoadingProgress()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        LoadingProgress()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Menu") {
                    Row() {
                        Menu() {
                            MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                        Menu() {
                            MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                    }.width(100.percent)
                } else if (this.targetView == "Progress") {
                    Row() {
                        Progress(value: 10.0)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Progress(value: 10.0)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "QRCode") {
                    Row() {
                        QRCode(targetView)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        QRCode(targetView)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Radio") {
                    Row() {
                        Radio(group: "1", value: "A")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Radio(group: "1", value: "A")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Rating") {
                    Row() {
                        Rating(rating: 3.5, indicator: false)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Rating(rating: 3.5, indicator: false)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Refresh") {
                    Row() {
                        Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                            Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                            Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "RichEditor") {
                    Row() {
                        RichEditor(richEditorController)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        RichEditor(richEditorController)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "RichText") {
                    Row() {
                        RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "RowSplit") {
                    Row() {
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
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

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
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "ScrollBar") {
                    Row() {
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
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

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
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Search") {
                    Row() {
                        Search(value: "", placeholder: "Type to search")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Search(value: "", placeholder: "Type to search")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Slider") {
                    Row() {
                        Slider()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Slider()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Stepper") {
                    Row() {
                        Stepper(index:0) {
                            StepperItem() {
                                Text("Page One").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                        Stepper(index:0) {
                            StepperItem() {
                                Text("Page One").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                    }.width(100.percent)
                } else if (this.targetView == "Text") {
                    Row() {
                        Text(targetView)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Text(targetView)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "TextArea") {
                    Row() {
                        TextArea(text: targetView)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        TextArea(text: targetView)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "TextClock") {
                    Row() {
                        TextClock()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        TextClock()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "TextInput") {
                    Row() {
                        TextInput(placeholder: "TextInput")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        TextInput(placeholder: "TextInput")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "TextPicker") {
                    Row() {
                        TextPicker(range:["apple", "banana", "orange", "peach"])
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        TextPicker(range:["apple", "banana", "orange", "peach"])
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "TextTimer") {
                    Row() {
                        TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Toggle") {
                    Row() {
                        Toggle(ToggleType.Switch, isOn: false)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Toggle(ToggleType.Switch, isOn: false)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Web") {
                    Row() {
                        Web(src: "www.baidu.com", controller: webController)
                            .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                            .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Web(src: "www.baidu.com", controller: webController)
                            .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                            .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Select") {
                    Row() {
                        Select(
                            [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                            .value("Select")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Select(
                            [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                            .value("Select")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Badge") {
                    Row() {
                        Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                            Button("message").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                            Button("message").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Column") {
                    Row() {
                        Column() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Column() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Grid") {
                    Row() {
                        Grid (child:{=>
                                    GridItem ({=>
                                Text("Message").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        })
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                        Grid (child:{=>
                                    GridItem ({=>
                                Text("Message").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        })
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                    }.width(100.percent)
                } else if (this.targetView == "GridRow") {
                    Row() {
                        GridRow() {
                            GridCol() {
                                Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                        GridRow() {
                            GridCol() {
                                Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                    }.width(100.percent)
                } else if (this.targetView == "Flex") {
                    Row() {
                        Flex() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Flex() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "List") {
                    Row() {
                        List() {
                            ListItemGroup() {
                                ListItem() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[3])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                        List() {
                            ListItemGroup() {
                                ListItem() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[3])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                    }.width(100.percent)
                } else if (this.targetView == "RelativeContainer") {
                    Row() {
                        RelativeContainer() {
                            Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        RelativeContainer() {
                            Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Row") {
                    Row() {
                        Row() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Row() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Scroll") {
                    Row() {
                        Scroll() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Scroll() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Stack") {
                    Row() {
                        Stack() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Stack() {
                            Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Swiper") {
                    Row() {
                        Swiper(controller:SwiperController()) {
                            Text("1").width(80.percent).height(80.percent)
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Swiper(controller:SwiperController()) {
                            Text("1").width(80.percent).height(80.percent)
                        }
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Tabs") {
                    Row() {
                        Tabs() {
                            TabContent {
                                Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                        Tabs() {
                            TabContent {
                                Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                            }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                        }
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[0])
                    }.width(100.percent)
                } else if (this.targetView == "Circle") {
                    Row() {
                        Circle()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Circle()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Line") {
                    Row() {
                        Line()
                            .startPoint((0.0, 0.0))
                            .endPoint((10.0, 20.0))
                            .stroke(Color.Black)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Line()
                            .startPoint((0.0, 0.0))
                            .endPoint((10.0, 20.0))
                            .stroke(Color.Black)
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Rect") {
                    Row() {
                        Rect()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Rect()
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Shape") {
                    Row() {
                        Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                } else if (this.targetView == "Path") {
                    Row() {
                        Path()
                            .commands("M0 0 H200 V200 H0 Z")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[1])
                            .id(this.targetView + "DisplayPriority1")
                            .displayPriority(1)

                        Path()
                            .commands("M0 0 H200 V200 H0 Z")
                            .width(80.percent)
                            .height(100)
                            .backgroundColor(this.Colors[2])
                            .id(this.targetView + "DisplayPriority2")
                            .displayPriority(2)
                    }.width(100.percent)
                }
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
