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

package ohos_app_cangjie_entry_test

import std.unittest.TestClass
import std.unittest.TestPackage
import std.unittest.TestSuite
import std.unittest.UnitTestCase
import std.unittest.common.Configuration
import std.unittest.testmacro.Test
import std.unittest.testmacro.TestCase
import std.unittest.testmacro.Expect

import std.unittest.expectEqual
import ohos.ability_delegator_registry.AbilityDelegatorRegistry
import ohos.ability.Want
import ohos.hilog.Hilog
import kit.TestKit.*

@Test
class TestExample00 {
    @TestCase
    func testUiExample(): Unit {
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let bundleName = AbilityDelegatorRegistry.getArguments().bundleName
        Hilog.info(0, "CangjieTest", "uitest: TestUiExample begin")
        //start tested ability
        let want = Want(bundleName: bundleName, abilityName: 'EntryAbility')
        delegator.startAbility(want)
        sleep(Duration.second * 5)
        //check top display ability
        let ability = delegator.getCurrentTopAbility()
        Hilog.info(0, "CangjieTest", "get top ability")
        @Expect(ability.context.abilityInfo.name, 'EntryAbility')
        // ui test code
        // init driver
        let driver = Driver.create()
        driver.delayMs(1000)
        let button = driver.findComponent(On().text('Next')).getOrThrow()
        //click button
        button.click()
        driver.delayMs(1000)
        //check text
        driver.assertComponentExist(On().text('after click'))
        driver.pressBack()
    }
}
