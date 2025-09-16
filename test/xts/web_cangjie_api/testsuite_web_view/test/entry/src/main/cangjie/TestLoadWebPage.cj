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

import std.unittest.testmacro.*
import std.unittest.*
import std.unittest.common.*
import ohos.base.*
import std.sync.*
import ohos.ui_test
import kit.ArkWeb.{WebviewController, WebHeader}
import std.sync.{AtomicBool, Monitor}
import ohos.arkui.state_macro_manage.rawfile
import kit.CoreFileKit.{FileIo}

@Test
class TestLoadWebPage {
    public static let webViewController:WebviewController = WebviewController()
    public static let hasWebViewControllerAssociated:AtomicBool = AtomicBool(false)
    public static let isWebPageLoaded:AtomicBool = AtomicBool(false)
    protected func beforeAll() {
        enterPage("ViewLoadWebPage")
        waitFor(Duration.second * 10) {
            TestLoadWebPage.hasWebViewControllerAssociated.load()
        }
    }
    protected func afterAll() {
        pressBack()
    }
    /*
    * @tc.number    : Sub_Cangjie_WebView_TestLoadWebPage_0100
    * @tc.name      : loadPage
    * @tc.desc      : test WebView loadPage
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func loadPage() {
        let webViewController = TestLoadWebPage.webViewController
        TestLoadWebPage.isWebPageLoaded.store(false)
        spawn (Main) {
            webViewController.loadUrl("https://gitee.com/organizations/openharmony/projects")
        }
        waitFor(Duration.second * 10) {
            TestLoadWebPage.isWebPageLoaded.load()
        }
    }
}
