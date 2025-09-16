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
class testSubscribe_44 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_129100
     * @tc.name      : TestCase_1291
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key631", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key632", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key633", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1291(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1291 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1138: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1291 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_129200
     * @tc.name      : TestCase_1292
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key634", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key635", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key636", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1292(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1292 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1139: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1292 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_129300
     * @tc.name      : TestCase_1293
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key637", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key638", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key639", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1293(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1293 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1140: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1293 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_129400
     * @tc.name      : TestCase_1294
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key640", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key641", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key642", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1294(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1294 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1141: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1294 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_129500
     * @tc.name      : TestCase_1295
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key643", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key644", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key645", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1295(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1295 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1142: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1295 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_129600
     * @tc.name      : TestCase_1296
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key646", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key647", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key648", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1296(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1296 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1143: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1296 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_129700
     * @tc.name      : TestCase_1297
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key1", ValueType.INT(-1i32)), ("key2", ValueType.INT(-1i32)), ("key3", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1297(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1297 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1144: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1297 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_129800
     * @tc.name      : TestCase_1298
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("aaaa", "aaaa", 0i32, "aaaa", HashMap([("key4", ValueType.INT(-1i32)), ("key5", ValueType.INT(-1i32)), ("key6", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1298(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1298 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1145: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1298 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_129900
     * @tc.name      : TestCase_1299
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("#!$@$23", "#!$@$23", 1i32, " ", HashMap([("key7", ValueType.INT(-1i32)), ("key8", ValueType.INT(-1i32)), ("key9", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1299(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1299 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1146: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1299 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_130000
     * @tc.name      : TestCase_1300
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("reason", "reason", -1i32, "", HashMap([("key10", ValueType.INT(-1i32)), ("key11", ValueType.INT(-1i32)), ("key12", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1300(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1300 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1147: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1300 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_130100
     * @tc.name      : TestCase_1301
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("1234567890", "1234567890", -1i32, "", HashMap([("key13", ValueType.INT(-1i32)), ("key14", ValueType.INT(-1i32)), ("key15", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1301(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1301 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1148: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1301 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_130200
     * @tc.name      : TestCase_1302
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("!#$@%^&*", "!#$@%^&*", -1i32, "", HashMap([("key16", ValueType.INT(-1i32)), ("key17", ValueType.INT(-1i32)), ("key18", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1302(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1302 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1149: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1302 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_130300
     * @tc.name      : TestCase_1303
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key19", ValueType.INT(-1i32)), ("key20", ValueType.FLOAT64(-1.000000f64)), ("key21", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1303(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1303 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1150: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1303 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_130400
     * @tc.name      : TestCase_1304
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key22", ValueType.INT(-1i32)), ("key23", ValueType.FLOAT64(-1.000000f64)), ("key24", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1304(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1304 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1151: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1304 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_130500
     * @tc.name      : TestCase_1305
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key25", ValueType.INT(-1i32)), ("key26", ValueType.FLOAT64(-1.000000f64)), ("key27", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1305(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1305 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1152: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1305 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_130600
     * @tc.name      : TestCase_1306
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key28", ValueType.INT(-1i32)), ("key29", ValueType.FLOAT64(-1.000000f64)), ("key30", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1306(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1306 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1153: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1306 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_130700
     * @tc.name      : TestCase_1307
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key31", ValueType.INT(-1i32)), ("key32", ValueType.FLOAT64(-1.000000f64)), ("key33", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1307(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1307 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1154: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1307 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_130800
     * @tc.name      : TestCase_1308
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key34", ValueType.INT(-1i32)), ("key35", ValueType.FLOAT64(-1.000000f64)), ("key36", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1308(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1308 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1155: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1308 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_130900
     * @tc.name      : TestCase_1309
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key37", ValueType.INT(-1i32)), ("key38", ValueType.STRING("hello world")), ("key39", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1309(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1309 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1156: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1309 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_131000
     * @tc.name      : TestCase_1310
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key40", ValueType.INT(-1i32)), ("key41", ValueType.STRING("hello world")), ("key42", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1310(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1310 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1157: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1310 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_131100
     * @tc.name      : TestCase_1311
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key43", ValueType.INT(-1i32)), ("key44", ValueType.STRING("hello world")), ("key45", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1311(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1311 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1158: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1311 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_131200
     * @tc.name      : TestCase_1312
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key46", ValueType.INT(-1i32)), ("key47", ValueType.STRING("hello world")), ("key48", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1312(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1312 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1159: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1312 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_131300
     * @tc.name      : TestCase_1313
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key49", ValueType.INT(-1i32)), ("key50", ValueType.STRING("hello world")), ("key51", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1313(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1313 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1160: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1313 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_131400
     * @tc.name      : TestCase_1314
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key52", ValueType.INT(-1i32)), ("key53", ValueType.STRING("hello world")), ("key54", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1314(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1314 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1161: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1314 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_131500
     * @tc.name      : TestCase_1315
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key55", ValueType.INT(-1i32)), ("key56", ValueType.BOOL(true)), ("key57", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1315(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1315 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1162: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1315 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_131600
     * @tc.name      : TestCase_1316
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key58", ValueType.INT(-1i32)), ("key59", ValueType.BOOL(true)), ("key60", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1316(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1316 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1163: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1316 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_131700
     * @tc.name      : TestCase_1317
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key61", ValueType.INT(-1i32)), ("key62", ValueType.BOOL(true)), ("key63", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1317(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1317 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1164: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1317 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_131800
     * @tc.name      : TestCase_1318
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key64", ValueType.INT(-1i32)), ("key65", ValueType.BOOL(true)), ("key66", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1318(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1318 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1165: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1318 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_131900
     * @tc.name      : TestCase_1319
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key67", ValueType.INT(-1i32)), ("key68", ValueType.BOOL(true)), ("key69", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1319(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1319 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1166: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1319 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_132000
     * @tc.name      : TestCase_1320
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32, priority: -1i32, publisherBundleName: "reason")"+ "CommonEventData("", "", -1i32, "", HashMap([("key70", ValueType.INT(-1i32)), ("key71", ValueType.BOOL(true)), ("key72", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1320(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1320 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "reason", publisherDeviceId: "reason", userId: -1i32,
                    priority: -1i32, publisherBundleName: "reason"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1167: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1320 ends.")
    }
}
