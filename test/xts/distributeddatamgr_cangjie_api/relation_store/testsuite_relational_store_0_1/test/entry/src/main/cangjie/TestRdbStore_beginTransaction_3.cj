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
class TestRdbStore_beginTransaction_3 {
    /*
     * @tc.number    : TestRdbStore_beginTransaction_20100
     * @tc.name      : TestCase_201
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_201(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_201 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#200: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_201 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_20200
     * @tc.name      : TestCase_202
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_202(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_202 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#201: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_202 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_20300
     * @tc.name      : TestCase_203
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_203(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_203 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#202: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_203 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_20400
     * @tc.name      : TestCase_204
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_204(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_204 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
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
            @Expect("assertion#203: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_204 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_20500
     * @tc.name      : TestCase_205
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_205(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_205 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#204: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_205 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_20600
     * @tc.name      : TestCase_206
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_206(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_206 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#205: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_206 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_20700
     * @tc.name      : TestCase_207
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_207(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_207 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#206: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_207 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_20800
     * @tc.name      : TestCase_208
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_208(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_208 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
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
            @Expect("assertion#207: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_208 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_20900
     * @tc.name      : TestCase_209
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_209(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_209 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#208: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_209 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_21000
     * @tc.name      : TestCase_210
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_210(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_210 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#209: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_210 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_21100
     * @tc.name      : TestCase_211
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_211(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_211 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#210: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_211 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_21200
     * @tc.name      : TestCase_212
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_212(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_212 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
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
            @Expect("assertion#211: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_212 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_21300
     * @tc.name      : TestCase_213
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_213(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_213 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#212: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_213 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_21400
     * @tc.name      : TestCase_214
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_214(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_214 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#213: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_214 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_21500
     * @tc.name      : TestCase_215
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_215(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_215 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#214: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_215 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_21600
     * @tc.name      : TestCase_216
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_216(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_216 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
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
            @Expect("assertion#215: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_216 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_21700
     * @tc.name      : TestCase_217
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_217(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_217 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#216: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_217 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_21800
     * @tc.name      : TestCase_218
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_218(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_218 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#217: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_218 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_21900
     * @tc.name      : TestCase_219
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_219(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_219 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#218: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_219 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_22000
     * @tc.name      : TestCase_220
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_220(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_220 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
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
            @Expect("assertion#219: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_220 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_22100
     * @tc.name      : TestCase_221
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_221(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_221 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#220: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_221 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_22200
     * @tc.name      : TestCase_222
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_222(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_222 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#221: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_222 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_22300
     * @tc.name      : TestCase_223
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_223(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_223 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#222: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_223 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_22400
     * @tc.name      : TestCase_224
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_224(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_224 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
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
            @Expect("assertion#223: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_224 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_22500
     * @tc.name      : TestCase_225
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_225(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_225 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#224: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_225 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_22600
     * @tc.name      : TestCase_226
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_226(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_226 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#225: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_226 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_22700
     * @tc.name      : TestCase_227
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_227(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_227 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#226: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_227 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_22800
     * @tc.name      : TestCase_228
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_228(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_228 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
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
            @Expect("assertion#227: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_228 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_22900
     * @tc.name      : TestCase_229
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_229(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_229 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#228: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_229 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_23000
     * @tc.name      : TestCase_230
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_230(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_230 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#229: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_230 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_23100
     * @tc.name      : TestCase_231
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_231(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_231 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#230: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_231 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_23200
     * @tc.name      : TestCase_232
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_232(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_232 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
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
            @Expect("assertion#231: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_232 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_23300
     * @tc.name      : TestCase_233
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_233(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_233 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#232: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_233 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_23400
     * @tc.name      : TestCase_234
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_234(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_234 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#233: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_234 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_23500
     * @tc.name      : TestCase_235
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_235(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_235 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#234: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_235 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_23600
     * @tc.name      : TestCase_236
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_236(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_236 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
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
            @Expect("assertion#235: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_236 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_23700
     * @tc.name      : TestCase_237
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_237(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_237 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#236: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_237 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_23800
     * @tc.name      : TestCase_238
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_238(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_238 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#237: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_238 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_23900
     * @tc.name      : TestCase_239
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_239(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_239 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#238: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_239 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_24000
     * @tc.name      : TestCase_240
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_240(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_240 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
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
            @Expect("assertion#239: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_240 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_24100
     * @tc.name      : TestCase_241
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_241(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_241 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#240: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_241 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_24200
     * @tc.name      : TestCase_242
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_242(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_242 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#241: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_242 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_24300
     * @tc.name      : TestCase_243
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_243(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_243 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#242: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_243 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_24400
     * @tc.name      : TestCase_244
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_244(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_244 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
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
            @Expect("assertion#243: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_244 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_24500
     * @tc.name      : TestCase_245
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_245(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_245 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#244: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_245 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_24600
     * @tc.name      : TestCase_246
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_246(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_246 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#245: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_246 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_24700
     * @tc.name      : TestCase_247
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_247(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_247 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#246: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_247 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_24800
     * @tc.name      : TestCase_248
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_248(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_248 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
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
            @Expect("assertion#247: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_248 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_24900
     * @tc.name      : TestCase_249
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_249(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_249 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#248: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_249 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_25000
     * @tc.name      : TestCase_250
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_250(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_250 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#249: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_250 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_25100
     * @tc.name      : TestCase_251
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_251(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_251 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#250: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_251 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_25200
     * @tc.name      : TestCase_252
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_252(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_252 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
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
            @Expect("assertion#251: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_252 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_25300
     * @tc.name      : TestCase_253
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_253(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_253 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#252: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_253 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_25400
     * @tc.name      : TestCase_254
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_254(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_254 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#253: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_254 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_25500
     * @tc.name      : TestCase_255
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_255(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_255 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#254: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_255 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_25600
     * @tc.name      : TestCase_256
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_256(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_256 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                    isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: false,
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
            @Expect("assertion#255: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_256 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_25700
     * @tc.name      : TestCase_257
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_257(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_257 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#256: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_257 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_25800
     * @tc.name      : TestCase_258
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_258(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_258 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#257: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_258 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_25900
     * @tc.name      : TestCase_259
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_259(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_259 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#258: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_259 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_26000
     * @tc.name      : TestCase_260
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_260(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_260 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
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
            @Expect("assertion#259: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_260 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_26100
     * @tc.name      : TestCase_261
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_261(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_261 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#260: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_261 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_26200
     * @tc.name      : TestCase_262
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_262(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_262 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#261: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_262 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_26300
     * @tc.name      : TestCase_263
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_263(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_263 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#262: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_263 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_26400
     * @tc.name      : TestCase_264
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_264(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_264 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
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
            @Expect("assertion#263: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_264 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_26500
     * @tc.name      : TestCase_265
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_265(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_265 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#264: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_265 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_26600
     * @tc.name      : TestCase_266
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_266(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_266 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#265: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_266 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_26700
     * @tc.name      : TestCase_267
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_267(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_267 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#266: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_267 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_26800
     * @tc.name      : TestCase_268
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_268(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_268 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
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
            @Expect("assertion#267: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_268 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_26900
     * @tc.name      : TestCase_269
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_269(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_269 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#268: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_269 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_27000
     * @tc.name      : TestCase_270
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_270(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_270 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#269: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_270 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_27100
     * @tc.name      : TestCase_271
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_271(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_271 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#270: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_271 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_27200
     * @tc.name      : TestCase_272
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_272(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_272 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
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
            @Expect("assertion#271: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_272 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_27300
     * @tc.name      : TestCase_273
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_273(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_273 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#272: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_273 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_27400
     * @tc.name      : TestCase_274
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_274(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_274 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#273: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_274 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_27500
     * @tc.name      : TestCase_275
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_275(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_275 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#274: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_275 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_27600
     * @tc.name      : TestCase_276
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_276(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_276 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
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
            @Expect("assertion#275: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_276 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_27700
     * @tc.name      : TestCase_277
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_277(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_277 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#276: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_277 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_27800
     * @tc.name      : TestCase_278
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_278(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_278 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#277: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_278 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_27900
     * @tc.name      : TestCase_279
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_279(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_279 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#278: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_279 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_28000
     * @tc.name      : TestCase_280
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_280(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_280 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
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
            @Expect("assertion#279: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_280 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_28100
     * @tc.name      : TestCase_281
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_281(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_281 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#280: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_281 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_28200
     * @tc.name      : TestCase_282
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_282(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_282 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#281: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_282 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_28300
     * @tc.name      : TestCase_283
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_283(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_283 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#282: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_283 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_28400
     * @tc.name      : TestCase_284
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_284(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_284 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
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
            @Expect("assertion#283: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_284 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_28500
     * @tc.name      : TestCase_285
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_285(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_285 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#284: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_285 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_28600
     * @tc.name      : TestCase_286
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_286(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_286 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#285: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_286 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_28700
     * @tc.name      : TestCase_287
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_287(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_287 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
            @Expect("assertion#286: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_287 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_28800
     * @tc.name      : TestCase_288
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_288(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_288 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
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
            @Expect("assertion#287: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_288 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_28900
     * @tc.name      : TestCase_289
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_289(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_289 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#288: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_289 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_29000
     * @tc.name      : TestCase_290
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_290(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_290 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#289: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_290 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_29100
     * @tc.name      : TestCase_291
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_291(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_291 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
            @Expect("assertion#290: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_291 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_29200
     * @tc.name      : TestCase_292
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_292(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_292 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
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
            @Expect("assertion#291: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_292 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_29300
     * @tc.name      : TestCase_293
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_293(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_293 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#292: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_293 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_29400
     * @tc.name      : TestCase_294
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_294(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_294 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#293: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_294 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_29500
     * @tc.name      : TestCase_295
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_295(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_295 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
            @Expect("assertion#294: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_295 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_29600
     * @tc.name      : TestCase_296
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_296(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_296 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
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
            @Expect("assertion#295: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_296 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_29700
     * @tc.name      : TestCase_297
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_297(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_297 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#296: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_297 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_29800
     * @tc.name      : TestCase_298
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_298(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_298 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#297: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_298 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_29900
     * @tc.name      : TestCase_299
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_299(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_299 begins.")
        Hilog.info(0u32, "cangjietest", "", "testisColumnNull the result set failed")
        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
                    isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                    tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
            @Expect("assertion#298: not throw", "testisColumnNull the result set failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_299 ends.")
    }

    /*
     * @tc.number    : TestRdbStore_beginTransaction_30000
     * @tc.name      : TestCase_300
     * @tc.desc      : "Lisa" Begin a transaction before executing the SQL statement. This interface does not support usage in multi-process or multi-threaded environments.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_300(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_300 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")

        try {
            let rdbStore = getRdbStore(getAbilityContext(),
                StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: true, dataGroupId: "valid createTime",
                    customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: true,
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
            @Expect("assertion#299: not throw", "commit failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_300 ends.")
    }
}
