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

internal import ohos.arkui.base.LengthProp
internal import ohos.arkui.component.Column
internal import ohos.arkui.component.Row
internal import ohos.arkui.component.Button
internal import ohos.arkui.component.Text
internal import ohos.arkui.component.CustomView
internal import ohos.arkui.component.CJEntry
internal import ohos.arkui.component.loadNativeView
internal import ohos.arkui.state_manage.SubscriberManager
internal import ohos.arkui.state_manage.ObservedProperty
internal import ohos.arkui.state_manage.LocalStorage
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r

import std.collection.HashMap
import kit.PerformanceAnalysisKit.*
import ohos.business_exception.*
import ohos.callback_invoke.*

@Entry
@Component
class EntryView {
    @State
    var num = 0
    var netType = "N/A"

    func build() {
        Row {
            Column {
                Button("writeTest")
                    .onClick {
                        evt =>
                            var params = HashMap<String, EventValueType>([("click_time", EventValueType.IntValue(100)),
                            ("str_data", EventValueType.StringValue("strValue"))])
                            var appInfo: AppEventInfo = AppEventInfo("button", "click", EventType.Behavior, params)
                            HiAppEvent.write(appInfo)
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}