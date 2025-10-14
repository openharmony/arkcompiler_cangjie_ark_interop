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

internal import ohos.base.LengthProp
internal import ohos.arkui.component.Column
internal import ohos.arkui.component.Row
internal import ohos.arkui.component.Text
internal import ohos.arkui.component.CustomView
internal import ohos.arkui.component.CJEntry
internal import ohos.arkui.component.loadNativeView
internal import ohos.arkui.component.FontWeight
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty
internal import ohos.arkui.state_management.LocalStorage
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r
import kit.ArkWeb.WebviewController
import kit.ArkUI.{Web, Button}
import ohos.business_exception.BusinessException
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.AppResource
import kit.PerformanceAnalysisKit.Hilog

@Entry
@Component
class EntryView {
    let webController = WebviewController()

    func build() {
        Column {
            Button("scrollTo").onClick { evt =>
                try {
                    webController.scrollTo(50.0, 50.0, duration: 500)
                    Hilog.info(0, "CangjieSample","scrollTo success")
                } catch (e: BusinessException) {
                    Hilog.error(0, "CangjieSample","scrollTo ErrorCode: ${e.code},  Message: ${e.message}")
                }
            }
            Button("scrollBy").onClick { evt =>
                try {
                    webController.scrollBy(50.0, 50.0, duration: 500)
                    Hilog.info(0, "CangjieSample","scrollBy success")
                } catch (e: BusinessException) {
                    Hilog.error(0, "CangjieSample","scrollBy ErrorCode: ${e.code},  Message: ${e.message}")
                }
            }
            Button("scrollStop").onClick { evt =>
                try {
                    webController.scrollBy(0.0, 0.0, duration: 1)
                    Hilog.info(0, "CangjieSample","scrollStop success")
                } catch (e: BusinessException) {
                    Hilog.error(0, "CangjieSample","scrollStop ErrorCode: ${e.code},  Message: ${e.message}")
                }
            }
            Web(src: @rawfile("index.html"), controller: webController)
        }
    }
}
