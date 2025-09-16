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
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.base.*
import ohos.arkui.ui_context.Router


@Entry
@Component
class View_EmptyAttrs_Visibility {
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
                    ObservedArrayList<(String, Visibility, String)>(Visibility_Prop_List),
                    itemGeneratorFunc: {
                        Visibility_Prop: (String, Visibility, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            Text("AlphabetIndexer : ${Visibility_Prop[0]}")
                            AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Blank") {
                            Text("Blank : ${Visibility_Prop[0]}")
                            Blank(min: 10)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Button") {
                            Text("Button : ${Visibility_Prop[0]}")
                            Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                .shape(ButtonType.Normal)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Checkbox") {
                            Text("Checkbox : ${Visibility_Prop[0]}")
                            Checkbox()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "CheckboxGroup") {
                            Text("CheckboxGroup : ${Visibility_Prop[0]}")
                            CheckboxGroup()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "DataPanel") {
                            Text("DataPanel : ${Visibility_Prop[0]}")
                            DataPanel(values: [30.0])
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "DatePicker") {
                            Text("DatePicker : ${Visibility_Prop[0]}")
                            DatePicker()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Divider") {
                            Text("Divider : ${Visibility_Prop[0]}")
                            Divider()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Gauge") {
                            Text("Gauge : ${Visibility_Prop[0]}")
                            Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Image") {
                            Text("Image : ${Visibility_Prop[0]}")
                            Image(@r(app.media.startIcon))
                                .objectFit(ImageFit.Contain)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "ImageSpan") {
                            Text("ImageSpan : ${Visibility_Prop[0]}")
                            Text() {
                                ImageSpan(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .id(this.targetView + Visibility_Prop[0])
                                    .visibility(Visibility_Prop[1])
                            }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "LoadingProgress") {
                            Text("LoadingProgress : ${Visibility_Prop[0]}")
                            LoadingProgress()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Menu") {
                            Text("Menu : ${Visibility_Prop[0]}")
                            Menu() {
                                MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                    MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "MenuItem") {
                            Text("MenuItem : ${Visibility_Prop[0]}")
                            Menu() {
                                MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                    MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                        .id(this.targetView + Visibility_Prop[0])
                                        .visibility(Visibility_Prop[1])
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "MenuItemGroup") {
                            Text("MenuItemGroup : ${Visibility_Prop[0]}")
                            Menu() {
                                MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                    MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Visibility_Prop[0])
                                    .visibility(Visibility_Prop[1])
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Progress") {
                            Text("Progress : ${Visibility_Prop[0]}")
                            Progress(value: 10.0)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "QRCode") {
                            Text("QRCode : ${Visibility_Prop[0]}")
                            QRCode(targetView)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Radio") {
                            Text("Radio : ${Visibility_Prop[0]}")
                            Radio(group: "1", value: "A")
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Rating") {
                            Text("Rating : ${Visibility_Prop[0]}")
                            Rating(rating: 3.5, indicator: false)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Refresh") {
                            Text("Refresh : ${Visibility_Prop[0]}")
                            Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "RichEditor") {
                            Text("RichEditor : ${Visibility_Prop[0]}")
                            RichEditor(richEditorController)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "RowSplit") {
                            Text("RowSplit : ${Visibility_Prop[0]}")
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
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "ScrollBar") {
                            Text("ScrollBar : ${Visibility_Prop[0]}")

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
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Search") {
                            Text("Search : ${Visibility_Prop[0]}")
                            Search(value: "", placeholder: "Type to search")
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Slider") {
                            Text("Slider : ${Visibility_Prop[0]}")
                            Slider()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Stepper") {
                            Text("Stepper : ${Visibility_Prop[0]}")
                            Stepper(index:0) {
                                StepperItem() {
                                    Text("Page One")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "StepperItem") {
                            Text("StepperItem : ${Visibility_Prop[0]}")
                            Stepper(index:0) {
                                StepperItem() {
                                    Text("Page One")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Visibility_Prop[0])
                                    .visibility(Visibility_Prop[1])
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Text") {
                            Text("Text : ${Visibility_Prop[0]}")
                            Text(targetView)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "TextArea") {
                            Text("TextArea : ${Visibility_Prop[0]}")
                            TextArea(text: targetView)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "TextClock") {
                            Text("TextClock : ${Visibility_Prop[0]}")
                            TextClock()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "TextInput") {
                            Text("TextInput : ${Visibility_Prop[0]}")
                            TextInput(placeholder: "TextInput")
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "TextPicker") {
                            Text("TextPicker : ${Visibility_Prop[0]}")
                            TextPicker(range:["apple", "banana", "orange", "peach"])
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "TextTimer") {
                            Text("TextTimer : ${Visibility_Prop[0]}")
                            TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Toggle") {
                            Text("Toggle : ${Visibility_Prop[0]}")
                            Toggle(ToggleType.Switch, isOn: false)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Web") {
                            Text("Web : ${Visibility_Prop[0]}")
                            Web(src: "www.baidu.com", controller: webController)
                                .onPageBegin({evt => Hilog.info(0,"", "cangjietest", "page begin url: ${evt.url}")})
                                .onPageEnd({evt => Hilog.info(0,"", "cangjietest", "page end url: ${evt.url}")})
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Select") {
                            Text("Select : ${Visibility_Prop[0]}")
                            Select(
                                [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                    SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                .value("Select")
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Badge") {
                            Text("Badge : ${Visibility_Prop[0]}")
                            Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                Button("message").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Column") {
                            Text("Column : ${Visibility_Prop[0]}")

                            Column() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Grid") {
                            Text("Grid : ${Visibility_Prop[0]}")
                            Grid ( child:{=>
                                GridItem ({=>
                                    Text("Message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            })
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "GridItem") {
                            Text("GridItem : ${Visibility_Prop[0]}")
                            Grid ( child:{=>
                                GridItem ({=>
                                    Text("Message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                })
                                    .id(this.targetView + Visibility_Prop[0])
                                    .visibility(Visibility_Prop[1])
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "GridRow") {
                            Text("GridRow : ${Visibility_Prop[0]}")
                            GridRow() {
                                GridCol() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "GridCol") {
                            Text("GridCol : ${Visibility_Prop[0]}")
                            GridRow() {
                                GridCol() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Visibility_Prop[0])
                                    .visibility(Visibility_Prop[1])
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Flex") {
                            Text("Flex : ${Visibility_Prop[0]}")
                            Flex() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "List") {
                            Text("List : ${Visibility_Prop[0]}")
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
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "ListItem") {
                            Text("ListItem : ${Visibility_Prop[0]}")
                            List() {
                                ListItemGroup() {
                                    ListItem() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[3])
                                    }
                                        .id(this.targetView + Visibility_Prop[0])
                                        .visibility(Visibility_Prop[1])
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "ListItemGroup") {
                            Text("ListItemGroup : ${Visibility_Prop[0]}")
                            List() {
                                ListItemGroup() {
                                    ListItem() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[3])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Visibility_Prop[0])
                                    .visibility(Visibility_Prop[1])
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Row") {
                            Text("Row : ${Visibility_Prop[0]}")

                            Row() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Scroll") {
                            Text("Scroll : ${Visibility_Prop[0]}")

                            Scroll() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Stack") {
                            Text("Stack : ${Visibility_Prop[0]}")

                            Stack() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Swiper") {
                            Text("Swiper : ${Visibility_Prop[0]}")

                            Swiper(controller:SwiperController()) {
                                Text("1").width(80.percent).height(80.percent)
                            }
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Tabs") {
                            Text("Tabs : ${Visibility_Prop[0]}")
                            Tabs() {
                                TabContent {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "TabContent") {
                            Text("TabContent : ${Visibility_Prop[0]}")
                            Tabs() {
                                TabContent {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }
                                    .tabBar("1")
                                    .id(this.targetView + Visibility_Prop[0])
                                    .visibility(Visibility_Prop[1])
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Circle") {
                            Text("Circle : ${Visibility_Prop[0]}")
                            Circle()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Line") {
                            Text("Line : ${Visibility_Prop[0]}")
                            Line()
                                .startPoint((0.0, 0.0))
                                .endPoint((10.0, 20.0))
                                .stroke(Color.Black)
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Rect") {
                            Text("Rect : ${Visibility_Prop[0]}")
                            Rect()
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Shape") {
                            Text("Shape : ${Visibility_Prop[0]}")
                            Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        } else if (this.targetView == "Path") {
                            Text("Path : ${Visibility_Prop[0]}")
                            Path()
                                .commands("M0 0 H200 V200 H0 Z")
                                .margin(3)
                                .width(150)
                                .height(80)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Visibility_Prop[0])
                                .visibility(Visibility_Prop[1])
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
