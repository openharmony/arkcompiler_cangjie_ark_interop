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
class testSubscribe_24 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_69100
     * @tc.name      : TestCase_691
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key127", ValueType.FLOAT64(-1.000000f64)), ("key128", ValueType.FLOAT64(-1.000000f64)), ("key129", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_691(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_691 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#538: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_691 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_69200
     * @tc.name      : TestCase_692
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key130", ValueType.FLOAT64(-1.000000f64)), ("key131", ValueType.FLOAT64(-1.000000f64)), ("key132", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_692(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_692 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#539: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_692 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_69300
     * @tc.name      : TestCase_693
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key133", ValueType.FLOAT64(-1.000000f64)), ("key134", ValueType.FLOAT64(-1.000000f64)), ("key135", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_693(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_693 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#540: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_693 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_69400
     * @tc.name      : TestCase_694
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key136", ValueType.FLOAT64(-1.000000f64)), ("key137", ValueType.FLOAT64(-1.000000f64)), ("key138", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_694(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_694 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#541: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_694 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_69500
     * @tc.name      : TestCase_695
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key139", ValueType.FLOAT64(-1.000000f64)), ("key140", ValueType.FLOAT64(-1.000000f64)), ("key141", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_695(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_695 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#542: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_695 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_69600
     * @tc.name      : TestCase_696
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key142", ValueType.FLOAT64(-1.000000f64)), ("key143", ValueType.FLOAT64(-1.000000f64)), ("key144", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_696(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_696 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#543: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_696 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_69700
     * @tc.name      : TestCase_697
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key145", ValueType.FLOAT64(-1.000000f64)), ("key146", ValueType.STRING("hello world")), ("key147", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_697(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_697 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#544: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_697 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_69800
     * @tc.name      : TestCase_698
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key148", ValueType.FLOAT64(-1.000000f64)), ("key149", ValueType.STRING("hello world")), ("key150", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_698(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_698 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#545: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_698 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_69900
     * @tc.name      : TestCase_699
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key151", ValueType.FLOAT64(-1.000000f64)), ("key152", ValueType.STRING("hello world")), ("key153", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_699(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_699 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#546: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_699 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_70000
     * @tc.name      : TestCase_700
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key154", ValueType.FLOAT64(-1.000000f64)), ("key155", ValueType.STRING("hello world")), ("key156", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_700(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_700 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#547: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_700 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_70100
     * @tc.name      : TestCase_701
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key157", ValueType.FLOAT64(-1.000000f64)), ("key158", ValueType.STRING("hello world")), ("key159", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_701(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_701 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#548: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_701 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_70200
     * @tc.name      : TestCase_702
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key160", ValueType.FLOAT64(-1.000000f64)), ("key161", ValueType.STRING("hello world")), ("key162", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_702(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_702 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#549: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_702 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_70300
     * @tc.name      : TestCase_703
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key163", ValueType.FLOAT64(-1.000000f64)), ("key164", ValueType.BOOL(true)), ("key165", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_703(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_703 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#550: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_703 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_70400
     * @tc.name      : TestCase_704
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key166", ValueType.FLOAT64(-1.000000f64)), ("key167", ValueType.BOOL(true)), ("key168", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_704(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_704 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#551: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_704 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_70500
     * @tc.name      : TestCase_705
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key169", ValueType.FLOAT64(-1.000000f64)), ("key170", ValueType.BOOL(true)), ("key171", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_705(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_705 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#552: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_705 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_70600
     * @tc.name      : TestCase_706
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key172", ValueType.FLOAT64(-1.000000f64)), ("key173", ValueType.BOOL(true)), ("key174", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_706(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_706 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#553: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_706 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_70700
     * @tc.name      : TestCase_707
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key175", ValueType.FLOAT64(-1.000000f64)), ("key176", ValueType.BOOL(true)), ("key177", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_707(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_707 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#554: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_707 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_70800
     * @tc.name      : TestCase_708
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key178", ValueType.FLOAT64(-1.000000f64)), ("key179", ValueType.BOOL(true)), ("key180", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_708(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_708 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#555: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_708 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_70900
     * @tc.name      : TestCase_709
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key181", ValueType.FLOAT64(-1.000000f64)), ("key182", ValueType.FD(1i32)), ("key183", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_709(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_709 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#556: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_709 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_71000
     * @tc.name      : TestCase_710
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key184", ValueType.FLOAT64(-1.000000f64)), ("key185", ValueType.FD(1i32)), ("key186", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_710(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_710 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#557: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_710 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_71100
     * @tc.name      : TestCase_711
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key187", ValueType.FLOAT64(-1.000000f64)), ("key188", ValueType.FD(1i32)), ("key189", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_711(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_711 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#558: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_711 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_71200
     * @tc.name      : TestCase_712
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key190", ValueType.FLOAT64(-1.000000f64)), ("key191", ValueType.FD(1i32)), ("key192", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_712(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_712 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#559: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_712 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_71300
     * @tc.name      : TestCase_713
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key193", ValueType.FLOAT64(-1.000000f64)), ("key194", ValueType.FD(1i32)), ("key195", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_713(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_713 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#560: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_713 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_71400
     * @tc.name      : TestCase_714
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key196", ValueType.FLOAT64(-1.000000f64)), ("key197", ValueType.FD(1i32)), ("key198", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_714(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_714 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#561: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_714 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_71500
     * @tc.name      : TestCase_715
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key199", ValueType.FLOAT64(-1.000000f64)), ("key200", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key201", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_715(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_715 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#562: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_715 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_71600
     * @tc.name      : TestCase_716
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key202", ValueType.FLOAT64(-1.000000f64)), ("key203", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key204", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_716(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_716 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#563: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_716 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_71700
     * @tc.name      : TestCase_717
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key205", ValueType.FLOAT64(-1.000000f64)), ("key206", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key207", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_717(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_717 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#564: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_717 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_71800
     * @tc.name      : TestCase_718
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key208", ValueType.FLOAT64(-1.000000f64)), ("key209", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key210", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_718(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_718 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#565: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_718 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_71900
     * @tc.name      : TestCase_719
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key211", ValueType.FLOAT64(-1.000000f64)), ("key212", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key213", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_719(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_719 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#566: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_719 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_72000
     * @tc.name      : TestCase_720
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key214", ValueType.FLOAT64(-1.000000f64)), ("key215", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key216", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_720(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_720 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#567: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_720 ends.")
    }
}
