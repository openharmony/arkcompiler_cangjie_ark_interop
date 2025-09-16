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
class TestClose_37 {
    /*
     * @tc.number    : Test_Close_360100
     * @tc.name      : TestCase_3601
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3601(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3601 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3601 ends.")
    }

    /*
     * @tc.number    : Test_Close_360200
     * @tc.name      : TestCase_3602
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3602(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3602 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3602 ends.")
    }

    /*
     * @tc.number    : Test_Close_360300
     * @tc.name      : TestCase_3603
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3603(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3603 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3603 ends.")
    }

    /*
     * @tc.number    : Test_Close_360400
     * @tc.name      : TestCase_3604
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3604(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3604 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3604 ends.")
    }

    /*
     * @tc.number    : Test_Close_360500
     * @tc.name      : TestCase_3605
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3605(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3605 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3605 ends.")
    }

    /*
     * @tc.number    : Test_Close_360600
     * @tc.name      : TestCase_3606
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3606(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3606 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3606 ends.")
    }

    /*
     * @tc.number    : Test_Close_360700
     * @tc.name      : TestCase_3607
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3607(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3607 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3607 ends.")
    }

    /*
     * @tc.number    : Test_Close_360800
     * @tc.name      : TestCase_3608
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3608(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3608 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3608 ends.")
    }

    /*
     * @tc.number    : Test_Close_360900
     * @tc.name      : TestCase_3609
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3609(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3609 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3609 ends.")
    }

    /*
     * @tc.number    : Test_Close_361000
     * @tc.name      : TestCase_3610
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3610(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3610 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3610 ends.")
    }

    /*
     * @tc.number    : Test_Close_361100
     * @tc.name      : TestCase_3611
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3611(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3611 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3611 ends.")
    }

    /*
     * @tc.number    : Test_Close_361200
     * @tc.name      : TestCase_3612
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3612(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3612 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3612 ends.")
    }

    /*
     * @tc.number    : Test_Close_361300
     * @tc.name      : TestCase_3613
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3613(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3613 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3613 ends.")
    }

    /*
     * @tc.number    : Test_Close_361400
     * @tc.name      : TestCase_3614
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3614(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3614 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3614 ends.")
    }

    /*
     * @tc.number    : Test_Close_361500
     * @tc.name      : TestCase_3615
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3615(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3615 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3615 ends.")
    }

    /*
     * @tc.number    : Test_Close_361600
     * @tc.name      : TestCase_3616
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3616(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3616 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3616 ends.")
    }

    /*
     * @tc.number    : Test_Close_361700
     * @tc.name      : TestCase_3617
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3617(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3617 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3617 ends.")
    }

    /*
     * @tc.number    : Test_Close_361800
     * @tc.name      : TestCase_3618
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3618(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3618 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3618 ends.")
    }

    /*
     * @tc.number    : Test_Close_361900
     * @tc.name      : TestCase_3619
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3619(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3619 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3619 ends.")
    }

    /*
     * @tc.number    : Test_Close_362000
     * @tc.name      : TestCase_3620
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3620(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3620 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3620 ends.")
    }

    /*
     * @tc.number    : Test_Close_362100
     * @tc.name      : TestCase_3621
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3621(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3621 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3621 ends.")
    }

    /*
     * @tc.number    : Test_Close_362200
     * @tc.name      : TestCase_3622
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3622(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3622 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3622 ends.")
    }

    /*
     * @tc.number    : Test_Close_362300
     * @tc.name      : TestCase_3623
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3623(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3623 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3623 ends.")
    }

    /*
     * @tc.number    : Test_Close_362400
     * @tc.name      : TestCase_3624
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3624(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3624 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3624 ends.")
    }

    /*
     * @tc.number    : Test_Close_362500
     * @tc.name      : TestCase_3625
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3625(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3625 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3625 ends.")
    }

    /*
     * @tc.number    : Test_Close_362600
     * @tc.name      : TestCase_3626
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3626(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3626 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3626 ends.")
    }

    /*
     * @tc.number    : Test_Close_362700
     * @tc.name      : TestCase_3627
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3627(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3627 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3627 ends.")
    }

    /*
     * @tc.number    : Test_Close_362800
     * @tc.name      : TestCase_3628
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3628(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3628 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3628 ends.")
    }

    /*
     * @tc.number    : Test_Close_362900
     * @tc.name      : TestCase_3629
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3629(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3629 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3629 ends.")
    }

    /*
     * @tc.number    : Test_Close_363000
     * @tc.name      : TestCase_3630
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3630(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3630 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3630 ends.")
    }

    /*
     * @tc.number    : Test_Close_363100
     * @tc.name      : TestCase_3631
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3631(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3631 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3631 ends.")
    }

    /*
     * @tc.number    : Test_Close_363200
     * @tc.name      : TestCase_3632
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3632(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3632 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3632 ends.")
    }

    /*
     * @tc.number    : Test_Close_363300
     * @tc.name      : TestCase_3633
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3633(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3633 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3633 ends.")
    }

    /*
     * @tc.number    : Test_Close_363400
     * @tc.name      : TestCase_3634
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3634(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3634 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3634 ends.")
    }

    /*
     * @tc.number    : Test_Close_363500
     * @tc.name      : TestCase_3635
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3635(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3635 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3635 ends.")
    }

    /*
     * @tc.number    : Test_Close_363600
     * @tc.name      : TestCase_3636
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3636(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3636 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3636 ends.")
    }

    /*
     * @tc.number    : Test_Close_363700
     * @tc.name      : TestCase_3637
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3637(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3637 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3637 ends.")
    }

    /*
     * @tc.number    : Test_Close_363800
     * @tc.name      : TestCase_3638
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3638(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3638 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3638 ends.")
    }

    /*
     * @tc.number    : Test_Close_363900
     * @tc.name      : TestCase_3639
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3639(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3639 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3639 ends.")
    }

    /*
     * @tc.number    : Test_Close_364000
     * @tc.name      : TestCase_3640
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3640(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3640 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3640 ends.")
    }

    /*
     * @tc.number    : Test_Close_364100
     * @tc.name      : TestCase_3641
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3641(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3641 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3641 ends.")
    }

    /*
     * @tc.number    : Test_Close_364200
     * @tc.name      : TestCase_3642
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3642(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3642 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3642 ends.")
    }

    /*
     * @tc.number    : Test_Close_364300
     * @tc.name      : TestCase_3643
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3643(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3643 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3643 ends.")
    }

    /*
     * @tc.number    : Test_Close_364400
     * @tc.name      : TestCase_3644
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3644(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3644 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3644 ends.")
    }

    /*
     * @tc.number    : Test_Close_364500
     * @tc.name      : TestCase_3645
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3645(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3645 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3645 ends.")
    }

    /*
     * @tc.number    : Test_Close_364600
     * @tc.name      : TestCase_3646
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3646(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3646 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3646 ends.")
    }

    /*
     * @tc.number    : Test_Close_364700
     * @tc.name      : TestCase_3647
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3647(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3647 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3647 ends.")
    }

    /*
     * @tc.number    : Test_Close_364800
     * @tc.name      : TestCase_3648
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3648(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3648 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3648 ends.")
    }

    /*
     * @tc.number    : Test_Close_364900
     * @tc.name      : TestCase_3649
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3649(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3649 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3649 ends.")
    }

    /*
     * @tc.number    : Test_Close_365000
     * @tc.name      : TestCase_3650
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3650(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3650 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3650 ends.")
    }

    /*
     * @tc.number    : Test_Close_365100
     * @tc.name      : TestCase_3651
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3651(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3651 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3651 ends.")
    }

    /*
     * @tc.number    : Test_Close_365200
     * @tc.name      : TestCase_3652
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3652(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3652 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3652 ends.")
    }

    /*
     * @tc.number    : Test_Close_365300
     * @tc.name      : TestCase_3653
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3653(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3653 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3653 ends.")
    }

    /*
     * @tc.number    : Test_Close_365400
     * @tc.name      : TestCase_3654
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3654(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3654 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3654 ends.")
    }

    /*
     * @tc.number    : Test_Close_365500
     * @tc.name      : TestCase_3655
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3655(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3655 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3655 ends.")
    }

    /*
     * @tc.number    : Test_Close_365600
     * @tc.name      : TestCase_3656
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3656(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3656 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3656 ends.")
    }

    /*
     * @tc.number    : Test_Close_365700
     * @tc.name      : TestCase_3657
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3657(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3657 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3657 ends.")
    }

    /*
     * @tc.number    : Test_Close_365800
     * @tc.name      : TestCase_3658
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3658(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3658 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3658 ends.")
    }

    /*
     * @tc.number    : Test_Close_365900
     * @tc.name      : TestCase_3659
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3659(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3659 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3659 ends.")
    }

    /*
     * @tc.number    : Test_Close_366000
     * @tc.name      : TestCase_3660
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3660(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3660 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3660 ends.")
    }

    /*
     * @tc.number    : Test_Close_366100
     * @tc.name      : TestCase_3661
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3661(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3661 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3661 ends.")
    }

    /*
     * @tc.number    : Test_Close_366200
     * @tc.name      : TestCase_3662
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3662(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3662 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3662 ends.")
    }

    /*
     * @tc.number    : Test_Close_366300
     * @tc.name      : TestCase_3663
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3663(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3663 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3663 ends.")
    }

    /*
     * @tc.number    : Test_Close_366400
     * @tc.name      : TestCase_3664
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3664(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3664 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3664 ends.")
    }

    /*
     * @tc.number    : Test_Close_366500
     * @tc.name      : TestCase_3665
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3665(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3665 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3665 ends.")
    }

    /*
     * @tc.number    : Test_Close_366600
     * @tc.name      : TestCase_3666
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3666(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3666 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3666 ends.")
    }

    /*
     * @tc.number    : Test_Close_366700
     * @tc.name      : TestCase_3667
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3667(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3667 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3667 ends.")
    }

    /*
     * @tc.number    : Test_Close_366800
     * @tc.name      : TestCase_3668
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3668(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3668 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3668 ends.")
    }

    /*
     * @tc.number    : Test_Close_366900
     * @tc.name      : TestCase_3669
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3669(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3669 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3669 ends.")
    }

    /*
     * @tc.number    : Test_Close_367000
     * @tc.name      : TestCase_3670
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3670(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3670 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3670 ends.")
    }

    /*
     * @tc.number    : Test_Close_367100
     * @tc.name      : TestCase_3671
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3671(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3671 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3671 ends.")
    }

    /*
     * @tc.number    : Test_Close_367200
     * @tc.name      : TestCase_3672
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3672(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3672 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3672 ends.")
    }

    /*
     * @tc.number    : Test_Close_367300
     * @tc.name      : TestCase_3673
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3673(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3673 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3673 ends.")
    }

    /*
     * @tc.number    : Test_Close_367400
     * @tc.name      : TestCase_3674
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3674(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3674 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3674 ends.")
    }

    /*
     * @tc.number    : Test_Close_367500
     * @tc.name      : TestCase_3675
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3675(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3675 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3675 ends.")
    }

    /*
     * @tc.number    : Test_Close_367600
     * @tc.name      : TestCase_3676
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3676(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3676 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3676 ends.")
    }

    /*
     * @tc.number    : Test_Close_367700
     * @tc.name      : TestCase_3677
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3677(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3677 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3677 ends.")
    }

    /*
     * @tc.number    : Test_Close_367800
     * @tc.name      : TestCase_3678
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3678(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3678 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3678 ends.")
    }

    /*
     * @tc.number    : Test_Close_367900
     * @tc.name      : TestCase_3679
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3679(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3679 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3679 ends.")
    }

    /*
     * @tc.number    : Test_Close_368000
     * @tc.name      : TestCase_3680
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3680(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3680 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: [], cryptoParam: CryptoParam(), vector: false,
                tokenizer: Tokenizer.NoneTokenizer, persist: false, enableSemanticIndex: false))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3680 ends.")
    }

    /*
     * @tc.number    : Test_Close_368100
     * @tc.name      : TestCase_3681
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3681(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3681 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3681 ends.")
    }

    /*
     * @tc.number    : Test_Close_368200
     * @tc.name      : TestCase_3682
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3682(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3682 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3682 ends.")
    }

    /*
     * @tc.number    : Test_Close_368300
     * @tc.name      : TestCase_3683
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3683(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3683 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3683 ends.")
    }

    /*
     * @tc.number    : Test_Close_368400
     * @tc.name      : TestCase_3684
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3684(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3684 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3684 ends.")
    }

    /*
     * @tc.number    : Test_Close_368500
     * @tc.name      : TestCase_3685
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3685(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3685 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S1, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3685 ends.")
    }

    /*
     * @tc.number    : Test_Close_368600
     * @tc.name      : TestCase_3686
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3686(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3686 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3686 ends.")
    }

    /*
     * @tc.number    : Test_Close_368700
     * @tc.name      : TestCase_3687
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3687(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3687 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3687 ends.")
    }

    /*
     * @tc.number    : Test_Close_368800
     * @tc.name      : TestCase_3688
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3688(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3688 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3688 ends.")
    }

    /*
     * @tc.number    : Test_Close_368900
     * @tc.name      : TestCase_3689
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3689(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3689 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3689 ends.")
    }

    /*
     * @tc.number    : Test_Close_369000
     * @tc.name      : TestCase_3690
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3690(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3690 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S2, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3690 ends.")
    }

    /*
     * @tc.number    : Test_Close_369100
     * @tc.name      : TestCase_3691
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3691(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3691 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3691 ends.")
    }

    /*
     * @tc.number    : Test_Close_369200
     * @tc.name      : TestCase_3692
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3692(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3692 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3692 ends.")
    }

    /*
     * @tc.number    : Test_Close_369300
     * @tc.name      : TestCase_3693
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3693(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3693 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3693 ends.")
    }

    /*
     * @tc.number    : Test_Close_369400
     * @tc.name      : TestCase_3694
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3694(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3694 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3694 ends.")
    }

    /*
     * @tc.number    : Test_Close_369500
     * @tc.name      : TestCase_3695
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3695(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3695 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S3, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3695 ends.")
    }

    /*
     * @tc.number    : Test_Close_369600
     * @tc.name      : TestCase_3696
     * @tc.desc      : "1" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3696(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3696 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3696 ends.")
    }

    /*
     * @tc.number    : Test_Close_369700
     * @tc.name      : TestCase_3697
     * @tc.desc      : "2" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3697(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3697 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3697 ends.")
    }

    /*
     * @tc.number    : Test_Close_369800
     * @tc.name      : TestCase_3698
     * @tc.desc      : "3" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3698(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3698 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3698 ends.")
    }

    /*
     * @tc.number    : Test_Close_369900
     * @tc.name      : TestCase_3699
     * @tc.desc      : "4" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3699(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3699 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3699 ends.")
    }

    /*
     * @tc.number    : Test_Close_370000
     * @tc.name      : TestCase_3700
     * @tc.desc      : "1024" Close the result set
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_3700(): Unit {
        try {

        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3700 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable rdbStore")
        let rdbStore = getRdbStore(getAbilityContext(),
            StoreConfig(SecurityLevel.S4, name: "valid name", encrypt: false, dataGroupId: "valid createTime",
                customDir: "valid modifyTime", rootDir: "rootDir", autoCleanDirtyData: true, allowRebuild: false,
                isReadOnly: false, pluginLibs: ["", "pluginLibs"], cryptoParam: CryptoParam(), vector: true,
                tokenizer: Tokenizer.NoneTokenizer, persist: true, enableSemanticIndex: true))
        Hilog.info(0u32, "cangjietest", "", "define local variable resultSet")
        let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'PETER")
        Hilog.info(0u32, "cangjietest", "", "testClose")
        resultSet.close()
                    @Expect(true)
        } catch (e: BusinessException) {
            @Expect(e.code, 14801002i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_3700 ends.")
    }
}
