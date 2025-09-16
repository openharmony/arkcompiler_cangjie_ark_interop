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
class View_EmptyAttrs_Size {
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
                    ObservedArrayList<(String, Any, String)>(Size_Prop_List),
                    itemGeneratorFunc: {
                        Size_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("AlphabetIndexer : ${Size_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("AlphabetIndexer : ${Size_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("AlphabetIndexer : ${Size_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("AlphabetIndexer : ${Size_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Blank : ${Size_Prop[0]}")
                                Blank(min: 10)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Blank : ${Size_Prop[0]}")
                                Blank(min: 10)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Blank : ${Size_Prop[0]}")
                                Blank(min: 10)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Blank : ${Size_Prop[0]}")
                                Blank(min: 10)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Button : ${Size_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Button : ${Size_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Button : ${Size_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Button : ${Size_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Checkbox : ${Size_Prop[0]}")
                                Checkbox()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Checkbox : ${Size_Prop[0]}")
                                Checkbox()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Checkbox : ${Size_Prop[0]}")
                                Checkbox()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Checkbox : ${Size_Prop[0]}")
                                Checkbox()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("CheckboxGroup : ${Size_Prop[0]}")
                                CheckboxGroup()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("CheckboxGroup : ${Size_Prop[0]}")
                                CheckboxGroup()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("CheckboxGroup : ${Size_Prop[0]}")
                                CheckboxGroup()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("CheckboxGroup : ${Size_Prop[0]}")
                                CheckboxGroup()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("DataPanel : ${Size_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("DataPanel : ${Size_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("DataPanel : ${Size_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("DataPanel : ${Size_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("DatePicker : ${Size_Prop[0]}")
                                DatePicker()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("DatePicker : ${Size_Prop[0]}")
                                DatePicker()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("DatePicker : ${Size_Prop[0]}")
                                DatePicker()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("DatePicker : ${Size_Prop[0]}")
                                DatePicker()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Divider : ${Size_Prop[0]}")
                                Divider()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Divider : ${Size_Prop[0]}")
                                Divider()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Divider : ${Size_Prop[0]}")
                                Divider()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Divider : ${Size_Prop[0]}")
                                Divider()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Gauge : ${Size_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Gauge : ${Size_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Gauge : ${Size_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Gauge : ${Size_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Image : ${Size_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Image : ${Size_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Image : ${Size_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Image : ${Size_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "ImageSpan") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("ImageSpan : ${Size_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("ImageSpan : ${Size_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("ImageSpan : ${Size_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("ImageSpan : ${Size_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("LoadingProgress : ${Size_Prop[0]}")
                                LoadingProgress()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("LoadingProgress : ${Size_Prop[0]}")
                                LoadingProgress()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("LoadingProgress : ${Size_Prop[0]}")
                                LoadingProgress()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("LoadingProgress : ${Size_Prop[0]}")
                                LoadingProgress()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Menu : ${Size_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Menu : ${Size_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Menu : ${Size_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Menu : ${Size_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("MenuItem : ${Size_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + Size_Prop[0])
                                            .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("MenuItem : ${Size_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + Size_Prop[0])
                                            .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("MenuItem : ${Size_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + Size_Prop[0])
                                            .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("MenuItem : ${Size_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + Size_Prop[0])
                                            .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                                height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("MenuItemGroup : ${Size_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("MenuItemGroup : ${Size_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("MenuItemGroup : ${Size_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("MenuItemGroup : ${Size_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Progress : ${Size_Prop[0]}")
                                Progress(value: 10.0)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Progress : ${Size_Prop[0]}")
                                Progress(value: 10.0)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Progress : ${Size_Prop[0]}")
                                Progress(value: 10.0)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Progress : ${Size_Prop[0]}")
                                Progress(value: 10.0)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("QRCode : ${Size_Prop[0]}")
                                QRCode(targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("QRCode : ${Size_Prop[0]}")
                                QRCode(targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("QRCode : ${Size_Prop[0]}")
                                QRCode(targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("QRCode : ${Size_Prop[0]}")
                                QRCode(targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Radio : ${Size_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Radio : ${Size_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Radio : ${Size_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Radio : ${Size_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Rating : ${Size_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Rating : ${Size_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Rating : ${Size_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Rating : ${Size_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Refresh : ${Size_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Refresh : ${Size_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Refresh : ${Size_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Refresh : ${Size_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("RichEditor : ${Size_Prop[0]}")
                                RichEditor(richEditorController)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("RichEditor : ${Size_Prop[0]}")
                                RichEditor(richEditorController)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("RichEditor : ${Size_Prop[0]}")
                                RichEditor(richEditorController)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("RichEditor : ${Size_Prop[0]}")
                                RichEditor(richEditorController)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("RichText : ${Size_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("RichText : ${Size_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("RichText : ${Size_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("RichText : ${Size_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("RowSplit : ${Size_Prop[0]}")
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
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("RowSplit : ${Size_Prop[0]}")
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
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("RowSplit : ${Size_Prop[0]}")
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
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("RowSplit : ${Size_Prop[0]}")
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
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("ScrollBar : ${Size_Prop[0]}")

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
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("ScrollBar : ${Size_Prop[0]}")

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
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("ScrollBar : ${Size_Prop[0]}")

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
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("ScrollBar : ${Size_Prop[0]}")

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
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Search : ${Size_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Search : ${Size_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Search : ${Size_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Search : ${Size_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Slider : ${Size_Prop[0]}")
                                Slider()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Slider : ${Size_Prop[0]}")
                                Slider()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Slider : ${Size_Prop[0]}")
                                Slider()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Slider : ${Size_Prop[0]}")
                                Slider()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Stepper : ${Size_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Stepper : ${Size_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Stepper : ${Size_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Stepper : ${Size_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("StepperItem : ${Size_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("StepperItem : ${Size_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("StepperItem : ${Size_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("StepperItem : ${Size_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Text : ${Size_Prop[0]}")
                                Text(targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Text : ${Size_Prop[0]}")
                                Text(targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Text : ${Size_Prop[0]}")
                                Text(targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Text : ${Size_Prop[0]}")
                                Text(targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("TextArea : ${Size_Prop[0]}")
                                TextArea(text: targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("TextArea : ${Size_Prop[0]}")
                                TextArea(text: targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("TextArea : ${Size_Prop[0]}")
                                TextArea(text: targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("TextArea : ${Size_Prop[0]}")
                                TextArea(text: targetView)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("TextClock : ${Size_Prop[0]}")
                                TextClock()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("TextClock : ${Size_Prop[0]}")
                                TextClock()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("TextClock : ${Size_Prop[0]}")
                                TextClock()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("TextClock : ${Size_Prop[0]}")
                                TextClock()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("TextInput : ${Size_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("TextInput : ${Size_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("TextInput : ${Size_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("TextInput : ${Size_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("TextPicker : ${Size_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("TextPicker : ${Size_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("TextPicker : ${Size_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("TextPicker : ${Size_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("TextTimer : ${Size_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("TextTimer : ${Size_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("TextTimer : ${Size_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("TextTimer : ${Size_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Toggle : ${Size_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Toggle : ${Size_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Toggle : ${Size_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Toggle : ${Size_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Web : ${Size_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Web : ${Size_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Web : ${Size_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Web : ${Size_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Select : ${Size_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Select : ${Size_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Select : ${Size_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Select : ${Size_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Badge : ${Size_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Badge : ${Size_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Badge : ${Size_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Badge : ${Size_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Column : ${Size_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Column : ${Size_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Column : ${Size_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Column : ${Size_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Grid : ${Size_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Grid : ${Size_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Grid : ${Size_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Grid : ${Size_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("GridItem : ${Size_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("GridItem : ${Size_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("GridItem : ${Size_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("GridItem : ${Size_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("GridRow : ${Size_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("GridRow : ${Size_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("GridRow : ${Size_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("GridRow : ${Size_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("GridCol : ${Size_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("GridCol : ${Size_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("GridCol : ${Size_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("GridCol : ${Size_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Flex : ${Size_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Flex : ${Size_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Flex : ${Size_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Flex : ${Size_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("List : ${Size_Prop[0]}")
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
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("List : ${Size_Prop[0]}")
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
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("List : ${Size_Prop[0]}")
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
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("List : ${Size_Prop[0]}")
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
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("ListItem : ${Size_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + Size_Prop[0])
                                            .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("ListItem : ${Size_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + Size_Prop[0])
                                            .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("ListItem : ${Size_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + Size_Prop[0])
                                            .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("ListItem : ${Size_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + Size_Prop[0])
                                            .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                                height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("ListItemGroup : ${Size_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("ListItemGroup : ${Size_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("ListItemGroup : ${Size_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("ListItemGroup : ${Size_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("RelativeContainer : ${Size_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("RelativeContainer : ${Size_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("RelativeContainer : ${Size_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("RelativeContainer : ${Size_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Row : ${Size_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Row : ${Size_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Row : ${Size_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Row : ${Size_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Scroll : ${Size_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Scroll : ${Size_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Scroll : ${Size_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Scroll : ${Size_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Stack : ${Size_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Stack : ${Size_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Stack : ${Size_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Stack : ${Size_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Swiper : ${Size_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Swiper : ${Size_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Swiper : ${Size_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Swiper : ${Size_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Tabs : ${Size_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Tabs : ${Size_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Tabs : ${Size_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Tabs : ${Size_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "TabContent") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("TabContent : ${Size_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("TabContent : ${Size_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("TabContent : ${Size_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("TabContent : ${Size_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + Size_Prop[0])
                                        .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                            height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Circle : ${Size_Prop[0]}")
                                Circle()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Circle : ${Size_Prop[0]}")
                                Circle()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Circle : ${Size_Prop[0]}")
                                Circle()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Circle : ${Size_Prop[0]}")
                                Circle()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Line : ${Size_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Line : ${Size_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Line : ${Size_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Line : ${Size_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Rect : ${Size_Prop[0]}")
                                Rect()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Rect : ${Size_Prop[0]}")
                                Rect()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Rect : ${Size_Prop[0]}")
                                Rect()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Rect : ${Size_Prop[0]}")
                                Rect()
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Shape : ${Size_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Shape : ${Size_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Shape : ${Size_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Shape : ${Size_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (Size_Prop[1] is (Length, Length)) {
                                Text("Path : ${Size_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Float64, Float64)) {
                                Text("Path : ${Size_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (Int64, Int64)) {
                                Text("Path : ${Size_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (Size_Prop[1] is (AppResource, AppResource)) {
                                Text("Path : ${Size_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + Size_Prop[0])
                                    .size(width: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((Size_Prop[1] as (AppResource, AppResource)).getOrThrow())[1])
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
