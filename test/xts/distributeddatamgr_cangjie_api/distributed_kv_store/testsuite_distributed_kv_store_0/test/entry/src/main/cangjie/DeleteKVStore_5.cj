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
class DeleteKVStore_5 {
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
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_39700
     * @tc.name      : TestCase_397
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S2, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being a,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_397(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_397 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "a" * 100000)
            @Expect("assertion#2492: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_397 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_39800
     * @tc.name      : TestCase_398
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S2, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being a,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_398(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_398 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#2493: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_398 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_39900
     * @tc.name      : TestCase_399
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S2, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being a,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_399(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_399 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#2494: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_399 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_40000
     * @tc.name      : TestCase_400
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S2, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being a,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_400(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_400 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#2495: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_400 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_40100
     * @tc.name      : TestCase_401
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_401(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_401 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "")
            @Expect("assertion#2496: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_401 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_40200
     * @tc.name      : TestCase_402
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_402(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_402 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "")
            @Expect("assertion#2497: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_402 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_40300
     * @tc.name      : TestCase_403
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_403(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_403 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "")
            @Expect("assertion#2498: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_403 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_40400
     * @tc.name      : TestCase_404
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_404(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_404 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "")
            @Expect("assertion#2499: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_404 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_40500
     * @tc.name      : TestCase_405
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_405(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_405 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "")
            @Expect("assertion#2500: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_405 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_40600
     * @tc.name      : TestCase_406
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_406(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_406 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "\0")
            @Expect("assertion#2501: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_406 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_40700
     * @tc.name      : TestCase_407
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_407(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_407 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "\0")
            @Expect("assertion#2502: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_407 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_40800
     * @tc.name      : TestCase_408
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_408(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_408 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "\0")
            @Expect("assertion#2503: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_408 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_40900
     * @tc.name      : TestCase_409
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_409(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_409 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "\0")
            @Expect("assertion#2504: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_409 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_41000
     * @tc.name      : TestCase_410
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_410(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_410 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "\0")
            @Expect("assertion#2505: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_410 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_41100
     * @tc.name      : TestCase_411
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_411(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_411 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "#$%^&")
            @Expect("assertion#2506: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_411 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_41200
     * @tc.name      : TestCase_412
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_412(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_412 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "#$%^&")
            @Expect("assertion#2507: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_412 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_41300
     * @tc.name      : TestCase_413
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_413(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_413 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "#$%^&")
            @Expect("assertion#2508: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_413 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_41400
     * @tc.name      : TestCase_414
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_414(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_414 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "#$%^&")
            @Expect("assertion#2509: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_414 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_41500
     * @tc.name      : TestCase_415
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_415(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_415 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#2510: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_415 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_41600
     * @tc.name      : TestCase_416
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being zpsABC,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_416(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_416 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "zpsABC")
            @Expect("assertion#2511: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_416 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_41700
     * @tc.name      : TestCase_417
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being zpsABC,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_417(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_417 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "zpsABC")
            @Expect("assertion#2512: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_417 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_41800
     * @tc.name      : TestCase_418
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being zpsABC,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_418(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_418 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "zpsABC")
            @Expect("assertion#2513: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Not found.")
            @Expect(e.code, 15100004i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_418 ends.")
    }


    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_42000
     * @tc.name      : TestCase_420
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being zpsABC,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_420(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_420 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#2514: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_420 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_42100
     * @tc.name      : TestCase_421
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_421(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_421 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "a" * 100000)
            @Expect("assertion#2515: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_421 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_42200
     * @tc.name      : TestCase_422
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_422(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_422 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "a" * 100000)
            @Expect("assertion#2516: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_422 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_42300
     * @tc.name      : TestCase_423
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_423(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_423 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#2517: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_423 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_42400
     * @tc.name      : TestCase_424
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_424(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_424 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#2518: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_424 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_42500
     * @tc.name      : TestCase_425
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_425(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_425 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#2519: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_425 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_42600
     * @tc.name      : TestCase_426
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_426(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_426 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "")
            @Expect("assertion#2520: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_426 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_42700
     * @tc.name      : TestCase_427
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_427(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_427 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "")
            @Expect("assertion#2521: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_427 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_42800
     * @tc.name      : TestCase_428
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_428(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_428 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "")
            @Expect("assertion#2522: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_428 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_42900
     * @tc.name      : TestCase_429
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_429(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_429 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "")
            @Expect("assertion#2523: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_429 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_43000
     * @tc.name      : TestCase_430
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_430(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_430 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "")
            @Expect("assertion#2524: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_430 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_43100
     * @tc.name      : TestCase_431
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_431(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_431 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "\0")
            @Expect("assertion#2525: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_431 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_43200
     * @tc.name      : TestCase_432
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_432(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_432 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "\0")
            @Expect("assertion#2526: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_432 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_43300
     * @tc.name      : TestCase_433
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_433(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_433 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "\0")
            @Expect("assertion#2527: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_433 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_43400
     * @tc.name      : TestCase_434
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_434(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_434 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "\0")
            @Expect("assertion#2528: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_434 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_43500
     * @tc.name      : TestCase_435
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_435(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_435 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "\0")
            @Expect("assertion#2529: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_435 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_43600
     * @tc.name      : TestCase_436
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_436(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_436 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "#$%^&")
            @Expect("assertion#2530: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_436 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_43700
     * @tc.name      : TestCase_437
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_437(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_437 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "#$%^&")
            @Expect("assertion#2531: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_437 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_43800
     * @tc.name      : TestCase_438
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_438(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_438 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "#$%^&")
            @Expect("assertion#2532: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_438 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_43900
     * @tc.name      : TestCase_439
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_439(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_439 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "#$%^&")
            @Expect("assertion#2533: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_439 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_44000
     * @tc.name      : TestCase_440
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_440(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_440 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#2534: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_440 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_44100
     * @tc.name      : TestCase_441
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being zpsABC,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_441(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_441 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "zpsABC")
            @Expect("assertion#2535: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_441 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_44200
     * @tc.name      : TestCase_442
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being zpsABC,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_442(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_442 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "zpsABC")
            @Expect("assertion#2536: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_442 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_44300
     * @tc.name      : TestCase_443
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being zpsABC,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_443(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_443 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "zpsABC")
            @Expect("assertion#2537: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Not found.")
            @Expect(e.code, 15100004i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_443 ends.")
    }


    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_44500
     * @tc.name      : TestCase_445
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being zpsABC,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_445(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_445 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#2538: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_445 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_44600
     * @tc.name      : TestCase_446
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_446(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_446 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "a" * 100000)
            @Expect("assertion#2539: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_446 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_44700
     * @tc.name      : TestCase_447
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_447(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_447 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "a" * 100000)
            @Expect("assertion#2540: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_447 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_44800
     * @tc.name      : TestCase_448
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_448(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_448 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#2541: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_448 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_44900
     * @tc.name      : TestCase_449
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_449(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_449 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#2542: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_449 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_45000
     * @tc.name      : TestCase_450
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_450(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_450 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#2543: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_450 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_45100
     * @tc.name      : TestCase_451
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_451(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_451 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "")
            @Expect("assertion#2544: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_451 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_45200
     * @tc.name      : TestCase_452
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_452(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_452 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "")
            @Expect("assertion#2545: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_452 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_45300
     * @tc.name      : TestCase_453
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_453(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_453 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "")
            @Expect("assertion#2546: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_453 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_45400
     * @tc.name      : TestCase_454
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_454(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_454 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "")
            @Expect("assertion#2547: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_454 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_45500
     * @tc.name      : TestCase_455
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_455(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_455 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "")
            @Expect("assertion#2548: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_455 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_45600
     * @tc.name      : TestCase_456
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_456(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_456 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "\0")
            @Expect("assertion#2549: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_456 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_45700
     * @tc.name      : TestCase_457
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_457(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_457 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "\0")
            @Expect("assertion#2550: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_457 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_45800
     * @tc.name      : TestCase_458
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_458(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_458 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "\0")
            @Expect("assertion#2551: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_458 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_45900
     * @tc.name      : TestCase_459
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_459(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_459 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "\0")
            @Expect("assertion#2552: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_459 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_46000
     * @tc.name      : TestCase_460
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_460(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_460 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "\0")
            @Expect("assertion#2553: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_460 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_46100
     * @tc.name      : TestCase_461
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_461(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_461 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "#$%^&")
            @Expect("assertion#2554: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_461 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_46200
     * @tc.name      : TestCase_462
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_462(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_462 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "#$%^&")
            @Expect("assertion#2555: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_462 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_46300
     * @tc.name      : TestCase_463
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_463(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_463 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "#$%^&")
            @Expect("assertion#2556: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_463 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_46400
     * @tc.name      : TestCase_464
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_464(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_464 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "#$%^&")
            @Expect("assertion#2557: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_464 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_46500
     * @tc.name      : TestCase_465
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_465(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_465 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#2558: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_465 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_46600
     * @tc.name      : TestCase_466
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being zpsABC,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_466(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_466 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "zpsABC")
            @Expect("assertion#2559: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_466 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_46700
     * @tc.name      : TestCase_467
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being zpsABC,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_467(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_467 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "zpsABC")
            @Expect("assertion#2560: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_467 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_46800
     * @tc.name      : TestCase_468
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being zpsABC,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_468(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_468 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "zpsABC")
            @Expect("assertion#2561: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Not found.")
            @Expect(e.code, 15100004i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_468 ends.")
    }


    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_47000
     * @tc.name      : TestCase_470
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being zpsABC,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_470(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_470 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#2562: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_470 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_47100
     * @tc.name      : TestCase_471
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_471(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_471 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "a" * 100000)
            @Expect("assertion#2563: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_471 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_47200
     * @tc.name      : TestCase_472
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_472(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_472 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "a" * 100000)
            @Expect("assertion#2564: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_472 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_47300
     * @tc.name      : TestCase_473
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_473(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_473 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#2565: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_473 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_47400
     * @tc.name      : TestCase_474
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_474(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_474 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#2566: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_474 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_47500
     * @tc.name      : TestCase_475
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_475(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_475 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#2567: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_475 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_47600
     * @tc.name      : TestCase_476
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_476(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_476 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "")
            @Expect("assertion#2568: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_476 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_47700
     * @tc.name      : TestCase_477
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_477(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_477 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "")
            @Expect("assertion#2569: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_477 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_47800
     * @tc.name      : TestCase_478
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_478(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_478 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "")
            @Expect("assertion#2570: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_478 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_47900
     * @tc.name      : TestCase_479
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_479(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_479 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "")
            @Expect("assertion#2571: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_479 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_48000
     * @tc.name      : TestCase_480
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_480(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_480 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "")
            @Expect("assertion#2572: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_480 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_48100
     * @tc.name      : TestCase_481
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_481(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_481 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "\0")
            @Expect("assertion#2573: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_481 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_48200
     * @tc.name      : TestCase_482
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_482(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_482 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "\0")
            @Expect("assertion#2574: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_482 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_48300
     * @tc.name      : TestCase_483
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_483(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_483 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "\0")
            @Expect("assertion#2575: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_483 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_48400
     * @tc.name      : TestCase_484
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_484(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_484 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "\0")
            @Expect("assertion#2576: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_484 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_48500
     * @tc.name      : TestCase_485
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_485(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_485 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "\0")
            @Expect("assertion#2577: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_485 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_48600
     * @tc.name      : TestCase_486
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_486(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_486 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "#$%^&")
            @Expect("assertion#2578: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_486 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_48700
     * @tc.name      : TestCase_487
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_487(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_487 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "#$%^&")
            @Expect("assertion#2579: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_487 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_48800
     * @tc.name      : TestCase_488
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_488(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_488 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "#$%^&")
            @Expect("assertion#2580: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_488 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_48900
     * @tc.name      : TestCase_489
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_489(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_489 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "#$%^&")
            @Expect("assertion#2581: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_489 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_49000
     * @tc.name      : TestCase_490
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_490(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_490 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#2582: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_490 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_49100
     * @tc.name      : TestCase_491
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_491(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_491 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "zpsABC")
            @Expect("assertion#2583: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_491 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_49200
     * @tc.name      : TestCase_492
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_492(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_492 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "zpsABC")
            @Expect("assertion#2584: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_492 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_49300
     * @tc.name      : TestCase_493
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_493(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_493 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "zpsABC")
            @Expect("assertion#2585: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Not found.")
            @Expect(e.code, 15100004i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_493 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_49500
     * @tc.name      : TestCase_495
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S3, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_495(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_495 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#2586: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_495 ends.")
    }
}
