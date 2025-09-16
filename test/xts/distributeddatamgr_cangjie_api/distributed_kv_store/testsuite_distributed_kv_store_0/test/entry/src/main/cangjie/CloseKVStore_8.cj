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
class CloseKVStore_8 {
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
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_69400
     * @tc.name      : TestCase_694
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_694(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_694 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "testcase TestCase_694 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_69500
     * @tc.name      : TestCase_695
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_695(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_695 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#3546: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_695 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_69600
     * @tc.name      : TestCase_696
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_696(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_696 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "a" * 100000)
            @Expect("assertion#3547: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_696 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_69700
     * @tc.name      : TestCase_697
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_697(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_697 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "a" * 100000)
            @Expect("assertion#3548: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_697 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_69800
     * @tc.name      : TestCase_698
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_698(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_698 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#3549: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_698 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_69900
     * @tc.name      : TestCase_699
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_699(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_699 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#3550: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_699 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_70000
     * @tc.name      : TestCase_700
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being true, backup being false, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_700(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_700 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#3551: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_700 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_70100
     * @tc.name      : TestCase_701
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_701(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_701 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "")
            @Expect("assertion#3552: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_701 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_70200
     * @tc.name      : TestCase_702
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_702(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_702 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "")
            @Expect("assertion#3553: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_702 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_70300
     * @tc.name      : TestCase_703
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_703(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_703 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "")
            @Expect("assertion#3554: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_703 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_70400
     * @tc.name      : TestCase_704
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_704(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_704 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "")
            @Expect("assertion#3555: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_704 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_70500
     * @tc.name      : TestCase_705
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_705(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_705 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "")
            @Expect("assertion#3556: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_705 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_70600
     * @tc.name      : TestCase_706
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_706(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_706 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "\0")
            @Expect("assertion#3557: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_706 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_70700
     * @tc.name      : TestCase_707
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_707(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_707 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "\0")
            @Expect("assertion#3558: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_707 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_70800
     * @tc.name      : TestCase_708
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_708(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_708 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "\0")
            @Expect("assertion#3559: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_708 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_70900
     * @tc.name      : TestCase_709
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_709(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_709 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "\0")
            @Expect("assertion#3560: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_709 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_71000
     * @tc.name      : TestCase_710
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_710(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_710 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "\0")
            @Expect("assertion#3561: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_710 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_71100
     * @tc.name      : TestCase_711
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_711(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_711 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "#$%^&")
            @Expect("assertion#3562: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_711 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_71200
     * @tc.name      : TestCase_712
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_712(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_712 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "#$%^&")
            @Expect("assertion#3563: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_712 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_71300
     * @tc.name      : TestCase_713
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_713(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_713 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "#$%^&")
            @Expect("assertion#3564: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_713 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_71400
     * @tc.name      : TestCase_714
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_714(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_714 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "#$%^&")
            @Expect("assertion#3565: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_714 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_71500
     * @tc.name      : TestCase_715
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_715(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_715 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#3566: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_715 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_71600
     * @tc.name      : TestCase_716
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_716(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_716 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "zpsABC")
            @Expect("assertion#3567: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_716 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_71700
     * @tc.name      : TestCase_717
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_717(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_717 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "zpsABC")
            @Expect("assertion#3568: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_717 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_71800
     * @tc.name      : TestCase_718
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_718(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_718 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "zpsABC")
        } catch (e: BusinessException) {
            @Expect(false)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_718 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_71900
     * @tc.name      : TestCase_719
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_719(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_719 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "testcase TestCase_719 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_72000
     * @tc.name      : TestCase_720
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_720(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_720 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#3570: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_720 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_72100
     * @tc.name      : TestCase_721
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_721(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_721 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "a" * 100000)
            @Expect("assertion#3571: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_721 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_72200
     * @tc.name      : TestCase_722
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_722(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_722 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "a" * 100000)
            @Expect("assertion#3572: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_722 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_72300
     * @tc.name      : TestCase_723
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_723(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_723 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#3573: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_723 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_72400
     * @tc.name      : TestCase_724
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_724(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_724 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#3574: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_724 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_72500
     * @tc.name      : TestCase_725
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_725(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_725 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#3575: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_725 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_72600
     * @tc.name      : TestCase_726
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_726(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_726 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "")
            @Expect("assertion#3576: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_726 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_72700
     * @tc.name      : TestCase_727
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_727(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_727 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "")
            @Expect("assertion#3577: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_727 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_72800
     * @tc.name      : TestCase_728
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_728(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_728 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "")
            @Expect("assertion#3578: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_728 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_72900
     * @tc.name      : TestCase_729
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_729(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_729 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "")
            @Expect("assertion#3579: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_729 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_73000
     * @tc.name      : TestCase_730
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_730(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_730 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "")
            @Expect("assertion#3580: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_730 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_73100
     * @tc.name      : TestCase_731
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_731(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_731 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "\0")
            @Expect("assertion#3581: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_731 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_73200
     * @tc.name      : TestCase_732
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_732(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_732 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "\0")
            @Expect("assertion#3582: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_732 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_73300
     * @tc.name      : TestCase_733
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_733(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_733 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "\0")
            @Expect("assertion#3583: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_733 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_73400
     * @tc.name      : TestCase_734
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_734(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_734 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "\0")
            @Expect("assertion#3584: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_734 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_73500
     * @tc.name      : TestCase_735
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_735(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_735 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "\0")
            @Expect("assertion#3585: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_735 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_73600
     * @tc.name      : TestCase_736
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_736(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_736 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "#$%^&")
            @Expect("assertion#3586: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_736 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_73700
     * @tc.name      : TestCase_737
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_737(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_737 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "#$%^&")
            @Expect("assertion#3587: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_737 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_73800
     * @tc.name      : TestCase_738
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_738(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_738 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "#$%^&")
            @Expect("assertion#3588: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_738 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_73900
     * @tc.name      : TestCase_739
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_739(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_739 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "#$%^&")
            @Expect("assertion#3589: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_739 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_74000
     * @tc.name      : TestCase_740
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_740(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_740 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#3590: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_740 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_74100
     * @tc.name      : TestCase_741
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_741(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_741 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "zpsABC")
            @Expect("assertion#3591: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_741 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_74200
     * @tc.name      : TestCase_742
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_742(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_742 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "zpsABC")
            @Expect("assertion#3592: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_742 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_74300
     * @tc.name      : TestCase_743
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_743(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_743 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "zpsABC")
        } catch (e: BusinessException) {
            @Expect(false)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_743 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_74400
     * @tc.name      : TestCase_744
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_744(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_744 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "testcase TestCase_744 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_74500
     * @tc.name      : TestCase_745
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_745(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_745 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#3594: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_745 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_74600
     * @tc.name      : TestCase_746
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_746(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_746 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "a" * 100000)
            @Expect("assertion#3595: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_746 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_74700
     * @tc.name      : TestCase_747
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_747(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_747 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "a" * 100000)
            @Expect("assertion#3596: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_747 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_74800
     * @tc.name      : TestCase_748
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_748(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_748 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#3597: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_748 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_74900
     * @tc.name      : TestCase_749
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_749(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_749 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#3598: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_749 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_75000
     * @tc.name      : TestCase_750
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being true, autoSync being false, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_750(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_750 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#3599: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_750 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_75100
     * @tc.name      : TestCase_751
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_751(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_751 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "")
            @Expect("assertion#3600: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_751 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_75200
     * @tc.name      : TestCase_752
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_752(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_752 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "")
            @Expect("assertion#3601: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_752 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_75300
     * @tc.name      : TestCase_753
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_753(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_753 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "")
            @Expect("assertion#3602: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_753 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_75400
     * @tc.name      : TestCase_754
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_754(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_754 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "")
            @Expect("assertion#3603: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_754 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_75500
     * @tc.name      : TestCase_755
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_755(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_755 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "")
            @Expect("assertion#3604: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_755 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_75600
     * @tc.name      : TestCase_756
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_756(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_756 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "\0")
            @Expect("assertion#3605: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_756 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_75700
     * @tc.name      : TestCase_757
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_757(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_757 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "\0")
            @Expect("assertion#3606: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_757 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_75800
     * @tc.name      : TestCase_758
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_758(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_758 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "\0")
            @Expect("assertion#3607: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_758 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_75900
     * @tc.name      : TestCase_759
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_759(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_759 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "\0")
            @Expect("assertion#3608: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_759 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_76000
     * @tc.name      : TestCase_760
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_760(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_760 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "\0")
            @Expect("assertion#3609: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_760 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_76100
     * @tc.name      : TestCase_761
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_761(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_761 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "#$%^&")
            @Expect("assertion#3610: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_761 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_76200
     * @tc.name      : TestCase_762
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_762(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_762 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "#$%^&")
            @Expect("assertion#3611: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_762 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_76300
     * @tc.name      : TestCase_763
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_763(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_763 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "#$%^&")
            @Expect("assertion#3612: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_763 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_76400
     * @tc.name      : TestCase_764
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_764(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_764 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "#$%^&")
            @Expect("assertion#3613: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_764 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_76500
     * @tc.name      : TestCase_765
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_765(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_765 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#3614: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_765 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_76600
     * @tc.name      : TestCase_766
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_766(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_766 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "zpsABC")
            @Expect("assertion#3615: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_766 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_76700
     * @tc.name      : TestCase_767
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_767(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_767 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "zpsABC")
            @Expect("assertion#3616: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_767 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_76800
     * @tc.name      : TestCase_768
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_768(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_768 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "zpsABC")
        } catch (e: BusinessException) {
            @Expect(false)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_768 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_76900
     * @tc.name      : TestCase_769
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_769(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_769 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "testcase TestCase_769 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_77000
     * @tc.name      : TestCase_770
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_770(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_770 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "zpsABC")
            @Expect("assertion#3618: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_770 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_77100
     * @tc.name      : TestCase_771
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_771(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_771 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "a" * 100000)
            @Expect("assertion#3619: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_771 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_77200
     * @tc.name      : TestCase_772
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_772(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_772 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "a" * 100000)
            @Expect("assertion#3620: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_772 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_77300
     * @tc.name      : TestCase_773
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_773(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_773 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "a" * 100000)
            @Expect("assertion#3621: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_773 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_77400
     * @tc.name      : TestCase_774
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_774(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_774 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "a" * 100000)
            @Expect("assertion#3622: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_774 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_77500
     * @tc.name      : TestCase_775
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being true, storeId being a
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_775(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_775 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "a" * 100000)
            @Expect("assertion#3623: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_775 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_77600
     * @tc.name      : TestCase_776
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_776(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_776 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "")
            @Expect("assertion#3624: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_776 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_77700
     * @tc.name      : TestCase_777
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_777(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_777 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "")
            @Expect("assertion#3625: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_777 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_77800
     * @tc.name      : TestCase_778
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_778(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_778 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "")
            @Expect("assertion#3626: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_778 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_77900
     * @tc.name      : TestCase_779
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_779(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_779 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "")
            @Expect("assertion#3627: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_779 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_78000
     * @tc.name      : TestCase_780
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_780(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_780 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "")
            @Expect("assertion#3628: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_780 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_78100
     * @tc.name      : TestCase_781
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_781(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_781 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "\0")
            @Expect("assertion#3629: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_781 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_78200
     * @tc.name      : TestCase_782
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_782(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_782 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "\0")
            @Expect("assertion#3630: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_782 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_78300
     * @tc.name      : TestCase_783
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_783(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_783 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "\0")
            @Expect("assertion#3631: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_783 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_78400
     * @tc.name      : TestCase_784
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_784(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_784 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "\0")
            @Expect("assertion#3632: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_784 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_78500
     * @tc.name      : TestCase_785
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being \0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_785(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_785 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "\0")
            @Expect("assertion#3633: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_785 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_78600
     * @tc.name      : TestCase_786
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_786(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_786 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "#$%^&")
            @Expect("assertion#3634: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_786 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_78700
     * @tc.name      : TestCase_787
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_787(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_787 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "#$%^&")
            @Expect("assertion#3635: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_787 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_78800
     * @tc.name      : TestCase_788
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_788(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_788 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("#$%^&", "#$%^&")
            @Expect("assertion#3636: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_788 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_78900
     * @tc.name      : TestCase_789
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_789(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_789 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("zpsABC", "#$%^&")
            @Expect("assertion#3637: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_789 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_79000
     * @tc.name      : TestCase_790
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being #$%^&
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_790(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_790 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("a" * 100000, "#$%^&")
            @Expect("assertion#3638: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_790 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_79100
     * @tc.name      : TestCase_791
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_791(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_791 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("", "zpsABC")
            @Expect("assertion#3639: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_791 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_distributed_kv_store_closeKVStore_79200
     * @tc.name      : TestCase_792
     * @tc.desc      : close kv store successfully with securityLevel being SecurityLevel.S4, createIfMissing being true, encrypt being false, backup being false, autoSync being false, storeId being zpsABC
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func TestCase_792(): Unit {
        Hilog.info(0, "cangjietest", "testcase TestCase_792 begins.")
        Hilog.info(0, "cangjietest", "define local variable kvManager")
        let kvManager = DistributedKVStore.createKVManager(
            KVManagerConfig(getAbilityContext(), "com.example.myapplication"))
        Hilog.info(0, "cangjietest", "fail to close kv store.")
        try {
            kvManager.closeKVStore("\0", "zpsABC")
            @Expect("assertion#3640: not throw", "fail to close kv store.")
        } catch (e: BusinessException) {
            @Expect(e.message, "KVManager closeKVStore failed: Parameter error. Parameter verification failed.")
            @Expect(e.code, 401i32)
        }
        Hilog.info(0, "cangjietest", "testcase TestCase_792 ends.")
    }
}
