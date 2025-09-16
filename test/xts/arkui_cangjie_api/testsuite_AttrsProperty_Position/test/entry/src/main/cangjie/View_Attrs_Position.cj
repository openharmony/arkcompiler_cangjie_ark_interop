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
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.base.*
import ohos.arkui.ui_context.Router

@Entry
@Component
class View_EmptyAttrs_Position {
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
                     ObservedArrayList<(String, Any, String)>(Position_Prop_List),
                    itemGeneratorFunc: {
                        Position_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("AlphabetIndexer : ${Position_Prop[0]}")
                                Column() {
                                    AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("AlphabetIndexer : ${Position_Prop[0]}")
                                Column() {
                                    AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("AlphabetIndexer : ${Position_Prop[0]}")
                                Column() {
                                    AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("AlphabetIndexer : ${Position_Prop[0]}")
                                Column() {
                                    AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Blank : ${Position_Prop[0]}")
                                Column() {
                                    Blank(min: 10)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Blank : ${Position_Prop[0]}")
                                Column() {
                                    Blank(min: 10)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Blank : ${Position_Prop[0]}")
                                Column() {
                                    Blank(min: 10)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Blank : ${Position_Prop[0]}")
                                Column() {
                                    Blank(min: 10)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Button : ${Position_Prop[0]}")
                                Column() {
                                    Button {
                                        Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)
                                    }
                                        .shape(ButtonType.Normal)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Button : ${Position_Prop[0]}")
                                Column() {
                                    Button {
                                        Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)
                                    }
                                        .shape(ButtonType.Normal)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Button : ${Position_Prop[0]}")
                                Column() {
                                    Button {
                                        Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)
                                    }
                                        .shape(ButtonType.Normal)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Button : ${Position_Prop[0]}")
                                Column() {
                                    Button {
                                        Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)
                                    }
                                        .shape(ButtonType.Normal)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Checkbox : ${Position_Prop[0]}")
                                Column() {
                                    Checkbox()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Checkbox : ${Position_Prop[0]}")
                                Column() {
                                    Checkbox()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Checkbox : ${Position_Prop[0]}")
                                Column() {
                                    Checkbox()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Checkbox : ${Position_Prop[0]}")
                                Column() {
                                    Checkbox()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("CheckboxGroup : ${Position_Prop[0]}")
                                Column() {
                                    CheckboxGroup()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("CheckboxGroup : ${Position_Prop[0]}")
                                Column() {
                                    CheckboxGroup()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("CheckboxGroup : ${Position_Prop[0]}")
                                Column() {
                                    CheckboxGroup()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("CheckboxGroup : ${Position_Prop[0]}")
                                Column() {
                                    CheckboxGroup()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("DataPanel : ${Position_Prop[0]}")
                                Column() {
                                    DataPanel(values: [30.0])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("DataPanel : ${Position_Prop[0]}")
                                Column() {
                                    DataPanel(values: [30.0])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("DataPanel : ${Position_Prop[0]}")
                                Column() {
                                    DataPanel(values: [30.0])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("DataPanel : ${Position_Prop[0]}")
                                Column() {
                                    DataPanel(values: [30.0])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("DatePicker : ${Position_Prop[0]}")
                                Column() {
                                    DatePicker()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("DatePicker : ${Position_Prop[0]}")
                                Column() {
                                    DatePicker()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("DatePicker : ${Position_Prop[0]}")
                                Column() {
                                    DatePicker()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("DatePicker : ${Position_Prop[0]}")
                                Column() {
                                    DatePicker()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Divider : ${Position_Prop[0]}")
                                Column() {
                                    Divider()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Divider : ${Position_Prop[0]}")
                                Column() {
                                    Divider()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Divider : ${Position_Prop[0]}")
                                Column() {
                                    Divider()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Divider : ${Position_Prop[0]}")
                                Column() {
                                    Divider()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Gauge : ${Position_Prop[0]}")
                                Column() {
                                    Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                        Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Gauge : ${Position_Prop[0]}")
                                Column() {
                                    Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                        Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Gauge : ${Position_Prop[0]}")
                                Column() {
                                    Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                        Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Gauge : ${Position_Prop[0]}")
                                Column() {
                                    Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                        Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Image : ${Position_Prop[0]}")
                                Column() {
                                    Image(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Image : ${Position_Prop[0]}")
                                Column() {
                                    Image(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Image : ${Position_Prop[0]}")
                                Column() {
                                    Image(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Image : ${Position_Prop[0]}")
                                Column() {
                                    Image(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "ImageSpan") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("ImageSpan : ${Position_Prop[0]}")
                                Column() {
                                    Text() {
                                        ImageSpan(@r(app.media.startIcon))
                                            .objectFit(ImageFit.Contain)
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                    }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("ImageSpan : ${Position_Prop[0]}")
                                Column() {
                                    Text() {
                                        ImageSpan(@r(app.media.startIcon))
                                            .objectFit(ImageFit.Contain)
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                    }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("ImageSpan : ${Position_Prop[0]}")
                                Column() {
                                    Text() {
                                        ImageSpan(@r(app.media.startIcon))
                                            .objectFit(ImageFit.Contain)
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                    }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("ImageSpan : ${Position_Prop[0]}")
                                Column() {
                                    Text() {
                                        ImageSpan(@r(app.media.startIcon))
                                            .objectFit(ImageFit.Contain)
                                            .id(this.targetView + Position_Prop[0])
                                            .position(
                                                x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                    }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("LoadingProgress : ${Position_Prop[0]}")
                                Column() {
                                    LoadingProgress()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("LoadingProgress : ${Position_Prop[0]}")
                                Column() {
                                    LoadingProgress()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("LoadingProgress : ${Position_Prop[0]}")
                                Column() {
                                    LoadingProgress()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("LoadingProgress : ${Position_Prop[0]}")
                                Column() {
                                    LoadingProgress()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Menu : ${Position_Prop[0]}")
                                Column() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Menu : ${Position_Prop[0]}")
                                Column() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Menu : ${Position_Prop[0]}")
                                Column() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Menu : ${Position_Prop[0]}")
                                Column() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("MenuItem : ${Position_Prop[0]}")
                                Column() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .id(this.targetView + Position_Prop[0])
                                                .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                    y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("MenuItem : ${Position_Prop[0]}")
                                Column() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .id(this.targetView + Position_Prop[0])
                                                .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                    y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("MenuItem : ${Position_Prop[0]}")
                                Column() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .id(this.targetView + Position_Prop[0])
                                                .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                    y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("MenuItem : ${Position_Prop[0]}")
                                Column() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .id(this.targetView + Position_Prop[0])
                                                .position(
                                                    x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                                    y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                                )
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("MenuItemGroup : ${Position_Prop[0]}")
                                Column() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("MenuItemGroup : ${Position_Prop[0]}")
                                Column() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("MenuItemGroup : ${Position_Prop[0]}")
                                Column() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("MenuItemGroup : ${Position_Prop[0]}")
                                Column() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(
                                                x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Progress : ${Position_Prop[0]}")
                                Column() {
                                    Progress(value: 10.0)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Progress : ${Position_Prop[0]}")
                                Column() {
                                    Progress(value: 10.0)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Progress : ${Position_Prop[0]}")
                                Column() {
                                    Progress(value: 10.0)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Progress : ${Position_Prop[0]}")
                                Column() {
                                    Progress(value: 10.0)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("QRCode : ${Position_Prop[0]}")
                                Column() {
                                    QRCode(targetView)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("QRCode : ${Position_Prop[0]}")
                                Column() {
                                    QRCode(targetView)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("QRCode : ${Position_Prop[0]}")
                                Column() {
                                    QRCode(targetView)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("QRCode : ${Position_Prop[0]}")
                                Column() {
                                    QRCode(targetView)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Radio : ${Position_Prop[0]}")
                                Column() {
                                    Radio(group: "1", value: "A")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Radio : ${Position_Prop[0]}")
                                Column() {
                                    Radio(group: "1", value: "A")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Radio : ${Position_Prop[0]}")
                                Column() {
                                    Radio(group: "1", value: "A")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Radio : ${Position_Prop[0]}")
                                Column() {
                                    Radio(group: "1", value: "A")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Rating : ${Position_Prop[0]}")
                                Column() {
                                    Rating(rating: 3.5, indicator: false)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Rating : ${Position_Prop[0]}")
                                Column() {
                                    Rating(rating: 3.5, indicator: false)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Rating : ${Position_Prop[0]}")
                                Column() {
                                    Rating(rating: 3.5, indicator: false)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Rating : ${Position_Prop[0]}")
                                Column() {
                                    Rating(rating: 3.5, indicator: false)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Refresh : ${Position_Prop[0]}")
                                Column() {
                                    Refresh( RefreshOptions(refreshing:@Binder(this.isRefreshing))) {
                                        Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Refresh : ${Position_Prop[0]}")
                                Column() {
                                    Refresh( RefreshOptions(refreshing:@Binder(this.isRefreshing))) {
                                        Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Refresh : ${Position_Prop[0]}")
                                Column() {
                                    Refresh( RefreshOptions(refreshing:@Binder(this.isRefreshing))) {
                                        Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Refresh : ${Position_Prop[0]}")
                                Column() {
                                    Refresh( RefreshOptions(refreshing:@Binder(this.isRefreshing))) {
                                        Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("RichEditor : ${Position_Prop[0]}")
                                Column() {
                                    RichEditor(richEditorController)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("RichEditor : ${Position_Prop[0]}")
                                Column() {
                                    RichEditor(richEditorController)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("RichEditor : ${Position_Prop[0]}")
                                Column() {
                                    RichEditor(richEditorController)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("RichEditor : ${Position_Prop[0]}")
                                Column() {
                                    RichEditor(richEditorController)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("RichText : ${Position_Prop[0]}")
                                Column() {
                                    RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("RichText : ${Position_Prop[0]}")
                                Column() {
                                    RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("RichText : ${Position_Prop[0]}")
                                Column() {
                                    RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("RichText : ${Position_Prop[0]}")
                                Column() {
                                    RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("RowSplit : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("RowSplit : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("RowSplit : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("RowSplit : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("ScrollBar : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("ScrollBar : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("ScrollBar : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("ScrollBar : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Search : ${Position_Prop[0]}")
                                Column() {
                                    Search(value: "", placeholder: "Type to search")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Search : ${Position_Prop[0]}")
                                Column() {
                                    Search(value: "", placeholder: "Type to search")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Search : ${Position_Prop[0]}")
                                Column() {
                                    Search(value: "", placeholder: "Type to search")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Search : ${Position_Prop[0]}")
                                Column() {
                                    Search(value: "", placeholder: "Type to search")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Slider : ${Position_Prop[0]}")
                                Column() {
                                    Slider()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Slider : ${Position_Prop[0]}")
                                Column() {
                                    Slider()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Slider : ${Position_Prop[0]}")
                                Column() {
                                    Slider()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Slider : ${Position_Prop[0]}")
                                Column() {
                                    Slider()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Stepper : ${Position_Prop[0]}")
                                Column() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Stepper : ${Position_Prop[0]}")
                                Column() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Stepper : ${Position_Prop[0]}")
                                Column() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Stepper : ${Position_Prop[0]}")
                                Column() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("StepperItem : ${Position_Prop[0]}")
                                Column() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("StepperItem : ${Position_Prop[0]}")
                                Column() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("StepperItem : ${Position_Prop[0]}")
                                Column() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("StepperItem : ${Position_Prop[0]}")
                                Column() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(
                                                x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Text : ${Position_Prop[0]}")
                                Column() {
                                    Text(targetView)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Text : ${Position_Prop[0]}")
                                Column() {
                                    Text(targetView)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Text : ${Position_Prop[0]}")
                                Column() {
                                    Text(targetView)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Text : ${Position_Prop[0]}")
                                Column() {
                                    Text(targetView)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("TextArea : ${Position_Prop[0]}")
                                Column() {
                                    TextArea(text: targetView)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("TextArea : ${Position_Prop[0]}")
                                Column() {
                                    TextArea(text: targetView)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("TextArea : ${Position_Prop[0]}")
                                Column() {
                                    TextArea(text: targetView)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("TextArea : ${Position_Prop[0]}")
                                Column() {
                                    TextArea(text: targetView)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("TextClock : ${Position_Prop[0]}")
                                Column() {
                                    TextClock()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("TextClock : ${Position_Prop[0]}")
                                Column() {
                                    TextClock()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("TextClock : ${Position_Prop[0]}")
                                Column() {
                                    TextClock()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("TextClock : ${Position_Prop[0]}")
                                Column() {
                                    TextClock()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("TextInput : ${Position_Prop[0]}")
                                Column() {
                                    TextInput(placeholder: "TextInput")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("TextInput : ${Position_Prop[0]}")
                                Column() {
                                    TextInput(placeholder: "TextInput")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("TextInput : ${Position_Prop[0]}")
                                Column() {
                                    TextInput(placeholder: "TextInput")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("TextInput : ${Position_Prop[0]}")
                                Column() {
                                    TextInput(placeholder: "TextInput")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("TextPicker : ${Position_Prop[0]}")
                                Column() {
                                    TextPicker(range:["apple", "banana", "orange", "peach"])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("TextPicker : ${Position_Prop[0]}")
                                Column() {
                                    TextPicker(range:["apple", "banana", "orange", "peach"])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("TextPicker : ${Position_Prop[0]}")
                                Column() {
                                    TextPicker(range:["apple", "banana", "orange", "peach"])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("TextPicker : ${Position_Prop[0]}")
                                Column() {
                                    TextPicker(range:["apple", "banana", "orange", "peach"])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("TextTimer : ${Position_Prop[0]}")
                                Column() {
                                    TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("TextTimer : ${Position_Prop[0]}")
                                Column() {
                                    TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("TextTimer : ${Position_Prop[0]}")
                                Column() {
                                    TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("TextTimer : ${Position_Prop[0]}")
                                Column() {
                                    TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Toggle : ${Position_Prop[0]}")
                                Column() {
                                    Toggle(ToggleType.Switch, isOn: false)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Toggle : ${Position_Prop[0]}")
                                Column() {
                                    Toggle(ToggleType.Switch, isOn: false)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Toggle : ${Position_Prop[0]}")
                                Column() {
                                    Toggle(ToggleType.Switch, isOn: false)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Toggle : ${Position_Prop[0]}")
                                Column() {
                                    Toggle(ToggleType.Switch, isOn: false)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Web : ${Position_Prop[0]}")
                                Column() {
                                    Web(src: "www.baidu.com", controller: webController)
                                        .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                        .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Web : ${Position_Prop[0]}")
                                Column() {
                                    Web(src: "www.baidu.com", controller: webController)
                                        .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                        .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Web : ${Position_Prop[0]}")
                                Column() {
                                    Web(src: "www.baidu.com", controller: webController)
                                        .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                        .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Web : ${Position_Prop[0]}")
                                Column() {
                                    Web(src: "www.baidu.com", controller: webController)
                                        .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                        .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Select : ${Position_Prop[0]}")
                                Column() {
                                    Select(
                                        [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                            SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                        .value("Select")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Select : ${Position_Prop[0]}")
                                Column() {
                                    Select(
                                        [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                            SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                        .value("Select")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Select : ${Position_Prop[0]}")
                                Column() {
                                    Select(
                                        [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                            SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                        .value("Select")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Select : ${Position_Prop[0]}")
                                Column() {
                                    Select(
                                        [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                            SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                        .value("Select")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Badge : ${Position_Prop[0]}")
                                Column() {
                                    Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                        Button("message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Badge : ${Position_Prop[0]}")
                                Column() {
                                    Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                        Button("message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Badge : ${Position_Prop[0]}")
                                Column() {
                                    Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                        Button("message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Badge : ${Position_Prop[0]}")
                                Column() {
                                    Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                        Button("message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is BadgePosition) {
                                Text("Badge : ${Position_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2]),
                                        position: (Position_Prop[1] as BadgePosition).getOrThrow()) {
                                    Button("message").width(70).height(50).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .width(80.percent)
                                    .key(this.targetView + Position_Prop[0])
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Column : ${Position_Prop[0]}")
                                Column() {
                                    Column() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Column : ${Position_Prop[0]}")
                                Column() {
                                    Column() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Column : ${Position_Prop[0]}")
                                Column() {
                                    Column() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Column : ${Position_Prop[0]}")
                                Column() {
                                    Column() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Grid : ${Position_Prop[0]}")
                                Column() {
                                    Grid ( child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    })
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Grid : ${Position_Prop[0]}")
                                Column() {
                                    Grid ( child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    })
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Grid : ${Position_Prop[0]}")
                                Column() {
                                    Grid ( child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    })
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Grid : ${Position_Prop[0]}")
                                Column() {
                                    Grid ( child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    })
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("GridItem : ${Position_Prop[0]}")
                                Column() {
                                    Grid ( child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        })
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("GridItem : ${Position_Prop[0]}")
                                Column() {
                                    Grid ( child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        })
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("GridItem : ${Position_Prop[0]}")
                                Column() {
                                    Grid ( child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        })
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("GridItem : ${Position_Prop[0]}")
                                Column() {
                                    Grid ( child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        })
                                            .id(this.targetView + Position_Prop[0])
                                            .position(
                                                x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("GridRow : ${Position_Prop[0]}")
                                Column() {
                                    GridRow() {
                                        GridCol() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("GridRow : ${Position_Prop[0]}")
                                Column() {
                                    GridRow() {
                                        GridCol() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("GridRow : ${Position_Prop[0]}")
                                Column() {
                                    GridRow() {
                                        GridCol() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("GridRow : ${Position_Prop[0]}")
                                Column() {
                                    GridRow() {
                                        GridCol() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("GridCol : ${Position_Prop[0]}")
                                Column() {
                                    GridRow() {
                                        GridCol() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("GridCol : ${Position_Prop[0]}")
                                Column() {
                                    GridRow() {
                                        GridCol() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("GridCol : ${Position_Prop[0]}")
                                Column() {
                                    GridRow() {
                                        GridCol() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("GridCol : ${Position_Prop[0]}")
                                Column() {
                                    GridRow() {
                                        GridCol() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(
                                                x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Flex : ${Position_Prop[0]}")
                                Column() {
                                    Flex() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Flex : ${Position_Prop[0]}")
                                Column() {
                                    Flex() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Flex : ${Position_Prop[0]}")
                                Column() {
                                    Flex() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Flex : ${Position_Prop[0]}")
                                Column() {
                                    Flex() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("List : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("List : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("List : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("List : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("ListItem : ${Position_Prop[0]}")
                                Column() {
                                    List() {
                                        ListItemGroup() {
                                            ListItem() {
                                                Text("Text")
                                                    .width(80.percent)
                                                    .height(80.percent)
                                                    .backgroundColor(this.Colors[3])
                                            }
                                                .id(this.targetView + Position_Prop[0])
                                                .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                    y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("ListItem : ${Position_Prop[0]}")
                                Column() {
                                    List() {
                                        ListItemGroup() {
                                            ListItem() {
                                                Text("Text")
                                                    .width(80.percent)
                                                    .height(80.percent)
                                                    .backgroundColor(this.Colors[3])
                                            }
                                                .id(this.targetView + Position_Prop[0])
                                                .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                    y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("ListItem : ${Position_Prop[0]}")
                                Column() {
                                    List() {
                                        ListItemGroup() {
                                            ListItem() {
                                                Text("Text")
                                                    .width(80.percent)
                                                    .height(80.percent)
                                                    .backgroundColor(this.Colors[3])
                                            }
                                                .id(this.targetView + Position_Prop[0])
                                                .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                    y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("ListItem : ${Position_Prop[0]}")
                                Column() {
                                    List() {
                                        ListItemGroup() {
                                            ListItem() {
                                                Text("Text")
                                                    .width(80.percent)
                                                    .height(80.percent)
                                                    .backgroundColor(this.Colors[3])
                                            }
                                                .id(this.targetView + Position_Prop[0])
                                                .position(
                                                    x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                                    y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                                )
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("ListItemGroup : ${Position_Prop[0]}")
                                Column() {
                                    List() {
                                        ListItemGroup() {
                                            ListItem() {
                                                Text("Text")
                                                    .width(80.percent)
                                                    .height(80.percent)
                                                    .backgroundColor(this.Colors[3])
                                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("ListItemGroup : ${Position_Prop[0]}")
                                Column() {
                                    List() {
                                        ListItemGroup() {
                                            ListItem() {
                                                Text("Text")
                                                    .width(80.percent)
                                                    .height(80.percent)
                                                    .backgroundColor(this.Colors[3])
                                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("ListItemGroup : ${Position_Prop[0]}")
                                Column() {
                                    List() {
                                        ListItemGroup() {
                                            ListItem() {
                                                Text("Text")
                                                    .width(80.percent)
                                                    .height(80.percent)
                                                    .backgroundColor(this.Colors[3])
                                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("ListItemGroup : ${Position_Prop[0]}")
                                Column() {
                                    List() {
                                        ListItemGroup() {
                                            ListItem() {
                                                Text("Text")
                                                    .width(80.percent)
                                                    .height(80.percent)
                                                    .backgroundColor(this.Colors[3])
                                            }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                        }
                                            .id(this.targetView + Position_Prop[0])
                                            .position(
                                                x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("RelativeContainer : ${Position_Prop[0]}")
                                Column() {
                                    RelativeContainer() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("RelativeContainer : ${Position_Prop[0]}")
                                Column() {
                                    RelativeContainer() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("RelativeContainer : ${Position_Prop[0]}")
                                Column() {
                                    RelativeContainer() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("RelativeContainer : ${Position_Prop[0]}")
                                Column() {
                                    RelativeContainer() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Row : ${Position_Prop[0]}")
                                Column() {
                                    Row() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Row : ${Position_Prop[0]}")
                                Column() {
                                    Row() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Row : ${Position_Prop[0]}")
                                Column() {
                                    Row() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Row : ${Position_Prop[0]}")
                                Column() {
                                    Row() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Scroll : ${Position_Prop[0]}")
                                Column() {
                                    Scroll() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Scroll : ${Position_Prop[0]}")
                                Column() {
                                    Scroll() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Scroll : ${Position_Prop[0]}")
                                Column() {
                                    Scroll() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Scroll : ${Position_Prop[0]}")
                                Column() {
                                    Scroll() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Stack : ${Position_Prop[0]}")
                                Column() {
                                    Stack() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Stack : ${Position_Prop[0]}")
                                Column() {
                                    Stack() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Stack : ${Position_Prop[0]}")
                                Column() {
                                    Stack() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Stack : ${Position_Prop[0]}")
                                Column() {
                                    Stack() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Swiper : ${Position_Prop[0]}")
                                Column() {
                                    Swiper(controller:SwiperController()) {
                                        Text("1").width(80.percent).height(80.percent)
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Swiper : ${Position_Prop[0]}")
                                Column() {
                                    Swiper(controller:SwiperController()) {
                                        Text("1").width(80.percent).height(80.percent)
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Swiper : ${Position_Prop[0]}")
                                Column() {
                                    Swiper(controller:SwiperController()) {
                                        Text("1").width(80.percent).height(80.percent)
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Swiper : ${Position_Prop[0]}")
                                Column() {
                                    Swiper(controller:SwiperController()) {
                                        Text("1").width(80.percent).height(80.percent)
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Tabs : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Tabs : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Tabs : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Tabs : ${Position_Prop[0]}")
                                Column() {
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
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "TabContent") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("TabContent : ${Position_Prop[0]}")
                                Column() {
                                    Tabs() {
                                        TabContent {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .tabBar("1")
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("TabContent : ${Position_Prop[0]}")
                                Column() {
                                    Tabs() {
                                        TabContent {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .tabBar("1")
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("TabContent : ${Position_Prop[0]}")
                                Column() {
                                    Tabs() {
                                        TabContent {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .tabBar("1")
                                            .id(this.targetView + Position_Prop[0])
                                            .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("TabContent : ${Position_Prop[0]}")
                                Column() {
                                    Tabs() {
                                        TabContent {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }
                                            .tabBar("1")
                                            .id(this.targetView + Position_Prop[0])
                                            .position(
                                                x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                                y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Circle : ${Position_Prop[0]}")
                                Column() {
                                    Circle()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Circle : ${Position_Prop[0]}")
                                Column() {
                                    Circle()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Circle : ${Position_Prop[0]}")
                                Column() {
                                    Circle()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Circle : ${Position_Prop[0]}")
                                Column() {
                                    Circle()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Line : ${Position_Prop[0]}")
                                Column() {
                                    Line()
                                        .startPoint((0.0, 0.0))
                                        .endPoint((10.0, 20.0))
                                        .stroke(Color.Black)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Line : ${Position_Prop[0]}")
                                Column() {
                                    Line()
                                        .startPoint((0.0, 0.0))
                                        .endPoint((10.0, 20.0))
                                        .stroke(Color.Black)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Line : ${Position_Prop[0]}")
                                Column() {
                                    Line()
                                        .startPoint((0.0, 0.0))
                                        .endPoint((10.0, 20.0))
                                        .stroke(Color.Black)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Line : ${Position_Prop[0]}")
                                Column() {
                                    Line()
                                        .startPoint((0.0, 0.0))
                                        .endPoint((10.0, 20.0))
                                        .stroke(Color.Black)
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Rect : ${Position_Prop[0]}")
                                Column() {
                                    Rect()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Rect : ${Position_Prop[0]}")
                                Column() {
                                    Rect()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Rect : ${Position_Prop[0]}")
                                Column() {
                                    Rect()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Rect : ${Position_Prop[0]}")
                                Column() {
                                    Rect()
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Shape : ${Position_Prop[0]}")
                                Column() {
                                    Shape() {
                                        Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Shape : ${Position_Prop[0]}")
                                Column() {
                                    Shape() {
                                        Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Shape : ${Position_Prop[0]}")
                                Column() {
                                    Shape() {
                                        Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Shape : ${Position_Prop[0]}")
                                Column() {
                                    Shape() {
                                        Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (Position_Prop[1] is (Length, Length)) {
                                Text("Path : ${Position_Prop[0]}")
                                Column() {
                                    Path()
                                        .commands("M0 0 H200 V200 H0 Z")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Float64, Float64)) {
                                Text("Path : ${Position_Prop[0]}")
                                Column() {
                                    Path()
                                        .commands("M0 0 H200 V200 H0 Z")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (Int64, Int64)) {
                                Text("Path : ${Position_Prop[0]}")
                                Column() {
                                    Path()
                                        .commands("M0 0 H200 V200 H0 Z")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            } else if (Position_Prop[1] is (AppResource, AppResource)) {
                                Text("Path : ${Position_Prop[0]}")
                                Column() {
                                    Path()
                                        .commands("M0 0 H200 V200 H0 Z")
                                        .width(80.percent)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + Position_Prop[0])
                                        .position(x: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            y: ((Position_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(100.percent).height(120).backgroundColor(Color.Gray)
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
