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

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.collection.*
import ohos.base.*
import stdx.encoding.json.*
import ohos.arkui.state_macro_manage.r
import ohos.resource_manager.AppResource
import kit.PerformanceAnalysisKit.Hilog
import ohos.business_exception.*
import ohos.resource_manager.ArgsValueType
import ohos.resource_manager.ScreenDensity
import ohos.resource_manager.NumberValueType
import ohos.i18n.*
import std.runtime.gc

@Test
class Test_i18n {
    /*
     * @tc.number    : Sub_Cangjie_i18n_0100
     * @tc.name      : TestCase_1
     * @tc.desc      : 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "CangjieTest", "testcase TestCase_1 begins.")
        try {
            let appPreferredLanguage = System.getAppPreferredLanguage()
            @Expect(appPreferredLanguage, "zh-Hans-CN")
        } catch (e: BusinessException) {
            @Expect(false)
        }
}
}
