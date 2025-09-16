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
class testSubscribe_35 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_102100
     * @tc.name      : TestCase_1021
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key469", ValueType.FD(1i32)), ("key470", ValueType.STRING("hello world")), ("key471", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1021(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1021 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#868: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1021 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_102200
     * @tc.name      : TestCase_1022
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key472", ValueType.FD(1i32)), ("key473", ValueType.STRING("hello world")), ("key474", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1022(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1022 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#869: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1022 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_102300
     * @tc.name      : TestCase_1023
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key475", ValueType.FD(1i32)), ("key476", ValueType.STRING("hello world")), ("key477", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1023(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1023 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#870: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1023 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_102400
     * @tc.name      : TestCase_1024
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key478", ValueType.FD(1i32)), ("key479", ValueType.STRING("hello world")), ("key480", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1024(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1024 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#871: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1024 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_102500
     * @tc.name      : TestCase_1025
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key481", ValueType.FD(1i32)), ("key482", ValueType.STRING("hello world")), ("key483", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1025(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1025 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#872: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1025 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_102600
     * @tc.name      : TestCase_1026
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key484", ValueType.FD(1i32)), ("key485", ValueType.STRING("hello world")), ("key486", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1026(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1026 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#873: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1026 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_102700
     * @tc.name      : TestCase_1027
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key487", ValueType.FD(1i32)), ("key488", ValueType.BOOL(true)), ("key489", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1027(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1027 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#874: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1027 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_102800
     * @tc.name      : TestCase_1028
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key490", ValueType.FD(1i32)), ("key491", ValueType.BOOL(true)), ("key492", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1028(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1028 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#875: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1028 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_102900
     * @tc.name      : TestCase_1029
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key493", ValueType.FD(1i32)), ("key494", ValueType.BOOL(true)), ("key495", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1029(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1029 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#876: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1029 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_103000
     * @tc.name      : TestCase_1030
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key496", ValueType.FD(1i32)), ("key497", ValueType.BOOL(true)), ("key498", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1030(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1030 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#877: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1030 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_103100
     * @tc.name      : TestCase_1031
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key499", ValueType.FD(1i32)), ("key500", ValueType.BOOL(true)), ("key501", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1031(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1031 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#878: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1031 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_103200
     * @tc.name      : TestCase_1032
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key502", ValueType.FD(1i32)), ("key503", ValueType.BOOL(true)), ("key504", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1032(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1032 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#879: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1032 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_103300
     * @tc.name      : TestCase_1033
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key505", ValueType.FD(1i32)), ("key506", ValueType.FD(1i32)), ("key507", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1033(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1033 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#880: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1033 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_103400
     * @tc.name      : TestCase_1034
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key508", ValueType.FD(1i32)), ("key509", ValueType.FD(1i32)), ("key510", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1034(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1034 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#881: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1034 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_103500
     * @tc.name      : TestCase_1035
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key511", ValueType.FD(1i32)), ("key512", ValueType.FD(1i32)), ("key513", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1035(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1035 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#882: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1035 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_103600
     * @tc.name      : TestCase_1036
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key514", ValueType.FD(1i32)), ("key515", ValueType.FD(1i32)), ("key516", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1036(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1036 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#883: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1036 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_103700
     * @tc.name      : TestCase_1037
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key517", ValueType.FD(1i32)), ("key518", ValueType.FD(1i32)), ("key519", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1037(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1037 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#884: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1037 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_103800
     * @tc.name      : TestCase_1038
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key520", ValueType.FD(1i32)), ("key521", ValueType.FD(1i32)), ("key522", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1038(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1038 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#885: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1038 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_103900
     * @tc.name      : TestCase_1039
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key523", ValueType.FD(1i32)), ("key524", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key525", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1039(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1039 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#886: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1039 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_104000
     * @tc.name      : TestCase_1040
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key526", ValueType.FD(1i32)), ("key527", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key528", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1040(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1040 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#887: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1040 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_104100
     * @tc.name      : TestCase_1041
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key529", ValueType.FD(1i32)), ("key530", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key531", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1041(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1041 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#888: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1041 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_104200
     * @tc.name      : TestCase_1042
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key532", ValueType.FD(1i32)), ("key533", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key534", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1042(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1042 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#889: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1042 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_104300
     * @tc.name      : TestCase_1043
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key535", ValueType.FD(1i32)), ("key536", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key537", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1043(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1043 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#890: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1043 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_104400
     * @tc.name      : TestCase_1044
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key538", ValueType.FD(1i32)), ("key539", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key540", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1044(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1044 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#891: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1044 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_104500
     * @tc.name      : TestCase_1045
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key541", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key542", ValueType.INT(-1i32)), ("key543", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1045(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1045 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#892: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1045 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_104600
     * @tc.name      : TestCase_1046
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key544", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key545", ValueType.INT(-1i32)), ("key546", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1046(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1046 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#893: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1046 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_104700
     * @tc.name      : TestCase_1047
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key547", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key548", ValueType.INT(-1i32)), ("key549", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1047(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1047 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#894: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1047 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_104800
     * @tc.name      : TestCase_1048
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key550", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key551", ValueType.INT(-1i32)), ("key552", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1048(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1048 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#895: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1048 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_104900
     * @tc.name      : TestCase_1049
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key553", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key554", ValueType.INT(-1i32)), ("key555", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1049(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1049 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#896: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1049 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_105000
     * @tc.name      : TestCase_1050
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key556", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key557", ValueType.INT(-1i32)), ("key558", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1050(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1050 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#897: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1050 ends.")
    }
}
