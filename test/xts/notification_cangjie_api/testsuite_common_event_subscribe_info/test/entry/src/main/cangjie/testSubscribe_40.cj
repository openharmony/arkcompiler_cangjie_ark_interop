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
class testSubscribe_40 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_117100
     * @tc.name      : TestCase_1171
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key271", ValueType.STRING("hello world")), ("key272", ValueType.BOOL(true)), ("key273", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1171(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1171 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1018: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1171 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_117200
     * @tc.name      : TestCase_1172
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key274", ValueType.STRING("hello world")), ("key275", ValueType.BOOL(true)), ("key276", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1172(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1172 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1019: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1172 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_117300
     * @tc.name      : TestCase_1173
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key277", ValueType.STRING("hello world")), ("key278", ValueType.BOOL(true)), ("key279", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1173(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1173 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1020: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1173 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_117400
     * @tc.name      : TestCase_1174
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key280", ValueType.STRING("hello world")), ("key281", ValueType.BOOL(true)), ("key282", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1174(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1174 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1021: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1174 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_117500
     * @tc.name      : TestCase_1175
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key283", ValueType.STRING("hello world")), ("key284", ValueType.BOOL(true)), ("key285", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1175(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1175 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1022: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1175 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_117600
     * @tc.name      : TestCase_1176
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key286", ValueType.STRING("hello world")), ("key287", ValueType.BOOL(true)), ("key288", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1176(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1176 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1023: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1176 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_117700
     * @tc.name      : TestCase_1177
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key289", ValueType.STRING("hello world")), ("key290", ValueType.FD(1i32)), ("key291", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1177(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1177 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1024: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1177 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_117800
     * @tc.name      : TestCase_1178
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key292", ValueType.STRING("hello world")), ("key293", ValueType.FD(1i32)), ("key294", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1178(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1178 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1025: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1178 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_117900
     * @tc.name      : TestCase_1179
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key295", ValueType.STRING("hello world")), ("key296", ValueType.FD(1i32)), ("key297", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1179(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1179 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1026: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1179 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_118000
     * @tc.name      : TestCase_1180
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key298", ValueType.STRING("hello world")), ("key299", ValueType.FD(1i32)), ("key300", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1180(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1180 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1027: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1180 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_118100
     * @tc.name      : TestCase_1181
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key301", ValueType.STRING("hello world")), ("key302", ValueType.FD(1i32)), ("key303", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1181(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1181 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1028: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1181 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_118200
     * @tc.name      : TestCase_1182
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key304", ValueType.STRING("hello world")), ("key305", ValueType.FD(1i32)), ("key306", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1182(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1182 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1029: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1182 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_118300
     * @tc.name      : TestCase_1183
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key307", ValueType.STRING("hello world")), ("key308", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key309", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1183(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1183 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1030: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1183 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_118400
     * @tc.name      : TestCase_1184
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key310", ValueType.STRING("hello world")), ("key311", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key312", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1184(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1184 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1031: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1184 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_118500
     * @tc.name      : TestCase_1185
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key313", ValueType.STRING("hello world")), ("key314", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key315", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1185(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1185 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1032: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1185 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_118600
     * @tc.name      : TestCase_1186
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key316", ValueType.STRING("hello world")), ("key317", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key318", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1186(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1186 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1033: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1186 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_118700
     * @tc.name      : TestCase_1187
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key319", ValueType.STRING("hello world")), ("key320", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key321", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1187(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1187 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1034: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1187 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_118800
     * @tc.name      : TestCase_1188
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key322", ValueType.STRING("hello world")), ("key323", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key324", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1188(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1188 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1035: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1188 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_118900
     * @tc.name      : TestCase_1189
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key325", ValueType.BOOL(true)), ("key326", ValueType.INT(-1i32)), ("key327", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1189(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1189 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1036: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1189 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_119000
     * @tc.name      : TestCase_1190
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key328", ValueType.BOOL(true)), ("key329", ValueType.INT(-1i32)), ("key330", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1190(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1190 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1037: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1190 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_119100
     * @tc.name      : TestCase_1191
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key331", ValueType.BOOL(true)), ("key332", ValueType.INT(-1i32)), ("key333", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1191(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1191 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1038: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1191 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_119200
     * @tc.name      : TestCase_1192
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key334", ValueType.BOOL(true)), ("key335", ValueType.INT(-1i32)), ("key336", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1192(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1192 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1039: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1192 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_119300
     * @tc.name      : TestCase_1193
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key337", ValueType.BOOL(true)), ("key338", ValueType.INT(-1i32)), ("key339", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1193(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1193 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1040: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1193 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_119400
     * @tc.name      : TestCase_1194
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key340", ValueType.BOOL(true)), ("key341", ValueType.INT(-1i32)), ("key342", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1194(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1194 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1041: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1194 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_119500
     * @tc.name      : TestCase_1195
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key343", ValueType.BOOL(true)), ("key344", ValueType.FLOAT64(-1.000000f64)), ("key345", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1195(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1195 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1042: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1195 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_119600
     * @tc.name      : TestCase_1196
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key346", ValueType.BOOL(true)), ("key347", ValueType.FLOAT64(-1.000000f64)), ("key348", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1196(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1196 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1043: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1196 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_119700
     * @tc.name      : TestCase_1197
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key349", ValueType.BOOL(true)), ("key350", ValueType.FLOAT64(-1.000000f64)), ("key351", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1197(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1197 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1044: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1197 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_119800
     * @tc.name      : TestCase_1198
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key352", ValueType.BOOL(true)), ("key353", ValueType.FLOAT64(-1.000000f64)), ("key354", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1198(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1198 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1045: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1198 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_119900
     * @tc.name      : TestCase_1199
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key355", ValueType.BOOL(true)), ("key356", ValueType.FLOAT64(-1.000000f64)), ("key357", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1199(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1199 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1046: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1199 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_120000
     * @tc.name      : TestCase_1200
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key358", ValueType.BOOL(true)), ("key359", ValueType.FLOAT64(-1.000000f64)), ("key360", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1200(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1200 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1047: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1200 ends.")
    }
}
