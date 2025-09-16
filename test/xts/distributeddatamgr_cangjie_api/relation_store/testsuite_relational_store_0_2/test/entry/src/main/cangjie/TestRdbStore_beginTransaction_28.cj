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
import ohos.data.relational_store.ValueType as RelaValueType
import ohos.business_exception.{BusinessException}
import kit.PerformanceAnalysisKit.Hilog
import std.core.*
import std.collection.HashMap
import ohos.app.ability.ui_ability.UIAbilityContext

@Test
class TestRdbStore_beginTransaction_28 {
    /*
     * @tc.number    : TestRdbStore_beginTransaction_270100
     * @tc.name      : TestCase_2701
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2701(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2701 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2700: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2701 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_270200
     * @tc.name      : TestCase_2702
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2702(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2702 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2701: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2702 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_270300
     * @tc.name      : TestCase_2703
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2703(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2703 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2702: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2703 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_270400
     * @tc.name      : TestCase_2704
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2704(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2704 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2703: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2704 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_270500
     * @tc.name      : TestCase_2705
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2705(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2705 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2704: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2705 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_270600
     * @tc.name      : TestCase_2706
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2706(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2706 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2705: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2706 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_270700
     * @tc.name      : TestCase_2707
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2707(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2707 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2706: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2707 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_270800
     * @tc.name      : TestCase_2708
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2708(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2708 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2707: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2708 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_270900
     * @tc.name      : TestCase_2709
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2709(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2709 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2708: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2709 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_271000
     * @tc.name      : TestCase_2710
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2710(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2710 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2709: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2710 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_271100
     * @tc.name      : TestCase_2711
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2711(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2711 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2710: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2711 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_271200
     * @tc.name      : TestCase_2712
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2712(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2712 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2711: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2712 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_271300
     * @tc.name      : TestCase_2713
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2713(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2713 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2712: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2713 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_271400
     * @tc.name      : TestCase_2714
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2714(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2714 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2713: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2714 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_271500
     * @tc.name      : TestCase_2715
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2715(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2715 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2714: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2715 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_271600
     * @tc.name      : TestCase_2716
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2716(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2716 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2715: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2716 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_271700
     * @tc.name      : TestCase_2717
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2717(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2717 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2716: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2717 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_271800
     * @tc.name      : TestCase_2718
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2718(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2718 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2717: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2718 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_271900
     * @tc.name      : TestCase_2719
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2719(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2719 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2718: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2719 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_272000
     * @tc.name      : TestCase_2720
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2720(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2720 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2719: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2720 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_272100
     * @tc.name      : TestCase_2721
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2721(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2721 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2720: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2721 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_272200
     * @tc.name      : TestCase_2722
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2722(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2722 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2721: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2722 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_272300
     * @tc.name      : TestCase_2723
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2723(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2723 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2722: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2723 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_272400
     * @tc.name      : TestCase_2724
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2724(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2724 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2723: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2724 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_272500
     * @tc.name      : TestCase_2725
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2725(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2725 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2724: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2725 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_272600
     * @tc.name      : TestCase_2726
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2726(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2726 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2725: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2726 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_272700
     * @tc.name      : TestCase_2727
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2727(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2727 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2726: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2727 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_272800
     * @tc.name      : TestCase_2728
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2728(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2728 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2727: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2728 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_272900
     * @tc.name      : TestCase_2729
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2729(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2729 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2728: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2729 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_273000
     * @tc.name      : TestCase_2730
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2730(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2730 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2729: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2730 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_273100
     * @tc.name      : TestCase_2731
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2731(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2731 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2730: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2731 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_273200
     * @tc.name      : TestCase_2732
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2732(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2732 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2731: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2732 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_273300
     * @tc.name      : TestCase_2733
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2733(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2733 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2732: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2733 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_273400
     * @tc.name      : TestCase_2734
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2734(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2734 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2733: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2734 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_273500
     * @tc.name      : TestCase_2735
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2735(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2735 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2734: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2735 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_273600
     * @tc.name      : TestCase_2736
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2736(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2736 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2735: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2736 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_273700
     * @tc.name      : TestCase_2737
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2737(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2737 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2736: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2737 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_273800
     * @tc.name      : TestCase_2738
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2738(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2738 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2737: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2738 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_273900
     * @tc.name      : TestCase_2739
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2739(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2739 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2738: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2739 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_274000
     * @tc.name      : TestCase_2740
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2740(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2740 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2739: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2740 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_274100
     * @tc.name      : TestCase_2741
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2741(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2741 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2740: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2741 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_274200
     * @tc.name      : TestCase_2742
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2742(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2742 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2741: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2742 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_274300
     * @tc.name      : TestCase_2743
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2743(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2743 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2742: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2743 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_274400
     * @tc.name      : TestCase_2744
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2744(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2744 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2743: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2744 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_274500
     * @tc.name      : TestCase_2745
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2745(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2745 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2744: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2745 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_274600
     * @tc.name      : TestCase_2746
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2746(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2746 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2745: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2746 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_274700
     * @tc.name      : TestCase_2747
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2747(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2747 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2746: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2747 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_274800
     * @tc.name      : TestCase_2748
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2748(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2748 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2747: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2748 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_274900
     * @tc.name      : TestCase_2749
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2749(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2749 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2748: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2749 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_275000
     * @tc.name      : TestCase_2750
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2750(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2750 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2749: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2750 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_275100
     * @tc.name      : TestCase_2751
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2751(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2751 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2750: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2751 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_275200
     * @tc.name      : TestCase_2752
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2752(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2752 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2751: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2752 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_275300
     * @tc.name      : TestCase_2753
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2753(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2753 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2752: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2753 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_275400
     * @tc.name      : TestCase_2754
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2754(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2754 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2753: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2754 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_275500
     * @tc.name      : TestCase_2755
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2755(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2755 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2754: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2755 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_275600
     * @tc.name      : TestCase_2756
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2756(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2756 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2755: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2756 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_275700
     * @tc.name      : TestCase_2757
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2757(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2757 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2756: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2757 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_275800
     * @tc.name      : TestCase_2758
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2758(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2758 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2757: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2758 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_275900
     * @tc.name      : TestCase_2759
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2759(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2759 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2758: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2759 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_276000
     * @tc.name      : TestCase_2760
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2760(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2760 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2759: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2760 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_276100
     * @tc.name      : TestCase_2761
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2761(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2761 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2760: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2761 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_276200
     * @tc.name      : TestCase_2762
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2762(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2762 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2761: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2762 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_276300
     * @tc.name      : TestCase_2763
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2763(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2763 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2762: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2763 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_276400
     * @tc.name      : TestCase_2764
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2764(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2764 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2763: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2764 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_276500
     * @tc.name      : TestCase_2765
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2765(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2765 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2764: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2765 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_276600
     * @tc.name      : TestCase_2766
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2766(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2766 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2765: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2766 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_276700
     * @tc.name      : TestCase_2767
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2767(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2767 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2766: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2767 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_276800
     * @tc.name      : TestCase_2768
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2768(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2768 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2767: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2768 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_276900
     * @tc.name      : TestCase_2769
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2769(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2769 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2768: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2769 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_277000
     * @tc.name      : TestCase_2770
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2770(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2770 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2769: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2770 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_277100
     * @tc.name      : TestCase_2771
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2771(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2771 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2770: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2771 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_277200
     * @tc.name      : TestCase_2772
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2772(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2772 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2771: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2772 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_277300
     * @tc.name      : TestCase_2773
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2773(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2773 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2772: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2773 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_277400
     * @tc.name      : TestCase_2774
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2774(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2774 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2773: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2774 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_277500
     * @tc.name      : TestCase_2775
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2775(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2775 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2774: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2775 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_277600
     * @tc.name      : TestCase_2776
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2776(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2776 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2775: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2776 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_277700
     * @tc.name      : TestCase_2777
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2777(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2777 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2776: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2777 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_277800
     * @tc.name      : TestCase_2778
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2778(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2778 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2777: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2778 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_277900
     * @tc.name      : TestCase_2779
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2779(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2779 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2778: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2779 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_278000
     * @tc.name      : TestCase_2780
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2780(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2780 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2779: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2780 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_278100
     * @tc.name      : TestCase_2781
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2781(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2781 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2780: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2781 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_278200
     * @tc.name      : TestCase_2782
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2782(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2782 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2781: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2782 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_278300
     * @tc.name      : TestCase_2783
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2783(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2783 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2782: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2783 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_278400
     * @tc.name      : TestCase_2784
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2784(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2784 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2783: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2784 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_278500
     * @tc.name      : TestCase_2785
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2785(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2785 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2784: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2785 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_278600
     * @tc.name      : TestCase_2786
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2786(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2786 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2785: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2786 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_278700
     * @tc.name      : TestCase_2787
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2787(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2787 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#2786: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2787 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_278800
     * @tc.name      : TestCase_2788
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2788(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2788 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2787: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2788 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_278900
     * @tc.name      : TestCase_2789
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2789(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2789 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2788: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2789 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_279000
     * @tc.name      : TestCase_2790
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2790(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2790 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2789: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2790 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_279100
     * @tc.name      : TestCase_2791
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2791(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2791 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#2790: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2791 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_279200
     * @tc.name      : TestCase_2792
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2792(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2792 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2791: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2792 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_279300
     * @tc.name      : TestCase_2793
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2793(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2793 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2792: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2793 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_279400
     * @tc.name      : TestCase_2794
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2794(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2794 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2793: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2794 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_279500
     * @tc.name      : TestCase_2795
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2795(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2795 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#2794: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2795 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_279600
     * @tc.name      : TestCase_2796
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2796(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2796 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2795: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2796 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_279700
     * @tc.name      : TestCase_2797
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2797(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2797 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2796: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2797 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_279800
     * @tc.name      : TestCase_2798
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2798(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2798 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2797: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2798 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_279900
     * @tc.name      : TestCase_2799
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2799(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2799 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#2798: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2799 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_280000
     * @tc.name      : TestCase_2800
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_2800(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2800 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#2799: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_2800 ends.")
    }
}
