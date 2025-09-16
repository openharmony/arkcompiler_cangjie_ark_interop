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
class View_EmptyAttrs_AlignSelf {
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
                    ObservedArrayList<(String, ItemAlign, String)>(ItemAlign_Prop_List),
                    itemGeneratorFunc: {
                        ItemAlign_Prop: (String, ItemAlign, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            Text("AlphabetIndexer : ${ItemAlign_Prop[0]}")
                            Flex() {
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            Text("Blank : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Blank(min: 10)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            Text("Button : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            Text("Checkbox : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Checkbox()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            Text("CheckboxGroup : ${ItemAlign_Prop[0]}")
                            Flex() {
                                CheckboxGroup()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            Text("DataPanel : ${ItemAlign_Prop[0]}")
                            Flex() {
                                DataPanel(values: [30.0])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            Text("DatePicker : ${ItemAlign_Prop[0]}")
                            Flex() {
                                DatePicker()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            Text("Divider : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Divider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            Text("Gauge : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            Text("Image : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            Text("LoadingProgress : ${ItemAlign_Prop[0]}")
                            Flex() {
                                LoadingProgress()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            Text("Menu : ${ItemAlign_Prop[0]}")
                            Flex() {
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
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            Text("Progress : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Progress(value: 10.0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            Text("QRCode : ${ItemAlign_Prop[0]}")
                            Flex() {
                                QRCode(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            Text("Radio : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Radio(group: "1", value: "A")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            Text("Rating : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Rating(rating: 3.5, indicator: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            Text("Refresh : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            Text("RichEditor : ${ItemAlign_Prop[0]}")
                            Flex() {
                                RichEditor(richEditorController)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            Text("RichText : ${ItemAlign_Prop[0]}")
                            Flex() {
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            Text("RowSplit : ${ItemAlign_Prop[0]}")
                            Flex() {
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
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            Text("ScrollBar : ${ItemAlign_Prop[0]}")
                            Flex() {
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
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            Text("Search : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Search(value: "", placeholder: "Type to search")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            Text("Slider : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Slider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            Text("Stepper : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            Text("Text : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Text(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            Text("TextArea : ${ItemAlign_Prop[0]}")
                            Flex() {
                                TextArea(text: targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            Text("TextClock : ${ItemAlign_Prop[0]}")
                            Flex() {
                                TextClock()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            Text("TextInput : ${ItemAlign_Prop[0]}")
                            Flex() {
                                TextInput(placeholder: "TextInput")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            Text("TextPicker : ${ItemAlign_Prop[0]}")
                            Flex() {
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            Text("TextTimer : ${ItemAlign_Prop[0]}")
                            Flex() {
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            Text("Toggle : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Toggle(ToggleType.Switch, isOn: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            Text("Web : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            Text("Select : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            Text("Badge : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            Text("Column : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            Text("Grid : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            Text("GridRow : ${ItemAlign_Prop[0]}")
                            Flex() {
                                GridRow() {
                                    GridCol() {
                                        Row().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            Text("Flex : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            Text("List : ${ItemAlign_Prop[0]}")
                            Flex() {
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
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            Text("RelativeContainer : ${ItemAlign_Prop[0]}")
                            Flex() {
                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            Text("Row : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            Text("Scroll : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            Text("Stack : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            Text("Swiper : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            Text("Tabs : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Tabs() {
                                    TabContent {
                                        Column().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }.tabBar("1").backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            Text("Circle : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Circle()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            Text("Line : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            Text("Rect : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Rect()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            Text("Shape : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            Text("Path : ${ItemAlign_Prop[0]}")
                            Flex() {
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ItemAlign_Prop[0])
                                    .alignSelf(ItemAlign_Prop[1])
                            }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
