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

import ohos.web.webview.*
import ohos.file.fs.*
import ohos.base.*
import ohos.base.*
import ohos.arkui.component.{Scroller, Column, Web, Scroll, Button, CustomView, loadNativeView, CJEntry, Row, Text}
import ohos.arkui.state_macro_manage.{r, rawfile, Component, Entry, State}
import ohos.arkui.state_management.{SubscriberManager, ObservedProperty, LocalStorage}

@Entry
@Component
class ViewLoadWebPage {
    let scroller: Scroller = Scroller()
    func build() {
        Row {
            Column {
                Web(src: "http://192.168.165.23:8080/", controller: TestLoadWebPage.webViewController)
                    .onPageBegin({
                        evt =>
                    })
                    .onPageEnd(
                        {
                            evt =>
                            TestLoadWebPage.hasWebViewControllerAssociated.store(true)
                            TestLoadWebPage.isWebPageLoaded.store(true)
                        }
                    )
                    .height(200)
                Scroll(this.scroller) {
                    Column(space:30) {
                        
                    }
                }.height(60.percent).id("scroller")
            }.width(100.percent)
        }.height(100.percent)
    }
}
