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
class View_EmptyAttrs_Padding {
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
                    ObservedArrayList<(String, Any, String)>(PaddingMargin_Prop_List),
                    itemGeneratorFunc: {
                        PaddingMargin_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("AlphabetIndexer : ${PaddingMargin_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("AlphabetIndexer : ${PaddingMargin_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("AlphabetIndexer : ${PaddingMargin_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("AlphabetIndexer : ${PaddingMargin_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Blank : ${PaddingMargin_Prop[0]}")
                                Blank(min: 10)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Blank : ${PaddingMargin_Prop[0]}")
                                Blank(min: 10)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Blank : ${PaddingMargin_Prop[0]}")
                                Blank(min: 10)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Blank : ${PaddingMargin_Prop[0]}")
                                Blank(min: 10)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Button : ${PaddingMargin_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Button : ${PaddingMargin_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Button : ${PaddingMargin_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Button : ${PaddingMargin_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Checkbox : ${PaddingMargin_Prop[0]}")
                                Checkbox()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Checkbox : ${PaddingMargin_Prop[0]}")
                                Checkbox()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Checkbox : ${PaddingMargin_Prop[0]}")
                                Checkbox()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Checkbox : ${PaddingMargin_Prop[0]}")
                                Checkbox()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("CheckboxGroup : ${PaddingMargin_Prop[0]}")
                                CheckboxGroup()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("CheckboxGroup : ${PaddingMargin_Prop[0]}")
                                CheckboxGroup()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("CheckboxGroup : ${PaddingMargin_Prop[0]}")
                                CheckboxGroup()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("CheckboxGroup : ${PaddingMargin_Prop[0]}")
                                CheckboxGroup()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("DataPanel : ${PaddingMargin_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("DataPanel : ${PaddingMargin_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("DataPanel : ${PaddingMargin_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("DataPanel : ${PaddingMargin_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("DatePicker : ${PaddingMargin_Prop[0]}")
                                DatePicker()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("DatePicker : ${PaddingMargin_Prop[0]}")
                                DatePicker()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("DatePicker : ${PaddingMargin_Prop[0]}")
                                DatePicker()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("DatePicker : ${PaddingMargin_Prop[0]}")
                                DatePicker()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Divider : ${PaddingMargin_Prop[0]}")
                                Divider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Divider : ${PaddingMargin_Prop[0]}")
                                Divider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Divider : ${PaddingMargin_Prop[0]}")
                                Divider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Divider : ${PaddingMargin_Prop[0]}")
                                Divider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Gauge : ${PaddingMargin_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Gauge : ${PaddingMargin_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Gauge : ${PaddingMargin_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Gauge : ${PaddingMargin_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Image : ${PaddingMargin_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Image : ${PaddingMargin_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Image : ${PaddingMargin_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Image : ${PaddingMargin_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "ImageSpan") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("ImageSpan : ${PaddingMargin_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("ImageSpan : ${PaddingMargin_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("ImageSpan : ${PaddingMargin_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[3]
                                        )
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("ImageSpan : ${PaddingMargin_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[3]
                                        )
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("LoadingProgress : ${PaddingMargin_Prop[0]}")
                                LoadingProgress()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("LoadingProgress : ${PaddingMargin_Prop[0]}")
                                LoadingProgress()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("LoadingProgress : ${PaddingMargin_Prop[0]}")
                                LoadingProgress()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("LoadingProgress : ${PaddingMargin_Prop[0]}")
                                LoadingProgress()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Menu : ${PaddingMargin_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Menu : ${PaddingMargin_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Menu : ${PaddingMargin_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Menu : ${PaddingMargin_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("MenuItem : ${PaddingMargin_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + PaddingMargin_Prop[0])
                                            .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("MenuItem : ${PaddingMargin_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + PaddingMargin_Prop[0])
                                            .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("MenuItem : ${PaddingMargin_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + PaddingMargin_Prop[0])
                                            .padding(
                                                top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                    .getOrThrow())[0],
                                                right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                    .getOrThrow())[1],
                                                bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                    .getOrThrow())[2],
                                                left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                    .getOrThrow())[3]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("MenuItem : ${PaddingMargin_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + PaddingMargin_Prop[0])
                                            .padding(
                                                top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                    AppResource)).getOrThrow())[0],
                                                right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                    AppResource)).getOrThrow())[1],
                                                bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, 
                                                    AppResource, AppResource)).getOrThrow())[2],
                                                left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                    AppResource)).getOrThrow())[3]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("MenuItemGroup : ${PaddingMargin_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("MenuItemGroup : ${PaddingMargin_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("MenuItemGroup : ${PaddingMargin_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("MenuItemGroup : ${PaddingMargin_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Progress : ${PaddingMargin_Prop[0]}")
                                Progress(value: 10.0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Progress : ${PaddingMargin_Prop[0]}")
                                Progress(value: 10.0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Progress : ${PaddingMargin_Prop[0]}")
                                Progress(value: 10.0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Progress : ${PaddingMargin_Prop[0]}")
                                Progress(value: 10.0)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("QRCode : ${PaddingMargin_Prop[0]}")
                                QRCode(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("QRCode : ${PaddingMargin_Prop[0]}")
                                QRCode(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("QRCode : ${PaddingMargin_Prop[0]}")
                                QRCode(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("QRCode : ${PaddingMargin_Prop[0]}")
                                QRCode(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Radio : ${PaddingMargin_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Radio : ${PaddingMargin_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Radio : ${PaddingMargin_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Radio : ${PaddingMargin_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Rating : ${PaddingMargin_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Rating : ${PaddingMargin_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Rating : ${PaddingMargin_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Rating : ${PaddingMargin_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Refresh : ${PaddingMargin_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Refresh : ${PaddingMargin_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Refresh : ${PaddingMargin_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Refresh : ${PaddingMargin_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("RichEditor : ${PaddingMargin_Prop[0]}")
                                RichEditor(richEditorController)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("RichEditor : ${PaddingMargin_Prop[0]}")
                                RichEditor(richEditorController)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("RichEditor : ${PaddingMargin_Prop[0]}")
                                RichEditor(richEditorController)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("RichEditor : ${PaddingMargin_Prop[0]}")
                                RichEditor(richEditorController)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("RichText : ${PaddingMargin_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("RichText : ${PaddingMargin_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("RichText : ${PaddingMargin_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("RichText : ${PaddingMargin_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("RowSplit : ${PaddingMargin_Prop[0]}")
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
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("RowSplit : ${PaddingMargin_Prop[0]}")
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
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("RowSplit : ${PaddingMargin_Prop[0]}")
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
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("RowSplit : ${PaddingMargin_Prop[0]}")
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
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("ScrollBar : ${PaddingMargin_Prop[0]}")

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
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("ScrollBar : ${PaddingMargin_Prop[0]}")

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
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("ScrollBar : ${PaddingMargin_Prop[0]}")

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
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("ScrollBar : ${PaddingMargin_Prop[0]}")

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
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Search : ${PaddingMargin_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Search : ${PaddingMargin_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Search : ${PaddingMargin_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Search : ${PaddingMargin_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Slider : ${PaddingMargin_Prop[0]}")
                                Slider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Slider : ${PaddingMargin_Prop[0]}")
                                Slider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Slider : ${PaddingMargin_Prop[0]}")
                                Slider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Slider : ${PaddingMargin_Prop[0]}")
                                Slider()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Stepper : ${PaddingMargin_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Stepper : ${PaddingMargin_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Stepper : ${PaddingMargin_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Stepper : ${PaddingMargin_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("StepperItem : ${PaddingMargin_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("StepperItem : ${PaddingMargin_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("StepperItem : ${PaddingMargin_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("StepperItem : ${PaddingMargin_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Text : ${PaddingMargin_Prop[0]}")
                                Text(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Text : ${PaddingMargin_Prop[0]}")
                                Text(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Text : ${PaddingMargin_Prop[0]}")
                                Text(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Text : ${PaddingMargin_Prop[0]}")
                                Text(targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("TextArea : ${PaddingMargin_Prop[0]}")
                                TextArea(text: targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("TextArea : ${PaddingMargin_Prop[0]}")
                                TextArea(text: targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("TextArea : ${PaddingMargin_Prop[0]}")
                                TextArea(text: targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("TextArea : ${PaddingMargin_Prop[0]}")
                                TextArea(text: targetView)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("TextClock : ${PaddingMargin_Prop[0]}")
                                TextClock()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("TextClock : ${PaddingMargin_Prop[0]}")
                                TextClock()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("TextClock : ${PaddingMargin_Prop[0]}")
                                TextClock()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("TextClock : ${PaddingMargin_Prop[0]}")
                                TextClock()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("TextInput : ${PaddingMargin_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("TextInput : ${PaddingMargin_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("TextInput : ${PaddingMargin_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("TextInput : ${PaddingMargin_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("TextPicker : ${PaddingMargin_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("TextPicker : ${PaddingMargin_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("TextPicker : ${PaddingMargin_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("TextPicker : ${PaddingMargin_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("TextTimer : ${PaddingMargin_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("TextTimer : ${PaddingMargin_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("TextTimer : ${PaddingMargin_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("TextTimer : ${PaddingMargin_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Toggle : ${PaddingMargin_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Toggle : ${PaddingMargin_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Toggle : ${PaddingMargin_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Toggle : ${PaddingMargin_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Web : ${PaddingMargin_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Web : ${PaddingMargin_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Web : ${PaddingMargin_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Web : ${PaddingMargin_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Select : ${PaddingMargin_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Select : ${PaddingMargin_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Select : ${PaddingMargin_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Select : ${PaddingMargin_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Badge : ${PaddingMargin_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Badge : ${PaddingMargin_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Badge : ${PaddingMargin_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Badge : ${PaddingMargin_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Column : ${PaddingMargin_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Column : ${PaddingMargin_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Column : ${PaddingMargin_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Column : ${PaddingMargin_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Grid : ${PaddingMargin_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Grid : ${PaddingMargin_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Grid : ${PaddingMargin_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Grid : ${PaddingMargin_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("GridItem : ${PaddingMargin_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("GridItem : ${PaddingMargin_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("GridItem : ${PaddingMargin_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("GridItem : ${PaddingMargin_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("GridRow : ${PaddingMargin_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("GridRow : ${PaddingMargin_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("GridRow : ${PaddingMargin_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("GridRow : ${PaddingMargin_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("GridCol : ${PaddingMargin_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("GridCol : ${PaddingMargin_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("GridCol : ${PaddingMargin_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("GridCol : ${PaddingMargin_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Flex : ${PaddingMargin_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Flex : ${PaddingMargin_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Flex : ${PaddingMargin_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Flex : ${PaddingMargin_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("List : ${PaddingMargin_Prop[0]}")
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
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("List : ${PaddingMargin_Prop[0]}")
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
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("List : ${PaddingMargin_Prop[0]}")
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
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("List : ${PaddingMargin_Prop[0]}")
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
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("ListItem : ${PaddingMargin_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + PaddingMargin_Prop[0])
                                            .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("ListItem : ${PaddingMargin_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + PaddingMargin_Prop[0])
                                            .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("ListItem : ${PaddingMargin_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + PaddingMargin_Prop[0])
                                            .padding(
                                                top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                    .getOrThrow())[0],
                                                right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                    .getOrThrow())[1],
                                                bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                    .getOrThrow())[2],
                                                left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                    .getOrThrow())[3]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("ListItem : ${PaddingMargin_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + PaddingMargin_Prop[0])
                                            .padding(
                                                top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                    AppResource)).getOrThrow())[0],
                                                right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                    AppResource)).getOrThrow())[1],
                                                bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, 
                                                    AppResource, AppResource)).getOrThrow())[2],
                                                left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                    AppResource)).getOrThrow())[3]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("ListItemGroup : ${PaddingMargin_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("ListItemGroup : ${PaddingMargin_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("ListItemGroup : ${PaddingMargin_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("ListItemGroup : ${PaddingMargin_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("RelativeContainer : ${PaddingMargin_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("RelativeContainer : ${PaddingMargin_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("RelativeContainer : ${PaddingMargin_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("RelativeContainer : ${PaddingMargin_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Row : ${PaddingMargin_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Row : ${PaddingMargin_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Row : ${PaddingMargin_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Row : ${PaddingMargin_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Scroll : ${PaddingMargin_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Scroll : ${PaddingMargin_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Scroll : ${PaddingMargin_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Scroll : ${PaddingMargin_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Stack : ${PaddingMargin_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Stack : ${PaddingMargin_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Stack : ${PaddingMargin_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Stack : ${PaddingMargin_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Swiper : ${PaddingMargin_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Swiper : ${PaddingMargin_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Swiper : ${PaddingMargin_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Swiper : ${PaddingMargin_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Tabs : ${PaddingMargin_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Tabs : ${PaddingMargin_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Tabs : ${PaddingMargin_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Tabs : ${PaddingMargin_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "TabContent") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("TabContent : ${PaddingMargin_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("TabContent : ${PaddingMargin_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("TabContent : ${PaddingMargin_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length))
                                                .getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("TabContent : ${PaddingMargin_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + PaddingMargin_Prop[0])
                                        .padding(
                                            top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[0],
                                            right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[1],
                                            bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[2],
                                            left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                                AppResource)).getOrThrow())[3]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Circle : ${PaddingMargin_Prop[0]}")
                                Circle()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Circle : ${PaddingMargin_Prop[0]}")
                                Circle()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Circle : ${PaddingMargin_Prop[0]}")
                                Circle()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Circle : ${PaddingMargin_Prop[0]}")
                                Circle()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Line : ${PaddingMargin_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Line : ${PaddingMargin_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Line : ${PaddingMargin_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Line : ${PaddingMargin_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Rect : ${PaddingMargin_Prop[0]}")
                                Rect()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Rect : ${PaddingMargin_Prop[0]}")
                                Rect()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Rect : ${PaddingMargin_Prop[0]}")
                                Rect()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Rect : ${PaddingMargin_Prop[0]}")
                                Rect()
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Shape : ${PaddingMargin_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Shape : ${PaddingMargin_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Shape : ${PaddingMargin_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Shape : ${PaddingMargin_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (PaddingMargin_Prop[1] is Length) {
                                Text("Path : ${PaddingMargin_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as Length).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is AppResource) {
                                Text("Path : ${PaddingMargin_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding((PaddingMargin_Prop[1] as AppResource).getOrThrow())
                            } else if (PaddingMargin_Prop[1] is (Length, Length, Length, Length)) {
                                Text("Path : ${PaddingMargin_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow(
                                        ))[2],
                                        left: ((PaddingMargin_Prop[1] as (Length, Length, Length, Length)).getOrThrow())[3]
                                    )
                            } else if (PaddingMargin_Prop[1] is (AppResource, AppResource, AppResource, AppResource)) {
                                Text("Path : ${PaddingMargin_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + PaddingMargin_Prop[0])
                                    .padding(
                                        top: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[0],
                                        right: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[1],
                                        bottom: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[2],
                                        left: ((PaddingMargin_Prop[1] as (AppResource, AppResource, AppResource, 
                                            AppResource)).getOrThrow())[3]
                                    )
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
