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
class testSubscribe_16 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_45100
     * @tc.name      : TestCase_451
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key55", ValueType.INT(-1i32)), ("key56", ValueType.BOOL(true)), ("key57", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_451(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_451 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#298: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_451 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_45200
     * @tc.name      : TestCase_452
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key58", ValueType.INT(-1i32)), ("key59", ValueType.BOOL(true)), ("key60", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_452(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_452 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#299: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_452 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_45300
     * @tc.name      : TestCase_453
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key61", ValueType.INT(-1i32)), ("key62", ValueType.BOOL(true)), ("key63", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_453(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_453 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#300: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_453 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_45400
     * @tc.name      : TestCase_454
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key64", ValueType.INT(-1i32)), ("key65", ValueType.BOOL(true)), ("key66", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_454(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_454 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#301: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_454 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_45500
     * @tc.name      : TestCase_455
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key67", ValueType.INT(-1i32)), ("key68", ValueType.BOOL(true)), ("key69", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_455(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_455 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#302: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_455 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_45600
     * @tc.name      : TestCase_456
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key70", ValueType.INT(-1i32)), ("key71", ValueType.BOOL(true)), ("key72", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_456(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_456 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#303: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_456 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_45700
     * @tc.name      : TestCase_457
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key73", ValueType.INT(-1i32)), ("key74", ValueType.FD(1i32)), ("key75", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_457(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_457 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#304: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_457 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_45800
     * @tc.name      : TestCase_458
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key76", ValueType.INT(-1i32)), ("key77", ValueType.FD(1i32)), ("key78", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_458(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_458 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#305: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_458 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_45900
     * @tc.name      : TestCase_459
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key79", ValueType.INT(-1i32)), ("key80", ValueType.FD(1i32)), ("key81", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_459(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_459 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#306: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_459 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_46000
     * @tc.name      : TestCase_460
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key82", ValueType.INT(-1i32)), ("key83", ValueType.FD(1i32)), ("key84", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_460(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_460 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#307: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_460 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_46100
     * @tc.name      : TestCase_461
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key85", ValueType.INT(-1i32)), ("key86", ValueType.FD(1i32)), ("key87", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_461(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_461 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#308: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_461 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_46200
     * @tc.name      : TestCase_462
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key88", ValueType.INT(-1i32)), ("key89", ValueType.FD(1i32)), ("key90", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_462(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_462 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#309: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_462 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_46300
     * @tc.name      : TestCase_463
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key91", ValueType.INT(-1i32)), ("key92", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key93", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_463(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_463 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#310: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_463 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_46400
     * @tc.name      : TestCase_464
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key94", ValueType.INT(-1i32)), ("key95", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key96", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_464(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_464 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#311: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_464 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_46500
     * @tc.name      : TestCase_465
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key97", ValueType.INT(-1i32)), ("key98", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key99", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_465(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_465 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#312: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_465 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_46600
     * @tc.name      : TestCase_466
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key100", ValueType.INT(-1i32)), ("key101", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key102", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_466(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_466 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#313: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_466 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_46700
     * @tc.name      : TestCase_467
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key103", ValueType.INT(-1i32)), ("key104", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key105", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_467(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_467 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#314: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_467 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_46800
     * @tc.name      : TestCase_468
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key106", ValueType.INT(-1i32)), ("key107", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key108", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_468(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_468 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#315: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_468 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_46900
     * @tc.name      : TestCase_469
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key109", ValueType.FLOAT64(-1.000000f64)), ("key110", ValueType.INT(-1i32)), ("key111", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_469(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_469 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#316: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_469 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_47000
     * @tc.name      : TestCase_470
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key112", ValueType.FLOAT64(-1.000000f64)), ("key113", ValueType.INT(-1i32)), ("key114", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_470(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_470 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#317: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_470 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_47100
     * @tc.name      : TestCase_471
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key115", ValueType.FLOAT64(-1.000000f64)), ("key116", ValueType.INT(-1i32)), ("key117", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_471(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_471 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#318: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_471 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_47200
     * @tc.name      : TestCase_472
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key118", ValueType.FLOAT64(-1.000000f64)), ("key119", ValueType.INT(-1i32)), ("key120", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_472(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_472 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#319: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_472 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_47300
     * @tc.name      : TestCase_473
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key121", ValueType.FLOAT64(-1.000000f64)), ("key122", ValueType.INT(-1i32)), ("key123", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_473(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_473 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#320: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_473 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_47400
     * @tc.name      : TestCase_474
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key124", ValueType.FLOAT64(-1.000000f64)), ("key125", ValueType.INT(-1i32)), ("key126", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_474(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_474 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#321: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_474 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_47500
     * @tc.name      : TestCase_475
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key127", ValueType.FLOAT64(-1.000000f64)), ("key128", ValueType.FLOAT64(-1.000000f64)), ("key129", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_475(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_475 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#322: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_475 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_47600
     * @tc.name      : TestCase_476
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key130", ValueType.FLOAT64(-1.000000f64)), ("key131", ValueType.FLOAT64(-1.000000f64)), ("key132", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_476(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_476 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#323: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_476 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_47700
     * @tc.name      : TestCase_477
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key133", ValueType.FLOAT64(-1.000000f64)), ("key134", ValueType.FLOAT64(-1.000000f64)), ("key135", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_477(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_477 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#324: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_477 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_47800
     * @tc.name      : TestCase_478
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key136", ValueType.FLOAT64(-1.000000f64)), ("key137", ValueType.FLOAT64(-1.000000f64)), ("key138", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_478(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_478 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#325: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_478 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_47900
     * @tc.name      : TestCase_479
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key139", ValueType.FLOAT64(-1.000000f64)), ("key140", ValueType.FLOAT64(-1.000000f64)), ("key141", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_479(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_479 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#326: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_479 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_48000
     * @tc.name      : TestCase_480
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key142", ValueType.FLOAT64(-1.000000f64)), ("key143", ValueType.FLOAT64(-1.000000f64)), ("key144", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_480(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_480 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#327: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_480 ends.")
    }
}
