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
import ohos.data.preferences.*
import ohos.data.preferences.Options as PreferencesOptions
import ohos.data.preferences.ValueType as PreferencesValueType
import kit.ArkData.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.business_exception.BusinessException

@Test
class TestDeletePreferencesByOptions_1 {
    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_0100
     * @tc.name      : TestCase_1
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_1(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_1 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.BoolData(true))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_1 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_0200
     * @tc.name      : TestCase_2
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_2(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_2 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.BoolArray([false, true]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_2 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_0300
     * @tc.name      : TestCase_3
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_3(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_3 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(Float64.Min))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_3 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_0400
     * @tc.name      : TestCase_4
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_4(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_4 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(Float64.Max))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_4 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_0500
     * @tc.name      : TestCase_5
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_5(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_5 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(Float64.Inf))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_5 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_0600
     * @tc.name      : TestCase_6
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_6(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_6 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(0.000000f64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_6 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_0700
     * @tc.name      : TestCase_7
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_7(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_7 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.DoubleArray([Float64.Min, Float64.Max, Float64.Inf, 0.000000f64]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_7 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_0800
     * @tc.name      : TestCase_8
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_8(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_8 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(Int64.Min))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_8 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_0900
     * @tc.name      : TestCase_9
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_9(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_9 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(-1i64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_9 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_1000
     * @tc.name      : TestCase_10
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_10(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_10 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(0i64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_10 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_1100
     * @tc.name      : TestCase_11
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_11(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_11 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(1i64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_11 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_1200
     * @tc.name      : TestCase_12
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_12(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_12 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(Int64.Max))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_12 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_1300
     * @tc.name      : TestCase_13
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_13(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_13 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringData(""))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_13 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_1400
     * @tc.name      : TestCase_14
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_14(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_14 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringData("\0"))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_14 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_1500
     * @tc.name      : TestCase_15
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_15(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_15 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringData("hello world"))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_15 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_1600
     * @tc.name      : TestCase_16
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_16(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_16 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringArray(["a", "b", "c"]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_16 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_1700
     * @tc.name      : TestCase_17
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_17(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_17 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringArray(["", "", ""]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_17 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_1800
     * @tc.name      : TestCase_18
     * @tc.desc      : delete preferences by options name="preferences1" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_18(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_18 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringArray(["", "\0", "hello world"]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_18 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_1900
     * @tc.name      : TestCase_19
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_19(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_19 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.BoolData(true))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_19 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_2000
     * @tc.name      : TestCase_20
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_20(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_20 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.BoolArray([false, true]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_20 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_2100
     * @tc.name      : TestCase_21
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_21(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_21 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(Float64.Min))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_21 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_2200
     * @tc.name      : TestCase_22
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_22(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_22 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(Float64.Max))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_22 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_2300
     * @tc.name      : TestCase_23
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_23(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_23 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(Float64.Inf))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_23 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_2400
     * @tc.name      : TestCase_24
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_24(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_24 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(0.000000f64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_24 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_2500
     * @tc.name      : TestCase_25
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_25(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_25 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.DoubleArray([Float64.Min, Float64.Max, Float64.Inf, 0.000000f64]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_25 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_2600
     * @tc.name      : TestCase_26
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_26(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_26 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(Int64.Min))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_26 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_2700
     * @tc.name      : TestCase_27
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_27(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_27 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(-1i64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_27 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_2800
     * @tc.name      : TestCase_28
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_28(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_28 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(0i64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_28 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_2900
     * @tc.name      : TestCase_29
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_29(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_29 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(1i64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_29 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_3000
     * @tc.name      : TestCase_30
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_30(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_30 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(Int64.Max))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_30 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_3100
     * @tc.name      : TestCase_31
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_31(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_31 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringData(""))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_31 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_3200
     * @tc.name      : TestCase_32
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_32(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_32 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringData("\0"))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_32 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_3300
     * @tc.name      : TestCase_33
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_33(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_33 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringData("hello world"))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_33 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_3400
     * @tc.name      : TestCase_34
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_34(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_34 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringArray(["a", "b", "c"]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_34 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_3500
     * @tc.name      : TestCase_35
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_35(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_35 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringArray(["", "", ""]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_35 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_3600
     * @tc.name      : TestCase_36
     * @tc.desc      : delete preferences by options name="preferences1" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_36(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_36 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringArray(["", "\0", "hello world"]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences1", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences1", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_36 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_3700
     * @tc.name      : TestCase_37
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_37(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_37 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.BoolData(true))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_37 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_3800
     * @tc.name      : TestCase_38
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_38(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_38 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.BoolArray([false, true]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_38 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_3900
     * @tc.name      : TestCase_39
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_39(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_39 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(Float64.Min))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_39 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_4000
     * @tc.name      : TestCase_40
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_40(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_40 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(Float64.Max))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_40 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_4100
     * @tc.name      : TestCase_41
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_41(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_41 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(Float64.Inf))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_41 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_4200
     * @tc.name      : TestCase_42
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_42(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_42 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(0.000000f64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_42 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_4300
     * @tc.name      : TestCase_43
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_43(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_43 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.DoubleArray([Float64.Min, Float64.Max, Float64.Inf, 0.000000f64]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_43 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_4400
     * @tc.name      : TestCase_44
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_44(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_44 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(Int64.Min))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_44 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_4500
     * @tc.name      : TestCase_45
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_45(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_45 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(-1i64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_45 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_4600
     * @tc.name      : TestCase_46
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_46(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_46 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(0i64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_46 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_4700
     * @tc.name      : TestCase_47
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_47(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_47 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(1i64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_47 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_4800
     * @tc.name      : TestCase_48
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_48(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_48 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(Int64.Max))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_48 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_4900
     * @tc.name      : TestCase_49
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_49(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_49 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringData(""))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_49 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_5000
     * @tc.name      : TestCase_50
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_50(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_50 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringData("\0"))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_50 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_5100
     * @tc.name      : TestCase_51
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_51(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_51 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringData("hello world"))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_51 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_5200
     * @tc.name      : TestCase_52
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_52(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_52 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringArray(["a", "b", "c"]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_52 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_5300
     * @tc.name      : TestCase_53
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_53(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_53 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringArray(["", "", ""]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_53 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_5400
     * @tc.name      : TestCase_54
     * @tc.desc      : delete preferences by options name="preferences2" groupId="1".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_54(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_54 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringArray(["", "\0", "hello world"]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_54 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_5500
     * @tc.name      : TestCase_55
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_55(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_55 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.BoolData(true))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_55 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_5600
     * @tc.name      : TestCase_56
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_56(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_56 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.BoolArray([false, true]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_56 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_5700
     * @tc.name      : TestCase_57
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_57(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_57 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(Float64.Min))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_57 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_5800
     * @tc.name      : TestCase_58
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_58(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_58 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(Float64.Max))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_58 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_5900
     * @tc.name      : TestCase_59
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_59(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_59 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(Float64.Inf))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_59 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_6000
     * @tc.name      : TestCase_60
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_60(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_60 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Double(0.000000f64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_60 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_6100
     * @tc.name      : TestCase_61
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_61(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_61 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.DoubleArray([Float64.Min, Float64.Max, Float64.Inf, 0.000000f64]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_61 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_6200
     * @tc.name      : TestCase_62
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_62(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_62 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(Int64.Min))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_62 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_6300
     * @tc.name      : TestCase_63
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_63(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_63 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(-1i64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_63 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_6400
     * @tc.name      : TestCase_64
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_64(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_64 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(0i64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_64 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_6500
     * @tc.name      : TestCase_65
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_65(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_65 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(1i64))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_65 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_6600
     * @tc.name      : TestCase_66
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_66(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_66 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.Integer(Int64.Max))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_66 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_6700
     * @tc.name      : TestCase_67
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_67(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_67 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringData(""))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_67 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_6800
     * @tc.name      : TestCase_68
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_68(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_68 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringData("\0"))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_68 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_6900
     * @tc.name      : TestCase_69
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_69(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_69 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringData("hello world"))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_69 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_7000
     * @tc.name      : TestCase_70
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_70(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_70 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringArray(["a", "b", "c"]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_70 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_7100
     * @tc.name      : TestCase_71
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_71(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_71 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringArray(["", "", ""]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_71 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_preferences_DeletePreferencesByOptions_7200
     * @tc.name      : TestCase_72
     * @tc.desc      : delete preferences by options name="preferences2" groupId="5".
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_72(): Unit {
        try {
            Hilog.info(0, "cangjietest", "testcase TestCase_72 begins.")
            Hilog.info(0, "cangjietest", "define local variable preferences")
            let preferences = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "put")
            preferences.put("key", PreferencesValueType.StringArray(["", "\0", "hello world"]))
            Hilog.info(0, "cangjietest", "flush")
            preferences.flush()
            Hilog.info(0, "cangjietest", "deletePreferences")
            Preferences.deletePreferences(getAbilityContext(), PreferencesOptions("preferences2", dataGroupId: ""))
            Hilog.info(0, "cangjietest", "define local variable preferences_1")
            let preferences_1 = Preferences.getPreferences(getAbilityContext(),
                PreferencesOptions("preferences2", dataGroupId: ""))
            @Assert(false, preferences_1.has("key"))
        } catch (e: BusinessException) {
            @Expect(e.message, "Preferences getPreferences failed: Inner error.")
            @Expect(e.code, 22i32)
        }

        Hilog.info(0, "cangjietest", "testcase TestCase_72 ends.")
    }
}
