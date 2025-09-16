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
class testSubscribe_42 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_123100
     * @tc.name      : TestCase_1231
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key451", ValueType.FD(1i32)), ("key452", ValueType.FLOAT64(-1.000000f64)), ("key453", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1231(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1231 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1078: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1231 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_123200
     * @tc.name      : TestCase_1232
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key454", ValueType.FD(1i32)), ("key455", ValueType.FLOAT64(-1.000000f64)), ("key456", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1232(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1232 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1079: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1232 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_123300
     * @tc.name      : TestCase_1233
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key457", ValueType.FD(1i32)), ("key458", ValueType.FLOAT64(-1.000000f64)), ("key459", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1233(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1233 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1080: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1233 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_123400
     * @tc.name      : TestCase_1234
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key460", ValueType.FD(1i32)), ("key461", ValueType.FLOAT64(-1.000000f64)), ("key462", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1234(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1234 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1081: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1234 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_123500
     * @tc.name      : TestCase_1235
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key463", ValueType.FD(1i32)), ("key464", ValueType.FLOAT64(-1.000000f64)), ("key465", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1235(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1235 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1082: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1235 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_123600
     * @tc.name      : TestCase_1236
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key466", ValueType.FD(1i32)), ("key467", ValueType.FLOAT64(-1.000000f64)), ("key468", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1236(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1236 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1083: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1236 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_123700
     * @tc.name      : TestCase_1237
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key469", ValueType.FD(1i32)), ("key470", ValueType.STRING("hello world")), ("key471", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1237(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1237 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1084: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1237 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_123800
     * @tc.name      : TestCase_1238
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key472", ValueType.FD(1i32)), ("key473", ValueType.STRING("hello world")), ("key474", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1238(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1238 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1085: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1238 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_123900
     * @tc.name      : TestCase_1239
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key475", ValueType.FD(1i32)), ("key476", ValueType.STRING("hello world")), ("key477", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1239(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1239 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1086: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1239 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_124000
     * @tc.name      : TestCase_1240
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key478", ValueType.FD(1i32)), ("key479", ValueType.STRING("hello world")), ("key480", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1240(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1240 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1087: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1240 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_124100
     * @tc.name      : TestCase_1241
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key481", ValueType.FD(1i32)), ("key482", ValueType.STRING("hello world")), ("key483", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1241(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1241 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1088: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1241 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_124200
     * @tc.name      : TestCase_1242
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key484", ValueType.FD(1i32)), ("key485", ValueType.STRING("hello world")), ("key486", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1242(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1242 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1089: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1242 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_124300
     * @tc.name      : TestCase_1243
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key487", ValueType.FD(1i32)), ("key488", ValueType.BOOL(true)), ("key489", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1243(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1243 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1090: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1243 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_124400
     * @tc.name      : TestCase_1244
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key490", ValueType.FD(1i32)), ("key491", ValueType.BOOL(true)), ("key492", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1244(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1244 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1091: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1244 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_124500
     * @tc.name      : TestCase_1245
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key493", ValueType.FD(1i32)), ("key494", ValueType.BOOL(true)), ("key495", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1245(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1245 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1092: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1245 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_124600
     * @tc.name      : TestCase_1246
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key496", ValueType.FD(1i32)), ("key497", ValueType.BOOL(true)), ("key498", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1246(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1246 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1093: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1246 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_124700
     * @tc.name      : TestCase_1247
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key499", ValueType.FD(1i32)), ("key500", ValueType.BOOL(true)), ("key501", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1247(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1247 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1094: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1247 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_124800
     * @tc.name      : TestCase_1248
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key502", ValueType.FD(1i32)), ("key503", ValueType.BOOL(true)), ("key504", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1248(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1248 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1095: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1248 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_124900
     * @tc.name      : TestCase_1249
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key505", ValueType.FD(1i32)), ("key506", ValueType.FD(1i32)), ("key507", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1249(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1249 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1096: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1249 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_125000
     * @tc.name      : TestCase_1250
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key508", ValueType.FD(1i32)), ("key509", ValueType.FD(1i32)), ("key510", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1250(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1250 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1097: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1250 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_125100
     * @tc.name      : TestCase_1251
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key511", ValueType.FD(1i32)), ("key512", ValueType.FD(1i32)), ("key513", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1251(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1251 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1098: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1251 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_125200
     * @tc.name      : TestCase_1252
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key514", ValueType.FD(1i32)), ("key515", ValueType.FD(1i32)), ("key516", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1252(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1252 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1099: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1252 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_125300
     * @tc.name      : TestCase_1253
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key517", ValueType.FD(1i32)), ("key518", ValueType.FD(1i32)), ("key519", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1253(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1253 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1100: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1253 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_125400
     * @tc.name      : TestCase_1254
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key520", ValueType.FD(1i32)), ("key521", ValueType.FD(1i32)), ("key522", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1254(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1254 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1101: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1254 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_125500
     * @tc.name      : TestCase_1255
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key523", ValueType.FD(1i32)), ("key524", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key525", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1255(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1255 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1102: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1255 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_125600
     * @tc.name      : TestCase_1256
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key526", ValueType.FD(1i32)), ("key527", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key528", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1256(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1256 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1103: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1256 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_125700
     * @tc.name      : TestCase_1257
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key529", ValueType.FD(1i32)), ("key530", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key531", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1257(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1257 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1104: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1257 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_125800
     * @tc.name      : TestCase_1258
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key532", ValueType.FD(1i32)), ("key533", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key534", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1258(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1258 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1105: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1258 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_125900
     * @tc.name      : TestCase_1259
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key535", ValueType.FD(1i32)), ("key536", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key537", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1259(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1259 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1106: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1259 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_126000
     * @tc.name      : TestCase_1260
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key538", ValueType.FD(1i32)), ("key539", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key540", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1260(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1260 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1107: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1260 ends.")
    }
}
