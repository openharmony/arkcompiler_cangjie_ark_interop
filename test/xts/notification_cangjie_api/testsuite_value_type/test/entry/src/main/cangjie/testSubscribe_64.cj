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
class testSubscribe_64 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_189100
     * @tc.name      : TestCase_1891
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key487", ValueType.FD(1i32)), ("key488", ValueType.BOOL(true)), ("key489", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1891(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1891 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1738: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1891 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_189200
     * @tc.name      : TestCase_1892
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key490", ValueType.FD(1i32)), ("key491", ValueType.BOOL(true)), ("key492", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1892(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1892 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1739: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1892 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_189300
     * @tc.name      : TestCase_1893
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key493", ValueType.FD(1i32)), ("key494", ValueType.BOOL(true)), ("key495", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1893(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1893 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1740: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1893 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_189400
     * @tc.name      : TestCase_1894
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key496", ValueType.FD(1i32)), ("key497", ValueType.BOOL(true)), ("key498", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1894(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1894 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1741: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1894 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_189500
     * @tc.name      : TestCase_1895
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key499", ValueType.FD(1i32)), ("key500", ValueType.BOOL(true)), ("key501", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1895(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1895 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1742: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1895 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_189600
     * @tc.name      : TestCase_1896
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key502", ValueType.FD(1i32)), ("key503", ValueType.BOOL(true)), ("key504", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1896(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1896 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1743: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1896 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_189700
     * @tc.name      : TestCase_1897
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key505", ValueType.FD(1i32)), ("key506", ValueType.FD(1i32)), ("key507", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1897(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1897 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1744: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1897 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_189800
     * @tc.name      : TestCase_1898
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key508", ValueType.FD(1i32)), ("key509", ValueType.FD(1i32)), ("key510", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1898(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1898 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1745: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1898 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_189900
     * @tc.name      : TestCase_1899
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key511", ValueType.FD(1i32)), ("key512", ValueType.FD(1i32)), ("key513", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1899(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1899 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1746: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1899 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_190000
     * @tc.name      : TestCase_1900
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key514", ValueType.FD(1i32)), ("key515", ValueType.FD(1i32)), ("key516", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1900(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1900 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1747: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1900 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_190100
     * @tc.name      : TestCase_1901
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key517", ValueType.FD(1i32)), ("key518", ValueType.FD(1i32)), ("key519", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1901(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1901 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1748: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1901 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_190200
     * @tc.name      : TestCase_1902
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key520", ValueType.FD(1i32)), ("key521", ValueType.FD(1i32)), ("key522", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1902(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1902 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1749: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1902 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_190300
     * @tc.name      : TestCase_1903
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key523", ValueType.FD(1i32)), ("key524", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key525", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1903(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1903 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1750: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1903 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_190400
     * @tc.name      : TestCase_1904
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key526", ValueType.FD(1i32)), ("key527", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key528", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1904(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1904 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1751: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1904 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_190500
     * @tc.name      : TestCase_1905
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key529", ValueType.FD(1i32)), ("key530", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key531", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1905(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1905 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1752: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1905 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_190600
     * @tc.name      : TestCase_1906
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key532", ValueType.FD(1i32)), ("key533", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key534", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1906(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1906 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1753: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1906 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_190700
     * @tc.name      : TestCase_1907
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key535", ValueType.FD(1i32)), ("key536", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key537", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1907(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1907 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1754: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1907 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_190800
     * @tc.name      : TestCase_1908
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key538", ValueType.FD(1i32)), ("key539", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key540", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1908(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1908 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1755: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1908 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_190900
     * @tc.name      : TestCase_1909
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key541", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key542", ValueType.INT(-1i32)), ("key543", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1909(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1909 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1756: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1909 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_191000
     * @tc.name      : TestCase_1910
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key544", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key545", ValueType.INT(-1i32)), ("key546", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1910(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1910 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1757: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1910 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_191100
     * @tc.name      : TestCase_1911
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key547", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key548", ValueType.INT(-1i32)), ("key549", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1911(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1911 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1758: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1911 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_191200
     * @tc.name      : TestCase_1912
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key550", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key551", ValueType.INT(-1i32)), ("key552", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1912(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1912 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1759: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1912 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_191300
     * @tc.name      : TestCase_1913
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key553", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key554", ValueType.INT(-1i32)), ("key555", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1913(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1913 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1760: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1913 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_191400
     * @tc.name      : TestCase_1914
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key556", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key557", ValueType.INT(-1i32)), ("key558", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1914(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1914 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1761: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1914 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_191500
     * @tc.name      : TestCase_1915
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key559", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key560", ValueType.FLOAT64(-1.000000f64)), ("key561", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1915(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1915 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1762: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1915 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_191600
     * @tc.name      : TestCase_1916
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key562", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key563", ValueType.FLOAT64(-1.000000f64)), ("key564", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1916(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1916 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1763: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1916 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_191700
     * @tc.name      : TestCase_1917
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key565", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key566", ValueType.FLOAT64(-1.000000f64)), ("key567", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1917(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1917 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1764: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1917 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_191800
     * @tc.name      : TestCase_1918
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key568", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key569", ValueType.FLOAT64(-1.000000f64)), ("key570", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1918(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1918 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1765: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1918 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_191900
     * @tc.name      : TestCase_1919
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key571", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key572", ValueType.FLOAT64(-1.000000f64)), ("key573", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1919(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1919 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1766: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1919 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_192000
     * @tc.name      : TestCase_1920
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key574", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key575", ValueType.FLOAT64(-1.000000f64)), ("key576", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1920(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1920 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1767: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1920 ends.")
    }
}
