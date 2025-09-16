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
import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.business_exception.BusinessException

@Test
class testSubscribe_17 {
    @BeforeAll
    func beforeAll() {
        Hilog.info(0u32, "cangjietest", "", "get user granted permission ohos.permission.COMMONEVENT_STICKY")
        try {
            getRequiredPermissions(["ohos.permission.COMMONEVENT_STICKY"])
            sleep(Duration.second * 1i64)
            click(at: Screen.getTheOnlyUiComponentWhoseTextEqualsTo("允许").centerPoint)
            sleep(Duration.second * 1i64)
        } catch (_: Exception) {
            Hilog.info(0u32, "cangjietest", "", "get user granted permission fail")
        }
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_48100
     * @tc.name      : TestCase_481
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key145", ValueType.FLOAT64(-1.000000f64)), ("key146", ValueType.STRING("hello world")), ("key147", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_481(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_481 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#328: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_481 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_48200
     * @tc.name      : TestCase_482
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key148", ValueType.FLOAT64(-1.000000f64)), ("key149", ValueType.STRING("hello world")), ("key150", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_482(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_482 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#329: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_482 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_48300
     * @tc.name      : TestCase_483
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key151", ValueType.FLOAT64(-1.000000f64)), ("key152", ValueType.STRING("hello world")), ("key153", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_483(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_483 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#330: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_483 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_48400
     * @tc.name      : TestCase_484
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key154", ValueType.FLOAT64(-1.000000f64)), ("key155", ValueType.STRING("hello world")), ("key156", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_484(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_484 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#331: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_484 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_48500
     * @tc.name      : TestCase_485
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key157", ValueType.FLOAT64(-1.000000f64)), ("key158", ValueType.STRING("hello world")), ("key159", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_485(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_485 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#332: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_485 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_48600
     * @tc.name      : TestCase_486
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key160", ValueType.FLOAT64(-1.000000f64)), ("key161", ValueType.STRING("hello world")), ("key162", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_486(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_486 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#333: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_486 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_48700
     * @tc.name      : TestCase_487
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key163", ValueType.FLOAT64(-1.000000f64)), ("key164", ValueType.BOOL(true)), ("key165", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_487(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_487 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#334: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_487 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_48800
     * @tc.name      : TestCase_488
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key166", ValueType.FLOAT64(-1.000000f64)), ("key167", ValueType.BOOL(true)), ("key168", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_488(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_488 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#335: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_488 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_48900
     * @tc.name      : TestCase_489
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key169", ValueType.FLOAT64(-1.000000f64)), ("key170", ValueType.BOOL(true)), ("key171", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_489(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_489 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#336: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_489 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_49000
     * @tc.name      : TestCase_490
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key172", ValueType.FLOAT64(-1.000000f64)), ("key173", ValueType.BOOL(true)), ("key174", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_490(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_490 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#337: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_490 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_49100
     * @tc.name      : TestCase_491
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key175", ValueType.FLOAT64(-1.000000f64)), ("key176", ValueType.BOOL(true)), ("key177", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_491(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_491 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#338: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_491 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_49200
     * @tc.name      : TestCase_492
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key178", ValueType.FLOAT64(-1.000000f64)), ("key179", ValueType.BOOL(true)), ("key180", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_492(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_492 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#339: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_492 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_49300
     * @tc.name      : TestCase_493
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key181", ValueType.FLOAT64(-1.000000f64)), ("key182", ValueType.FD(1i32)), ("key183", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_493(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_493 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#340: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_493 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_49400
     * @tc.name      : TestCase_494
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key184", ValueType.FLOAT64(-1.000000f64)), ("key185", ValueType.FD(1i32)), ("key186", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_494(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_494 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#341: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_494 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_49500
     * @tc.name      : TestCase_495
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key187", ValueType.FLOAT64(-1.000000f64)), ("key188", ValueType.FD(1i32)), ("key189", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_495(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_495 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#342: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_495 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_49600
     * @tc.name      : TestCase_496
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key190", ValueType.FLOAT64(-1.000000f64)), ("key191", ValueType.FD(1i32)), ("key192", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_496(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_496 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#343: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_496 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_49700
     * @tc.name      : TestCase_497
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key193", ValueType.FLOAT64(-1.000000f64)), ("key194", ValueType.FD(1i32)), ("key195", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_497(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_497 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#344: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_497 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_49800
     * @tc.name      : TestCase_498
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key196", ValueType.FLOAT64(-1.000000f64)), ("key197", ValueType.FD(1i32)), ("key198", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_498(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_498 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#345: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_498 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_49900
     * @tc.name      : TestCase_499
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key199", ValueType.FLOAT64(-1.000000f64)), ("key200", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key201", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_499(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_499 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#346: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_499 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_50000
     * @tc.name      : TestCase_500
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key202", ValueType.FLOAT64(-1.000000f64)), ("key203", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key204", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_500(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_500 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#347: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_500 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_50100
     * @tc.name      : TestCase_501
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key205", ValueType.FLOAT64(-1.000000f64)), ("key206", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key207", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_501(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_501 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#348: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_501 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_50200
     * @tc.name      : TestCase_502
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key208", ValueType.FLOAT64(-1.000000f64)), ("key209", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key210", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_502(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_502 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#349: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_502 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_50300
     * @tc.name      : TestCase_503
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key211", ValueType.FLOAT64(-1.000000f64)), ("key212", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key213", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_503(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_503 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#350: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_503 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_50400
     * @tc.name      : TestCase_504
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key214", ValueType.FLOAT64(-1.000000f64)), ("key215", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key216", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_504(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_504 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#351: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_504 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_50500
     * @tc.name      : TestCase_505
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key217", ValueType.STRING("hello world")), ("key218", ValueType.INT(-1i32)), ("key219", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_505(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_505 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#352: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_505 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_50600
     * @tc.name      : TestCase_506
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key220", ValueType.STRING("hello world")), ("key221", ValueType.INT(-1i32)), ("key222", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_506(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_506 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#353: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_506 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_50700
     * @tc.name      : TestCase_507
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key223", ValueType.STRING("hello world")), ("key224", ValueType.INT(-1i32)), ("key225", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_507(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_507 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#354: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_507 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_50800
     * @tc.name      : TestCase_508
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key226", ValueType.STRING("hello world")), ("key227", ValueType.INT(-1i32)), ("key228", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_508(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_508 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#355: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_508 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_50900
     * @tc.name      : TestCase_509
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key229", ValueType.STRING("hello world")), ("key230", ValueType.INT(-1i32)), ("key231", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_509(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_509 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#356: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_509 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_51000
     * @tc.name      : TestCase_510
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key232", ValueType.STRING("hello world")), ("key233", ValueType.INT(-1i32)), ("key234", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_510(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_510 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#357: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_510 ends.")
    }
}
