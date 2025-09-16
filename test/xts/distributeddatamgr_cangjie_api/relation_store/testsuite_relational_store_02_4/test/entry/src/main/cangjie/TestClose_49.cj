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
class TestClose_49 {
    /*
     * @tc.number    : Test_Close_480100
     * @tc.name      : TestCase_4801
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4801(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4801 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4801 ends.")
    }

    /*
     * @tc.number    : Test_Close_480200
     * @tc.name      : TestCase_4802
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4802(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4802 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4802 ends.")
    }

    /*
     * @tc.number    : Test_Close_480300
     * @tc.name      : TestCase_4803
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4803(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4803 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4803 ends.")
    }

    /*
     * @tc.number    : Test_Close_480400
     * @tc.name      : TestCase_4804
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4804(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4804 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4804 ends.")
    }

    /*
     * @tc.number    : Test_Close_480500
     * @tc.name      : TestCase_4805
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4805(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4805 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4805 ends.")
    }

    /*
     * @tc.number    : Test_Close_480600
     * @tc.name      : TestCase_4806
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4806(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4806 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4806 ends.")
    }

    /*
     * @tc.number    : Test_Close_480700
     * @tc.name      : TestCase_4807
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4807(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4807 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4807 ends.")
    }

    /*
     * @tc.number    : Test_Close_480800
     * @tc.name      : TestCase_4808
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4808(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4808 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4808 ends.")
    }

    /*
     * @tc.number    : Test_Close_480900
     * @tc.name      : TestCase_4809
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4809(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4809 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4809 ends.")
    }

    /*
     * @tc.number    : Test_Close_481000
     * @tc.name      : TestCase_4810
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4810(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4810 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4810 ends.")
    }

    /*
     * @tc.number    : Test_Close_481100
     * @tc.name      : TestCase_4811
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4811(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4811 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4811 ends.")
    }

    /*
     * @tc.number    : Test_Close_481200
     * @tc.name      : TestCase_4812
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4812(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4812 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4812 ends.")
    }

    /*
     * @tc.number    : Test_Close_481300
     * @tc.name      : TestCase_4813
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4813(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4813 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4813 ends.")
    }

    /*
     * @tc.number    : Test_Close_481400
     * @tc.name      : TestCase_4814
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4814(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4814 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4814 ends.")
    }

    /*
     * @tc.number    : Test_Close_481500
     * @tc.name      : TestCase_4815
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4815(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4815 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4815 ends.")
    }

    /*
     * @tc.number    : Test_Close_481600
     * @tc.name      : TestCase_4816
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4816(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4816 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4816 ends.")
    }

    /*
     * @tc.number    : Test_Close_481700
     * @tc.name      : TestCase_4817
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4817(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4817 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4817 ends.")
    }

    /*
     * @tc.number    : Test_Close_481800
     * @tc.name      : TestCase_4818
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4818(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4818 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4818 ends.")
    }

    /*
     * @tc.number    : Test_Close_481900
     * @tc.name      : TestCase_4819
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4819(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4819 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4819 ends.")
    }

    /*
     * @tc.number    : Test_Close_482000
     * @tc.name      : TestCase_4820
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4820(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4820 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4820 ends.")
    }

    /*
     * @tc.number    : Test_Close_482100
     * @tc.name      : TestCase_4821
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4821(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4821 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4821 ends.")
    }

    /*
     * @tc.number    : Test_Close_482200
     * @tc.name      : TestCase_4822
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4822(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4822 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4822 ends.")
    }

    /*
     * @tc.number    : Test_Close_482300
     * @tc.name      : TestCase_4823
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4823(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4823 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4823 ends.")
    }

    /*
     * @tc.number    : Test_Close_482400
     * @tc.name      : TestCase_4824
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4824(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4824 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4824 ends.")
    }

    /*
     * @tc.number    : Test_Close_482500
     * @tc.name      : TestCase_4825
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4825(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4825 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4825 ends.")
    }

    /*
     * @tc.number    : Test_Close_482600
     * @tc.name      : TestCase_4826
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4826(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4826 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4826 ends.")
    }

    /*
     * @tc.number    : Test_Close_482700
     * @tc.name      : TestCase_4827
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4827(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4827 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4827 ends.")
    }

    /*
     * @tc.number    : Test_Close_482800
     * @tc.name      : TestCase_4828
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4828(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4828 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4828 ends.")
    }

    /*
     * @tc.number    : Test_Close_482900
     * @tc.name      : TestCase_4829
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4829(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4829 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4829 ends.")
    }

    /*
     * @tc.number    : Test_Close_483000
     * @tc.name      : TestCase_4830
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4830(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4830 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4830 ends.")
    }

    /*
     * @tc.number    : Test_Close_483100
     * @tc.name      : TestCase_4831
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4831(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4831 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4831 ends.")
    }

    /*
     * @tc.number    : Test_Close_483200
     * @tc.name      : TestCase_4832
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4832(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4832 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4832 ends.")
    }

    /*
     * @tc.number    : Test_Close_483300
     * @tc.name      : TestCase_4833
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4833(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4833 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4833 ends.")
    }

    /*
     * @tc.number    : Test_Close_483400
     * @tc.name      : TestCase_4834
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4834(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4834 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4834 ends.")
    }

    /*
     * @tc.number    : Test_Close_483500
     * @tc.name      : TestCase_4835
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4835(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4835 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4835 ends.")
    }

    /*
     * @tc.number    : Test_Close_483600
     * @tc.name      : TestCase_4836
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4836(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4836 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4836 ends.")
    }

    /*
     * @tc.number    : Test_Close_483700
     * @tc.name      : TestCase_4837
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4837(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4837 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4837 ends.")
    }

    /*
     * @tc.number    : Test_Close_483800
     * @tc.name      : TestCase_4838
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4838(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4838 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4838 ends.")
    }

    /*
     * @tc.number    : Test_Close_483900
     * @tc.name      : TestCase_4839
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4839(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4839 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4839 ends.")
    }

    /*
     * @tc.number    : Test_Close_484000
     * @tc.name      : TestCase_4840
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4840(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4840 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4840 ends.")
    }

    /*
     * @tc.number    : Test_Close_484100
     * @tc.name      : TestCase_4841
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4841(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4841 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4841 ends.")
    }

    /*
     * @tc.number    : Test_Close_484200
     * @tc.name      : TestCase_4842
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4842(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4842 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4842 ends.")
    }

    /*
     * @tc.number    : Test_Close_484300
     * @tc.name      : TestCase_4843
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4843(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4843 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4843 ends.")
    }

    /*
     * @tc.number    : Test_Close_484400
     * @tc.name      : TestCase_4844
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4844(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4844 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4844 ends.")
    }

    /*
     * @tc.number    : Test_Close_484500
     * @tc.name      : TestCase_4845
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4845(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4845 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4845 ends.")
    }

    /*
     * @tc.number    : Test_Close_484600
     * @tc.name      : TestCase_4846
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4846(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4846 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4846 ends.")
    }

    /*
     * @tc.number    : Test_Close_484700
     * @tc.name      : TestCase_4847
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4847(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4847 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4847 ends.")
    }

    /*
     * @tc.number    : Test_Close_484800
     * @tc.name      : TestCase_4848
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4848(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4848 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4848 ends.")
    }

    /*
     * @tc.number    : Test_Close_484900
     * @tc.name      : TestCase_4849
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4849(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4849 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4849 ends.")
    }

    /*
     * @tc.number    : Test_Close_485000
     * @tc.name      : TestCase_4850
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4850(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4850 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4850 ends.")
    }

    /*
     * @tc.number    : Test_Close_485100
     * @tc.name      : TestCase_4851
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4851(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4851 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4851 ends.")
    }

    /*
     * @tc.number    : Test_Close_485200
     * @tc.name      : TestCase_4852
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4852(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4852 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4852 ends.")
    }

    /*
     * @tc.number    : Test_Close_485300
     * @tc.name      : TestCase_4853
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4853(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4853 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4853 ends.")
    }

    /*
     * @tc.number    : Test_Close_485400
     * @tc.name      : TestCase_4854
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4854(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4854 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4854 ends.")
    }

    /*
     * @tc.number    : Test_Close_485500
     * @tc.name      : TestCase_4855
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4855(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4855 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4855 ends.")
    }

    /*
     * @tc.number    : Test_Close_485600
     * @tc.name      : TestCase_4856
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4856(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4856 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4856 ends.")
    }

    /*
     * @tc.number    : Test_Close_485700
     * @tc.name      : TestCase_4857
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4857(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4857 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4857 ends.")
    }

    /*
     * @tc.number    : Test_Close_485800
     * @tc.name      : TestCase_4858
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4858(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4858 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4858 ends.")
    }

    /*
     * @tc.number    : Test_Close_485900
     * @tc.name      : TestCase_4859
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4859(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4859 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4859 ends.")
    }

    /*
     * @tc.number    : Test_Close_486000
     * @tc.name      : TestCase_4860
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4860(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4860 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4860 ends.")
    }

    /*
     * @tc.number    : Test_Close_486100
     * @tc.name      : TestCase_4861
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4861(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4861 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4861 ends.")
    }

    /*
     * @tc.number    : Test_Close_486200
     * @tc.name      : TestCase_4862
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4862(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4862 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4862 ends.")
    }

    /*
     * @tc.number    : Test_Close_486300
     * @tc.name      : TestCase_4863
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4863(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4863 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4863 ends.")
    }

    /*
     * @tc.number    : Test_Close_486400
     * @tc.name      : TestCase_4864
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4864(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4864 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4864 ends.")
    }

    /*
     * @tc.number    : Test_Close_486500
     * @tc.name      : TestCase_4865
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4865(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4865 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4865 ends.")
    }

    /*
     * @tc.number    : Test_Close_486600
     * @tc.name      : TestCase_4866
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4866(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4866 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4866 ends.")
    }

    /*
     * @tc.number    : Test_Close_486700
     * @tc.name      : TestCase_4867
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4867(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4867 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4867 ends.")
    }

    /*
     * @tc.number    : Test_Close_486800
     * @tc.name      : TestCase_4868
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4868(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4868 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4868 ends.")
    }

    /*
     * @tc.number    : Test_Close_486900
     * @tc.name      : TestCase_4869
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4869(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4869 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4869 ends.")
    }

    /*
     * @tc.number    : Test_Close_487000
     * @tc.name      : TestCase_4870
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4870(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4870 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4870 ends.")
    }

    /*
     * @tc.number    : Test_Close_487100
     * @tc.name      : TestCase_4871
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4871(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4871 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4871 ends.")
    }

    /*
     * @tc.number    : Test_Close_487200
     * @tc.name      : TestCase_4872
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4872(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4872 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4872 ends.")
    }

    /*
     * @tc.number    : Test_Close_487300
     * @tc.name      : TestCase_4873
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4873(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4873 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4873 ends.")
    }

    /*
     * @tc.number    : Test_Close_487400
     * @tc.name      : TestCase_4874
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4874(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4874 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4874 ends.")
    }

    /*
     * @tc.number    : Test_Close_487500
     * @tc.name      : TestCase_4875
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4875(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4875 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4875 ends.")
    }

    /*
     * @tc.number    : Test_Close_487600
     * @tc.name      : TestCase_4876
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4876(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4876 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4876 ends.")
    }

    /*
     * @tc.number    : Test_Close_487700
     * @tc.name      : TestCase_4877
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4877(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4877 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4877 ends.")
    }

    /*
     * @tc.number    : Test_Close_487800
     * @tc.name      : TestCase_4878
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4878(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4878 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4878 ends.")
    }

    /*
     * @tc.number    : Test_Close_487900
     * @tc.name      : TestCase_4879
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4879(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4879 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4879 ends.")
    }

    /*
     * @tc.number    : Test_Close_488000
     * @tc.name      : TestCase_4880
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4880(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4880 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4880 ends.")
    }

    /*
     * @tc.number    : Test_Close_488100
     * @tc.name      : TestCase_4881
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4881(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4881 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4881 ends.")
    }

    /*
     * @tc.number    : Test_Close_488200
     * @tc.name      : TestCase_4882
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4882(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4882 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4882 ends.")
    }

    /*
     * @tc.number    : Test_Close_488300
     * @tc.name      : TestCase_4883
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4883(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4883 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4883 ends.")
    }

    /*
     * @tc.number    : Test_Close_488400
     * @tc.name      : TestCase_4884
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4884(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4884 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4884 ends.")
    }

    /*
     * @tc.number    : Test_Close_488500
     * @tc.name      : TestCase_4885
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4885(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4885 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4885 ends.")
    }

    /*
     * @tc.number    : Test_Close_488600
     * @tc.name      : TestCase_4886
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4886(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4886 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4886 ends.")
    }

    /*
     * @tc.number    : Test_Close_488700
     * @tc.name      : TestCase_4887
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4887(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4887 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4887 ends.")
    }

    /*
     * @tc.number    : Test_Close_488800
     * @tc.name      : TestCase_4888
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4888(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4888 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4888 ends.")
    }

    /*
     * @tc.number    : Test_Close_488900
     * @tc.name      : TestCase_4889
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4889(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4889 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4889 ends.")
    }

    /*
     * @tc.number    : Test_Close_489000
     * @tc.name      : TestCase_4890
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4890(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4890 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4890 ends.")
    }

    /*
     * @tc.number    : Test_Close_489100
     * @tc.name      : TestCase_4891
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4891(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4891 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4891 ends.")
    }

    /*
     * @tc.number    : Test_Close_489200
     * @tc.name      : TestCase_4892
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4892(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4892 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4892 ends.")
    }

    /*
     * @tc.number    : Test_Close_489300
     * @tc.name      : TestCase_4893
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4893(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4893 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4893 ends.")
    }

    /*
     * @tc.number    : Test_Close_489400
     * @tc.name      : TestCase_4894
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4894(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4894 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4894 ends.")
    }

    /*
     * @tc.number    : Test_Close_489500
     * @tc.name      : TestCase_4895
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4895(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4895 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4895 ends.")
    }

    /*
     * @tc.number    : Test_Close_489600
     * @tc.name      : TestCase_4896
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4896(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4896 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4896 ends.")
    }

    /*
     * @tc.number    : Test_Close_489700
     * @tc.name      : TestCase_4897
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4897(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4897 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4897 ends.")
    }

    /*
     * @tc.number    : Test_Close_489800
     * @tc.name      : TestCase_4898
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4898(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4898 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4898 ends.")
    }

    /*
     * @tc.number    : Test_Close_489900
     * @tc.name      : TestCase_4899
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4899(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4899 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4899 ends.")
    }

    /*
     * @tc.number    : Test_Close_490000
     * @tc.name      : TestCase_4900
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_4900(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4900 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: false, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_4900 ends.")
    }
}
