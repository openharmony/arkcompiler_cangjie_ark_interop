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
class View_Enabled {
    func build() {
        Flex(justifyContent: FlexAlign.SpaceAround) {
            // 点击没有反应
            Button("disable").enabled(false).backgroundColor(0x317aff).opacity(0.4).id("Button1")
            Button("enable").backgroundColor(0x317aff).id("Button2")
        }.width(100.percent).padding(top: 5).id("Flex")
    }
}
