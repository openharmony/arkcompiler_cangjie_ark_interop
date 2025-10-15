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
internal import ohos.component.Column
internal import ohos.component.Row
internal import ohos.component.Button
internal import ohos.component.Text
internal import ohos.component.CustomView
internal import ohos.component.CJEntry
internal import ohos.component.loadNativeView
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
internal import ohos.state_manage.LocalStorage
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.r
import ohos.base.UIThread

@Entry
@Component
class EntryView {
    func build() {
        Row {
            Column {
                Button("onClick spawn(UIThread)")
                    .onClick {
                        evt => spawn (UIThread) {
                            createJSRuntimeAndCheck("onClick spawn(UIThread)")
                        }
                    }
                    .fontSize(40)
                    .height(80)
                Button("onClick spawn spawn(UIThread)")
                    .onClick {
                        evt => spawn {
                            spawn (UIThread) {
                                createJSRuntimeAndCheck("onClick spawn spawn(UIThread)")
                            }
                        }
                    }
                    .fontSize(40)
                    .height(80)
                Button("onClick spawn(UIThread) spawn")
                    .onClick {
                        evt => spawn (UIThread) {
                            spawn {
                                createJSRuntimeAndCheck("onClick spawn(UIThread) spawn")
                            }
                        }
                    }
                    .fontSize(40)
                    .height(80)
                Button("onClick spawn(UIThread) spawn(UIThread)")
                    .onClick {
                        evt => spawn (UIThread) {
                            spawn (UIThread) {
                                createJSRuntimeAndCheck("onClick spawn(UIThread) spawn(UIThread)")
                            }
                        }
                    }
                    .fontSize(40)
                    .height(80)
                Button("onClick spawn spawn")
                    .onClick {
                        evt => spawn {
                            spawn {
                                createJSRuntimeAndCheck("onClick spawn spawn")
                            }
                        }
                    }
                    .fontSize(40)
                    .height(80)
            }.width(100.percent)
        }.height(100.percent)
    }
}
