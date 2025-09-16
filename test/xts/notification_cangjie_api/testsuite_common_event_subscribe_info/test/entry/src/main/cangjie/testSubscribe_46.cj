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
class testSubscribe_46 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_135100
     * @tc.name      : TestCase_1351
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key163", ValueType.FLOAT64(-1.000000f64)), ("key164", ValueType.BOOL(true)), ("key165", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1351(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1351 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1198: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1351 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_135200
     * @tc.name      : TestCase_1352
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key166", ValueType.FLOAT64(-1.000000f64)), ("key167", ValueType.BOOL(true)), ("key168", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1352(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1352 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1199: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1352 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_135300
     * @tc.name      : TestCase_1353
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key169", ValueType.FLOAT64(-1.000000f64)), ("key170", ValueType.BOOL(true)), ("key171", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1353(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1353 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1200: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1353 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_135400
     * @tc.name      : TestCase_1354
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key172", ValueType.FLOAT64(-1.000000f64)), ("key173", ValueType.BOOL(true)), ("key174", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1354(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1354 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1201: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1354 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_135500
     * @tc.name      : TestCase_1355
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key175", ValueType.FLOAT64(-1.000000f64)), ("key176", ValueType.BOOL(true)), ("key177", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1355(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1355 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1202: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1355 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_135600
     * @tc.name      : TestCase_1356
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key178", ValueType.FLOAT64(-1.000000f64)), ("key179", ValueType.BOOL(true)), ("key180", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1356(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1356 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1203: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1356 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_135700
     * @tc.name      : TestCase_1357
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key181", ValueType.FLOAT64(-1.000000f64)), ("key182", ValueType.FD(1i32)), ("key183", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1357(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1357 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1204: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1357 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_135800
     * @tc.name      : TestCase_1358
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key184", ValueType.FLOAT64(-1.000000f64)), ("key185", ValueType.FD(1i32)), ("key186", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1358(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1358 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1205: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1358 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_135900
     * @tc.name      : TestCase_1359
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key187", ValueType.FLOAT64(-1.000000f64)), ("key188", ValueType.FD(1i32)), ("key189", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1359(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1359 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1206: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1359 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_136000
     * @tc.name      : TestCase_1360
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key190", ValueType.FLOAT64(-1.000000f64)), ("key191", ValueType.FD(1i32)), ("key192", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1360(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1360 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1207: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1360 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_136100
     * @tc.name      : TestCase_1361
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key193", ValueType.FLOAT64(-1.000000f64)), ("key194", ValueType.FD(1i32)), ("key195", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1361(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1361 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1208: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1361 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_136200
     * @tc.name      : TestCase_1362
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key196", ValueType.FLOAT64(-1.000000f64)), ("key197", ValueType.FD(1i32)), ("key198", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1362(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1362 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1209: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1362 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_136300
     * @tc.name      : TestCase_1363
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key199", ValueType.FLOAT64(-1.000000f64)), ("key200", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key201", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1363(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1363 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1210: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1363 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_136400
     * @tc.name      : TestCase_1364
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key202", ValueType.FLOAT64(-1.000000f64)), ("key203", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key204", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1364(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1364 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1211: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1364 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_136500
     * @tc.name      : TestCase_1365
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key205", ValueType.FLOAT64(-1.000000f64)), ("key206", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key207", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1365(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1365 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1212: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1365 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_136600
     * @tc.name      : TestCase_1366
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key208", ValueType.FLOAT64(-1.000000f64)), ("key209", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key210", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1366(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1366 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1213: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1366 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_136700
     * @tc.name      : TestCase_1367
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key211", ValueType.FLOAT64(-1.000000f64)), ("key212", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key213", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1367(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1367 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1214: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1367 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_136800
     * @tc.name      : TestCase_1368
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key214", ValueType.FLOAT64(-1.000000f64)), ("key215", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key216", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1368(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1368 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1215: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1368 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_136900
     * @tc.name      : TestCase_1369
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key217", ValueType.STRING("hello world")), ("key218", ValueType.INT(-1i32)), ("key219", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1369(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1369 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1216: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1369 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_137000
     * @tc.name      : TestCase_1370
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key220", ValueType.STRING("hello world")), ("key221", ValueType.INT(-1i32)), ("key222", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1370(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1370 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1217: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1370 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_137100
     * @tc.name      : TestCase_1371
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key223", ValueType.STRING("hello world")), ("key224", ValueType.INT(-1i32)), ("key225", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1371(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1371 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1218: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1371 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_137200
     * @tc.name      : TestCase_1372
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key226", ValueType.STRING("hello world")), ("key227", ValueType.INT(-1i32)), ("key228", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1372(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1372 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1219: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1372 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_137300
     * @tc.name      : TestCase_1373
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key229", ValueType.STRING("hello world")), ("key230", ValueType.INT(-1i32)), ("key231", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1373(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1373 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1220: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1373 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_137400
     * @tc.name      : TestCase_1374
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key232", ValueType.STRING("hello world")), ("key233", ValueType.INT(-1i32)), ("key234", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1374(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1374 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1221: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1374 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_137500
     * @tc.name      : TestCase_1375
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key235", ValueType.STRING("hello world")), ("key236", ValueType.FLOAT64(-1.000000f64)), ("key237", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1375(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1375 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1222: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1375 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_137600
     * @tc.name      : TestCase_1376
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key238", ValueType.STRING("hello world")), ("key239", ValueType.FLOAT64(-1.000000f64)), ("key240", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1376(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1376 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1223: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1376 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_137700
     * @tc.name      : TestCase_1377
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key241", ValueType.STRING("hello world")), ("key242", ValueType.FLOAT64(-1.000000f64)), ("key243", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1377(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1377 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1224: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1377 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_137800
     * @tc.name      : TestCase_1378
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key244", ValueType.STRING("hello world")), ("key245", ValueType.FLOAT64(-1.000000f64)), ("key246", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1378(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1378 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1225: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1378 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_137900
     * @tc.name      : TestCase_1379
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key247", ValueType.STRING("hello world")), ("key248", ValueType.FLOAT64(-1.000000f64)), ("key249", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1379(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1379 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1226: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1379 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_138000
     * @tc.name      : TestCase_1380
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key250", ValueType.STRING("hello world")), ("key251", ValueType.FLOAT64(-1.000000f64)), ("key252", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1380(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1380 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1227: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1380 ends.")
    }
}
