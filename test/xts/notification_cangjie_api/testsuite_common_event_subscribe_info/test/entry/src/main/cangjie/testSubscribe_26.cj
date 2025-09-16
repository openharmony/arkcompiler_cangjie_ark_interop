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
class testSubscribe_26 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_75100
     * @tc.name      : TestCase_751
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key307", ValueType.STRING("hello world")), ("key308", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key309", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_751(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_751 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#598: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_751 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_75200
     * @tc.name      : TestCase_752
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key310", ValueType.STRING("hello world")), ("key311", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key312", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_752(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_752 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#599: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_752 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_75300
     * @tc.name      : TestCase_753
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key313", ValueType.STRING("hello world")), ("key314", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key315", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_753(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_753 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#600: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_753 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_75400
     * @tc.name      : TestCase_754
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key316", ValueType.STRING("hello world")), ("key317", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key318", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_754(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_754 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#601: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_754 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_75500
     * @tc.name      : TestCase_755
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key319", ValueType.STRING("hello world")), ("key320", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key321", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_755(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_755 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#602: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_755 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_75600
     * @tc.name      : TestCase_756
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key322", ValueType.STRING("hello world")), ("key323", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key324", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_756(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_756 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#603: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_756 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_75700
     * @tc.name      : TestCase_757
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key325", ValueType.BOOL(true)), ("key326", ValueType.INT(-1i32)), ("key327", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_757(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_757 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#604: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_757 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_75800
     * @tc.name      : TestCase_758
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key328", ValueType.BOOL(true)), ("key329", ValueType.INT(-1i32)), ("key330", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_758(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_758 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#605: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_758 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_75900
     * @tc.name      : TestCase_759
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key331", ValueType.BOOL(true)), ("key332", ValueType.INT(-1i32)), ("key333", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_759(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_759 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#606: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_759 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_76000
     * @tc.name      : TestCase_760
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key334", ValueType.BOOL(true)), ("key335", ValueType.INT(-1i32)), ("key336", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_760(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_760 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#607: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_760 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_76100
     * @tc.name      : TestCase_761
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key337", ValueType.BOOL(true)), ("key338", ValueType.INT(-1i32)), ("key339", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_761(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_761 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#608: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_761 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_76200
     * @tc.name      : TestCase_762
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key340", ValueType.BOOL(true)), ("key341", ValueType.INT(-1i32)), ("key342", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_762(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_762 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#609: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_762 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_76300
     * @tc.name      : TestCase_763
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key343", ValueType.BOOL(true)), ("key344", ValueType.FLOAT64(-1.000000f64)), ("key345", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_763(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_763 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#610: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_763 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_76400
     * @tc.name      : TestCase_764
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key346", ValueType.BOOL(true)), ("key347", ValueType.FLOAT64(-1.000000f64)), ("key348", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_764(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_764 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#611: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_764 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_76500
     * @tc.name      : TestCase_765
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key349", ValueType.BOOL(true)), ("key350", ValueType.FLOAT64(-1.000000f64)), ("key351", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_765(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_765 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#612: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_765 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_76600
     * @tc.name      : TestCase_766
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key352", ValueType.BOOL(true)), ("key353", ValueType.FLOAT64(-1.000000f64)), ("key354", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_766(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_766 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#613: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_766 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_76700
     * @tc.name      : TestCase_767
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key355", ValueType.BOOL(true)), ("key356", ValueType.FLOAT64(-1.000000f64)), ("key357", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_767(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_767 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#614: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_767 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_76800
     * @tc.name      : TestCase_768
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key358", ValueType.BOOL(true)), ("key359", ValueType.FLOAT64(-1.000000f64)), ("key360", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_768(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_768 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#615: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_768 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_76900
     * @tc.name      : TestCase_769
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key361", ValueType.BOOL(true)), ("key362", ValueType.STRING("hello world")), ("key363", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_769(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_769 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#616: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_769 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_77000
     * @tc.name      : TestCase_770
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key364", ValueType.BOOL(true)), ("key365", ValueType.STRING("hello world")), ("key366", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_770(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_770 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#617: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_770 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_77100
     * @tc.name      : TestCase_771
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key367", ValueType.BOOL(true)), ("key368", ValueType.STRING("hello world")), ("key369", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_771(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_771 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#618: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_771 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_77200
     * @tc.name      : TestCase_772
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key370", ValueType.BOOL(true)), ("key371", ValueType.STRING("hello world")), ("key372", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_772(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_772 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#619: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_772 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_77300
     * @tc.name      : TestCase_773
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key373", ValueType.BOOL(true)), ("key374", ValueType.STRING("hello world")), ("key375", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_773(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_773 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#620: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_773 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_77400
     * @tc.name      : TestCase_774
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key376", ValueType.BOOL(true)), ("key377", ValueType.STRING("hello world")), ("key378", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_774(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_774 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#621: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_774 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_77500
     * @tc.name      : TestCase_775
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key379", ValueType.BOOL(true)), ("key380", ValueType.BOOL(true)), ("key381", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_775(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_775 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#622: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_775 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_77600
     * @tc.name      : TestCase_776
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key382", ValueType.BOOL(true)), ("key383", ValueType.BOOL(true)), ("key384", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_776(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_776 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#623: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_776 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_77700
     * @tc.name      : TestCase_777
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key385", ValueType.BOOL(true)), ("key386", ValueType.BOOL(true)), ("key387", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_777(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_777 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#624: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_777 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_77800
     * @tc.name      : TestCase_778
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key388", ValueType.BOOL(true)), ("key389", ValueType.BOOL(true)), ("key390", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_778(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_778 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#625: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_778 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_77900
     * @tc.name      : TestCase_779
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key391", ValueType.BOOL(true)), ("key392", ValueType.BOOL(true)), ("key393", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_779(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_779 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#626: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_779 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_78000
     * @tc.name      : TestCase_780
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key394", ValueType.BOOL(true)), ("key395", ValueType.BOOL(true)), ("key396", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_780(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_780 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#627: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_780 ends.")
    }
}
