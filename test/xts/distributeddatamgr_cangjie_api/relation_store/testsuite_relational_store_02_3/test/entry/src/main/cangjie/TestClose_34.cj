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
class TestClose_34 {
    /*
     * @tc.number    : Test_Close_330100
     * @tc.name      : TestCase_3301
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3301(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3301 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3301 ends.")
    }

    /*
     * @tc.number    : Test_Close_330200
     * @tc.name      : TestCase_3302
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3302(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3302 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3302 ends.")
    }

    /*
     * @tc.number    : Test_Close_330300
     * @tc.name      : TestCase_3303
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3303(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3303 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3303 ends.")
    }

    /*
     * @tc.number    : Test_Close_330400
     * @tc.name      : TestCase_3304
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3304(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3304 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3304 ends.")
    }

    /*
     * @tc.number    : Test_Close_330500
     * @tc.name      : TestCase_3305
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3305(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3305 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3305 ends.")
    }

    /*
     * @tc.number    : Test_Close_330600
     * @tc.name      : TestCase_3306
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3306(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3306 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3306 ends.")
    }

    /*
     * @tc.number    : Test_Close_330700
     * @tc.name      : TestCase_3307
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3307(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3307 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3307 ends.")
    }

    /*
     * @tc.number    : Test_Close_330800
     * @tc.name      : TestCase_3308
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3308(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3308 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3308 ends.")
    }

    /*
     * @tc.number    : Test_Close_330900
     * @tc.name      : TestCase_3309
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3309(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3309 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3309 ends.")
    }

    /*
     * @tc.number    : Test_Close_331000
     * @tc.name      : TestCase_3310
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3310(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3310 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3310 ends.")
    }

    /*
     * @tc.number    : Test_Close_331100
     * @tc.name      : TestCase_3311
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3311(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3311 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3311 ends.")
    }

    /*
     * @tc.number    : Test_Close_331200
     * @tc.name      : TestCase_3312
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3312(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3312 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3312 ends.")
    }

    /*
     * @tc.number    : Test_Close_331300
     * @tc.name      : TestCase_3313
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3313(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3313 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3313 ends.")
    }

    /*
     * @tc.number    : Test_Close_331400
     * @tc.name      : TestCase_3314
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3314(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3314 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3314 ends.")
    }

    /*
     * @tc.number    : Test_Close_331500
     * @tc.name      : TestCase_3315
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3315(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3315 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3315 ends.")
    }

    /*
     * @tc.number    : Test_Close_331600
     * @tc.name      : TestCase_3316
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3316(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3316 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3316 ends.")
    }

    /*
     * @tc.number    : Test_Close_331700
     * @tc.name      : TestCase_3317
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3317(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3317 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3317 ends.")
    }

    /*
     * @tc.number    : Test_Close_331800
     * @tc.name      : TestCase_3318
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3318(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3318 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3318 ends.")
    }

    /*
     * @tc.number    : Test_Close_331900
     * @tc.name      : TestCase_3319
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3319(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3319 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3319 ends.")
    }

    /*
     * @tc.number    : Test_Close_332000
     * @tc.name      : TestCase_3320
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3320(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3320 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3320 ends.")
    }

    /*
     * @tc.number    : Test_Close_332100
     * @tc.name      : TestCase_3321
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3321(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3321 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3321 ends.")
    }

    /*
     * @tc.number    : Test_Close_332200
     * @tc.name      : TestCase_3322
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3322(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3322 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3322 ends.")
    }

    /*
     * @tc.number    : Test_Close_332300
     * @tc.name      : TestCase_3323
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3323(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3323 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3323 ends.")
    }

    /*
     * @tc.number    : Test_Close_332400
     * @tc.name      : TestCase_3324
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3324(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3324 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3324 ends.")
    }

    /*
     * @tc.number    : Test_Close_332500
     * @tc.name      : TestCase_3325
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3325(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3325 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3325 ends.")
    }

    /*
     * @tc.number    : Test_Close_332600
     * @tc.name      : TestCase_3326
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3326(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3326 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3326 ends.")
    }

    /*
     * @tc.number    : Test_Close_332700
     * @tc.name      : TestCase_3327
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3327(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3327 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3327 ends.")
    }

    /*
     * @tc.number    : Test_Close_332800
     * @tc.name      : TestCase_3328
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3328(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3328 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3328 ends.")
    }

    /*
     * @tc.number    : Test_Close_332900
     * @tc.name      : TestCase_3329
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3329(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3329 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3329 ends.")
    }

    /*
     * @tc.number    : Test_Close_333000
     * @tc.name      : TestCase_3330
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3330(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3330 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3330 ends.")
    }

    /*
     * @tc.number    : Test_Close_333100
     * @tc.name      : TestCase_3331
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3331(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3331 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3331 ends.")
    }

    /*
     * @tc.number    : Test_Close_333200
     * @tc.name      : TestCase_3332
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3332(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3332 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3332 ends.")
    }

    /*
     * @tc.number    : Test_Close_333300
     * @tc.name      : TestCase_3333
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3333(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3333 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3333 ends.")
    }

    /*
     * @tc.number    : Test_Close_333400
     * @tc.name      : TestCase_3334
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3334(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3334 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3334 ends.")
    }

    /*
     * @tc.number    : Test_Close_333500
     * @tc.name      : TestCase_3335
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3335(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3335 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3335 ends.")
    }

    /*
     * @tc.number    : Test_Close_333600
     * @tc.name      : TestCase_3336
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3336(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3336 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3336 ends.")
    }

    /*
     * @tc.number    : Test_Close_333700
     * @tc.name      : TestCase_3337
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3337(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3337 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3337 ends.")
    }

    /*
     * @tc.number    : Test_Close_333800
     * @tc.name      : TestCase_3338
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3338(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3338 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3338 ends.")
    }

    /*
     * @tc.number    : Test_Close_333900
     * @tc.name      : TestCase_3339
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3339(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3339 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3339 ends.")
    }

    /*
     * @tc.number    : Test_Close_334000
     * @tc.name      : TestCase_3340
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3340(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3340 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3340 ends.")
    }

    /*
     * @tc.number    : Test_Close_334100
     * @tc.name      : TestCase_3341
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3341(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3341 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3341 ends.")
    }

    /*
     * @tc.number    : Test_Close_334200
     * @tc.name      : TestCase_3342
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3342(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3342 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3342 ends.")
    }

    /*
     * @tc.number    : Test_Close_334300
     * @tc.name      : TestCase_3343
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3343(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3343 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3343 ends.")
    }

    /*
     * @tc.number    : Test_Close_334400
     * @tc.name      : TestCase_3344
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3344(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3344 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3344 ends.")
    }

    /*
     * @tc.number    : Test_Close_334500
     * @tc.name      : TestCase_3345
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3345(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3345 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3345 ends.")
    }

    /*
     * @tc.number    : Test_Close_334600
     * @tc.name      : TestCase_3346
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3346(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3346 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3346 ends.")
    }

    /*
     * @tc.number    : Test_Close_334700
     * @tc.name      : TestCase_3347
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3347(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3347 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3347 ends.")
    }

    /*
     * @tc.number    : Test_Close_334800
     * @tc.name      : TestCase_3348
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3348(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3348 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3348 ends.")
    }

    /*
     * @tc.number    : Test_Close_334900
     * @tc.name      : TestCase_3349
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3349(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3349 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3349 ends.")
    }

    /*
     * @tc.number    : Test_Close_335000
     * @tc.name      : TestCase_3350
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3350(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3350 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3350 ends.")
    }

    /*
     * @tc.number    : Test_Close_335100
     * @tc.name      : TestCase_3351
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3351(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3351 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3351 ends.")
    }

    /*
     * @tc.number    : Test_Close_335200
     * @tc.name      : TestCase_3352
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3352(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3352 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3352 ends.")
    }

    /*
     * @tc.number    : Test_Close_335300
     * @tc.name      : TestCase_3353
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3353(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3353 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3353 ends.")
    }

    /*
     * @tc.number    : Test_Close_335400
     * @tc.name      : TestCase_3354
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3354(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3354 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3354 ends.")
    }

    /*
     * @tc.number    : Test_Close_335500
     * @tc.name      : TestCase_3355
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3355(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3355 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3355 ends.")
    }

    /*
     * @tc.number    : Test_Close_335600
     * @tc.name      : TestCase_3356
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3356(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3356 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3356 ends.")
    }

    /*
     * @tc.number    : Test_Close_335700
     * @tc.name      : TestCase_3357
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3357(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3357 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3357 ends.")
    }

    /*
     * @tc.number    : Test_Close_335800
     * @tc.name      : TestCase_3358
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3358(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3358 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3358 ends.")
    }

    /*
     * @tc.number    : Test_Close_335900
     * @tc.name      : TestCase_3359
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3359(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3359 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3359 ends.")
    }

    /*
     * @tc.number    : Test_Close_336000
     * @tc.name      : TestCase_3360
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3360(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3360 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3360 ends.")
    }

    /*
     * @tc.number    : Test_Close_336100
     * @tc.name      : TestCase_3361
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3361(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3361 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3361 ends.")
    }

    /*
     * @tc.number    : Test_Close_336200
     * @tc.name      : TestCase_3362
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3362(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3362 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3362 ends.")
    }

    /*
     * @tc.number    : Test_Close_336300
     * @tc.name      : TestCase_3363
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3363(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3363 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3363 ends.")
    }

    /*
     * @tc.number    : Test_Close_336400
     * @tc.name      : TestCase_3364
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3364(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3364 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3364 ends.")
    }

    /*
     * @tc.number    : Test_Close_336500
     * @tc.name      : TestCase_3365
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3365(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3365 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3365 ends.")
    }

    /*
     * @tc.number    : Test_Close_336600
     * @tc.name      : TestCase_3366
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3366(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3366 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3366 ends.")
    }

    /*
     * @tc.number    : Test_Close_336700
     * @tc.name      : TestCase_3367
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3367(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3367 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3367 ends.")
    }

    /*
     * @tc.number    : Test_Close_336800
     * @tc.name      : TestCase_3368
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3368(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3368 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3368 ends.")
    }

    /*
     * @tc.number    : Test_Close_336900
     * @tc.name      : TestCase_3369
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3369(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3369 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3369 ends.")
    }

    /*
     * @tc.number    : Test_Close_337000
     * @tc.name      : TestCase_3370
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3370(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3370 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3370 ends.")
    }

    /*
     * @tc.number    : Test_Close_337100
     * @tc.name      : TestCase_3371
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3371(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3371 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3371 ends.")
    }

    /*
     * @tc.number    : Test_Close_337200
     * @tc.name      : TestCase_3372
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3372(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3372 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3372 ends.")
    }

    /*
     * @tc.number    : Test_Close_337300
     * @tc.name      : TestCase_3373
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3373(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3373 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3373 ends.")
    }

    /*
     * @tc.number    : Test_Close_337400
     * @tc.name      : TestCase_3374
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3374(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3374 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3374 ends.")
    }

    /*
     * @tc.number    : Test_Close_337500
     * @tc.name      : TestCase_3375
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3375(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3375 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3375 ends.")
    }

    /*
     * @tc.number    : Test_Close_337600
     * @tc.name      : TestCase_3376
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3376(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3376 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3376 ends.")
    }

    /*
     * @tc.number    : Test_Close_337700
     * @tc.name      : TestCase_3377
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3377(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3377 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3377 ends.")
    }

    /*
     * @tc.number    : Test_Close_337800
     * @tc.name      : TestCase_3378
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3378(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3378 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3378 ends.")
    }

    /*
     * @tc.number    : Test_Close_337900
     * @tc.name      : TestCase_3379
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3379(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3379 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3379 ends.")
    }

    /*
     * @tc.number    : Test_Close_338000
     * @tc.name      : TestCase_3380
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3380(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3380 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3380 ends.")
    }

    /*
     * @tc.number    : Test_Close_338100
     * @tc.name      : TestCase_3381
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3381(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3381 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3381 ends.")
    }

    /*
     * @tc.number    : Test_Close_338200
     * @tc.name      : TestCase_3382
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3382(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3382 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3382 ends.")
    }

    /*
     * @tc.number    : Test_Close_338300
     * @tc.name      : TestCase_3383
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3383(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3383 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3383 ends.")
    }

    /*
     * @tc.number    : Test_Close_338400
     * @tc.name      : TestCase_3384
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3384(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3384 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3384 ends.")
    }

    /*
     * @tc.number    : Test_Close_338500
     * @tc.name      : TestCase_3385
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3385(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3385 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3385 ends.")
    }

    /*
     * @tc.number    : Test_Close_338600
     * @tc.name      : TestCase_3386
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3386(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3386 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3386 ends.")
    }

    /*
     * @tc.number    : Test_Close_338700
     * @tc.name      : TestCase_3387
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3387(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3387 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3387 ends.")
    }

    /*
     * @tc.number    : Test_Close_338800
     * @tc.name      : TestCase_3388
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3388(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3388 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3388 ends.")
    }

    /*
     * @tc.number    : Test_Close_338900
     * @tc.name      : TestCase_3389
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3389(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3389 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3389 ends.")
    }

    /*
     * @tc.number    : Test_Close_339000
     * @tc.name      : TestCase_3390
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3390(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3390 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3390 ends.")
    }

    /*
     * @tc.number    : Test_Close_339100
     * @tc.name      : TestCase_3391
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3391(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3391 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3391 ends.")
    }

    /*
     * @tc.number    : Test_Close_339200
     * @tc.name      : TestCase_3392
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3392(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3392 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3392 ends.")
    }

    /*
     * @tc.number    : Test_Close_339300
     * @tc.name      : TestCase_3393
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3393(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3393 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3393 ends.")
    }

    /*
     * @tc.number    : Test_Close_339400
     * @tc.name      : TestCase_3394
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3394(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3394 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3394 ends.")
    }

    /*
     * @tc.number    : Test_Close_339500
     * @tc.name      : TestCase_3395
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3395(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3395 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3395 ends.")
    }

    /*
     * @tc.number    : Test_Close_339600
     * @tc.name      : TestCase_3396
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3396(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3396 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3396 ends.")
    }

    /*
     * @tc.number    : Test_Close_339700
     * @tc.name      : TestCase_3397
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3397(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3397 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3397 ends.")
    }

    /*
     * @tc.number    : Test_Close_339800
     * @tc.name      : TestCase_3398
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3398(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3398 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3398 ends.")
    }

    /*
     * @tc.number    : Test_Close_339900
     * @tc.name      : TestCase_3399
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3399(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3399 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3399 ends.")
    }

    /*
     * @tc.number    : Test_Close_340000
     * @tc.name      : TestCase_3400
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3400(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3400 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: true, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3400 ends.")
    }
}
