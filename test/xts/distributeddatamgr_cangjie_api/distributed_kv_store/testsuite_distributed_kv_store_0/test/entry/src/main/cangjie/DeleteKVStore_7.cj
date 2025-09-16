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
class DeleteKVStore_7 {
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
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_59500
     * @tc.name      : TestCase_595
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being zpsABC,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_595(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_595 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#2682: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_595 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_59600
     * @tc.name      : TestCase_596
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being a,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_596(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_596 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "a" * 100000)
            @Expect("assertion#2683: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_596 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_59700
     * @tc.name      : TestCase_597
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being a,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_597(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_597 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "a" * 100000)
            @Expect("assertion#2684: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_597 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_59800
     * @tc.name      : TestCase_598
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being a,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_598(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_598 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#2685: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_598 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_59900
     * @tc.name      : TestCase_599
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being a,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_599(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_599 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#2686: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_599 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_60000
     * @tc.name      : TestCase_600
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being a,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_600(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_600 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#2687: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_600 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_60100
     * @tc.name      : TestCase_601
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_601(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_601 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "")
            @Expect("assertion#2688: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_601 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_60200
     * @tc.name      : TestCase_602
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_602(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_602 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "")
            @Expect("assertion#2689: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_602 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_60300
     * @tc.name      : TestCase_603
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_603(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_603 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "")
            @Expect("assertion#2690: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_603 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_60400
     * @tc.name      : TestCase_604
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_604(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_604 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "")
            @Expect("assertion#2691: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_604 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_60500
     * @tc.name      : TestCase_605
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_605(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_605 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "")
            @Expect("assertion#2692: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_605 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_60600
     * @tc.name      : TestCase_606
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_606(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_606 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "\0")
            @Expect("assertion#2693: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_606 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_60700
     * @tc.name      : TestCase_607
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_607(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_607 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "\0")
            @Expect("assertion#2694: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_607 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_60800
     * @tc.name      : TestCase_608
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_608(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_608 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "\0")
            @Expect("assertion#2695: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_608 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_60900
     * @tc.name      : TestCase_609
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_609(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_609 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "\0")
            @Expect("assertion#2696: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_609 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_61000
     * @tc.name      : TestCase_610
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_610(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_610 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "\0")
            @Expect("assertion#2697: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_610 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_61100
     * @tc.name      : TestCase_611
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_611(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_611 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "#$%^&")
            @Expect("assertion#2698: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_611 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_61200
     * @tc.name      : TestCase_612
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_612(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_612 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "#$%^&")
            @Expect("assertion#2699: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_612 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_61300
     * @tc.name      : TestCase_613
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_613(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_613 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "#$%^&")
            @Expect("assertion#2700: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_613 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_61400
     * @tc.name      : TestCase_614
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_614(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_614 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "#$%^&")
            @Expect("assertion#2701: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_614 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_61500
     * @tc.name      : TestCase_615
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_615(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_615 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#2702: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_615 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_61600
     * @tc.name      : TestCase_616
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being zpsABC,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_616(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_616 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "zpsABC")
            @Expect("assertion#2703: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_616 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_61700
     * @tc.name      : TestCase_617
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being zpsABC,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_617(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_617 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "zpsABC")
            @Expect("assertion#2704: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_617 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_61800
     * @tc.name      : TestCase_618
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being zpsABC,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_618(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_618 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "zpsABC")
            @Expect("assertion#2705: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Not found.")
            @Expect(e.code, 15100004i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_618 ends.")
    }


    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_62000
     * @tc.name      : TestCase_620
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being zpsABC,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_620(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_620 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#2706: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_620 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_62100
     * @tc.name      : TestCase_621
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_621(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_621 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "a" * 100000)
            @Expect("assertion#2707: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_621 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_62200
     * @tc.name      : TestCase_622
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_622(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_622 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "a" * 100000)
            @Expect("assertion#2708: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_622 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_62300
     * @tc.name      : TestCase_623
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_623(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_623 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#2709: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_623 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_62400
     * @tc.name      : TestCase_624
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_624(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_624 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#2710: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_624 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_62500
     * @tc.name      : TestCase_625
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_625(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_625 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#2711: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_625 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_62600
     * @tc.name      : TestCase_626
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_626(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_626 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "")
            @Expect("assertion#2712: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_626 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_62700
     * @tc.name      : TestCase_627
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_627(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_627 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "")
            @Expect("assertion#2713: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_627 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_62800
     * @tc.name      : TestCase_628
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_628(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_628 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "")
            @Expect("assertion#2714: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_628 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_62900
     * @tc.name      : TestCase_629
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_629(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_629 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "")
            @Expect("assertion#2715: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_629 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_63000
     * @tc.name      : TestCase_630
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_630(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_630 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "")
            @Expect("assertion#2716: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_630 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_63100
     * @tc.name      : TestCase_631
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_631(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_631 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "\0")
            @Expect("assertion#2717: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_631 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_63200
     * @tc.name      : TestCase_632
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_632(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_632 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "\0")
            @Expect("assertion#2718: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_632 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_63300
     * @tc.name      : TestCase_633
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_633(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_633 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "\0")
            @Expect("assertion#2719: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_633 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_63400
     * @tc.name      : TestCase_634
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_634(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_634 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "\0")
            @Expect("assertion#2720: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_634 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_63500
     * @tc.name      : TestCase_635
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_635(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_635 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "\0")
            @Expect("assertion#2721: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_635 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_63600
     * @tc.name      : TestCase_636
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_636(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_636 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "#$%^&")
            @Expect("assertion#2722: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_636 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_63700
     * @tc.name      : TestCase_637
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_637(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_637 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "#$%^&")
            @Expect("assertion#2723: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_637 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_63800
     * @tc.name      : TestCase_638
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_638(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_638 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "#$%^&")
            @Expect("assertion#2724: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_638 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_63900
     * @tc.name      : TestCase_639
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_639(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_639 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "#$%^&")
            @Expect("assertion#2725: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_639 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_64000
     * @tc.name      : TestCase_640
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_640(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_640 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#2726: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_640 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_64100
     * @tc.name      : TestCase_641
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being zpsABC,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_641(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_641 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "zpsABC")
            @Expect("assertion#2727: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_641 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_64200
     * @tc.name      : TestCase_642
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being zpsABC,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_642(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_642 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "zpsABC")
            @Expect("assertion#2728: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_642 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_64300
     * @tc.name      : TestCase_643
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being zpsABC,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_643(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_643 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "zpsABC")
            @Expect("assertion#2729: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Not found.")
            @Expect(e.code, 15100004i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_643 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_64500
     * @tc.name      : TestCase_645
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being zpsABC,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_645(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_645 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#2730: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_645 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_64600
     * @tc.name      : TestCase_646
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_646(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_646 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "a" * 100000)
            @Expect("assertion#2731: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_646 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_64700
     * @tc.name      : TestCase_647
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_647(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_647 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "a" * 100000)
            @Expect("assertion#2732: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_647 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_64800
     * @tc.name      : TestCase_648
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_648(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_648 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#2733: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_648 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_64900
     * @tc.name      : TestCase_649
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_649(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_649 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#2734: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_649 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_65000
     * @tc.name      : TestCase_650
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_650(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_650 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#2735: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_650 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_65100
     * @tc.name      : TestCase_651
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_651(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_651 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "")
            @Expect("assertion#2736: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_651 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_65200
     * @tc.name      : TestCase_652
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_652(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_652 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "")
            @Expect("assertion#2737: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_652 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_65300
     * @tc.name      : TestCase_653
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_653(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_653 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "")
            @Expect("assertion#2738: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_653 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_65400
     * @tc.name      : TestCase_654
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_654(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_654 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "")
            @Expect("assertion#2739: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_654 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_65500
     * @tc.name      : TestCase_655
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_655(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_655 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "")
            @Expect("assertion#2740: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_655 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_65600
     * @tc.name      : TestCase_656
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_656(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_656 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "\0")
            @Expect("assertion#2741: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_656 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_65700
     * @tc.name      : TestCase_657
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_657(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_657 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "\0")
            @Expect("assertion#2742: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_657 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_65800
     * @tc.name      : TestCase_658
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_658(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_658 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "\0")
            @Expect("assertion#2743: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_658 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_65900
     * @tc.name      : TestCase_659
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_659(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_659 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "\0")
            @Expect("assertion#2744: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_659 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_66000
     * @tc.name      : TestCase_660
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_660(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_660 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "\0")
            @Expect("assertion#2745: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_660 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_66100
     * @tc.name      : TestCase_661
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_661(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_661 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "#$%^&")
            @Expect("assertion#2746: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_661 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_66200
     * @tc.name      : TestCase_662
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_662(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_662 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "#$%^&")
            @Expect("assertion#2747: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_662 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_66300
     * @tc.name      : TestCase_663
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_663(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_663 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "#$%^&")
            @Expect("assertion#2748: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_663 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_66400
     * @tc.name      : TestCase_664
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_664(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_664 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "#$%^&")
            @Expect("assertion#2749: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_664 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_66500
     * @tc.name      : TestCase_665
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_665(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_665 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#2750: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_665 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_66600
     * @tc.name      : TestCase_666
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being zpsABC,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_666(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_666 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "zpsABC")
            @Expect("assertion#2751: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_666 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_66700
     * @tc.name      : TestCase_667
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being zpsABC,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_667(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_667 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "zpsABC")
            @Expect("assertion#2752: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_667 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_66800
     * @tc.name      : TestCase_668
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being zpsABC,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_668(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_668 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "zpsABC")
            @Expect("assertion#2753: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Not found.")
            @Expect(e.code, 15100004i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_668 ends.")
    }


    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_67000
     * @tc.name      : TestCase_670
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being zpsABC,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_670(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_670 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#2754: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_670 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_67100
     * @tc.name      : TestCase_671
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_671(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_671 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "a" * 100000)
            @Expect("assertion#2755: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_671 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_67200
     * @tc.name      : TestCase_672
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_672(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_672 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "a" * 100000)
            @Expect("assertion#2756: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_672 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_67300
     * @tc.name      : TestCase_673
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_673(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_673 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#2757: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_673 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_67400
     * @tc.name      : TestCase_674
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_674(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_674 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#2758: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_674 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_67500
     * @tc.name      : TestCase_675
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_675(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_675 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#2759: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_675 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_67600
     * @tc.name      : TestCase_676
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_676(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_676 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "")
            @Expect("assertion#2760: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_676 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_67700
     * @tc.name      : TestCase_677
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_677(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_677 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "")
            @Expect("assertion#2761: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_677 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_67800
     * @tc.name      : TestCase_678
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_678(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_678 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "")
            @Expect("assertion#2762: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_678 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_67900
     * @tc.name      : TestCase_679
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_679(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_679 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "")
            @Expect("assertion#2763: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_679 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_68000
     * @tc.name      : TestCase_680
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_680(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_680 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "")
            @Expect("assertion#2764: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_680 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_68100
     * @tc.name      : TestCase_681
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_681(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_681 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "\0")
            @Expect("assertion#2765: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_681 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_68200
     * @tc.name      : TestCase_682
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_682(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_682 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "\0")
            @Expect("assertion#2766: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_682 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_68300
     * @tc.name      : TestCase_683
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_683(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_683 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "\0")
            @Expect("assertion#2767: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_683 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_68400
     * @tc.name      : TestCase_684
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_684(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_684 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "\0")
            @Expect("assertion#2768: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_684 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_68500
     * @tc.name      : TestCase_685
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_685(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_685 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "\0")
            @Expect("assertion#2769: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_685 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_68600
     * @tc.name      : TestCase_686
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_686(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_686 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "#$%^&")
            @Expect("assertion#2770: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_686 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_68700
     * @tc.name      : TestCase_687
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_687(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_687 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "#$%^&")
            @Expect("assertion#2771: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_687 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_68800
     * @tc.name      : TestCase_688
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_688(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_688 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "#$%^&")
            @Expect("assertion#2772: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_688 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_68900
     * @tc.name      : TestCase_689
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_689(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_689 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "#$%^&")
            @Expect("assertion#2773: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_689 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_69000
     * @tc.name      : TestCase_690
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_690(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_690 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#2774: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_690 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_69100
     * @tc.name      : TestCase_691
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_691(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_691 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "zpsABC")
            @Expect("assertion#2775: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_691 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_69200
     * @tc.name      : TestCase_692
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_692(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_692 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "zpsABC")
            @Expect("assertion#2776: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_692 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_69300
     * @tc.name      : TestCase_693
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_693(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_693 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "zpsABC")
            @Expect("assertion#2777: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Not found.")
            @Expect(e.code, 15100004i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_693 ends.")
    }
}
