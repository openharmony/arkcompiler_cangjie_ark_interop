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
class testSubscribe_45 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_132100
     * @tc.name      : TestCase_1321
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key73", ValueType.INT(-1i32)), ("key74", ValueType.FD(1i32)), ("key75", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1321(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1321 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1168: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1321 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_132200
     * @tc.name      : TestCase_1322
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key76", ValueType.INT(-1i32)), ("key77", ValueType.FD(1i32)), ("key78", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1322(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1322 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1169: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1322 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_132300
     * @tc.name      : TestCase_1323
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key79", ValueType.INT(-1i32)), ("key80", ValueType.FD(1i32)), ("key81", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1323(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1323 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1170: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1323 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_132400
     * @tc.name      : TestCase_1324
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key82", ValueType.INT(-1i32)), ("key83", ValueType.FD(1i32)), ("key84", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1324(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1324 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1171: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1324 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_132500
     * @tc.name      : TestCase_1325
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key85", ValueType.INT(-1i32)), ("key86", ValueType.FD(1i32)), ("key87", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1325(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1325 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1172: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1325 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_132600
     * @tc.name      : TestCase_1326
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key88", ValueType.INT(-1i32)), ("key89", ValueType.FD(1i32)), ("key90", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1326(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1326 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1173: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1326 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_132700
     * @tc.name      : TestCase_1327
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key91", ValueType.INT(-1i32)), ("key92", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key93", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1327(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1327 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1174: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1327 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_132800
     * @tc.name      : TestCase_1328
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key94", ValueType.INT(-1i32)), ("key95", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key96", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1328(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1328 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1175: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1328 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_132900
     * @tc.name      : TestCase_1329
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key97", ValueType.INT(-1i32)), ("key98", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key99", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1329(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1329 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1176: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1329 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_133000
     * @tc.name      : TestCase_1330
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key100", ValueType.INT(-1i32)), ("key101", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key102", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1330(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1330 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1177: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1330 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_133100
     * @tc.name      : TestCase_1331
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key103", ValueType.INT(-1i32)), ("key104", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key105", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1331(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1331 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1178: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1331 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_133200
     * @tc.name      : TestCase_1332
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key106", ValueType.INT(-1i32)), ("key107", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key108", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1332(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1332 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1179: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1332 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_133300
     * @tc.name      : TestCase_1333
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key109", ValueType.FLOAT64(-1.000000f64)), ("key110", ValueType.INT(-1i32)), ("key111", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1333(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1333 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1180: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1333 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_133400
     * @tc.name      : TestCase_1334
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key112", ValueType.FLOAT64(-1.000000f64)), ("key113", ValueType.INT(-1i32)), ("key114", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1334(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1334 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1181: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1334 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_133500
     * @tc.name      : TestCase_1335
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key115", ValueType.FLOAT64(-1.000000f64)), ("key116", ValueType.INT(-1i32)), ("key117", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1335(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1335 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1182: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1335 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_133600
     * @tc.name      : TestCase_1336
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key118", ValueType.FLOAT64(-1.000000f64)), ("key119", ValueType.INT(-1i32)), ("key120", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1336(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1336 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1183: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1336 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_133700
     * @tc.name      : TestCase_1337
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key121", ValueType.FLOAT64(-1.000000f64)), ("key122", ValueType.INT(-1i32)), ("key123", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1337(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1337 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1184: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1337 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_133800
     * @tc.name      : TestCase_1338
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key124", ValueType.FLOAT64(-1.000000f64)), ("key125", ValueType.INT(-1i32)), ("key126", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1338(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1338 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1185: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1338 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_133900
     * @tc.name      : TestCase_1339
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key127", ValueType.FLOAT64(-1.000000f64)), ("key128", ValueType.FLOAT64(-1.000000f64)), ("key129", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1339(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1339 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1186: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1339 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_134000
     * @tc.name      : TestCase_1340
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key130", ValueType.FLOAT64(-1.000000f64)), ("key131", ValueType.FLOAT64(-1.000000f64)), ("key132", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1340(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1340 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1187: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1340 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_134100
     * @tc.name      : TestCase_1341
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key133", ValueType.FLOAT64(-1.000000f64)), ("key134", ValueType.FLOAT64(-1.000000f64)), ("key135", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1341(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1341 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1188: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1341 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_134200
     * @tc.name      : TestCase_1342
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key136", ValueType.FLOAT64(-1.000000f64)), ("key137", ValueType.FLOAT64(-1.000000f64)), ("key138", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1342(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1342 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1189: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1342 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_134300
     * @tc.name      : TestCase_1343
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key139", ValueType.FLOAT64(-1.000000f64)), ("key140", ValueType.FLOAT64(-1.000000f64)), ("key141", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1343(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1343 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1190: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1343 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_134400
     * @tc.name      : TestCase_1344
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key142", ValueType.FLOAT64(-1.000000f64)), ("key143", ValueType.FLOAT64(-1.000000f64)), ("key144", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1344(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1344 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1191: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1344 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_134500
     * @tc.name      : TestCase_1345
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key145", ValueType.FLOAT64(-1.000000f64)), ("key146", ValueType.STRING("hello world")), ("key147", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1345(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1345 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1192: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1345 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_134600
     * @tc.name      : TestCase_1346
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key148", ValueType.FLOAT64(-1.000000f64)), ("key149", ValueType.STRING("hello world")), ("key150", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1346(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1346 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1193: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1346 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_134700
     * @tc.name      : TestCase_1347
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key151", ValueType.FLOAT64(-1.000000f64)), ("key152", ValueType.STRING("hello world")), ("key153", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1347(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1347 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1194: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1347 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_134800
     * @tc.name      : TestCase_1348
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key154", ValueType.FLOAT64(-1.000000f64)), ("key155", ValueType.STRING("hello world")), ("key156", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1348(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1348 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1195: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1348 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_134900
     * @tc.name      : TestCase_1349
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key157", ValueType.FLOAT64(-1.000000f64)), ("key158", ValueType.STRING("hello world")), ("key159", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1349(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1349 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1196: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1349 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_135000
     * @tc.name      : TestCase_1350
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key160", ValueType.FLOAT64(-1.000000f64)), ("key161", ValueType.STRING("hello world")), ("key162", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1350(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1350 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1197: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1350 ends.")
    }
}
