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

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos.router.Router

@Entry
@Component
class EntryView {
    func build() {
        Scroll(
            {
                => Column(
                    {
                        => ForEach(
                            ["ViewText", "ViewListList", "ViewGridList", "ViewButtonList", "ViewDragGridList",
                                "ViewRouterList"],
                            itemGeneratorFunc: {
                                viewName: String, _: Int64 => Button(viewName)
                                    .fontSize(16i64)
                                    .width(100i64.percent)
                                    .height(50i64)
                                    .id(viewName)
                                    .borderRadius(10i64)
                                    .onClick({
                                        => Router.push(url: viewName)
                                    })
                            }
                        )
                    }).width(100i64.percent).margin(top: 5i64)
            }).id("scroller")
    }
}
