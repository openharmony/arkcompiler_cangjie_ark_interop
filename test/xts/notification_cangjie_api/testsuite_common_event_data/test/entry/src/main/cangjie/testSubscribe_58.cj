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
class testSubscribe_58 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_171100
     * @tc.name      : TestCase_1711
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key595", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key596", ValueType.BOOL(true)), ("key597", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1711(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1711 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1558: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1711 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_171200
     * @tc.name      : TestCase_1712
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key598", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key599", ValueType.BOOL(true)), ("key600", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1712(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1712 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1559: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1712 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_171300
     * @tc.name      : TestCase_1713
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key601", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key602", ValueType.BOOL(true)), ("key603", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1713(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1713 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1560: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1713 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_171400
     * @tc.name      : TestCase_1714
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key604", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key605", ValueType.BOOL(true)), ("key606", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1714(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1714 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1561: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1714 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_171500
     * @tc.name      : TestCase_1715
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key607", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key608", ValueType.BOOL(true)), ("key609", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1715(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1715 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1562: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1715 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_171600
     * @tc.name      : TestCase_1716
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key610", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key611", ValueType.BOOL(true)), ("key612", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1716(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1716 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1563: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1716 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_171700
     * @tc.name      : TestCase_1717
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key613", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key614", ValueType.FD(1i32)), ("key615", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1717(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1717 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1564: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1717 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_171800
     * @tc.name      : TestCase_1718
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key616", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key617", ValueType.FD(1i32)), ("key618", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1718(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1718 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1565: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1718 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_171900
     * @tc.name      : TestCase_1719
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key619", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key620", ValueType.FD(1i32)), ("key621", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1719(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1719 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1566: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1719 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_172000
     * @tc.name      : TestCase_1720
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key622", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key623", ValueType.FD(1i32)), ("key624", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1720(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1720 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1567: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1720 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_172100
     * @tc.name      : TestCase_1721
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key625", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key626", ValueType.FD(1i32)), ("key627", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1721(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1721 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1568: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1721 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_172200
     * @tc.name      : TestCase_1722
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key628", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key629", ValueType.FD(1i32)), ("key630", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1722(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1722 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1569: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1722 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_172300
     * @tc.name      : TestCase_1723
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key631", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key632", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key633", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1723(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1723 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1570: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1723 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_172400
     * @tc.name      : TestCase_1724
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key634", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key635", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key636", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1724(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1724 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1571: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1724 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_172500
     * @tc.name      : TestCase_1725
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key637", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key638", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key639", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1725(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1725 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1572: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1725 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_172600
     * @tc.name      : TestCase_1726
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key640", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key641", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key642", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1726(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1726 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1573: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1726 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_172700
     * @tc.name      : TestCase_1727
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key643", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key644", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key645", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1727(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1727 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1574: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1727 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_172800
     * @tc.name      : TestCase_1728
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "1234567890", publisherDeviceId: "1234567890", userId: -1i32, priority: -1i32, publisherBundleName: "1234567890")"+ "CommonEventData("", "", -1i32, "", HashMap([("key646", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key647", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key648", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1728(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1728 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "1234567890", publisherDeviceId: "1234567890",
                    userId: -1i32, priority: -1i32, publisherBundleName: "1234567890"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1575: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1728 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_172900
     * @tc.name      : TestCase_1729
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key1", ValueType.INT(-1i32)), ("key2", ValueType.INT(-1i32)), ("key3", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1729(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1729 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1576: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1729 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_173000
     * @tc.name      : TestCase_1730
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("aaaa", "aaaa", 0i32, "aaaa", HashMap([("key4", ValueType.INT(-1i32)), ("key5", ValueType.INT(-1i32)), ("key6", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1730(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1730 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1577: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1730 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_173100
     * @tc.name      : TestCase_1731
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("#!$@$23", "#!$@$23", 1i32, " ", HashMap([("key7", ValueType.INT(-1i32)), ("key8", ValueType.INT(-1i32)), ("key9", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1731(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1731 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1578: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1731 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_173200
     * @tc.name      : TestCase_1732
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("reason", "reason", -1i32, "", HashMap([("key10", ValueType.INT(-1i32)), ("key11", ValueType.INT(-1i32)), ("key12", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1732(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1732 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1579: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1732 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_173300
     * @tc.name      : TestCase_1733
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("1234567890", "1234567890", -1i32, "", HashMap([("key13", ValueType.INT(-1i32)), ("key14", ValueType.INT(-1i32)), ("key15", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1733(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1733 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1580: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1733 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_173400
     * @tc.name      : TestCase_1734
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("!#$@%^&*", "!#$@%^&*", -1i32, "", HashMap([("key16", ValueType.INT(-1i32)), ("key17", ValueType.INT(-1i32)), ("key18", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1734(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1734 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1581: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1734 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_173500
     * @tc.name      : TestCase_1735
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key19", ValueType.INT(-1i32)), ("key20", ValueType.FLOAT64(-1.000000f64)), ("key21", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1735(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1735 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1582: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1735 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_173600
     * @tc.name      : TestCase_1736
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key22", ValueType.INT(-1i32)), ("key23", ValueType.FLOAT64(-1.000000f64)), ("key24", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1736(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1736 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1583: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1736 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_173700
     * @tc.name      : TestCase_1737
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key25", ValueType.INT(-1i32)), ("key26", ValueType.FLOAT64(-1.000000f64)), ("key27", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1737(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1737 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1584: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1737 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_173800
     * @tc.name      : TestCase_1738
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key28", ValueType.INT(-1i32)), ("key29", ValueType.FLOAT64(-1.000000f64)), ("key30", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1738(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1738 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1585: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1738 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_173900
     * @tc.name      : TestCase_1739
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key31", ValueType.INT(-1i32)), ("key32", ValueType.FLOAT64(-1.000000f64)), ("key33", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1739(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1739 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1586: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1739 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_174000
     * @tc.name      : TestCase_1740
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key34", ValueType.INT(-1i32)), ("key35", ValueType.FLOAT64(-1.000000f64)), ("key36", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1740(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1740 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1587: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1740 ends.")
    }
}
