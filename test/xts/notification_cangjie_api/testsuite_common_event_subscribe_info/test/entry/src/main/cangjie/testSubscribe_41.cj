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
class testSubscribe_41 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_120100
     * @tc.name      : TestCase_1201
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key361", ValueType.BOOL(true)), ("key362", ValueType.STRING("hello world")), ("key363", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1201(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1201 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1048: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1201 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_120200
     * @tc.name      : TestCase_1202
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key364", ValueType.BOOL(true)), ("key365", ValueType.STRING("hello world")), ("key366", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1202(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1202 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1049: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1202 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_120300
     * @tc.name      : TestCase_1203
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key367", ValueType.BOOL(true)), ("key368", ValueType.STRING("hello world")), ("key369", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1203(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1203 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1050: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1203 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_120400
     * @tc.name      : TestCase_1204
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key370", ValueType.BOOL(true)), ("key371", ValueType.STRING("hello world")), ("key372", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1204(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1204 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1051: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1204 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_120500
     * @tc.name      : TestCase_1205
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key373", ValueType.BOOL(true)), ("key374", ValueType.STRING("hello world")), ("key375", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1205(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1205 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1052: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1205 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_120600
     * @tc.name      : TestCase_1206
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key376", ValueType.BOOL(true)), ("key377", ValueType.STRING("hello world")), ("key378", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1206(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1206 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1053: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1206 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_120700
     * @tc.name      : TestCase_1207
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key379", ValueType.BOOL(true)), ("key380", ValueType.BOOL(true)), ("key381", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1207(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1207 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1054: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1207 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_120800
     * @tc.name      : TestCase_1208
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key382", ValueType.BOOL(true)), ("key383", ValueType.BOOL(true)), ("key384", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1208(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1208 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1055: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1208 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_120900
     * @tc.name      : TestCase_1209
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key385", ValueType.BOOL(true)), ("key386", ValueType.BOOL(true)), ("key387", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1209(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1209 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1056: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1209 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_121000
     * @tc.name      : TestCase_1210
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key388", ValueType.BOOL(true)), ("key389", ValueType.BOOL(true)), ("key390", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1210(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1210 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1057: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1210 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_121100
     * @tc.name      : TestCase_1211
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key391", ValueType.BOOL(true)), ("key392", ValueType.BOOL(true)), ("key393", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1211(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1211 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1058: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1211 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_121200
     * @tc.name      : TestCase_1212
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key394", ValueType.BOOL(true)), ("key395", ValueType.BOOL(true)), ("key396", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1212(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1212 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1059: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1212 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_121300
     * @tc.name      : TestCase_1213
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key397", ValueType.BOOL(true)), ("key398", ValueType.FD(1i32)), ("key399", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1213(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1213 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1060: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1213 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_121400
     * @tc.name      : TestCase_1214
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key400", ValueType.BOOL(true)), ("key401", ValueType.FD(1i32)), ("key402", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1214(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1214 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1061: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1214 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_121500
     * @tc.name      : TestCase_1215
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key403", ValueType.BOOL(true)), ("key404", ValueType.FD(1i32)), ("key405", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1215(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1215 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1062: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1215 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_121600
     * @tc.name      : TestCase_1216
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key406", ValueType.BOOL(true)), ("key407", ValueType.FD(1i32)), ("key408", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1216(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1216 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1063: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1216 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_121700
     * @tc.name      : TestCase_1217
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key409", ValueType.BOOL(true)), ("key410", ValueType.FD(1i32)), ("key411", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1217(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1217 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1064: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1217 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_121800
     * @tc.name      : TestCase_1218
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key412", ValueType.BOOL(true)), ("key413", ValueType.FD(1i32)), ("key414", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1218(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1218 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1065: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1218 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_121900
     * @tc.name      : TestCase_1219
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key415", ValueType.BOOL(true)), ("key416", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key417", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1219(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1219 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1066: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1219 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_122000
     * @tc.name      : TestCase_1220
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key418", ValueType.BOOL(true)), ("key419", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key420", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1220(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1220 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1067: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1220 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_122100
     * @tc.name      : TestCase_1221
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key421", ValueType.BOOL(true)), ("key422", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key423", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1221(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1221 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1068: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1221 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_122200
     * @tc.name      : TestCase_1222
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key424", ValueType.BOOL(true)), ("key425", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key426", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1222(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1222 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1069: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1222 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_122300
     * @tc.name      : TestCase_1223
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key427", ValueType.BOOL(true)), ("key428", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key429", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1223(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1223 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1070: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1223 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_122400
     * @tc.name      : TestCase_1224
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key430", ValueType.BOOL(true)), ("key431", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key432", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1224(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1224 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1071: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1224 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_122500
     * @tc.name      : TestCase_1225
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key433", ValueType.FD(1i32)), ("key434", ValueType.INT(-1i32)), ("key435", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1225(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1225 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1072: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1225 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_122600
     * @tc.name      : TestCase_1226
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key436", ValueType.FD(1i32)), ("key437", ValueType.INT(-1i32)), ("key438", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1226(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1226 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1073: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1226 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_122700
     * @tc.name      : TestCase_1227
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key439", ValueType.FD(1i32)), ("key440", ValueType.INT(-1i32)), ("key441", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1227(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1227 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1074: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1227 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_122800
     * @tc.name      : TestCase_1228
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key442", ValueType.FD(1i32)), ("key443", ValueType.INT(-1i32)), ("key444", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1228(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1228 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1075: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1228 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_122900
     * @tc.name      : TestCase_1229
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key445", ValueType.FD(1i32)), ("key446", ValueType.INT(-1i32)), ("key447", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1229(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1229 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1076: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1229 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_123000
     * @tc.name      : TestCase_1230
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key448", ValueType.FD(1i32)), ("key449", ValueType.INT(-1i32)), ("key450", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1230(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1230 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1077: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1230 ends.")
    }
}
