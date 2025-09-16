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

@Test
class TestBundleManager {
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager_TestBundleManager_0100
    * @tc.name      : test00
    * @tc.desc      : test BundleManager test00
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test00() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_DEFAULT
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager_TestBundleManager_0200
    * @tc.name      : test01
    * @tc.desc      : test BundleManager test01
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test01() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager_TestBundleManager_0300
    * @tc.name      : test02
    * @tc.desc      : test BundleManager test02
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test02() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager_TestBundleManager_0400
    * @tc.name      : test03
    * @tc.desc      : test BundleManager test03
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test03() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager_TestBundleManager_0500
    * @tc.name      : test04
    * @tc.desc      : test BundleManager test04
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test04() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager_TestBundleManager_0600
    * @tc.name      : test05
    * @tc.desc      : test BundleManager test05
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test05() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_REQUESTED_PERMISSION
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager_TestBundleManager_0700
    * @tc.name      : test06
    * @tc.desc      : test BundleManager test06
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test06() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager_TestBundleManager_0800
    * @tc.name      : test07
    * @tc.desc      : test BundleManager test07
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test07() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_DISABLE
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager_TestBundleManager_0900
    * @tc.name      : test08
    * @tc.desc      : test BundleManager test08
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test08() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_SIGNATURE_INFO
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
    
    /*
    * @tc.number    : Sub_Cangjie_BundleManager_TestBundleManager_1000
    * @tc.name      : test09
    * @tc.desc      : test BundleManager test09
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test09() {
        let bundleFlags = BundleFlag.GET_BUNDLE_INFO_WITH_MENU
        let bundleInfo = BundleManager.getBundleInfoForSelf(bundleFlags)
    }
}
