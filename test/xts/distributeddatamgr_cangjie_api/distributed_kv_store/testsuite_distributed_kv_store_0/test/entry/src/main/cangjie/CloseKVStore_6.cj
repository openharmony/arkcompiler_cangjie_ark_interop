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
import ohos.data.distributed_kv_store.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.business_exception.{BusinessException}

@Test
class CloseKVStore_6 {
    @BeforeAll
    func beforeAll() {
        Hilog.info(0, "cangjietest", "get user granted permission ohos.permission.DISTRIBUTED_DATASYNC")
        try {
            getRequiredPermissions(["ohos.permission.DISTRIBUTED_DATASYNC"])
            sleep(Duration.second * 1i64)
            click(at: Screen
                .getTheOnlyUiComponentWhoseTextEqualsTo("允许")
                .centerPoint)
            sleep(Duration.second * 1i64)
        } catch (_: Exception) {
            Hilog.info(0, "cangjietest", "get user granted permission fail")
        }
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_49600
     * @tc.name      : TestCase_496
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_496(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_496 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "a" * 100000)
            @Expect("assertion#3355: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_496 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_49700
     * @tc.name      : TestCase_497
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_497(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_497 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "a" * 100000)
            @Expect("assertion#3356: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_497 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_49800
     * @tc.name      : TestCase_498
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_498(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_498 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#3357: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_498 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_49900
     * @tc.name      : TestCase_499
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_499(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_499 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#3358: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_499 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_50000
     * @tc.name      : TestCase_500
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_500(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_500 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#3359: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_500 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_50100
     * @tc.name      : TestCase_501
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_501(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_501 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "")
            @Expect("assertion#3360: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_501 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_50200
     * @tc.name      : TestCase_502
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_502(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_502 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "")
            @Expect("assertion#3361: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_502 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_50300
     * @tc.name      : TestCase_503
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_503(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_503 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "")
            @Expect("assertion#3362: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_503 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_50400
     * @tc.name      : TestCase_504
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_504(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_504 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "")
            @Expect("assertion#3363: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_504 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_50500
     * @tc.name      : TestCase_505
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_505(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_505 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "")
            @Expect("assertion#3364: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_505 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_50600
     * @tc.name      : TestCase_506
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_506(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_506 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "\0")
            @Expect("assertion#3365: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_506 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_50700
     * @tc.name      : TestCase_507
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_507(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_507 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "\0")
            @Expect("assertion#3366: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_507 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_50800
     * @tc.name      : TestCase_508
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_508(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_508 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "\0")
            @Expect("assertion#3367: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_508 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_50900
     * @tc.name      : TestCase_509
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_509(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_509 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "\0")
            @Expect("assertion#3368: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_509 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_51000
     * @tc.name      : TestCase_510
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_510(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_510 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "\0")
            @Expect("assertion#3369: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_510 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_51100
     * @tc.name      : TestCase_511
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_511(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_511 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "#$%^&")
            @Expect("assertion#3370: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_511 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_51200
     * @tc.name      : TestCase_512
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_512(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_512 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "#$%^&")
            @Expect("assertion#3371: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_512 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_51300
     * @tc.name      : TestCase_513
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_513(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_513 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "#$%^&")
            @Expect("assertion#3372: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_513 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_51400
     * @tc.name      : TestCase_514
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_514(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_514 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "#$%^&")
            @Expect("assertion#3373: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_514 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_51500
     * @tc.name      : TestCase_515
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_515(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_515 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#3374: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_515 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_51600
     * @tc.name      : TestCase_516
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_516(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_516 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "zpsABC")
            @Expect("assertion#3375: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_516 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_51700
     * @tc.name      : TestCase_517
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_517(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_517 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "zpsABC")
            @Expect("assertion#3376: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_517 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_51800
     * @tc.name      : TestCase_518
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_518(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_518 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "zpsABC")
        } catch (e: BusinessException) {
            @Expect(false)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_518 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_51900
     * @tc.name      : TestCase_519
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_519(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_519 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "testcase TestCase_519 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_52000
     * @tc.name      : TestCase_520
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_520(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_520 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#3378: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_520 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_52100
     * @tc.name      : TestCase_521
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_521(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_521 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "a" * 100000)
            @Expect("assertion#3379: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_521 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_52200
     * @tc.name      : TestCase_522
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_522(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_522 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "a" * 100000)
            @Expect("assertion#3380: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_522 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_52300
     * @tc.name      : TestCase_523
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_523(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_523 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#3381: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_523 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_52400
     * @tc.name      : TestCase_524
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_524(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_524 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#3382: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_524 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_52500
     * @tc.name      : TestCase_525
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_525(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_525 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#3383: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_525 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_52600
     * @tc.name      : TestCase_526
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_526(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_526 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "")
            @Expect("assertion#3384: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_526 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_52700
     * @tc.name      : TestCase_527
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_527(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_527 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "")
            @Expect("assertion#3385: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_527 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_52800
     * @tc.name      : TestCase_528
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_528(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_528 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "")
            @Expect("assertion#3386: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_528 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_52900
     * @tc.name      : TestCase_529
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_529(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_529 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "")
            @Expect("assertion#3387: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_529 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_53000
     * @tc.name      : TestCase_530
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_530(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_530 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "")
            @Expect("assertion#3388: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_530 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_53100
     * @tc.name      : TestCase_531
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_531(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_531 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "\0")
            @Expect("assertion#3389: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_531 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_53200
     * @tc.name      : TestCase_532
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_532(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_532 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "\0")
            @Expect("assertion#3390: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_532 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_53300
     * @tc.name      : TestCase_533
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_533(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_533 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "\0")
            @Expect("assertion#3391: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_533 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_53400
     * @tc.name      : TestCase_534
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_534(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_534 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "\0")
            @Expect("assertion#3392: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_534 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_53500
     * @tc.name      : TestCase_535
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_535(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_535 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "\0")
            @Expect("assertion#3393: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_535 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_53600
     * @tc.name      : TestCase_536
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_536(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_536 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "#$%^&")
            @Expect("assertion#3394: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_536 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_53700
     * @tc.name      : TestCase_537
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_537(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_537 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "#$%^&")
            @Expect("assertion#3395: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_537 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_53800
     * @tc.name      : TestCase_538
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_538(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_538 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "#$%^&")
            @Expect("assertion#3396: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_538 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_53900
     * @tc.name      : TestCase_539
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_539(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_539 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "#$%^&")
            @Expect("assertion#3397: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_539 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_54000
     * @tc.name      : TestCase_540
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_540(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_540 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#3398: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_540 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_54100
     * @tc.name      : TestCase_541
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_541(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_541 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "zpsABC")
            @Expect("assertion#3399: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_541 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_54200
     * @tc.name      : TestCase_542
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_542(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_542 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "zpsABC")
            @Expect("assertion#3400: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_542 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_54300
     * @tc.name      : TestCase_543
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_543(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_543 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "zpsABC")
        } catch (e: BusinessException) {
            @Expect(false)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_543 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_54400
     * @tc.name      : TestCase_544
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_544(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_544 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "testcase TestCase_544 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_54500
     * @tc.name      : TestCase_545
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_545(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_545 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#3402: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_545 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_54600
     * @tc.name      : TestCase_546
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_546(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_546 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "a" * 100000)
            @Expect("assertion#3403: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_546 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_54700
     * @tc.name      : TestCase_547
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_547(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_547 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "a" * 100000)
            @Expect("assertion#3404: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_547 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_54800
     * @tc.name      : TestCase_548
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_548(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_548 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#3405: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_548 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_54900
     * @tc.name      : TestCase_549
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_549(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_549 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#3406: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_549 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_55000
     * @tc.name      : TestCase_550
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_550(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_550 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#3407: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_550 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_55100
     * @tc.name      : TestCase_551
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_551(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_551 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "")
            @Expect("assertion#3408: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_551 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_55200
     * @tc.name      : TestCase_552
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_552(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_552 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "")
            @Expect("assertion#3409: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_552 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_55300
     * @tc.name      : TestCase_553
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_553(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_553 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "")
            @Expect("assertion#3410: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_553 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_55400
     * @tc.name      : TestCase_554
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_554(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_554 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "")
            @Expect("assertion#3411: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_554 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_55500
     * @tc.name      : TestCase_555
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_555(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_555 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "")
            @Expect("assertion#3412: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_555 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_55600
     * @tc.name      : TestCase_556
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_556(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_556 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "\0")
            @Expect("assertion#3413: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_556 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_55700
     * @tc.name      : TestCase_557
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_557(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_557 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "\0")
            @Expect("assertion#3414: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_557 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_55800
     * @tc.name      : TestCase_558
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_558(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_558 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "\0")
            @Expect("assertion#3415: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_558 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_55900
     * @tc.name      : TestCase_559
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_559(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_559 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "\0")
            @Expect("assertion#3416: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_559 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_56000
     * @tc.name      : TestCase_560
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_560(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_560 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "\0")
            @Expect("assertion#3417: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_560 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_56100
     * @tc.name      : TestCase_561
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_561(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_561 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "#$%^&")
            @Expect("assertion#3418: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_561 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_56200
     * @tc.name      : TestCase_562
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_562(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_562 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "#$%^&")
            @Expect("assertion#3419: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_562 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_56300
     * @tc.name      : TestCase_563
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_563(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_563 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "#$%^&")
            @Expect("assertion#3420: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_563 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_56400
     * @tc.name      : TestCase_564
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_564(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_564 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "#$%^&")
            @Expect("assertion#3421: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_564 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_56500
     * @tc.name      : TestCase_565
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_565(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_565 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#3422: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_565 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_56600
     * @tc.name      : TestCase_566
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_566(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_566 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "zpsABC")
            @Expect("assertion#3423: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_566 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_56700
     * @tc.name      : TestCase_567
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_567(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_567 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "zpsABC")
            @Expect("assertion#3424: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_567 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_56800
     * @tc.name      : TestCase_568
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_568(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_568 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "zpsABC")
        } catch (e: BusinessException) {
            @Expect(false)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_568 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_56900
     * @tc.name      : TestCase_569
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_569(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_569 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "testcase TestCase_569 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_57000
     * @tc.name      : TestCase_570
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_570(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_570 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#3426: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_570 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_57100
     * @tc.name      : TestCase_571
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_571(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_571 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "a" * 100000)
            @Expect("assertion#3427: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_571 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_57200
     * @tc.name      : TestCase_572
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_572(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_572 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "a" * 100000)
            @Expect("assertion#3428: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_572 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_57300
     * @tc.name      : TestCase_573
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_573(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_573 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#3429: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_573 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_57400
     * @tc.name      : TestCase_574
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_574(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_574 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#3430: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_574 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_57500
     * @tc.name      : TestCase_575
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_575(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_575 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#3431: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_575 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_57600
     * @tc.name      : TestCase_576
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_576(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_576 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "")
            @Expect("assertion#3432: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_576 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_57700
     * @tc.name      : TestCase_577
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_577(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_577 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "")
            @Expect("assertion#3433: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_577 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_57800
     * @tc.name      : TestCase_578
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_578(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_578 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "")
            @Expect("assertion#3434: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_578 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_57900
     * @tc.name      : TestCase_579
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_579(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_579 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "")
            @Expect("assertion#3435: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_579 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_58000
     * @tc.name      : TestCase_580
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_580(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_580 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "")
            @Expect("assertion#3436: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_580 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_58100
     * @tc.name      : TestCase_581
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_581(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_581 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "\0")
            @Expect("assertion#3437: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_581 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_58200
     * @tc.name      : TestCase_582
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_582(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_582 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "\0")
            @Expect("assertion#3438: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_582 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_58300
     * @tc.name      : TestCase_583
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_583(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_583 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "\0")
            @Expect("assertion#3439: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_583 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_58400
     * @tc.name      : TestCase_584
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_584(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_584 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "\0")
            @Expect("assertion#3440: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_584 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_58500
     * @tc.name      : TestCase_585
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_585(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_585 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "\0")
            @Expect("assertion#3441: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_585 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_58600
     * @tc.name      : TestCase_586
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_586(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_586 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "#$%^&")
            @Expect("assertion#3442: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_586 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_58700
     * @tc.name      : TestCase_587
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_587(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_587 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "#$%^&")
            @Expect("assertion#3443: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_587 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_58800
     * @tc.name      : TestCase_588
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_588(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_588 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "#$%^&")
            @Expect("assertion#3444: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_588 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_58900
     * @tc.name      : TestCase_589
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_589(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_589 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "#$%^&")
            @Expect("assertion#3445: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_589 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_59000
     * @tc.name      : TestCase_590
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_590(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_590 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#3446: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_590 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_59100
     * @tc.name      : TestCase_591
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_591(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_591 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "zpsABC")
            @Expect("assertion#3447: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_591 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_59200
     * @tc.name      : TestCase_592
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_592(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_592 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "zpsABC")
            @Expect("assertion#3448: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_592 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_59300
     * @tc.name      : TestCase_593
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_593(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_593 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "zpsABC")
        } catch (e: BusinessException) {
            @Expect(false)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_593 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_59400
     * @tc.name      : TestCase_594
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_594(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_594 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "testcase TestCase_594 ends.")
    }
}
