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
class testSubscribe_47 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_138100
     * @tc.name      : TestCase_1381
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key253", ValueType.STRING("hello world")), ("key254", ValueType.STRING("hello world")), ("key255", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1381(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1381 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1228: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1381 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_138200
     * @tc.name      : TestCase_1382
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key256", ValueType.STRING("hello world")), ("key257", ValueType.STRING("hello world")), ("key258", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1382(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1382 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1229: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1382 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_138300
     * @tc.name      : TestCase_1383
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key259", ValueType.STRING("hello world")), ("key260", ValueType.STRING("hello world")), ("key261", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1383(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1383 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1230: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1383 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_138400
     * @tc.name      : TestCase_1384
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key262", ValueType.STRING("hello world")), ("key263", ValueType.STRING("hello world")), ("key264", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1384(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1384 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1231: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1384 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_138500
     * @tc.name      : TestCase_1385
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key265", ValueType.STRING("hello world")), ("key266", ValueType.STRING("hello world")), ("key267", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1385(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1385 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1232: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1385 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_138600
     * @tc.name      : TestCase_1386
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key268", ValueType.STRING("hello world")), ("key269", ValueType.STRING("hello world")), ("key270", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1386(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1386 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1233: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1386 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_138700
     * @tc.name      : TestCase_1387
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key271", ValueType.STRING("hello world")), ("key272", ValueType.BOOL(true)), ("key273", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1387(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1387 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1234: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1387 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_138800
     * @tc.name      : TestCase_1388
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key274", ValueType.STRING("hello world")), ("key275", ValueType.BOOL(true)), ("key276", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1388(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1388 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1235: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1388 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_138900
     * @tc.name      : TestCase_1389
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key277", ValueType.STRING("hello world")), ("key278", ValueType.BOOL(true)), ("key279", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1389(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1389 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1236: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1389 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_139000
     * @tc.name      : TestCase_1390
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key280", ValueType.STRING("hello world")), ("key281", ValueType.BOOL(true)), ("key282", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1390(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1390 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1237: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1390 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_139100
     * @tc.name      : TestCase_1391
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key283", ValueType.STRING("hello world")), ("key284", ValueType.BOOL(true)), ("key285", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1391(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1391 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1238: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1391 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_139200
     * @tc.name      : TestCase_1392
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key286", ValueType.STRING("hello world")), ("key287", ValueType.BOOL(true)), ("key288", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1392(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1392 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1239: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1392 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_139300
     * @tc.name      : TestCase_1393
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key289", ValueType.STRING("hello world")), ("key290", ValueType.FD(1i32)), ("key291", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1393(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1393 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1240: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1393 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_139400
     * @tc.name      : TestCase_1394
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key292", ValueType.STRING("hello world")), ("key293", ValueType.FD(1i32)), ("key294", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1394(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1394 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1241: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1394 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_139500
     * @tc.name      : TestCase_1395
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key295", ValueType.STRING("hello world")), ("key296", ValueType.FD(1i32)), ("key297", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1395(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1395 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1242: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1395 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_139600
     * @tc.name      : TestCase_1396
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key298", ValueType.STRING("hello world")), ("key299", ValueType.FD(1i32)), ("key300", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1396(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1396 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1243: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1396 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_139700
     * @tc.name      : TestCase_1397
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key301", ValueType.STRING("hello world")), ("key302", ValueType.FD(1i32)), ("key303", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1397(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1397 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1244: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1397 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_139800
     * @tc.name      : TestCase_1398
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key304", ValueType.STRING("hello world")), ("key305", ValueType.FD(1i32)), ("key306", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1398(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1398 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1245: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1398 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_139900
     * @tc.name      : TestCase_1399
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key307", ValueType.STRING("hello world")), ("key308", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key309", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1399(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1399 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1246: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1399 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_140000
     * @tc.name      : TestCase_1400
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key310", ValueType.STRING("hello world")), ("key311", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key312", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1400(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1400 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1247: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1400 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_140100
     * @tc.name      : TestCase_1401
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key313", ValueType.STRING("hello world")), ("key314", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key315", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1401(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1401 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1248: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1401 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_140200
     * @tc.name      : TestCase_1402
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key316", ValueType.STRING("hello world")), ("key317", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key318", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1402(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1402 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1249: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1402 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_140300
     * @tc.name      : TestCase_1403
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key319", ValueType.STRING("hello world")), ("key320", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key321", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1403(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1403 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1250: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1403 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_140400
     * @tc.name      : TestCase_1404
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key322", ValueType.STRING("hello world")), ("key323", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key324", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1404(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1404 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1251: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1404 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_140500
     * @tc.name      : TestCase_1405
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key325", ValueType.BOOL(true)), ("key326", ValueType.INT(-1i32)), ("key327", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1405(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1405 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1252: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1405 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_140600
     * @tc.name      : TestCase_1406
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key328", ValueType.BOOL(true)), ("key329", ValueType.INT(-1i32)), ("key330", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1406(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1406 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1253: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1406 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_140700
     * @tc.name      : TestCase_1407
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key331", ValueType.BOOL(true)), ("key332", ValueType.INT(-1i32)), ("key333", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1407(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1407 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1254: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1407 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_140800
     * @tc.name      : TestCase_1408
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key334", ValueType.BOOL(true)), ("key335", ValueType.INT(-1i32)), ("key336", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1408(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1408 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1255: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1408 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_140900
     * @tc.name      : TestCase_1409
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key337", ValueType.BOOL(true)), ("key338", ValueType.INT(-1i32)), ("key339", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1409(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1409 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1256: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1409 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_141000
     * @tc.name      : TestCase_1410
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key340", ValueType.BOOL(true)), ("key341", ValueType.INT(-1i32)), ("key342", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1410(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1410 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1257: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1410 ends.")
    }
}
