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


import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class View_Text_Backgroundcolor {
    @State
    var value: String = "Text"
    @State
    var sizeValue: String = ""
    func build() {
        Column {
            Text(this.value)
                .backgroundColor(Color.Green)
                .margin(30)
                .fontSize(30)
                .onClick({evt => this.value = this.value + "Text"})
                .onAreaChange(
                    {old, new => this.sizeValue = "from " + old.width.value.toString() + " to " + new.width.value.toString()})
                .id('Text')
            Text("Area:\n" + this.sizeValue).margin(30)
        }
    }
}
