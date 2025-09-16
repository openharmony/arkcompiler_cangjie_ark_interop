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


public import ohos.base.*
public import ohos.arkui.component.*
public import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class View_Button_Backgroundcolor {
    @State
    var txt: String = 'overflowTextOverlengthTextOverflow.Clip'
    func build() {
        Column() {
            Button(this.txt)
                .width(210)
                .height(100)
                .backgroundColor(0x317aff)
                .fontSize(40)
                .id("Button")
        }.height(100.percent).width(100.percent).justifyContent(FlexAlign.Center)
    }
}
