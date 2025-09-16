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
class TestRdbStore_beginTransaction_36 {
    /*
     * @tc.number    : TestRdbStore_beginTransaction_350100
     * @tc.name      : TestCase_3501
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3501(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3501 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3500: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3501 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_350200
     * @tc.name      : TestCase_3502
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3502(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3502 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3501: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3502 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_350300
     * @tc.name      : TestCase_3503
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3503(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3503 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3502: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3503 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_350400
     * @tc.name      : TestCase_3504
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3504(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3504 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
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
            @Expect("assertion#3503: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3504 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_350500
     * @tc.name      : TestCase_3505
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3505(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3505 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3504: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3505 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_350600
     * @tc.name      : TestCase_3506
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3506(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3506 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3505: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3506 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_350700
     * @tc.name      : TestCase_3507
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3507(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3507 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3506: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3507 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_350800
     * @tc.name      : TestCase_3508
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3508(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3508 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
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
            @Expect("assertion#3507: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3508 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_350900
     * @tc.name      : TestCase_3509
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3509(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3509 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3508: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3509 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_351000
     * @tc.name      : TestCase_3510
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3510(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3510 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3509: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3510 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_351100
     * @tc.name      : TestCase_3511
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3511(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3511 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3510: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3511 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_351200
     * @tc.name      : TestCase_3512
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3512(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3512 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
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
            @Expect("assertion#3511: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3512 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_351300
     * @tc.name      : TestCase_3513
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3513(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3513 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3512: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3513 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_351400
     * @tc.name      : TestCase_3514
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3514(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3514 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3513: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3514 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_351500
     * @tc.name      : TestCase_3515
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3515(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3515 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3514: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3515 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_351600
     * @tc.name      : TestCase_3516
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3516(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3516 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
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
            @Expect("assertion#3515: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3516 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_351700
     * @tc.name      : TestCase_3517
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3517(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3517 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3516: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3517 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_351800
     * @tc.name      : TestCase_3518
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3518(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3518 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3517: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3518 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_351900
     * @tc.name      : TestCase_3519
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3519(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3519 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3518: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3519 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_352000
     * @tc.name      : TestCase_3520
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3520(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3520 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3519: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3520 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_352100
     * @tc.name      : TestCase_3521
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3521(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3521 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3520: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3521 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_352200
     * @tc.name      : TestCase_3522
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3522(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3522 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3521: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3522 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_352300
     * @tc.name      : TestCase_3523
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3523(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3523 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3522: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3523 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_352400
     * @tc.name      : TestCase_3524
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3524(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3524 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3523: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3524 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_352500
     * @tc.name      : TestCase_3525
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3525(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3525 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3524: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3525 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_352600
     * @tc.name      : TestCase_3526
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3526(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3526 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3525: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3526 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_352700
     * @tc.name      : TestCase_3527
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3527(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3527 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3526: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3527 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_352800
     * @tc.name      : TestCase_3528
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3528(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3528 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3527: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3528 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_352900
     * @tc.name      : TestCase_3529
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3529(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3529 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3528: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3529 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_353000
     * @tc.name      : TestCase_3530
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3530(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3530 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3529: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3530 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_353100
     * @tc.name      : TestCase_3531
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3531(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3531 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3530: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3531 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_353200
     * @tc.name      : TestCase_3532
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3532(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3532 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3531: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3532 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_353300
     * @tc.name      : TestCase_3533
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3533(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3533 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3532: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3533 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_353400
     * @tc.name      : TestCase_3534
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3534(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3534 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3533: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3534 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_353500
     * @tc.name      : TestCase_3535
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3535(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3535 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3534: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3535 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_353600
     * @tc.name      : TestCase_3536
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3536(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3536 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3535: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3536 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_353700
     * @tc.name      : TestCase_3537
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3537(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3537 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3536: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3537 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_353800
     * @tc.name      : TestCase_3538
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3538(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3538 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3537: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3538 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_353900
     * @tc.name      : TestCase_3539
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3539(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3539 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3538: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3539 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_354000
     * @tc.name      : TestCase_3540
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3540(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3540 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3539: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3540 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_354100
     * @tc.name      : TestCase_3541
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3541(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3541 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3540: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3541 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_354200
     * @tc.name      : TestCase_3542
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3542(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3542 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3541: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3542 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_354300
     * @tc.name      : TestCase_3543
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3543(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3543 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3542: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3543 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_354400
     * @tc.name      : TestCase_3544
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3544(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3544 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3543: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3544 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_354500
     * @tc.name      : TestCase_3545
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3545(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3545 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3544: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3545 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_354600
     * @tc.name      : TestCase_3546
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3546(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3546 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3545: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3546 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_354700
     * @tc.name      : TestCase_3547
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3547(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3547 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3546: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3547 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_354800
     * @tc.name      : TestCase_3548
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3548(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3548 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3547: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3548 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_354900
     * @tc.name      : TestCase_3549
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3549(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3549 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3548: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3549 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_355000
     * @tc.name      : TestCase_3550
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3550(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3550 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3549: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3550 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_355100
     * @tc.name      : TestCase_3551
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3551(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3551 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3550: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3551 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_355200
     * @tc.name      : TestCase_3552
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3552(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3552 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3551: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3552 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_355300
     * @tc.name      : TestCase_3553
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3553(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3553 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3552: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3553 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_355400
     * @tc.name      : TestCase_3554
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3554(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3554 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3553: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3554 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_355500
     * @tc.name      : TestCase_3555
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3555(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3555 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3554: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3555 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_355600
     * @tc.name      : TestCase_3556
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3556(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3556 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3555: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3556 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_355700
     * @tc.name      : TestCase_3557
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3557(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3557 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3556: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3557 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_355800
     * @tc.name      : TestCase_3558
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3558(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3558 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3557: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3558 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_355900
     * @tc.name      : TestCase_3559
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3559(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3559 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3558: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3559 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_356000
     * @tc.name      : TestCase_3560
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3560(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3560 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3559: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3560 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_356100
     * @tc.name      : TestCase_3561
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3561(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3561 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3560: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3561 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_356200
     * @tc.name      : TestCase_3562
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3562(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3562 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3561: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3562 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_356300
     * @tc.name      : TestCase_3563
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3563(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3563 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3562: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3563 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_356400
     * @tc.name      : TestCase_3564
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3564(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3564 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3563: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3564 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_356500
     * @tc.name      : TestCase_3565
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3565(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3565 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3564: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3565 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_356600
     * @tc.name      : TestCase_3566
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3566(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3566 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3565: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3566 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_356700
     * @tc.name      : TestCase_3567
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3567(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3567 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3566: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3567 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_356800
     * @tc.name      : TestCase_3568
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3568(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3568 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3567: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3568 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_356900
     * @tc.name      : TestCase_3569
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3569(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3569 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3568: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3569 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_357000
     * @tc.name      : TestCase_3570
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3570(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3570 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3569: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3570 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_357100
     * @tc.name      : TestCase_3571
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3571(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3571 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3570: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3571 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_357200
     * @tc.name      : TestCase_3572
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3572(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3572 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3571: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3572 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_357300
     * @tc.name      : TestCase_3573
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3573(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3573 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3572: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3573 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_357400
     * @tc.name      : TestCase_3574
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3574(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3574 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3573: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3574 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_357500
     * @tc.name      : TestCase_3575
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3575(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3575 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3574: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3575 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_357600
     * @tc.name      : TestCase_3576
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3576(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3576 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3575: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3576 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_357700
     * @tc.name      : TestCase_3577
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3577(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3577 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3576: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3577 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_357800
     * @tc.name      : TestCase_3578
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3578(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3578 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3577: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3578 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_357900
     * @tc.name      : TestCase_3579
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3579(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3579 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3578: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3579 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_358000
     * @tc.name      : TestCase_3580
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3580(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3580 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3579: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3580 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_358100
     * @tc.name      : TestCase_3581
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3581(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3581 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3580: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3581 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_358200
     * @tc.name      : TestCase_3582
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3582(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3582 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3581: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3582 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_358300
     * @tc.name      : TestCase_3583
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3583(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3583 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3582: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3583 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_358400
     * @tc.name      : TestCase_3584
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3584(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3584 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
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
            @Expect("assertion#3583: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3584 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_358500
     * @tc.name      : TestCase_3585
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3585(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3585 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3584: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3585 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_358600
     * @tc.name      : TestCase_3586
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3586(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3586 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3585: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3586 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_358700
     * @tc.name      : TestCase_3587
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3587(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3587 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#3586: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3587 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_358800
     * @tc.name      : TestCase_3588
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3588(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3588 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
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
            @Expect("assertion#3587: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3588 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_358900
     * @tc.name      : TestCase_3589
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3589(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3589 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3588: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3589 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_359000
     * @tc.name      : TestCase_3590
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3590(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3590 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3589: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3590 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_359100
     * @tc.name      : TestCase_3591
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3591(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3591 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#3590: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3591 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_359200
     * @tc.name      : TestCase_3592
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3592(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3592 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
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
            @Expect("assertion#3591: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3592 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_359300
     * @tc.name      : TestCase_3593
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3593(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3593 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3592: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3593 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_359400
     * @tc.name      : TestCase_3594
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3594(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3594 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3593: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3594 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_359500
     * @tc.name      : TestCase_3595
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3595(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3595 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#3594: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3595 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_359600
     * @tc.name      : TestCase_3596
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3596(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3596 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
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
            @Expect("assertion#3595: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3596 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_359700
     * @tc.name      : TestCase_3597
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3597(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3597 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3596: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3597 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_359800
     * @tc.name      : TestCase_3598
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3598(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3598 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3597: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3598 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_359900
     * @tc.name      : TestCase_3599
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3599(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3599 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#3598: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3599 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_360000
     * @tc.name      : TestCase_3600
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3600(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3600 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: true,
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
            @Expect("assertion#3599: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3600 ends.")
    }
}
