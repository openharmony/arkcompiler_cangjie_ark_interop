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
class View_EmptyAttrs_Direction {
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
                    ObservedArrayList<(String, Direction, String)>(Direction_Prop_List),
                    itemGeneratorFunc: {
                        Direction_Prop: (String, Direction, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "Button") {
                            Text("Button : ${Direction_Prop[0]}")
                            Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                .shape(ButtonType.Normal)
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "Gauge") {
                            Text("Gauge : ${Direction_Prop[0]}")
                            Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "ImageSpan") {
                            Text("ImageSpan : ${Direction_Prop[0]}")
                            Text() {
                                ImageSpan(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .id(this.targetView + Direction_Prop[0])
                                    .direction(Direction_Prop[1])
                            }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Menu") {
                            Text("Menu : ${Direction_Prop[0]}")

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
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "MenuItem") {
                            Text("MenuItem : ${Direction_Prop[0]}")
                            Menu() {
                                MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                    MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                        .id(this.targetView + Direction_Prop[0])
                                        .direction(Direction_Prop[1])
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "MenuItemGroup") {
                            Text("MenuItemGroup : ${Direction_Prop[0]}")
                            Menu() {
                                MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                    MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Direction_Prop[0])
                                    .direction(Direction_Prop[1])
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Refresh") {
                            Text("Refresh : ${Direction_Prop[0]}")
                            Refresh( RefreshOptions(refreshing:@Binder(this.isRefreshing))) {
                                Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "RowSplit") {
                            Text("RowSplit : ${Direction_Prop[0]}")
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
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "Stepper") {
                            Text("Stepper : ${Direction_Prop[0]}")

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
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "StepperItem") {
                            Text("StepperItem : ${Direction_Prop[0]}")
                            Stepper(index:0) {
                                StepperItem() {
                                    Text("Page One")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Direction_Prop[0])
                                    .direction(Direction_Prop[1])
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Badge") {
                            Text("Badge : ${Direction_Prop[0]}")
                            Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                Button("message").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "Grid") {
                            Text("Grid : ${Direction_Prop[0]}")
                            Grid ( child:{=>
                                GridItem ({=>
                                    Text("Message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            })
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "GridItem") {
                            Text("GridItem : ${Direction_Prop[0]}")
                            Grid ( child:{=>
                                GridItem ({=>
                                    Text("Message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                })
                                    .id(this.targetView + Direction_Prop[0])
                                    .direction(Direction_Prop[1])
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "GridRow") {
                            Text("GridRow : ${Direction_Prop[0]}")
                            GridRow() {
                                GridCol() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "GridCol") {
                            Text("GridCol : ${Direction_Prop[0]}")
                            GridRow() {
                                GridCol() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Direction_Prop[0])
                                    .direction(Direction_Prop[1])
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Flex") {
                            Text("Flex : ${Direction_Prop[0]}")
                            Flex() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "List") {
                            Text("List : ${Direction_Prop[0]}")
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
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "ListItem") {
                            Text("ListItem : ${Direction_Prop[0]}")
                            List() {
                                ListItemGroup() {
                                    ListItem() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[3])
                                    }
                                        .id(this.targetView + Direction_Prop[0])
                                        .direction(Direction_Prop[1])
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[2])
                                }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "ListItemGroup") {
                            Text("ListItemGroup : ${Direction_Prop[0]}")
                            List() {
                                ListItemGroup() {
                                    ListItem() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[3])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }
                                    .id(this.targetView + Direction_Prop[0])
                                    .direction(Direction_Prop[1])
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "RelativeContainer") {
                            Text("RelativeContainer : ${Direction_Prop[0]}")

                            RelativeContainer() {
                                Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "Row") {
                            Text("Row : ${Direction_Prop[0]}")

                            Row() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "Scroll") {
                            Text("Scroll : ${Direction_Prop[0]}")

                            Scroll() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "Stack") {
                            Text("Stack : ${Direction_Prop[0]}")

                            Stack() {
                                Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "Swiper") {
                            Text("Swiper : ${Direction_Prop[0]}")

                            Swiper(controller:SwiperController()) {
                                Text("1").width(80.percent).height(80.percent)
                            }
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        } else if (this.targetView == "Tabs") {
                            Text("Tabs : ${Direction_Prop[0]}")
                            Tabs() {
                                TabContent {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                            }
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                        } else if (this.targetView == "TabContent") {
                            Text("TabContent : ${Direction_Prop[0]}")
                            Tabs() {
                                TabContent {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                }
                                    .tabBar("1")
                                    .id(this.targetView + Direction_Prop[0])
                                    .direction(Direction_Prop[1])
                                    .width(80.percent)
                                    .height(80.percent)
                                    .backgroundColor(this.Colors[1])
                            }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                        } else if (this.targetView == "Shape") {
                            Text("Shape : ${Direction_Prop[0]}")
                            Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                .width(80.percent)
                                .height(100)
                                .backgroundColor(this.Colors[0])
                                .id(this.targetView + Direction_Prop[0])
                                .direction(Direction_Prop[1])
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
