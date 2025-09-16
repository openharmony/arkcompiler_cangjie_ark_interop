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
class TestRdbStore_beginTransaction_40 {
    /*
     * @tc.number    : TestRdbStore_beginTransaction_390100
     * @tc.name      : TestCase_3901
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3901(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3901 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3900: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3901 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_390200
     * @tc.name      : TestCase_3902
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3902(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3902 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3901: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3902 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_390300
     * @tc.name      : TestCase_3903
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3903(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3903 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3902: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3903 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_390400
     * @tc.name      : TestCase_3904
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3904(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3904 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3903: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3904 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_390500
     * @tc.name      : TestCase_3905
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3905(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3905 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3904: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3905 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_390600
     * @tc.name      : TestCase_3906
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3906(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3906 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3905: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3906 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_390700
     * @tc.name      : TestCase_3907
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3907(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3907 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3906: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3907 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_390800
     * @tc.name      : TestCase_3908
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3908(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3908 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3907: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3908 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_390900
     * @tc.name      : TestCase_3909
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3909(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3909 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3908: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3909 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_391000
     * @tc.name      : TestCase_3910
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3910(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3910 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3909: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3910 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_391100
     * @tc.name      : TestCase_3911
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3911(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3911 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3910: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3911 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_391200
     * @tc.name      : TestCase_3912
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3912(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3912 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3911: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3912 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_391300
     * @tc.name      : TestCase_3913
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3913(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3913 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3912: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3913 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_391400
     * @tc.name      : TestCase_3914
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3914(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3914 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3913: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3914 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_391500
     * @tc.name      : TestCase_3915
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3915(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3915 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3914: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3915 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_391600
     * @tc.name      : TestCase_3916
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3916(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3916 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3915: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3916 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_391700
     * @tc.name      : TestCase_3917
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3917(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3917 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3916: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3917 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_391800
     * @tc.name      : TestCase_3918
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3918(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3918 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3917: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3918 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_391900
     * @tc.name      : TestCase_3919
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3919(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3919 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3918: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3919 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_392000
     * @tc.name      : TestCase_3920
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3920(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3920 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3919: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3920 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_392100
     * @tc.name      : TestCase_3921
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3921(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3921 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3920: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3921 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_392200
     * @tc.name      : TestCase_3922
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3922(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3922 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3921: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3922 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_392300
     * @tc.name      : TestCase_3923
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3923(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3923 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3922: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3923 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_392400
     * @tc.name      : TestCase_3924
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3924(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3924 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3923: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3924 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_392500
     * @tc.name      : TestCase_3925
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3925(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3925 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3924: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3925 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_392600
     * @tc.name      : TestCase_3926
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3926(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3926 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3925: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3926 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_392700
     * @tc.name      : TestCase_3927
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3927(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3927 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3926: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3927 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_392800
     * @tc.name      : TestCase_3928
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3928(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3928 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3927: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3928 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_392900
     * @tc.name      : TestCase_3929
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3929(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3929 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3928: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3929 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_393000
     * @tc.name      : TestCase_3930
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3930(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3930 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3929: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3930 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_393100
     * @tc.name      : TestCase_3931
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3931(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3931 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3930: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3931 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_393200
     * @tc.name      : TestCase_3932
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3932(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3932 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3931: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3932 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_393300
     * @tc.name      : TestCase_3933
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3933(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3933 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3932: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3933 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_393400
     * @tc.name      : TestCase_3934
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3934(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3934 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3933: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3934 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_393500
     * @tc.name      : TestCase_3935
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3935(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3935 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3934: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3935 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_393600
     * @tc.name      : TestCase_3936
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3936(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3936 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3935: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3936 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_393700
     * @tc.name      : TestCase_3937
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3937(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3937 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3936: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3937 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_393800
     * @tc.name      : TestCase_3938
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3938(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3938 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3937: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3938 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_393900
     * @tc.name      : TestCase_3939
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3939(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3939 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3938: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3939 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_394000
     * @tc.name      : TestCase_3940
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3940(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3940 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3939: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3940 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_394100
     * @tc.name      : TestCase_3941
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3941(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3941 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3940: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3941 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_394200
     * @tc.name      : TestCase_3942
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3942(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3942 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3941: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3942 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_394300
     * @tc.name      : TestCase_3943
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3943(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3943 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3942: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3943 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_394400
     * @tc.name      : TestCase_3944
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3944(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3944 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3943: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3944 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_394500
     * @tc.name      : TestCase_3945
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3945(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3945 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3944: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3945 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_394600
     * @tc.name      : TestCase_3946
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3946(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3946 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3945: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3946 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_394700
     * @tc.name      : TestCase_3947
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3947(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3947 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3946: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3947 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_394800
     * @tc.name      : TestCase_3948
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3948(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3948 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3947: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3948 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_394900
     * @tc.name      : TestCase_3949
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3949(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3949 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3948: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3949 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_395000
     * @tc.name      : TestCase_3950
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3950(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3950 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3949: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3950 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_395100
     * @tc.name      : TestCase_3951
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3951(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3951 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3950: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3951 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_395200
     * @tc.name      : TestCase_3952
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3952(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3952 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3951: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3952 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_395300
     * @tc.name      : TestCase_3953
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3953(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3953 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3952: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3953 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_395400
     * @tc.name      : TestCase_3954
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3954(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3954 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3953: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3954 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_395500
     * @tc.name      : TestCase_3955
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3955(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3955 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3954: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3955 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_395600
     * @tc.name      : TestCase_3956
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3956(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3956 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3955: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3956 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_395700
     * @tc.name      : TestCase_3957
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3957(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3957 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3956: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3957 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_395800
     * @tc.name      : TestCase_3958
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3958(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3958 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3957: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3958 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_395900
     * @tc.name      : TestCase_3959
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3959(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3959 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3958: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3959 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_396000
     * @tc.name      : TestCase_3960
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3960(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3960 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3959: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3960 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_396100
     * @tc.name      : TestCase_3961
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3961(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3961 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3960: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3961 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_396200
     * @tc.name      : TestCase_3962
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3962(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3962 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3961: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3962 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_396300
     * @tc.name      : TestCase_3963
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3963(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3963 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3962: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3963 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_396400
     * @tc.name      : TestCase_3964
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3964(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3964 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3963: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3964 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_396500
     * @tc.name      : TestCase_3965
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3965(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3965 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3964: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3965 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_396600
     * @tc.name      : TestCase_3966
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3966(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3966 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3965: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3966 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_396700
     * @tc.name      : TestCase_3967
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3967(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3967 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3966: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3967 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_396800
     * @tc.name      : TestCase_3968
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3968(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3968 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3967: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3968 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_396900
     * @tc.name      : TestCase_3969
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3969(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3969 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3968: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3969 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_397000
     * @tc.name      : TestCase_3970
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3970(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3970 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3969: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3970 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_397100
     * @tc.name      : TestCase_3971
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3971(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3971 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3970: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3971 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_397200
     * @tc.name      : TestCase_3972
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3972(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3972 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3971: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3972 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_397300
     * @tc.name      : TestCase_3973
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3973(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3973 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3972: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3973 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_397400
     * @tc.name      : TestCase_3974
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3974(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3974 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3973: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3974 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_397500
     * @tc.name      : TestCase_3975
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3975(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3975 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3974: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3975 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_397600
     * @tc.name      : TestCase_3976
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3976(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3976 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3975: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3976 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_397700
     * @tc.name      : TestCase_3977
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3977(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3977 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3976: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3977 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_397800
     * @tc.name      : TestCase_3978
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3978(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3978 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3977: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3978 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_397900
     * @tc.name      : TestCase_3979
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3979(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3979 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3978: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3979 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_398000
     * @tc.name      : TestCase_3980
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3980(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3980 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3979: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3980 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_398100
     * @tc.name      : TestCase_3981
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3981(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3981 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3980: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3981 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_398200
     * @tc.name      : TestCase_3982
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3982(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3982 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3981: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3982 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_398300
     * @tc.name      : TestCase_3983
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3983(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3983 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3982: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3983 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_398400
     * @tc.name      : TestCase_3984
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3984(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3984 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3983: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3984 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_398500
     * @tc.name      : TestCase_3985
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3985(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3985 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3984: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3985 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_398600
     * @tc.name      : TestCase_3986
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3986(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3986 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3985: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3986 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_398700
     * @tc.name      : TestCase_3987
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3987(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3987 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3986: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3987 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_398800
     * @tc.name      : TestCase_3988
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3988(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3988 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3987: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3988 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_398900
     * @tc.name      : TestCase_3989
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3989(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3989 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3988: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3989 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_399000
     * @tc.name      : TestCase_3990
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3990(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3990 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3989: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3990 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_399100
     * @tc.name      : TestCase_3991
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3991(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3991 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3990: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3991 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_399200
     * @tc.name      : TestCase_3992
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3992(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3992 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3991: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3992 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_399300
     * @tc.name      : TestCase_3993
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3993(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3993 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3992: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3993 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_399400
     * @tc.name      : TestCase_3994
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3994(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3994 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3993: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3994 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_399500
     * @tc.name      : TestCase_3995
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3995(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3995 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3994: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3995 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_399600
     * @tc.name      : TestCase_3996
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3996(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3996 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3995: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3996 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_399700
     * @tc.name      : TestCase_3997
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3997(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3997 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3996: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3997 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_399800
     * @tc.name      : TestCase_3998
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3998(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3998 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3997: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3998 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_399900
     * @tc.name      : TestCase_3999
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3999(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3999 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3998: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3999 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_400000
     * @tc.name      : TestCase_4000
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4000(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4000 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            Hilog.info(0u32, "cangjietest", "", "define local variable values")
            let values = HashMap<String, ValueType>()
            Hilog.info(0u32, "cangjietest", "", "commit failed")
            rdbStore.beginTransaction()
            values.add("ID", RelaValueType.Integer(-1i64))
            values.add("NAME", RelaValueType.StringValue("Lisa"))
            rdbStore.insert("THING", values)
            rdbStore.insert("THING", values)
            rdbStore.commit()
            @Expect("assertion#3999: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4000 ends.")
    }
}
