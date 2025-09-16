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
class View_EmptyAttrs_FontFamily {
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
                    ObservedArrayList<(String, Any, String)>(FontFamily_Prop_List),
                    itemGeneratorFunc: {
                        FontFamily_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (FontFamily_Prop[1] is String) {
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + FontFamily_Prop[0])
                                    .fontFamily((FontFamily_Prop[1] as String).getOrThrow())
                            } else if (FontFamily_Prop[1] is AppResource) {
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + FontFamily_Prop[0])
                                    .fontFamily((FontFamily_Prop[1] as AppResource).getOrThrow())
                            }
                        }else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (FontFamily_Prop[1] is String) {
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + FontFamily_Prop[0])
                                    .fontFamily((FontFamily_Prop[1] as String).getOrThrow())
                            } else if (FontFamily_Prop[1] is AppResource) {
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + FontFamily_Prop[0])
                                    .fontFamily((FontFamily_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (FontFamily_Prop[1] is String) {
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + FontFamily_Prop[0])
                                    .fontFamily((FontFamily_Prop[1] as String).getOrThrow())
                            } else if (FontFamily_Prop[1] is AppResource) {
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + FontFamily_Prop[0])
                                    .fontFamily((FontFamily_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (FontFamily_Prop[1] is String) {
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + FontFamily_Prop[0])
                                    .fontFamily((FontFamily_Prop[1] as String).getOrThrow())
                            } else if (FontFamily_Prop[1] is AppResource) {
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + FontFamily_Prop[0])
                                    .fontFamily((FontFamily_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (FontFamily_Prop[1] is String) {
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + FontFamily_Prop[0])
                                    .fontFamily((FontFamily_Prop[1] as String).getOrThrow())
                            } else if (FontFamily_Prop[1] is AppResource) {
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + FontFamily_Prop[0])
                                    .fontFamily((FontFamily_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (FontFamily_Prop[1] is String) {
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + FontFamily_Prop[0])
                                    .fontFamily((FontFamily_Prop[1] as String).getOrThrow())
                            } else if (FontFamily_Prop[1] is AppResource) {
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + FontFamily_Prop[0])
                                    .fontFamily((FontFamily_Prop[1] as AppResource).getOrThrow())
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
