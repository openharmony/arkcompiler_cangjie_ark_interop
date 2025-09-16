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
class testSubscribe_60 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_177100
     * @tc.name      : TestCase_1771
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key127", ValueType.FLOAT64(-1.000000f64)), ("key128", ValueType.FLOAT64(-1.000000f64)), ("key129", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1771(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1771 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1618: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1771 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_177200
     * @tc.name      : TestCase_1772
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key130", ValueType.FLOAT64(-1.000000f64)), ("key131", ValueType.FLOAT64(-1.000000f64)), ("key132", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1772(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1772 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1619: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1772 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_177300
     * @tc.name      : TestCase_1773
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key133", ValueType.FLOAT64(-1.000000f64)), ("key134", ValueType.FLOAT64(-1.000000f64)), ("key135", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1773(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1773 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1620: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1773 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_177400
     * @tc.name      : TestCase_1774
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key136", ValueType.FLOAT64(-1.000000f64)), ("key137", ValueType.FLOAT64(-1.000000f64)), ("key138", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1774(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1774 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1621: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1774 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_177500
     * @tc.name      : TestCase_1775
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key139", ValueType.FLOAT64(-1.000000f64)), ("key140", ValueType.FLOAT64(-1.000000f64)), ("key141", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1775(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1775 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1622: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1775 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_177600
     * @tc.name      : TestCase_1776
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key142", ValueType.FLOAT64(-1.000000f64)), ("key143", ValueType.FLOAT64(-1.000000f64)), ("key144", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1776(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1776 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1623: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1776 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_177700
     * @tc.name      : TestCase_1777
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key145", ValueType.FLOAT64(-1.000000f64)), ("key146", ValueType.STRING("hello world")), ("key147", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1777(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1777 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1624: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1777 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_177800
     * @tc.name      : TestCase_1778
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key148", ValueType.FLOAT64(-1.000000f64)), ("key149", ValueType.STRING("hello world")), ("key150", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1778(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1778 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1625: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1778 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_177900
     * @tc.name      : TestCase_1779
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key151", ValueType.FLOAT64(-1.000000f64)), ("key152", ValueType.STRING("hello world")), ("key153", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1779(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1779 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1626: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1779 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_178000
     * @tc.name      : TestCase_1780
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key154", ValueType.FLOAT64(-1.000000f64)), ("key155", ValueType.STRING("hello world")), ("key156", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1780(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1780 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1627: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1780 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_178100
     * @tc.name      : TestCase_1781
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key157", ValueType.FLOAT64(-1.000000f64)), ("key158", ValueType.STRING("hello world")), ("key159", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1781(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1781 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1628: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1781 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_178200
     * @tc.name      : TestCase_1782
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key160", ValueType.FLOAT64(-1.000000f64)), ("key161", ValueType.STRING("hello world")), ("key162", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1782(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1782 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1629: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1782 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_178300
     * @tc.name      : TestCase_1783
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key163", ValueType.FLOAT64(-1.000000f64)), ("key164", ValueType.BOOL(true)), ("key165", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1783(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1783 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1630: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1783 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_178400
     * @tc.name      : TestCase_1784
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key166", ValueType.FLOAT64(-1.000000f64)), ("key167", ValueType.BOOL(true)), ("key168", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1784(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1784 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1631: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1784 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_178500
     * @tc.name      : TestCase_1785
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key169", ValueType.FLOAT64(-1.000000f64)), ("key170", ValueType.BOOL(true)), ("key171", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1785(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1785 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1632: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1785 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_178600
     * @tc.name      : TestCase_1786
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key172", ValueType.FLOAT64(-1.000000f64)), ("key173", ValueType.BOOL(true)), ("key174", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1786(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1786 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1633: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1786 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_178700
     * @tc.name      : TestCase_1787
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key175", ValueType.FLOAT64(-1.000000f64)), ("key176", ValueType.BOOL(true)), ("key177", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1787(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1787 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1634: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1787 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_178800
     * @tc.name      : TestCase_1788
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key178", ValueType.FLOAT64(-1.000000f64)), ("key179", ValueType.BOOL(true)), ("key180", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1788(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1788 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1635: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1788 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_178900
     * @tc.name      : TestCase_1789
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key181", ValueType.FLOAT64(-1.000000f64)), ("key182", ValueType.FD(1i32)), ("key183", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1789(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1789 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1636: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1789 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_179000
     * @tc.name      : TestCase_1790
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key184", ValueType.FLOAT64(-1.000000f64)), ("key185", ValueType.FD(1i32)), ("key186", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1790(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1790 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1637: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1790 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_179100
     * @tc.name      : TestCase_1791
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key187", ValueType.FLOAT64(-1.000000f64)), ("key188", ValueType.FD(1i32)), ("key189", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1791(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1791 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1638: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1791 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_179200
     * @tc.name      : TestCase_1792
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key190", ValueType.FLOAT64(-1.000000f64)), ("key191", ValueType.FD(1i32)), ("key192", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1792(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1792 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1639: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1792 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_179300
     * @tc.name      : TestCase_1793
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key193", ValueType.FLOAT64(-1.000000f64)), ("key194", ValueType.FD(1i32)), ("key195", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1793(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1793 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1640: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1793 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_179400
     * @tc.name      : TestCase_1794
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key196", ValueType.FLOAT64(-1.000000f64)), ("key197", ValueType.FD(1i32)), ("key198", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1794(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1794 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1641: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1794 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_179500
     * @tc.name      : TestCase_1795
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key199", ValueType.FLOAT64(-1.000000f64)), ("key200", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key201", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1795(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1795 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1642: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1795 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_179600
     * @tc.name      : TestCase_1796
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key202", ValueType.FLOAT64(-1.000000f64)), ("key203", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key204", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1796(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1796 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1643: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1796 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_179700
     * @tc.name      : TestCase_1797
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key205", ValueType.FLOAT64(-1.000000f64)), ("key206", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key207", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1797(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1797 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1644: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1797 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_179800
     * @tc.name      : TestCase_1798
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key208", ValueType.FLOAT64(-1.000000f64)), ("key209", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key210", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1798(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1798 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1645: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1798 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_179900
     * @tc.name      : TestCase_1799
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key211", ValueType.FLOAT64(-1.000000f64)), ("key212", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key213", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1799(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1799 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1646: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1799 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_180000
     * @tc.name      : TestCase_1800
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key214", ValueType.FLOAT64(-1.000000f64)), ("key215", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key216", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1800(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1800 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1647: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1800 ends.")
    }
}
