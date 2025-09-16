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
class View_EmptyAttrs_Invert {
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
        this.targetView = getUIContext().getRouter()
            .getParams()
            .getOrThrow()
    }
    func build() {
        Scroll() {
            Column() {
                ForEach(
                    ObservedArrayList<(String, Any, String)>(Invert_Prop_List),
                    itemGeneratorFunc: {
                        Invert_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Blank") {
                            Blank(min: 10)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Button") {
                            Button {Text("Button")
                                    .width(90.percent)
                                    .height(90.percent)
                                    .backgroundColor(Color.Gray)}
                                .shape(ButtonType.Normal)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Checkbox") {
                            Checkbox()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "CheckboxGroup") {
                            CheckboxGroup()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "DataPanel") {
                            DataPanel(values: [30.0])
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "DatePicker") {
                            DatePicker()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Divider") {
                            Divider()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Gauge") {
                            Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                Text("Gauge")
                                    .width(50.percent)
                                    .height(50.percent)
                                    .backgroundColor(Color.Red)
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Image") {
                            Image(@r(app.media.startIcon))
                                .objectFit(ImageFit.Contain)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "ImageSpan") {
                            Text() {
                                ImageSpan(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .id(this.targetView + Invert_Prop[0])
                                    .invert((Invert_Prop[1] as Float64).getOrThrow())
                                    .width(150)
                                    .height(50)
                            }
                                .width(80.percent)
                                .height(100.percent)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "LoadingProgress") {
                            LoadingProgress()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Menu") {
                            Menu() {
                                MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                    MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                                .width(150)
                                .height(50)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "MenuItem") {
                            Menu() {
                                MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                    MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                        .id(this.targetView + Invert_Prop[0])
                                        .invert((Invert_Prop[1] as Float64).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "MenuItemGroup") {
                            Menu() {
                                MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                    MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Invert_Prop[0])
                                    .invert((Invert_Prop[1] as Float64).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Progress") {
                            Progress(value: 10.0)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "QRCode") {
                            QRCode(targetView)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Radio") {
                            Radio(group: "1", value: "A")
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Rating") {
                            Rating(rating: 3.5, indicator: false)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Refresh") {
                            Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                Text("1")
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "RichEditor") {
                            RichEditor(richEditorController)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "RichText") {
                            RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "RowSplit") {
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
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "ScrollBar") {
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
                            }
                                .height(150)
                                .scrollBar(BarState.Off)
                                .scrollable(ScrollDirection.Vertical)
                            ScrollBar(scroller: this.scroller, direction: ScrollBarDirection.Vertical,
                                state: BarState.On) {
                                Text("")
                                    .width(100)
                                    .height(50)
                                    .borderRadius(10)
                                    .backgroundColor(0xC0C0C0)
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Search") {
                            Search(value: "", placeholder: "Type to search")
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Slider") {
                            Slider()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Stepper") {
                            Stepper(index: 0) {
                                StepperItem() {
                                    Text("Page One")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                                .width(150)
                                .height(50)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "StepperItem") {
                            Stepper(index: 0) {
                                StepperItem() {
                                    Text("Page One")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Invert_Prop[0])
                                    .invert((Invert_Prop[1] as Float64).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Text") {
                            Text(targetView)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "TextArea") {
                            TextArea(text: targetView)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "TextClock") {
                            TextClock()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "TextInput") {
                            TextInput(placeholder: "TextInput")
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "TextPicker") {
                            TextPicker(range: ["apple", "banana", "orange", "peach"])
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "TextTimer") {
                            TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Toggle") {
                            Toggle(ToggleType.Switch, isOn: false)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Web") {
                            Web(src: "www.baidu.com", controller: webController)
                                .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Select") {
                            Select(
                                [SelectOptions(value: "aaa", icon: @r(app.media.startIcon)),
                                    SelectOptions(value: "bbb", icon: @r(app.media.startIcon))])
                                .value("Select")
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Badge") {
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
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Column") {
                            Column() {
                                Text("1")
                                    .height(80.percent)
                                    .width(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Grid") {
                            Grid(
                                child: {
                                    => GridItem(
                                        {
                                            => Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        })
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                })
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                                .width(150)
                                .height(50)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "GridItem") {
                            Grid(
                                child: {
                                    => GridItem(
                                        {
                                            => Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        })
                                        .id(this.targetView + Invert_Prop[0])
                                        .invert((Invert_Prop[1] as Float64).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                })
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "GridRow") {
                            GridRow() {
                                GridCol() {
                                    Text("Text")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                                .width(150)
                                .height(50)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "GridCol") {
                            GridRow() {
                                GridCol() {
                                    Text("Text")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Invert_Prop[0])
                                    .invert((Invert_Prop[1] as Float64).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Flex") {
                            Flex() {
                                Text("1")
                                    .height(80.percent)
                                    .width(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "List") {
                            List() {
                                ListItemGroup() {
                                    ListItem() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[3])
                                    }
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                                .width(150)
                                .height(50)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "ListItem") {
                            List() {
                                ListItemGroup() {
                                    ListItem() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[3])
                                    }
                                        .id(this.targetView + Invert_Prop[0])
                                        .invert((Invert_Prop[1] as Float64).getOrThrow())
                                        .width(150)
                                        .height(50)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "ListItemGroup") {
                            List() {
                                ListItemGroup() {
                                    ListItem() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[3])
                                    }
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Invert_Prop[0])
                                    .invert((Invert_Prop[1] as Float64).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "RelativeContainer") {
                            RelativeContainer() {
                                Text("Text")
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Row") {
                            Row() {
                                Text("1")
                                    .height(80.percent)
                                    .width(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Scroll") {
                            Scroll() {
                                Text("1")
                                    .height(80.percent)
                                    .width(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Stack") {
                            Stack() {
                                Text("1")
                                    .height(80.percent)
                                    .width(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Swiper") {
                            Swiper(controller:SwiperController()) {
                                Text("1")
                                    .width(80.percent)
                                    .height(80.percent)
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Tabs") {
                            Tabs() {
                                TabContent {
                                    Text("Text")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .tabBar("1")
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                                .width(150)
                                .height(50)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "TabContent") {
                            Tabs() {
                                TabContent {
                                    Text("Text")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .tabBar("1")
                                    .id(this.targetView + Invert_Prop[0])
                                    .invert((Invert_Prop[1] as Float64).getOrThrow())
                                    .width(150)
                                    .height(50)
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Circle") {
                            Circle()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Line") {
                            Line()
                                .startPoint((0.0, 0.0))
                                .endPoint((10.0, 20.0))
                                .stroke(Color.Black)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Rect") {
                            Rect()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Shape") {
                            Shape() {Rect()
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])}
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        } else if (this.targetView == "Path") {
                            Path()
                                .commands("M0 0 H200 V200 H0 Z")
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Invert_Prop[0])
                                .invert((Invert_Prop[1] as Float64).getOrThrow())
                        }
                    }
                )
            }
        }
            .id("Scroll")
            .height(this.parentHeight)
            .width(this.parentWidth)
            .backgroundColor(this.parentBackGroundColor)
    }
}
