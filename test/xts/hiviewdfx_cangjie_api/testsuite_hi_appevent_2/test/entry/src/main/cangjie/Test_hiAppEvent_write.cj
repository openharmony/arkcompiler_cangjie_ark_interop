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
import std.collection.*
import ohos.hiviewdfx.hi_app_event.*
import ohos.hilog.*
import std.unittest.testmacro.*
import std.unittest.*
import std.unittest.common.*
import ohos.ui_test.*
import ohos.base.*

@Test
public class Test_hiAppEvent_write {
    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_0100
    * @tc.name      : Test_hiappevent_write_0
    * @tc.desc      : test Hiappevent Test_hiappevent_write_0
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_0(): Unit {
        Hilog.info(0, "Test_hiappevent_write_0", "Test_hiappevent_write_0_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "test_event", EventType.Fault, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_0", "Test_hiappevent_write_0_pass")
        } catch (e: Exception) {
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_0", "Test_hiappevent_write_0_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_0", "Test_hiappevent_write_0_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_0200
    * @tc.name      : Test_hiappevent_write_00
    * @tc.desc      : test Hiappevent Test_hiappevent_write_00
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_00(): Unit {
        Hilog.info(0, "Test_hiappevent_write_00", "Test_hiappevent_write_00_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "test_event", EventType.Fault, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_00", "Test_hiappevent_write_00_pass")
        } catch (e: BusinessException) {
            @Expect(e.code,11101003)
            @Expect(e.message,"Invalid number of event parameters.")
            Hilog.info(0, "Test_hiappevent_write_00", "Test_hiappevent_write_00_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_00", "Test_hiappevent_write_00_end")
        }
    }
    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_0300
    * @tc.name      : Test_hiappevent_write_01
    * @tc.desc      : test Hiappevent Test_hiappevent_write_01
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_01(): Unit {
        Hilog.info(0, "Test_hiappevent_write_01", "Test_hiappevent_write_01_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "test_event", EventType.Fault, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_01", "Test_hiappevent_write_01_pass")
        } catch (e: Exception) {
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_01", "Test_hiappevent_write_01_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_01", "Test_hiappevent_write_01_end")
        }
    }
    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_0400
    * @tc.name      : Test_hiappevent_write_02
    * @tc.desc      : test Hiappevent Test_hiappevent_write_02
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_02(): Unit {
        Hilog.info(0, "Test_hiappevent_write_02", "Test_hiappevent_write_02_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("1cangjie", "test_event", EventType.Fault, params)
            HiAppEvent.write(appInfo)
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_02", "Test_hiappevent_write_02_fail")
        } catch (e: BusinessException) {
            @Expect(e.code,11101001)
            @Expect(e.message,"Invalid event domain.")
            Hilog.info(0, "Test_hiappevent_write_02", "Test_hiappevent_write_02_pass_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_02", "Test_hiappevent_write_02_end")
        }
    }
    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_0500
    * @tc.name      : Test_hiappevent_write_03
    * @tc.desc      : test Hiappevent Test_hiappevent_write_03
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_03(): Unit {
        Hilog.info(0, "Test_hiappevent_write_03", "Test_hiappevent_write_03_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie1_", "test_event", EventType.Fault, params)
            HiAppEvent.write(appInfo)
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_03", "Test_hiappevent_write_03_fail")
        } catch (e: BusinessException) {
            @Expect(e.code,11101001)
            @Expect(e.message,"Invalid event domain.")
            Hilog.info(0, "Test_hiappevent_write_03", "Test_hiappevent_write_03_pass_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_03", "Test_hiappevent_write_03_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_0600
    * @tc.name      : Test_hiappevent_write_04
    * @tc.desc      : test Hiappevent Test_hiappevent_write_04
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_04(): Unit {
        Hilog.info(0, "Test_hiappevent_write_04", "Test_hiappevent_write_04_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_123456789abcdefghabcdabcd", "test_event", EventType.Fault,
                params)
            HiAppEvent.write(appInfo)
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_04", "Test_hiappevent_write_04_fail")
        } catch (e: BusinessException) {
            @Expect(e.code,11101001)
            @Expect(e.message,"Invalid event domain.")
            Hilog.info(0, "Test_hiappevent_write_04", "Test_hiappevent_write_04_pass_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_04", "Test_hiappevent_write_04_end")
        }
    }
    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_0700
    * @tc.name      : Test_hiappevent_write_05
    * @tc.desc      : test Hiappevent Test_hiappevent_write_05
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_05(): Unit {
        Hilog.info(0, "Test_hiappevent_write_05", "Test_hiappevent_write_05_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Fault, params) //cangjie_
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_05", "Test_hiappevent_write_05_pass")
        } catch (e: Exception) {
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_05", "Test_hiappevent_write_05_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_05", "Test_hiappevent_write_05_end")
        }
    }
    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_0800
    * @tc.name      : Test_hiappevent_write_06
    * @tc.desc      : test Hiappevent Test_hiappevent_write_06
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_06(): Unit {
        Hilog.info(0, "Test_hiappevent_write_06", "Test_hiappevent_write_06_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie", "cangjie1_", EventType.Fault, params)
            HiAppEvent.write(appInfo)
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_06", "Test_hiappevent_write_06_fail")
        } catch (e: BusinessException) {
            @Expect(e.code,11101002)
            @Expect(e.message,"Invalid event name.")
            Hilog.info(0, "Test_hiappevent_write_06", "Test_hiappevent_write_06_pass_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_06", "Test_hiappevent_write_06_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_0900
    * @tc.name      : Test_hiappevent_write_07
    * @tc.desc      : test Hiappevent Test_hiappevent_write_07
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_07(): Unit {
        Hilog.info(0, "Test_hiappevent_write_07", "Test_hiappevent_write_07_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie",
                "cangjie1234567898aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", EventType.Fault, params)
            HiAppEvent.write(appInfo)
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_07", "Test_hiappevent_write_07_fail")
        } catch (e: BusinessException) {
            @Expect(e.code,11101002)
            @Expect(e.message,"Invalid event name.")
            Hilog.info(0, "Test_hiappevent_write_07", "Test_hiappevent_write_07_pass_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_07", "Test_hiappevent_write_07_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_1000
    * @tc.name      : Test_hiappevent_write_08
    * @tc.desc      : test Hiappevent Test_hiappevent_write_08
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_08(): Unit {
        Hilog.info(0, "Test_hiappevent_write_08", "Test_hiappevent_write_08_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie", "", EventType.Fault, params)
            HiAppEvent.write(appInfo)
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_08", "Test_hiappevent_write_08_fail")
        } catch (e: BusinessException) {
            @Expect(e.code,11101002)
            @Expect(e.message,"Invalid event name.")
            Hilog.info(0, "Test_hiappevent_write_08", "Test_hiappevent_write_08_pass_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_08", "Test_hiappevent_write_08_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_1100
    * @tc.name      : Test_hiappevent_write_09
    * @tc.desc      : test Hiappevent Test_hiappevent_write_09
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_09(): Unit {
        Hilog.info(0, "Test_hiappevent_write_09", "Test_hiappevent_write_09_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_09", "Test_hiappevent_write_09_pass")
        } catch (e: Exception) {
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_09", "Test_hiappevent_write_09_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_09", "Test_hiappevent_write_09_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_1200
    * @tc.name      : Test_hiappevent_write_10
    * @tc.desc      : test Hiappevent Test_hiappevent_write_10
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_10(): Unit {
        Hilog.info(0, "Test_hiappevent_write_10", "Test_hiappevent_write_10_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Behavior, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_10", "Test_hiappevent_write_10_pass")
        } catch (e: Exception) {
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_10", "Test_hiappevent_write_10_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_10", "Test_hiappevent_write_10_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_1300
    * @tc.name      : Test_hiappevent_write_11
    * @tc.desc      : test Hiappevent Test_hiappevent_write_11
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_11(): Unit {
        Hilog.info(0, "Test_hiappevent_write_11", "Test_hiappevent_write_11_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Security, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_11", "Test_hiappevent_write_11_pass")
        } catch (e: Exception) {
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_11", "Test_hiappevent_write_11_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_11", "Test_hiappevent_write_11_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_1400
    * @tc.name      : Test_hiappevent_write_12
    * @tc.desc      : test Hiappevent Test_hiappevent_write_12
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_12(): Unit {
        Hilog.info(0, "Test_hiappevent_write_12", "Test_hiappevent_write_12_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_12", "Test_hiappevent_write_12_pass")
        } catch (e: Exception) {
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_12", "Test_hiappevent_write_12_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_12", "Test_hiappevent_write_12_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_1500
    * @tc.name      : Test_hiappevent_write_13
    * @tc.desc      : test Hiappevent Test_hiappevent_write_13
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_13(): Unit {
        Hilog.info(0, "Test_hiappevent_write_13", "Test_hiappevent_write_13_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_13", "Test_hiappevent_write_13_pass")
        } catch (e: BusinessException) {
            @Expect(e.code,11101005)
            @Expect(e.message,"Invalid event parameter name.")
            Hilog.info(0, "Test_hiappevent_write_13", "Test_hiappevent_write_13_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_13", "Test_hiappevent_write_13_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_1600
    * @tc.name      : Test_hiappevent_write_14
    * @tc.desc      : test Hiappevent Test_hiappevent_write_14
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_14(): Unit {
        Hilog.info(0, "Test_hiappevent_write_14", "Test_hiappevent_write_14_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_14", "Test_hiappevent_write_14_pass")
        } catch (e: BusinessException) {
            @Expect(e.code,11101005)
            @Expect(e.message,"Invalid event parameter name.")
            Hilog.info(0, "Test_hiappevent_write_14", "Test_hiappevent_write_14_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_14", "Test_hiappevent_write_14_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_1700
    * @tc.name      : Test_hiappevent_write_15
    * @tc.desc      : test Hiappevent Test_hiappevent_write_15
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_15(): Unit {
        Hilog.info(0, "Test_hiappevent_write_15", "Test_hiappevent_write_15_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_15", "Test_hiappevent_write_15_fail")
        } catch (e: Exception) {
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_15", "Test_hiappevent_write_15_pass_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_15", "Test_hiappevent_write_15_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_1800
    * @tc.name      : Test_hiappevent_write_16
    * @tc.desc      : test Hiappevent Test_hiappevent_write_16
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_16(): Unit {
        Hilog.info(0, "Test_hiappevent_write_16", "Test_hiappevent_write_16_start")
        try {
            let num: Int32 = Int32(2147483647)
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_16", "Test_hiappevent_write_16_fail")
        } catch (e: Exception) {
            @Expect(false) //
            Hilog.info(0, "Test_hiappevent_write_16", "Test_hiappevent_write_16_pass_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_16", "Test_hiappevent_write_16_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_1900
    * @tc.name      : Test_hiappevent_write_17
    * @tc.desc      : test Hiappevent Test_hiappevent_write_17
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_17(): Unit {
        Hilog.info(0, "Test_hiappevent_write_17", "Test_hiappevent_write_17_start")
        try {
            let num: Int32 = Int32(-2147483648)
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_17", "Test_hiappevent_write_17_pass")
        } catch (e: Exception) {
            @Expect(false) // OverflowException: The result would be greater than Int32.Max.
            Hilog.info(0, "Test_hiappevent_write_17", "Test_hiappevent_write_17_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_17", "Test_hiappevent_write_17_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_2000
    * @tc.name      : Test_hiappevent_write_18
    * @tc.desc      : test Hiappevent Test_hiappevent_write_18
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_18(): Unit {
        Hilog.info(0, "Test_hiappevent_write_18", "Test_hiappevent_write_18_start")
        try {
            let num: Float64 = Float64(2147483647.00)
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_18", "Test_hiappevent_write_18_fail")
        } catch (e: Exception) {
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_18", "Test_hiappevent_write_18_pass_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_18", "Test_hiappevent_write_18_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_2100
    * @tc.name      : Test_hiappevent_write_19
    * @tc.desc      : test Hiappevent Test_hiappevent_write_19
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_19(): Unit {
        Hilog.info(0, "Test_hiappevent_write_19", "Test_hiappevent_write_19_start")
        try {
            let num: Float64 = Float64(-2147483648.00)
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_19", "Test_hiappevent_write_19_fail")
        } catch (e: Exception) {
            @Expect(false) // OverflowException: The result would be greater than Int32.Max.
            Hilog.info(0, "Test_hiappevent_write_19", "Test_hiappevent_write_19_pass_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_19", "Test_hiappevent_write_19_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_2200
    * @tc.name      : Test_hiappevent_write_20
    * @tc.desc      : test Hiappevent Test_hiappevent_write_20
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_20(): Unit {
        Hilog.info(0, "Test_hiappevent_write_20", "Test_hiappevent_write_20_start")
        try {
            let str = ""
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_20", "Test_hiappevent_write_20_pass")
        } catch (e: Exception) {
            Hilog.info(0, "Test_hiappevent_write_20", "Test_hiappevent_write_20_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_20", "Test_hiappevent_write_20_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_2300
    * @tc.name      : Test_hiappevent_write_21
    * @tc.desc      : test Hiappevent Test_hiappevent_write_21
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_21(): Unit {
        Hilog.info(0, "Test_hiappevent_write_21", "Test_hiappevent_write_21_start")
        try {
            let str = "kjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wudfiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHJKLjSKCKnSCLKLKSJN;KXJC;LjsDPIAKNC,MsnXKlzHCIPADFIENKLASJDC;SKJDLKjxCLKHIalsFCHLJKASJCDLKsDCLKkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHJKLjSKCKnSCLKLKSJN;KXJC;LjsDPIAKNC,MsnXKlzHCIPADFIENKLASJDC;SKJDLKjxCLKHIalsFCHLJKASJCDLKsDCLKkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHJKLjSKCKnSCLKLKSJN;KXJC;LjsDPIAKNC,MsnXKlzHCIPADFIENKLASJDC;SKJDLKjxCLKHIalsFCHLJKASJCDLKsDCLKkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHDkjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxiZkcuskdcLZKBHcf;ASkdcAsyudcioaqnejkahbsk;xc j:Xuc[odivopsjkdvfHSWGDOIlsjdqx;'ADXshCJZCJHAZJHDSADASOJDCashjdclkSA:lsJDCLKSAHjhJfhfld;vhbjck;czpicjijd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikMnsKXCNlsJCd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikMnsKXCNlsJCd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikMnsKXCNlsJCd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikMnsKXCNlsJCd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidyuevfdkdjchxikMnsKXCNlsJCd;plKSODOIiUSJBCABiouaiocfnjhcfgblZKLc'zcbjuqg2wuiu	iuiAUSRHVSCKJZXHCLKKSCDVlodgkhasgdksjdisuidaDsdxaAAAAAAAAAAAAAAAAAAAAAAAAAA"
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_21", "Test_hiappevent_write_21_fail")
        } catch (e: BusinessException) {
            @Expect(e.code, 11101004)
            @Expect(e.message,"Invalid string length of the event parameter.")
            Hilog.info(0, "Test_hiappevent_write_21", "Test_hiappevent_write_21_pass_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_21", "Test_hiappevent_write_21_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_2400
    * @tc.name      : Test_hiappevent_write_22
    * @tc.desc      : test Hiappevent Test_hiappevent_write_22
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_22(): Unit {
        Hilog.info(0, "Test_hiappevent_write_22", "Test_hiappevent_write_22_start")
        try {
            let str = "cangjie123!@#$%^&*()?><:*"
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true) //长度超过8192没抛异常
            Hilog.info(0, "Test_hiappevent_write_22", "Test_hiappevent_write_22_pass")
        } catch (e: Exception) {
            @Expect(false) // OverflowException: The result would be greater than Int32.Max.
            Hilog.info(0, "Test_hiappevent_write_22", "Test_hiappevent_write_22_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_22", "Test_hiappevent_write_22_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_2500
    * @tc.name      : Test_hiappevent_write_23
    * @tc.desc      : test Hiappevent Test_hiappevent_write_23
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_23(): Unit {
        Hilog.info(0, "Test_hiappevent_write_23", "Test_hiappevent_write_23_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_23", "Test_hiappevent_write_23_pass")
        } catch (e: Exception) {
            @Expect(false) // OverflowException: The result would be greater than Int32.Max.
            Hilog.info(0, "Test_hiappevent_write_23", "Test_hiappevent_write_23_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_23", "Test_hiappevent_write_23_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_2600
    * @tc.name      : Test_hiappevent_write_24
    * @tc.desc      : test Hiappevent Test_hiappevent_write_24
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_24(): Unit {
        Hilog.info(0, "Test_hiappevent_write_24", "Test_hiappevent_write_24_start")
        try {
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_24", "Test_hiappevent_write_24_pass")
        } catch (e: Exception) {
            @Expect(false) // OverflowException: The result would be greater than Int32.Max.
            Hilog.info(0, "Test_hiappevent_write_24", "Test_hiappevent_write_24_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_24", "Test_hiappevent_write_24_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_2700
    * @tc.name      : Test_hiappevent_write_25
    * @tc.desc      : test Hiappevent Test_hiappevent_write_25
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_25(): Unit {
        Hilog.info(0, "Test_hiappevent_write_25", "Test_hiappevent_write_25_start")
        try {
            let array1: Array<Int32> = [16, 32]
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_25", "Test_hiappevent_write_25_pass")
        } catch (e: Exception) {
            @Expect(false) // OverflowException: The result would be greater than Int32.Max.
            Hilog.info(0, "Test_hiappevent_write_25", "Test_hiappevent_write_25_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_25", "Test_hiappevent_write_25_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_2800
    * @tc.name      : Test_hiappevent_write_26
    * @tc.desc      : test Hiappevent Test_hiappevent_write_26
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_26(): Unit {
        Hilog.info(0, "Test_hiappevent_write_26", "Test_hiappevent_write_26_start")
        try {
            let array1: Array<Float64> = [16.00, 32.00]
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_26", "Test_hiappevent_write_26_pass")
        } catch (e: Exception) {
            @Expect(false) // OverflowException: The result would be greater than Int32.Max.
            Hilog.info(0, "Test_hiappevent_write_26", "Test_hiappevent_write_26_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_26", "Test_hiappevent_write_26_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_2900
    * @tc.name      : Test_hiappevent_write_27
    * @tc.desc      : test Hiappevent Test_hiappevent_write_27
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_27(): Unit {
        Hilog.info(0, "Test_hiappevent_write_27", "Test_hiappevent_write_27_start")
        try {
            let array1: Array<Bool> = [true, false]
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_27", "Test_hiappevent_write_27_pass")
        } catch (e: Exception) {
            @Expect(false)
            Hilog.info(0, "Test_hiappevent_write_27", "Test_hiappevent_write_27_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_27", "Test_hiappevent_write_27_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_3000
    * @tc.name      : Test_hiappevent_write_28
    * @tc.desc      : test Hiappevent Test_hiappevent_write_28
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_28(): Unit {
        Hilog.info(0, "Test_hiappevent_write_28", "Test_hiappevent_write_28_start")
        try {
            let array1: Array<Bool> = [true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false, true, false,
                true, false, true, false, true, false, true, false, true, false, true, false, true, false]
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_28", "Test_hiappevent_write_28_pass")
        } catch (e: BusinessException) {
            @Expect(e.code,11101006)
            @Expect(e.message,"Invalid array length of the event parameter.") // OverflowException: The result would be greater than Int32.Max.
            Hilog.info(0, "Test_hiappevent_write_28", "Test_hiappevent_write_28_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_28", "Test_hiappevent_write_28_end")
        }
    }

    
    /*
    * @tc.number    : Sub_Cangjie_Hiappevent_Test_hiAppEvent_write_3100
    * @tc.name      : Test_hiappevent_write_29
    * @tc.desc      : test Hiappevent Test_hiappevent_write_29
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    public func Test_hiappevent_write_29(): Unit {
        Hilog.info(0, "Test_hiappevent_write_29", "Test_hiappevent_write_29_start")
        try {
            let array1: Array<Float64> = [16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 32.00,
                16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00,
                16.00, 32.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 32.00, 16.00, 32.00, 16.00,
                32.00, 16.00, 32.00, 16.00, 32.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 32.00,
                16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00,
                16.00, 32.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 32.00, 16.00, 32.00, 16.00,
                32.00, 16.00, 32.00, 16.00, 32.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 32.00,
                16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00, 32.00, 16.00, 32.00, 16.00, 32.00, 16.00, 32.00,
                16.00, 32.00]
            var params = HashMap<String, EventValueType>([
                ("int_data", IntValue(100)),
                ("str_data", StringValue("strValue")),
                ("flo_data", FloatValue(123.45)),
                ("bool_data", BoolValue(true)),
                ("arri32_data", ArrI32([1, 2, 3])),
                ("arrf64_data", ArrF64([1.2])),
                ("arrstr_data", ArrString(["123"])),
                ("arrbool_data", ArrBool([true]))
            ])
            var appInfo: AppEventInfo = AppEventInfo("cangjie_1", "$cangjie_1", EventType.Statistic, params)
            HiAppEvent.write(appInfo)
            @Expect(true)
            Hilog.info(0, "Test_hiappevent_write_29", "Test_hiappevent_write_29_pass")
        } catch (e: BusinessException) {
            @Expect(e.code,11101006)
            @Expect(e.message,"Invalid array length of the event parameter.") // OverflowException: The result would be greater than Int32.Max.
            Hilog.info(0, "Test_hiappevent_write_29", "Test_hiappevent_write_29_fail_${e.toString()}")
        } finally {
            Hilog.info(0, "Test_hiappevent_write_29", "Test_hiappevent_write_29_end")
        }
    }
}
