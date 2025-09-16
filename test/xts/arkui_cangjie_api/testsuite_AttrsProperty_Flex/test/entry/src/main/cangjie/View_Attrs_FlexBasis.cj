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
class View_EmptyAttrs_FlexBasis {
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
                    ObservedArrayList<(String, Any, String)>(FlexBasis_Prop_List),
                    itemGeneratorFunc: {
                        FlexBasis_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("AlphabetIndexer : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("AlphabetIndexer : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("AlphabetIndexer : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("AlphabetIndexer : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Blank : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Blank(min: 10)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Blank : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Blank(min: 10)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Blank : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Blank(min: 10)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Blank : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Blank(min: 10)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Button : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Button {
                                        Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)
                                    }
                                        .shape(ButtonType.Normal)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Button : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Button {
                                        Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)
                                    }
                                        .shape(ButtonType.Normal)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Button : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Button {
                                        Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)
                                    }
                                        .shape(ButtonType.Normal)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Button : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Button {
                                        Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)
                                    }
                                        .shape(ButtonType.Normal)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Checkbox : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Checkbox()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Checkbox : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Checkbox()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Checkbox : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Checkbox()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Checkbox : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Checkbox()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("CheckboxGroup : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    CheckboxGroup()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("CheckboxGroup : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    CheckboxGroup()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("CheckboxGroup : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    CheckboxGroup()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("CheckboxGroup : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    CheckboxGroup()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("DataPanel : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    DataPanel(values: [30.0])
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("DataPanel : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    DataPanel(values: [30.0])
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("DataPanel : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    DataPanel(values: [30.0])
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("DataPanel : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    DataPanel(values: [30.0])
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("DatePicker : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    DatePicker()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("DatePicker : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    DatePicker()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("DatePicker : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    DatePicker()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("DatePicker : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    DatePicker()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Divider : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Divider()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Divider : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Divider()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Divider : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Divider()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Divider : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Divider()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Gauge : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                        Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Gauge : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                        Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Gauge : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                        Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Gauge : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                        Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Image : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Image(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Image : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Image(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Image : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Image(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Image : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Image(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("LoadingProgress : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    LoadingProgress()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("LoadingProgress : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    LoadingProgress()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("LoadingProgress : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    LoadingProgress()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("LoadingProgress : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    LoadingProgress()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Menu : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Menu : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Menu : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Menu : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Progress : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Progress(value: 10.0)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Progress : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Progress(value: 10.0)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Progress : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Progress(value: 10.0)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Progress : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Progress(value: 10.0)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("QRCode : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    QRCode(targetView)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("QRCode : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    QRCode(targetView)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("QRCode : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    QRCode(targetView)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("QRCode : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    QRCode(targetView)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Radio : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Radio(group: "1", value: "A")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Radio : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Radio(group: "1", value: "A")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Radio : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Radio(group: "1", value: "A")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Radio : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Radio(group: "1", value: "A")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Rating : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Rating(rating: 3.5, indicator: false)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Rating : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Rating(rating: 3.5, indicator: false)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Rating : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Rating(rating: 3.5, indicator: false)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Rating : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Rating(rating: 3.5, indicator: false)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Refresh : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                        Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Refresh : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                        Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Refresh : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                        Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Refresh : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                        Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("RichEditor : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    RichEditor(richEditorController)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("RichEditor : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    RichEditor(richEditorController)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("RichEditor : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    RichEditor(richEditorController)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("RichEditor : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    RichEditor(richEditorController)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("RichText : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("RichText : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("RichText : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("RichText : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("RowSplit : ${FlexBasis_Prop[0]}")
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
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("RowSplit : ${FlexBasis_Prop[0]}")
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
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("RowSplit : ${FlexBasis_Prop[0]}")
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
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("RowSplit : ${FlexBasis_Prop[0]}")
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
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("ScrollBar : ${FlexBasis_Prop[0]}")
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
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("ScrollBar : ${FlexBasis_Prop[0]}")
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
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("ScrollBar : ${FlexBasis_Prop[0]}")
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
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("ScrollBar : ${FlexBasis_Prop[0]}")
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
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Search : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Search(value: "", placeholder: "Type to search")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Search : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Search(value: "", placeholder: "Type to search")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Search : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Search(value: "", placeholder: "Type to search")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Search : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Search(value: "", placeholder: "Type to search")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Slider : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Slider()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Slider : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Slider()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Slider : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Slider()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Slider : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Slider()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Stepper : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Stepper : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Stepper : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Stepper : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Text : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Text(targetView)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Text : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Text(targetView)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Text : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Text(targetView)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Text : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Text(targetView)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("TextArea : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextArea(text: targetView)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("TextArea : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextArea(text: targetView)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("TextArea : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextArea(text: targetView)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("TextArea : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextArea(text: targetView)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("TextClock : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextClock()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("TextClock : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextClock()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("TextClock : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextClock()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("TextClock : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextClock()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("TextInput : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextInput(placeholder: "TextInput")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("TextInput : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextInput(placeholder: "TextInput")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("TextInput : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextInput(placeholder: "TextInput")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("TextInput : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextInput(placeholder: "TextInput")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("TextPicker : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextPicker(range:["apple", "banana", "orange", "peach"])
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("TextPicker : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextPicker(range:["apple", "banana", "orange", "peach"])
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("TextPicker : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextPicker(range:["apple", "banana", "orange", "peach"])
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("TextPicker : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextPicker(range:["apple", "banana", "orange", "peach"])
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("TextTimer : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("TextTimer : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("TextTimer : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("TextTimer : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Toggle : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Toggle(ToggleType.Switch, isOn: false)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Toggle : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Toggle(ToggleType.Switch, isOn: false)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Toggle : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Toggle(ToggleType.Switch, isOn: false)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Toggle : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Toggle(ToggleType.Switch, isOn: false)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Web : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Web(src: "www.baidu.com", controller: webController)
                                        .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                        .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Web : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Web(src: "www.baidu.com", controller: webController)
                                        .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                        .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Web : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Web(src: "www.baidu.com", controller: webController)
                                        .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                        .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Web : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Web(src: "www.baidu.com", controller: webController)
                                        .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                        .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Select : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Select(
                                        [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                            SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                        .value("Select")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Select : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Select(
                                        [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                            SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                        .value("Select")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Select : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Select(
                                        [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                            SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                        .value("Select")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Select : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Select(
                                        [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                            SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                        .value("Select")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Badge : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                        Button("message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Badge : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                        Button("message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Badge : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                        Button("message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Badge : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                        Button("message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Column : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Column() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Column : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Column() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Column : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Column() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Column : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Column() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Grid : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Grid (child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    })
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Grid : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Grid (child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    })
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Grid : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Grid (child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    })
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Grid : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Grid (child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    })
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("GridRow : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    GridRow() {
                                        GridCol() {
                                            Row().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("GridRow : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    GridRow() {
                                        GridCol() {
                                            Row().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("GridRow : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    GridRow() {
                                        GridCol() {
                                            Row().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("GridRow : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    GridRow() {
                                        GridCol() {
                                            Row().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Flex : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Flex() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Flex : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Flex() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Flex : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Flex() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Flex : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Flex() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("List : ${FlexBasis_Prop[0]}")
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
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("List : ${FlexBasis_Prop[0]}")
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
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("List : ${FlexBasis_Prop[0]}")
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
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("List : ${FlexBasis_Prop[0]}")
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
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("RelativeContainer : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    RelativeContainer() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("RelativeContainer : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    RelativeContainer() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("RelativeContainer : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    RelativeContainer() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("RelativeContainer : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    RelativeContainer() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Row : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Row() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Row : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Row() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Row : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Row() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Row : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Row() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Scroll : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Scroll() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Scroll : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Scroll() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Scroll : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Scroll() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Scroll : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Scroll() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Stack : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Stack() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Stack : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Stack() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Stack : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Stack() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Stack : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Stack() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Swiper : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Swiper(controller:SwiperController()) {
                                        Text("1").width(80.percent).height(80.percent)
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Swiper : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Swiper(controller:SwiperController()) {
                                        Text("1").width(80.percent).height(80.percent)
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Swiper : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Swiper(controller:SwiperController()) {
                                        Text("1").width(80.percent).height(80.percent)
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Swiper : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Swiper(controller:SwiperController()) {
                                        Text("1").width(80.percent).height(80.percent)
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Tabs : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Tabs() {
                                        TabContent {
                                            Column()
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.tabBar("1").backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Tabs : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Tabs() {
                                        TabContent {
                                            Column()
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.tabBar("1").backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Tabs : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Tabs() {
                                        TabContent {
                                            Column()
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.tabBar("1").backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Tabs : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Tabs() {
                                        TabContent {
                                            Column()
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.tabBar("1").backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Circle : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Circle()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Circle : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Circle()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Circle : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Circle()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Circle : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Circle()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Line : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Line()
                                        .startPoint((0.0, 0.0))
                                        .endPoint((10.0, 20.0))
                                        .stroke(Color.Black)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Line : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Line()
                                        .startPoint((0.0, 0.0))
                                        .endPoint((10.0, 20.0))
                                        .stroke(Color.Black)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Line : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Line()
                                        .startPoint((0.0, 0.0))
                                        .endPoint((10.0, 20.0))
                                        .stroke(Color.Black)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Line : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Line()
                                        .startPoint((0.0, 0.0))
                                        .endPoint((10.0, 20.0))
                                        .stroke(Color.Black)
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Rect : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Rect()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Rect : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Rect()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Rect : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Rect()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Rect : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Rect()
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Shape : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Shape() {
                                        Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Shape : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Shape() {
                                        Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Shape : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Shape() {
                                        Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Shape : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Shape() {
                                        Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (FlexBasis_Prop[1] is Length) {
                                Text("Path : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Path()
                                        .commands("M0 0 H200 V200 H0 Z")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Length).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Float64) {
                                Text("Path : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Path()
                                        .commands("M0 0 H200 V200 H0 Z")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Float64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is Int64) {
                                Text("Path : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Path()
                                        .commands("M0 0 H200 V200 H0 Z")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as Int64).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexBasis_Prop[1] is AppResource) {
                                Text("Path : ${FlexBasis_Prop[0]}")
                                Flex() {
                                    Path()
                                        .commands("M0 0 H200 V200 H0 Z")
                                        .height(100)
                                        .backgroundColor(this.Colors[0])
                                        .id(this.targetView + FlexBasis_Prop[0])
                                        .flexBasis((FlexBasis_Prop[1] as AppResource).getOrThrow())
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
