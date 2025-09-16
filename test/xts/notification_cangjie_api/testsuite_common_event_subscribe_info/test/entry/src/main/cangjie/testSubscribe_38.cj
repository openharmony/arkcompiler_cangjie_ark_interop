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
class testSubscribe_38 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_111100
     * @tc.name      : TestCase_1111
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key91", ValueType.INT(-1i32)), ("key92", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key93", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1111(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1111 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#958: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1111 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_111200
     * @tc.name      : TestCase_1112
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key94", ValueType.INT(-1i32)), ("key95", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key96", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1112(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1112 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#959: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1112 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_111300
     * @tc.name      : TestCase_1113
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key97", ValueType.INT(-1i32)), ("key98", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key99", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1113(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1113 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#960: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1113 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_111400
     * @tc.name      : TestCase_1114
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key100", ValueType.INT(-1i32)), ("key101", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key102", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1114(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1114 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#961: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1114 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_111500
     * @tc.name      : TestCase_1115
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key103", ValueType.INT(-1i32)), ("key104", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key105", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1115(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1115 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#962: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1115 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_111600
     * @tc.name      : TestCase_1116
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key106", ValueType.INT(-1i32)), ("key107", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key108", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1116(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1116 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#963: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1116 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_111700
     * @tc.name      : TestCase_1117
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key109", ValueType.FLOAT64(-1.000000f64)), ("key110", ValueType.INT(-1i32)), ("key111", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1117(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1117 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#964: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1117 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_111800
     * @tc.name      : TestCase_1118
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key112", ValueType.FLOAT64(-1.000000f64)), ("key113", ValueType.INT(-1i32)), ("key114", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1118(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1118 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#965: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1118 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_111900
     * @tc.name      : TestCase_1119
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key115", ValueType.FLOAT64(-1.000000f64)), ("key116", ValueType.INT(-1i32)), ("key117", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1119(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1119 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#966: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1119 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_112000
     * @tc.name      : TestCase_1120
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key118", ValueType.FLOAT64(-1.000000f64)), ("key119", ValueType.INT(-1i32)), ("key120", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1120(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1120 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#967: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1120 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_112100
     * @tc.name      : TestCase_1121
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key121", ValueType.FLOAT64(-1.000000f64)), ("key122", ValueType.INT(-1i32)), ("key123", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1121(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1121 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#968: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1121 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_112200
     * @tc.name      : TestCase_1122
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key124", ValueType.FLOAT64(-1.000000f64)), ("key125", ValueType.INT(-1i32)), ("key126", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1122(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1122 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#969: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1122 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_112300
     * @tc.name      : TestCase_1123
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key127", ValueType.FLOAT64(-1.000000f64)), ("key128", ValueType.FLOAT64(-1.000000f64)), ("key129", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1123(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1123 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#970: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1123 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_112400
     * @tc.name      : TestCase_1124
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key130", ValueType.FLOAT64(-1.000000f64)), ("key131", ValueType.FLOAT64(-1.000000f64)), ("key132", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1124(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1124 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#971: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1124 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_112500
     * @tc.name      : TestCase_1125
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key133", ValueType.FLOAT64(-1.000000f64)), ("key134", ValueType.FLOAT64(-1.000000f64)), ("key135", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1125(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1125 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#972: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1125 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_112600
     * @tc.name      : TestCase_1126
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key136", ValueType.FLOAT64(-1.000000f64)), ("key137", ValueType.FLOAT64(-1.000000f64)), ("key138", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1126(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1126 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#973: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1126 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_112700
     * @tc.name      : TestCase_1127
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key139", ValueType.FLOAT64(-1.000000f64)), ("key140", ValueType.FLOAT64(-1.000000f64)), ("key141", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1127(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1127 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#974: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1127 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_112800
     * @tc.name      : TestCase_1128
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key142", ValueType.FLOAT64(-1.000000f64)), ("key143", ValueType.FLOAT64(-1.000000f64)), ("key144", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1128(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1128 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#975: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1128 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_112900
     * @tc.name      : TestCase_1129
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key145", ValueType.FLOAT64(-1.000000f64)), ("key146", ValueType.STRING("hello world")), ("key147", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1129(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1129 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#976: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1129 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_113000
     * @tc.name      : TestCase_1130
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key148", ValueType.FLOAT64(-1.000000f64)), ("key149", ValueType.STRING("hello world")), ("key150", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1130(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1130 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#977: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1130 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_113100
     * @tc.name      : TestCase_1131
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key151", ValueType.FLOAT64(-1.000000f64)), ("key152", ValueType.STRING("hello world")), ("key153", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1131(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1131 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#978: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1131 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_113200
     * @tc.name      : TestCase_1132
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key154", ValueType.FLOAT64(-1.000000f64)), ("key155", ValueType.STRING("hello world")), ("key156", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1132(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1132 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#979: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1132 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_113300
     * @tc.name      : TestCase_1133
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key157", ValueType.FLOAT64(-1.000000f64)), ("key158", ValueType.STRING("hello world")), ("key159", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1133(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1133 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#980: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1133 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_113400
     * @tc.name      : TestCase_1134
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key160", ValueType.FLOAT64(-1.000000f64)), ("key161", ValueType.STRING("hello world")), ("key162", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1134(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1134 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#981: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1134 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_113500
     * @tc.name      : TestCase_1135
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key163", ValueType.FLOAT64(-1.000000f64)), ("key164", ValueType.BOOL(true)), ("key165", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1135(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1135 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#982: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1135 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_113600
     * @tc.name      : TestCase_1136
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key166", ValueType.FLOAT64(-1.000000f64)), ("key167", ValueType.BOOL(true)), ("key168", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1136(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1136 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#983: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1136 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_113700
     * @tc.name      : TestCase_1137
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key169", ValueType.FLOAT64(-1.000000f64)), ("key170", ValueType.BOOL(true)), ("key171", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1137(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1137 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#984: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1137 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_113800
     * @tc.name      : TestCase_1138
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key172", ValueType.FLOAT64(-1.000000f64)), ("key173", ValueType.BOOL(true)), ("key174", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1138(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1138 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#985: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1138 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_113900
     * @tc.name      : TestCase_1139
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key175", ValueType.FLOAT64(-1.000000f64)), ("key176", ValueType.BOOL(true)), ("key177", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1139(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1139 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#986: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1139 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_114000
     * @tc.name      : TestCase_1140
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23", userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23")"+ "CommonEventData("", "", -1i32, "", HashMap([("key178", ValueType.FLOAT64(-1.000000f64)), ("key179", ValueType.BOOL(true)), ("key180", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1140(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1140 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#!$@$23", publisherDeviceId: "#!$@$23",
                    userId: 1024i32, priority: 1024i32, publisherBundleName: "#!$@$23"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#987: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1140 ends.")
    }
}
