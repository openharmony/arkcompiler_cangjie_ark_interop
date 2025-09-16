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
class DeleteKVStore_1 {
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
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_0100
     * @tc.name      : TestCase_1
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_1(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_1 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "")
            @Expect("assertion#2112: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_1 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_0200
     * @tc.name      : TestCase_2
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_2(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_2 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "")
            @Expect("assertion#2113: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_2 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_0300
     * @tc.name      : TestCase_3
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_3(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_3 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "")
            @Expect("assertion#2114: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_3 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_0400
     * @tc.name      : TestCase_4
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_4(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_4 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "")
            @Expect("assertion#2115: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_4 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_0500
     * @tc.name      : TestCase_5
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being ,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_5(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_5 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "")
            @Expect("assertion#2116: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_5 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_0600
     * @tc.name      : TestCase_6
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_6(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_6 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "\0")
            @Expect("assertion#2117: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_6 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_0700
     * @tc.name      : TestCase_7
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_7(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_7 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "\0")
            @Expect("assertion#2118: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_7 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_0800
     * @tc.name      : TestCase_8
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_8(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_8 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "\0")
            @Expect("assertion#2119: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_8 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_0900
     * @tc.name      : TestCase_9
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_9(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_9 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "\0")
            @Expect("assertion#2120: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_9 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_1000
     * @tc.name      : TestCase_10
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being \0,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_10(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_10 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "\0")
            @Expect("assertion#2121: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_10 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_1100
     * @tc.name      : TestCase_11
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_11(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_11 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "#$%^&")
            @Expect("assertion#2122: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_11 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_1200
     * @tc.name      : TestCase_12
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_12(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_12 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "#$%^&")
            @Expect("assertion#2123: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_12 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_1300
     * @tc.name      : TestCase_13
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_13(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_13 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "#$%^&")
            @Expect("assertion#2124: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_13 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_1400
     * @tc.name      : TestCase_14
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_14(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_14 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "#$%^&")
            @Expect("assertion#2125: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_14 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_1500
     * @tc.name      : TestCase_15
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being #$%^&,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_15(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_15 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#2126: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_15 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_1600
     * @tc.name      : TestCase_16
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being zpsABC,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_16(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_16 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "zpsABC")
            @Expect("assertion#2127: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_16 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_1700
     * @tc.name      : TestCase_17
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being zpsABC,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_17(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_17 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "zpsABC")
            @Expect("assertion#2128: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_17 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_1800
     * @tc.name      : TestCase_18
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being zpsABC,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_18(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_18 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "zpsABC")
            @Expect("assertion#2129: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Not found.")
            @Expect(e.code, 15100004i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_18 ends.")
    }


    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_2000
     * @tc.name      : TestCase_20
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being zpsABC,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_20(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_20 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#2130: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_20 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_2100
     * @tc.name      : TestCase_21
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_21(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_21 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "a" * 100000)
            @Expect("assertion#2131: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_21 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_2200
     * @tc.name      : TestCase_22
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_22(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_22 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "a" * 100000)
            @Expect("assertion#2132: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_22 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_2300
     * @tc.name      : TestCase_23
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_23(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_23 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#2133: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_23 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_2400
     * @tc.name      : TestCase_24
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_24(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_24 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#2134: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_24 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_2500
     * @tc.name      : TestCase_25
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being true, storeId being a,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_25(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_25 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#2135: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_25 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_2600
     * @tc.name      : TestCase_26
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_26(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_26 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "")
            @Expect("assertion#2136: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_26 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_2700
     * @tc.name      : TestCase_27
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_27(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_27 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "")
            @Expect("assertion#2137: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_27 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_2800
     * @tc.name      : TestCase_28
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_28(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_28 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "")
            @Expect("assertion#2138: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_28 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_2900
     * @tc.name      : TestCase_29
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_29(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_29 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "")
            @Expect("assertion#2139: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_29 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_3000
     * @tc.name      : TestCase_30
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being ,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_30(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_30 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "")
            @Expect("assertion#2140: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_30 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_3100
     * @tc.name      : TestCase_31
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_31(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_31 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "\0")
            @Expect("assertion#2141: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_31 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_3200
     * @tc.name      : TestCase_32
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_32(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_32 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "\0")
            @Expect("assertion#2142: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_32 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_3300
     * @tc.name      : TestCase_33
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_33(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_33 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "\0")
            @Expect("assertion#2143: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_33 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_3400
     * @tc.name      : TestCase_34
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_34(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_34 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "\0")
            @Expect("assertion#2144: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_34 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_3500
     * @tc.name      : TestCase_35
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being \0,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_35(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_35 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "\0")
            @Expect("assertion#2145: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_35 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_3600
     * @tc.name      : TestCase_36
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_36(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_36 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "#$%^&")
            @Expect("assertion#2146: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_36 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_3700
     * @tc.name      : TestCase_37
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_37(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_37 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "#$%^&")
            @Expect("assertion#2147: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_37 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_3800
     * @tc.name      : TestCase_38
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_38(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_38 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "#$%^&")
            @Expect("assertion#2148: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_38 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_3900
     * @tc.name      : TestCase_39
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_39(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_39 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "#$%^&")
            @Expect("assertion#2149: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_39 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_4000
     * @tc.name      : TestCase_40
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being #$%^&,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_40(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_40 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#2150: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_40 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_4100
     * @tc.name      : TestCase_41
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being zpsABC,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_41(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_41 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "zpsABC")
            @Expect("assertion#2151: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_41 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_4200
     * @tc.name      : TestCase_42
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being zpsABC,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_42(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_42 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "zpsABC")
            @Expect("assertion#2152: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_42 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_4300
     * @tc.name      : TestCase_43
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being zpsABC,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_43(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_43 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "zpsABC")
            @Expect("assertion#2153: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Not found.")
            @Expect(e.code, 15100004i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_43 ends.")
    }


    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_4500
     * @tc.name      : TestCase_45
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being zpsABC,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_45(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_45 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#2154: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_45 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_4600
     * @tc.name      : TestCase_46
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_46(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_46 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "a" * 100000)
            @Expect("assertion#2155: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_46 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_4700
     * @tc.name      : TestCase_47
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_47(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_47 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "a" * 100000)
            @Expect("assertion#2156: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_47 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_4800
     * @tc.name      : TestCase_48
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_48(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_48 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#2157: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_48 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_4900
     * @tc.name      : TestCase_49
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_49(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_49 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#2158: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_49 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_5000
     * @tc.name      : TestCase_50
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being true, autoSync being false, storeId being a,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_50(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_50 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#2159: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_50 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_5100
     * @tc.name      : TestCase_51
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_51(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_51 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "")
            @Expect("assertion#2160: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_51 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_5200
     * @tc.name      : TestCase_52
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_52(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_52 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "")
            @Expect("assertion#2161: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_52 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_5300
     * @tc.name      : TestCase_53
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_53(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_53 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "")
            @Expect("assertion#2162: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_53 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_5400
     * @tc.name      : TestCase_54
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_54(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_54 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "")
            @Expect("assertion#2163: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_54 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_5500
     * @tc.name      : TestCase_55
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being ,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_55(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_55 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "")
            @Expect("assertion#2164: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_55 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_5600
     * @tc.name      : TestCase_56
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_56(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_56 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "\0")
            @Expect("assertion#2165: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_56 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_5700
     * @tc.name      : TestCase_57
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_57(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_57 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "\0")
            @Expect("assertion#2166: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_57 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_5800
     * @tc.name      : TestCase_58
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_58(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_58 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "\0")
            @Expect("assertion#2167: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_58 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_5900
     * @tc.name      : TestCase_59
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_59(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_59 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "\0")
            @Expect("assertion#2168: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_59 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_6000
     * @tc.name      : TestCase_60
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being \0,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_60(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_60 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "\0")
            @Expect("assertion#2169: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_60 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_6100
     * @tc.name      : TestCase_61
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_61(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_61 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "#$%^&")
            @Expect("assertion#2170: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_61 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_6200
     * @tc.name      : TestCase_62
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_62(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_62 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "#$%^&")
            @Expect("assertion#2171: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_62 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_6300
     * @tc.name      : TestCase_63
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_63(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_63 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "#$%^&")
            @Expect("assertion#2172: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_63 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_6400
     * @tc.name      : TestCase_64
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_64(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_64 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "#$%^&")
            @Expect("assertion#2173: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_64 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_6500
     * @tc.name      : TestCase_65
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being #$%^&,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_65(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_65 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#2174: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_65 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_6600
     * @tc.name      : TestCase_66
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being zpsABC,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_66(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_66 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "zpsABC")
            @Expect("assertion#2175: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_66 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_6700
     * @tc.name      : TestCase_67
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being zpsABC,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_67(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_67 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "zpsABC")
            @Expect("assertion#2176: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_67 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_6800
     * @tc.name      : TestCase_68
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being zpsABC,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_68(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_68 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "zpsABC")
            @Expect("assertion#2177: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Not found.")
            @Expect(e.code, 15100004i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_68 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_7000
     * @tc.name      : TestCase_70
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being zpsABC,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_70(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_70 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#2178: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_70 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_7100
     * @tc.name      : TestCase_71
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_71(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_71 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "a" * 100000)
            @Expect("assertion#2179: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_71 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_7200
     * @tc.name      : TestCase_72
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_72(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_72 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "a" * 100000)
            @Expect("assertion#2180: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_72 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_7300
     * @tc.name      : TestCase_73
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_73(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_73 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#2181: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_73 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_7400
     * @tc.name      : TestCase_74
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_74(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_74 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#2182: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_74 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_7500
     * @tc.name      : TestCase_75
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being true, storeId being a,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_75(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_75 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#2183: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_75 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_7600
     * @tc.name      : TestCase_76
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_76(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_76 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "")
            @Expect("assertion#2184: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_76 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_7700
     * @tc.name      : TestCase_77
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_77(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_77 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "")
            @Expect("assertion#2185: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_77 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_7800
     * @tc.name      : TestCase_78
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_78(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_78 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "")
            @Expect("assertion#2186: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_78 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_7900
     * @tc.name      : TestCase_79
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_79(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_79 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "")
            @Expect("assertion#2187: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_79 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_8000
     * @tc.name      : TestCase_80
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being ,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_80(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_80 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "")
            @Expect("assertion#2188: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_80 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_8100
     * @tc.name      : TestCase_81
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_81(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_81 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "\0")
            @Expect("assertion#2189: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_81 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_8200
     * @tc.name      : TestCase_82
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_82(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_82 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "\0")
            @Expect("assertion#2190: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_82 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_8300
     * @tc.name      : TestCase_83
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_83(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_83 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "\0")
            @Expect("assertion#2191: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_83 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_8400
     * @tc.name      : TestCase_84
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_84(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_84 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "\0")
            @Expect("assertion#2192: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_84 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_8500
     * @tc.name      : TestCase_85
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being \0,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_85(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_85 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "\0")
            @Expect("assertion#2193: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_85 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_8600
     * @tc.name      : TestCase_86
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_86(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_86 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "#$%^&")
            @Expect("assertion#2194: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_86 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_8700
     * @tc.name      : TestCase_87
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_87(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_87 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "#$%^&")
            @Expect("assertion#2195: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_87 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_8800
     * @tc.name      : TestCase_88
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_88(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_88 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "#$%^&")
            @Expect("assertion#2196: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_88 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_8900
     * @tc.name      : TestCase_89
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_89(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_89 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "#$%^&")
            @Expect("assertion#2197: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_89 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_9000
     * @tc.name      : TestCase_90
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being #$%^&,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_90(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_90 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#2198: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_90 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_9100
     * @tc.name      : TestCase_91
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_91(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_91 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "zpsABC")
            @Expect("assertion#2199: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_91 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_9200
     * @tc.name      : TestCase_92
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_92(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_92 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "zpsABC")
            @Expect("assertion#2200: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_92 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_9300
     * @tc.name      : TestCase_93
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_93(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_93 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "zpsABC")
            @Expect("assertion#2201: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Not found.")
            @Expect(e.code, 15100004i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_93 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_9500
     * @tc.name      : TestCase_95
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC,appId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_95(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_95 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#2202: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_95 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_9600
     * @tc.name      : TestCase_96
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a,appId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_96(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_96 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("", "a" * 100000)
            @Expect("assertion#2203: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_96 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_9700
     * @tc.name      : TestCase_97
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a,appId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_97(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_97 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("\0", "a" * 100000)
            @Expect("assertion#2204: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_97 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_9800
     * @tc.name      : TestCase_98
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a,appId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_98(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_98 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#2205: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_98 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_deleteKVStore_9900
     * @tc.name      : TestCase_99
     * @tc.desc      : delete kv store faild with securityLevel being SecurityLevel.S1, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a,appId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_99(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_99 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to delete kv store.")
        try {
            kvManager.deleteKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#2206: not throw", "fail to delete kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager deleteKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_99 ends.")
    }
}
