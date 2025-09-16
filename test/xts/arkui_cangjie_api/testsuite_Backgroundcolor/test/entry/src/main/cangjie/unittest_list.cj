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

import ohos.arkui.state_management.ObservedArrayList
let views = ObservedArrayList<String>(["View_HoverEffect", "View_Button_Backgroundcolor", "View_Enabled", "View_Flex_Backgroundcolor",
    "View_Opacity", "View_Text_Backgroundcolor"])

class AA {
    var aa = ""
    init(aa: String) {
        this.aa = aa
    }
}

struct BB {
    var bb = ""
    init(bb: String) {
        this.bb = bb
    }
}

enum EE {
    ee(Int64)

    static func getEnumNumber(EnumType: EE): String {
        match (EnumType) {
            case ee(-1) => "-1"
            case ee(0) => "0"
            case ee(10) => "10"
            case ee(50) => "50"
            case ee(100) => "100"
            case _ => ""
        }
    }
}
