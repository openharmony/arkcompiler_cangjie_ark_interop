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
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class View_Popup {
    @State
    var isShowPopup: Bool = false
    @State
    var isShowPopupBuilder: Bool = false

    @Builder
    func builder() {
        Column {
            Button("Builder 内容").width(300.px).onClick({
                evt =>() //nativeLog("Builder 中的按钮被点击")
            })
        }.width(300.px)
    }

    func build() {
        Column() {
            Text("${this.isShowPopup}").id("Test_Text00")
            Text("${this.isShowPopupBuilder}").id("Test_Text01")

            Button("BindPopup")
                .id("Test_Button00")
                .onClick({
                    evt => this.isShowPopup = true
                })
                .bindPopup(
                    isShowPopup,
                    PopupOptions(
                        showInSubWindow: false,
                        message: "确定将此项删除吗？",
                        primaryButton: PopupButton(
                            value: "OK",
                            action: {
                                =>
                                //nativeLog("OK被点击")
                                isShowPopup = false
                            }
                        ),
                        secondaryButton: PopupButton(
                            value: "Cancel",
                            action: {
                                =>
                                //nativeLog("Cancel被点击")
                                isShowPopup = false
                            }
                        ),
                        onStateChange: {
                            evt =>
                            //nativeLog("Bind 1 isVisible: " + evt.isVisible.toString())
                            if (!evt.isVisible) {
                                isShowPopup = false
                            }
                        }
                    )
                )

            Button("BindPopup-Custom")
                .id("Test_Button01")
                .onClick({
                    evt => this.isShowPopupBuilder = true
                })
                .bindPopup(isShowPopupBuilder,
                    CustomPopupOptions(
                        showInSubWindow: false,
                        enableArrow: true,
                        builder: bind(builder, this),
                        onStateChange: {
                            evt =>()
                            //nativeLog("BindPopup-Custom isVisible: " + evt.isVisible.toString())
                            if (!evt.isVisible) {
                                isShowPopupBuilder = false
                            }
                        }
                    )
                )
        }
    }
}
