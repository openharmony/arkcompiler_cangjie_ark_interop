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
class testSubscribe_36 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_105100
     * @tc.name      : TestCase_1051
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key559", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key560", ValueType.FLOAT64(-1.000000f64)), ("key561", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1051(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1051 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#898: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1051 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_105200
     * @tc.name      : TestCase_1052
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key562", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key563", ValueType.FLOAT64(-1.000000f64)), ("key564", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1052(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1052 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#899: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1052 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_105300
     * @tc.name      : TestCase_1053
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key565", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key566", ValueType.FLOAT64(-1.000000f64)), ("key567", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1053(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1053 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#900: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1053 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_105400
     * @tc.name      : TestCase_1054
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key568", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key569", ValueType.FLOAT64(-1.000000f64)), ("key570", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1054(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1054 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#901: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1054 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_105500
     * @tc.name      : TestCase_1055
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key571", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key572", ValueType.FLOAT64(-1.000000f64)), ("key573", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1055(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1055 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#902: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1055 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_105600
     * @tc.name      : TestCase_1056
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key574", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key575", ValueType.FLOAT64(-1.000000f64)), ("key576", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1056(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1056 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#903: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1056 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_105700
     * @tc.name      : TestCase_1057
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key577", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key578", ValueType.STRING("hello world")), ("key579", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1057(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1057 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#904: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1057 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_105800
     * @tc.name      : TestCase_1058
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key580", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key581", ValueType.STRING("hello world")), ("key582", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1058(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1058 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#905: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1058 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_105900
     * @tc.name      : TestCase_1059
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key583", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key584", ValueType.STRING("hello world")), ("key585", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1059(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1059 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#906: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1059 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_106000
     * @tc.name      : TestCase_1060
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key586", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key587", ValueType.STRING("hello world")), ("key588", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1060(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1060 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#907: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1060 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_106100
     * @tc.name      : TestCase_1061
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key589", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key590", ValueType.STRING("hello world")), ("key591", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1061(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1061 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#908: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1061 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_106200
     * @tc.name      : TestCase_1062
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key592", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key593", ValueType.STRING("hello world")), ("key594", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1062(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1062 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#909: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1062 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_106300
     * @tc.name      : TestCase_1063
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key595", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key596", ValueType.BOOL(true)), ("key597", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1063(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1063 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#910: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1063 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_106400
     * @tc.name      : TestCase_1064
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key598", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key599", ValueType.BOOL(true)), ("key600", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1064(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1064 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#911: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1064 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_106500
     * @tc.name      : TestCase_1065
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key601", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key602", ValueType.BOOL(true)), ("key603", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1065(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1065 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#912: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1065 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_106600
     * @tc.name      : TestCase_1066
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key604", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key605", ValueType.BOOL(true)), ("key606", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1066(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1066 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#913: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1066 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_106700
     * @tc.name      : TestCase_1067
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key607", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key608", ValueType.BOOL(true)), ("key609", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1067(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1067 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#914: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1067 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_106800
     * @tc.name      : TestCase_1068
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key610", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key611", ValueType.BOOL(true)), ("key612", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1068(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1068 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#915: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1068 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_106900
     * @tc.name      : TestCase_1069
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key613", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key614", ValueType.FD(1i32)), ("key615", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1069(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1069 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#916: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1069 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_107000
     * @tc.name      : TestCase_1070
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key616", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key617", ValueType.FD(1i32)), ("key618", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1070(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1070 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#917: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1070 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_107100
     * @tc.name      : TestCase_1071
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key619", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key620", ValueType.FD(1i32)), ("key621", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1071(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1071 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#918: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1071 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_107200
     * @tc.name      : TestCase_1072
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key622", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key623", ValueType.FD(1i32)), ("key624", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1072(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1072 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#919: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1072 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_107300
     * @tc.name      : TestCase_1073
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key625", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key626", ValueType.FD(1i32)), ("key627", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1073(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1073 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#920: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1073 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_107400
     * @tc.name      : TestCase_1074
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key628", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key629", ValueType.FD(1i32)), ("key630", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1074(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1074 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#921: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1074 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_107500
     * @tc.name      : TestCase_1075
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key631", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key632", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key633", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1075(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1075 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#922: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1075 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_107600
     * @tc.name      : TestCase_1076
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key634", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key635", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key636", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1076(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1076 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#923: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1076 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_107700
     * @tc.name      : TestCase_1077
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key637", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key638", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key639", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1077(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1077 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#924: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1077 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_107800
     * @tc.name      : TestCase_1078
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key640", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key641", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key642", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1078(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1078 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#925: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1078 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_107900
     * @tc.name      : TestCase_1079
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key643", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key644", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key645", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1079(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1079 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#926: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1079 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_108000
     * @tc.name      : TestCase_1080
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key646", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key647", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key648", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1080(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1080 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#927: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1080 ends.")
    }
}
