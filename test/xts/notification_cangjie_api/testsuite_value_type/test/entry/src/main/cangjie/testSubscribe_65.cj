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
class testSubscribe_65 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_192100
     * @tc.name      : TestCase_1921
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key577", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key578", ValueType.STRING("hello world")), ("key579", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1921(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1921 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1768: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1921 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_192200
     * @tc.name      : TestCase_1922
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key580", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key581", ValueType.STRING("hello world")), ("key582", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1922(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1922 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1769: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1922 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_192300
     * @tc.name      : TestCase_1923
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key583", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key584", ValueType.STRING("hello world")), ("key585", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1923(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1923 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1770: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1923 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_192400
     * @tc.name      : TestCase_1924
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key586", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key587", ValueType.STRING("hello world")), ("key588", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1924(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1924 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1771: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1924 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_192500
     * @tc.name      : TestCase_1925
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key589", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key590", ValueType.STRING("hello world")), ("key591", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1925(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1925 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1772: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1925 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_192600
     * @tc.name      : TestCase_1926
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key592", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key593", ValueType.STRING("hello world")), ("key594", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1926(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1926 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1773: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1926 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_192700
     * @tc.name      : TestCase_1927
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key595", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key596", ValueType.BOOL(true)), ("key597", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1927(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1927 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1774: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1927 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_192800
     * @tc.name      : TestCase_1928
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key598", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key599", ValueType.BOOL(true)), ("key600", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1928(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1928 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1775: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1928 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_192900
     * @tc.name      : TestCase_1929
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key601", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key602", ValueType.BOOL(true)), ("key603", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1929(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1929 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1776: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1929 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_193000
     * @tc.name      : TestCase_1930
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key604", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key605", ValueType.BOOL(true)), ("key606", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1930(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1930 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1777: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1930 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_193100
     * @tc.name      : TestCase_1931
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key607", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key608", ValueType.BOOL(true)), ("key609", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1931(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1931 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1778: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1931 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_193200
     * @tc.name      : TestCase_1932
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key610", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key611", ValueType.BOOL(true)), ("key612", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1932(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1932 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1779: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1932 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_193300
     * @tc.name      : TestCase_1933
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key613", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key614", ValueType.FD(1i32)), ("key615", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1933(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1933 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1780: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1933 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_193400
     * @tc.name      : TestCase_1934
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key616", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key617", ValueType.FD(1i32)), ("key618", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1934(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1934 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1781: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1934 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_193500
     * @tc.name      : TestCase_1935
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key619", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key620", ValueType.FD(1i32)), ("key621", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1935(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1935 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1782: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1935 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_193600
     * @tc.name      : TestCase_1936
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key622", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key623", ValueType.FD(1i32)), ("key624", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1936(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1936 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1783: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1936 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_193700
     * @tc.name      : TestCase_1937
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key625", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key626", ValueType.FD(1i32)), ("key627", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1937(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1937 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1784: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1937 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_193800
     * @tc.name      : TestCase_1938
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key628", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key629", ValueType.FD(1i32)), ("key630", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1938(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1938 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1785: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1938 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_193900
     * @tc.name      : TestCase_1939
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key631", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key632", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key633", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1939(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1939 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1786: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1939 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_194000
     * @tc.name      : TestCase_1940
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key634", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key635", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key636", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1940(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1940 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1787: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1940 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_194100
     * @tc.name      : TestCase_1941
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key637", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key638", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key639", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1941(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1941 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1788: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1941 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_194200
     * @tc.name      : TestCase_1942
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key640", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key641", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key642", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1942(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1942 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1789: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1942 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_194300
     * @tc.name      : TestCase_1943
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key643", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key644", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key645", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1943(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1943 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1790: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1943 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_194400
     * @tc.name      : TestCase_1944
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key646", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key647", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key648", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1944(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1944 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1791: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1944 ends.")
    }
}
