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
class View_EmptyAttrs_ConstraintSize {
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
                    ObservedArrayList<(String, Any, String)>(ConstraintSize_Prop_List),
                    itemGeneratorFunc: {
                        ConstraintSize_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("AlphabetIndexer : ${ConstraintSize_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Blank : ${ConstraintSize_Prop[0]}")
                                Blank(min: 10)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Button : ${ConstraintSize_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Checkbox : ${ConstraintSize_Prop[0]}")
                                Checkbox()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("CheckboxGroup : ${ConstraintSize_Prop[0]}")
                                CheckboxGroup()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("DataPanel : ${ConstraintSize_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("DatePicker : ${ConstraintSize_Prop[0]}")
                                DatePicker()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Divider : ${ConstraintSize_Prop[0]}")
                                Divider()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Gauge : ${ConstraintSize_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Image : ${ConstraintSize_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "ImageSpan") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("ImageSpan : ${ConstraintSize_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + ConstraintSize_Prop[0])
                                        .width(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[0])
                                        .height(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[1])
                                        .constraintSize(
                                            minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[2],
                                            minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[3],
                                            maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[4],
                                            maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[5]
                                        )
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("LoadingProgress : ${ConstraintSize_Prop[0]}")
                                LoadingProgress()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Menu : ${ConstraintSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("MenuItem : ${ConstraintSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + ConstraintSize_Prop[0])
                                            .width(
                                                ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                                    Length)).getOrThrow())[0])
                                            .height(
                                                ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                                    Length)).getOrThrow())[1])
                                            .constraintSize(
                                                minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                    Length, Length)).getOrThrow())[2],
                                                minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                    Length, Length)).getOrThrow())[3],
                                                maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                    Length, Length)).getOrThrow())[4],
                                                maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                    Length, Length)).getOrThrow())[5]
                                            )
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("MenuItemGroup : ${ConstraintSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ConstraintSize_Prop[0])
                                        .width(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[0])
                                        .height(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[1])
                                        .constraintSize(
                                            minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[2],
                                            minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[3],
                                            maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[4],
                                            maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[5]
                                        )
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Progress : ${ConstraintSize_Prop[0]}")
                                Progress(value: 10.0)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("QRCode : ${ConstraintSize_Prop[0]}")
                                QRCode(targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Radio : ${ConstraintSize_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Rating : ${ConstraintSize_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Refresh : ${ConstraintSize_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("RichEditor : ${ConstraintSize_Prop[0]}")
                                RichEditor(richEditorController)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("RichText : ${ConstraintSize_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("RowSplit : ${ConstraintSize_Prop[0]}")
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
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("ScrollBar : ${ConstraintSize_Prop[0]}")

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
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Search : ${ConstraintSize_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Slider : ${ConstraintSize_Prop[0]}")
                                Slider()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Stepper : ${ConstraintSize_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("StepperItem : ${ConstraintSize_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ConstraintSize_Prop[0])
                                        .width(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[0])
                                        .height(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[1])
                                        .constraintSize(
                                            minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[2],
                                            minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[3],
                                            maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[4],
                                            maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[5]
                                        )
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Text : ${ConstraintSize_Prop[0]}")
                                Text(targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("TextArea : ${ConstraintSize_Prop[0]}")
                                TextArea(text: targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("TextClock : ${ConstraintSize_Prop[0]}")
                                TextClock()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("TextInput : ${ConstraintSize_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("TextPicker : ${ConstraintSize_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("TextTimer : ${ConstraintSize_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Toggle : ${ConstraintSize_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Web : ${ConstraintSize_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Select : ${ConstraintSize_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Badge : ${ConstraintSize_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Column : ${ConstraintSize_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Grid : ${ConstraintSize_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("GridItem : ${ConstraintSize_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + ConstraintSize_Prop[0])
                                        .width(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[0])
                                        .height(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[1])
                                        .constraintSize(
                                            minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[2],
                                            minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[3],
                                            maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[4],
                                            maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[5]
                                        )
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("GridRow : ${ConstraintSize_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("GridCol : ${ConstraintSize_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ConstraintSize_Prop[0])
                                        .width(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[0])
                                        .height(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[1])
                                        .constraintSize(
                                            minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[2],
                                            minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[3],
                                            maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[4],
                                            maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[5]
                                        )
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Flex : ${ConstraintSize_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("List : ${ConstraintSize_Prop[0]}")
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
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("ListItem : ${ConstraintSize_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + ConstraintSize_Prop[0])
                                            .width(
                                                ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                                    Length)).getOrThrow())[0])
                                            .height(
                                                ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                                    Length)).getOrThrow())[1])
                                            .constraintSize(
                                                minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                    Length, Length)).getOrThrow())[2],
                                                minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                    Length, Length)).getOrThrow())[3],
                                                maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                    Length, Length)).getOrThrow())[4],
                                                maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                    Length, Length)).getOrThrow())[5]
                                            )
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("ListItemGroup : ${ConstraintSize_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ConstraintSize_Prop[0])
                                        .width(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[0])
                                        .height(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[1])
                                        .constraintSize(
                                            minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[2],
                                            minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[3],
                                            maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[4],
                                            maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[5]
                                        )
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("RelativeContainer : ${ConstraintSize_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Row : ${ConstraintSize_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Scroll : ${ConstraintSize_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Stack : ${ConstraintSize_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Swiper : ${ConstraintSize_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Tabs : ${ConstraintSize_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "TabContent") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("TabContent : ${ConstraintSize_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + ConstraintSize_Prop[0])
                                        .width(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[0])
                                        .height(
                                            ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                                .getOrThrow())[1])
                                        .constraintSize(
                                            minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[2],
                                            minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[3],
                                            maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[4],
                                            maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, 
                                                Length, Length)).getOrThrow())[5]
                                        )
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Circle : ${ConstraintSize_Prop[0]}")
                                Circle()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Line : ${ConstraintSize_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Rect : ${ConstraintSize_Prop[0]}")
                                Rect()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Shape : ${ConstraintSize_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (ConstraintSize_Prop[1] is (Length, Length, Length, Length, Length, Length)) {
                                Text("Path : ${ConstraintSize_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ConstraintSize_Prop[0])
                                    .width(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[0])
                                    .height(
                                        ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, Length))
                                            .getOrThrow())[1])
                                    .constraintSize(
                                        minWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[2],
                                        minHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[3],
                                        maxWidth: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[4],
                                        maxHeight: ((ConstraintSize_Prop[1] as (Length, Length, Length, Length, Length, 
                                            Length)).getOrThrow())[5]
                                    )
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
