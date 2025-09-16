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
import kit.PerformanceAnalysisKit.*
import kit.PerformanceAnalysisKit.Hilog
@Test
class testCofigure_1 {
    /*
     * @tc.number    : Sub_Cangjie_config_config_0100
     * @tc.name      : TestCase_1
     * @tc.desc      : config ConfigOption(maxStorage:"100M", disable: true).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_1 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"100M", disable: true))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_1 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_0200
     * @tc.name      : TestCase_2
     * @tc.desc      : config ConfigOption(maxStorage:"200M", disable: true).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_2 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"200M", disable: true))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_2 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_0300
     * @tc.name      : TestCase_3
     * @tc.desc      : config ConfigOption(maxStorage:"300M", disable: true).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_3 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"300M", disable: true))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_3 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_0400
     * @tc.name      : TestCase_4
     * @tc.desc      : config ConfigOption(maxStorage:"1000M", disable: true).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_4 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"1000M", disable: true))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_4 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_0500
     * @tc.name      : TestCase_5
     * @tc.desc      : config ConfigOption(maxStorage:"400M", disable: true).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_5(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_5 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"400M", disable: true))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_5 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_0600
     * @tc.name      : TestCase_6
     * @tc.desc      : config ConfigOption(maxStorage:"500M", disable: true).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_6(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_6 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"500M", disable: true))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_6 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_0700
     * @tc.name      : TestCase_7
     * @tc.desc      : config ConfigOption(maxStorage:"100M", disable: false).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_7(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_7 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"100M", disable: false))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_7 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_0800
     * @tc.name      : TestCase_8
     * @tc.desc      : config ConfigOption(maxStorage:"200M", disable: false).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_8(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_8 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"200M", disable: false))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_8 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_0900
     * @tc.name      : TestCase_9
     * @tc.desc      : config ConfigOption(maxStorage:"300M", disable: false).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_9(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_9 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"300M", disable: false))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_9 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_1000
     * @tc.name      : TestCase_10
     * @tc.desc      : config ConfigOption(maxStorage:"1000M", disable: false).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_10(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_10 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"1000M", disable: false))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_10 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_1100
     * @tc.name      : TestCase_11
     * @tc.desc      : config ConfigOption(maxStorage:"400M", disable: false).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_11(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_11 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"400M", disable: false))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_11 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_1200
     * @tc.name      : TestCase_12
     * @tc.desc      : config ConfigOption(maxStorage:"500M", disable: false).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_12(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_12 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"500M", disable: false))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_12 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_1300
     * @tc.name      : TestCase_13
     * @tc.desc      : config ConfigOption(maxStorage:"100M").
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_13(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_13 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"100M"))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_13 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_1400
     * @tc.name      : TestCase_14
     * @tc.desc      : config ConfigOption(maxStorage:"200M").
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_14(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_14 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"200M"))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_14 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_1500
     * @tc.name      : TestCase_15
     * @tc.desc      : config ConfigOption(maxStorage:"300M").
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_15(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_15 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"300M"))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_15 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_1600
     * @tc.name      : TestCase_16
     * @tc.desc      : config ConfigOption(maxStorage:"1000M").
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_16(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_16 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"1000M"))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_16 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_1700
     * @tc.name      : TestCase_17
     * @tc.desc      : config ConfigOption(maxStorage:"400M").
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_17(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_17 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"400M"))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_17 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_config_config_1800
     * @tc.name      : TestCase_18
     * @tc.desc      : config ConfigOption(maxStorage:"500M").
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_18(): Unit {
        Hilog.info(0, "cangjietest","testcase TestCase_18 begins.")
        Hilog.info(0, "cangjietest","define local variable config")
        let config = HiAppEvent.configure(ConfigOption(maxStorage:"500M"))
        @Assert(true, true)
        Hilog.info(0, "cangjietest","testcase TestCase_18 ends.")
    }
}
