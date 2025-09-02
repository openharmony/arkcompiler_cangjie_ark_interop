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
import ohos.ark_interop.*
import ohos.state_manage.AppStorage
import ohos.ability_delegator_registry.AbilityDelegatorRegistry
import ohos.ability.Want
import ohos.vibrator.*
import ohos.file_fs.*
import std.math.numeric.BigInt
import std.math.MathExtension
import ohos.bundle_manager.*
import ohos.base.*
import ohos.ui_test.*
import stdx.encoding.json.*

@Test
class testJSBigInt1_1 {
    @TestCase
    func TestCase_44(): Unit {
        logger.info("testcase TestCase_44 begins.")
        logger.info("getJSContext")
        let jsContext = getJSContext()
        logger.info("jsBigIntCreator")
        await(
            jsContext,
            {
                => jsContext.bigint(BigInt.parse("-1"))
            }
        )
        logger.info("testcase TestCase_44 ends.")
    }

    @TestCase
    func TestCase_45(): Unit {
        logger.info("testcase TestCase_45 begins.")
        logger.info("getJSContext")
        let jsContext = getJSContext()
        logger.info("jsBigIntCreator")
        await(
            jsContext,
            {
                => jsContext.bigint(BigInt.parse("0"))
            }
        )
        logger.info("testcase TestCase_45 ends.")
    }

    @TestCase
    func TestCase_46(): Unit {
        logger.info("testcase TestCase_46 begins.")
        logger.info("getJSContext")
        let jsContext = getJSContext()
        logger.info("jsBigIntCreator")
        await(
            jsContext,
            {
                => jsContext.bigint(BigInt.parse("1"))
            }
        )
        logger.info("testcase TestCase_46 ends.")
    }
}
