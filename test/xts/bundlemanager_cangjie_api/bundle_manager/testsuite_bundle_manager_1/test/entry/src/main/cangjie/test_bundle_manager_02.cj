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

import std.unittest.testmacro.{Test, Expect, TestCase}
import ohos.bundle.bundle_manager.{BundleManager, BundleFlag}
import std.unittest.testmacro.*
import std.unittest.*
import std.unittest.common.*
import ohos.ui_test.*
import ohos.bundle.bundle_manager.BundleInfo

@Test
class TestBundleManager02 {
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager01_TestBundleManager02_0100
    * @tc.name      : test00
    * @tc.desc      : test BundleManager01 test00
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test00() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION | BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager01_TestBundleManager02_0200
    * @tc.name      : test01
    * @tc.desc      : test BundleManager01 test01
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test01() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager01_TestBundleManager02_0300
    * @tc.name      : test02
    * @tc.desc      : test BundleManager01 test02
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test02() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | BundleFlag.GET_BUNDLE_INFO_WITH_MENU
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager01_TestBundleManager02_0400
    * @tc.name      : test03
    * @tc.desc      : test BundleManager01 test03
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test03() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
}
