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

/**
 * Created on 2025/5/26
 */
package ohos_app_cangjie_entry

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import ohos.base.*

@Test
class TestThreads {
    @BeforeAll
    func wait(): Unit {
        sleepFor(5.second)
    }
    @TestCase
    func onWindowStageCreate_spawnMain(): Unit {
        waitForEventWithName("onWindowStageCreate spawn(UIThread)") {_ =>}
    }
    @TestCase
    func onWindowStageCreate_spawn_spawnMain(): Unit {
        waitForEventWithName("onWindowStageCreate spawn spawn(UIThread)") {_ =>}
    }
    @TestCase
    func onWindowStageCreate_spawnMain_spawnMain(): Unit {
        waitForEventWithName("onWindowStageCreate spawn(UIThread) spawn(UIThread)") {_ =>}
    }
    @TestCase
    func onClick_spawnMain_spawnMain(): Unit {
        click(at: Screen
            .getTheOnlyUiComponentWhoseTextEqualsTo("onClick spawn(UIThread) spawn(UIThread)")
            .centerPoint)
        waitForEventWithName("onClick spawn(UIThread) spawn(UIThread)") {_ =>}
    }
    @TestCase
    func onClick_spawnMain(): Unit {
        click(at: Screen
            .getTheOnlyUiComponentWhoseTextEqualsTo("onClick spawn(UIThread)")
            .centerPoint)
        waitForEventWithName("onClick spawn(UIThread)") {_ =>}
    }
    @TestCase
    func onClick_spawn_spawnMain(): Unit {
        click(at: Screen
            .getTheOnlyUiComponentWhoseTextEqualsTo("onClick spawn spawn(UIThread)")
            .centerPoint)
        waitForEventWithName("onClick spawn spawn(UIThread)") {_ =>}
    }
}
