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
import ohos.data.relational_store.*
import ohos.business_exception.{BusinessException}
import kit.PerformanceAnalysisKit.Hilog

@Test
class TestLimitAs_1 {
    /*
     * @tc.number    : Test_Limit_As_0100
     * @tc.name      : TestCase_1
     * @tc.desc      : "1" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("NAME", "NAME")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_0200
     * @tc.name      : TestCase_2
     * @tc.desc      : "1" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("NAME", "%os%")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_0300
     * @tc.name      : TestCase_3
     * @tc.desc      : "1" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("%os%", "NAME")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_0400
     * @tc.name      : TestCase_4
     * @tc.desc      : "1" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("%os%", "%os%")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_0500
     * @tc.name      : TestCase_5
     * @tc.desc      : "2" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_5(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_5 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("NAME", "NAME")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_5 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_0600
     * @tc.name      : TestCase_6
     * @tc.desc      : "2" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_6(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_6 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("NAME", "%os%")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_6 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_0700
     * @tc.name      : TestCase_7
     * @tc.desc      : "2" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_7(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_7 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("%os%", "NAME")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_7 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_0800
     * @tc.name      : TestCase_8
     * @tc.desc      : "2" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_8(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_8 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("%os%", "%os%")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_8 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_0900
     * @tc.name      : TestCase_9
     * @tc.desc      : "3" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_9(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_9 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("NAME", "NAME")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_9 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_1000
     * @tc.name      : TestCase_10
     * @tc.desc      : "3" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_10(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_10 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("NAME", "%os%")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_10 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_1100
     * @tc.name      : TestCase_11
     * @tc.desc      : "3" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_11(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_11 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("%os%", "NAME")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_11 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_1200
     * @tc.name      : TestCase_12
     * @tc.desc      : "3" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_12(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_12 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("%os%", "%os%")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_12 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_1300
     * @tc.name      : TestCase_13
     * @tc.desc      : "4" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_13(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_13 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("NAME", "NAME")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_13 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_1400
     * @tc.name      : TestCase_14
     * @tc.desc      : "4" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_14(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_14 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("NAME", "%os%")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_14 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_1500
     * @tc.name      : TestCase_15
     * @tc.desc      : "4" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_15(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_15 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("%os%", "NAME")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_15 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_1600
     * @tc.name      : TestCase_16
     * @tc.desc      : "4" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_16(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_16 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("%os%", "%os%")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_16 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_1700
     * @tc.name      : TestCase_17
     * @tc.desc      : "1024" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_17(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_17 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("NAME", "NAME")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_17 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_1800
     * @tc.name      : TestCase_18
     * @tc.desc      : "1024" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_18(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_18 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("NAME", "%os%")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_18 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_1900
     * @tc.name      : TestCase_19
     * @tc.desc      : "1024" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_19(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_19 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("%os%", "NAME")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_19 ends.")
    }

    /*
     * @tc.number    : Test_Limit_As_2000
     * @tc.name      : TestCase_20
     * @tc.desc      : "1024" Record the maxnum of the predicate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_20(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_20 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbPridecates")
        let rdbPridecates = RdbPredicates("EMPLOYEE")
        Hilog.info(0u32, "cangjietest", "", "testLimitAs")
        rdbPridecates.like("%os%", "%os%")
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_20 ends.")
    }
}
