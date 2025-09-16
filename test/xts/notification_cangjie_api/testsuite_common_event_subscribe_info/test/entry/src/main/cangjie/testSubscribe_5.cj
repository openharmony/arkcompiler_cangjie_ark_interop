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
class testSubscribe_5 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_12100
     * @tc.name      : TestCase_121
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key361", ValueType.BOOL(true)), ("key362", ValueType.STRING("hello world")), ("key363", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_121(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_121 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#184: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_121 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_12200
     * @tc.name      : TestCase_122
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key364", ValueType.BOOL(true)), ("key365", ValueType.STRING("hello world")), ("key366", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_122(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_122 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#185: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_122 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_12300
     * @tc.name      : TestCase_123
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key367", ValueType.BOOL(true)), ("key368", ValueType.STRING("hello world")), ("key369", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_123(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_123 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#186: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_123 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_12400
     * @tc.name      : TestCase_124
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key370", ValueType.BOOL(true)), ("key371", ValueType.STRING("hello world")), ("key372", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_124(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_124 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#187: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_124 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_12500
     * @tc.name      : TestCase_125
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key373", ValueType.BOOL(true)), ("key374", ValueType.STRING("hello world")), ("key375", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_125(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_125 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#188: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_125 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_12600
     * @tc.name      : TestCase_126
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key376", ValueType.BOOL(true)), ("key377", ValueType.STRING("hello world")), ("key378", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_126(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_126 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#189: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_126 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_12700
     * @tc.name      : TestCase_127
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key379", ValueType.BOOL(true)), ("key380", ValueType.BOOL(true)), ("key381", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_127(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_127 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#190: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_127 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_12800
     * @tc.name      : TestCase_128
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key382", ValueType.BOOL(true)), ("key383", ValueType.BOOL(true)), ("key384", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_128(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_128 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#191: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_128 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_12900
     * @tc.name      : TestCase_129
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key385", ValueType.BOOL(true)), ("key386", ValueType.BOOL(true)), ("key387", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_129(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_129 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#192: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_129 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_13000
     * @tc.name      : TestCase_130
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key388", ValueType.BOOL(true)), ("key389", ValueType.BOOL(true)), ("key390", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_130(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_130 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#193: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_130 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_13100
     * @tc.name      : TestCase_131
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key391", ValueType.BOOL(true)), ("key392", ValueType.BOOL(true)), ("key393", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_131(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_131 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#194: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_131 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_13200
     * @tc.name      : TestCase_132
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key394", ValueType.BOOL(true)), ("key395", ValueType.BOOL(true)), ("key396", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_132(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_132 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#195: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_132 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_13300
     * @tc.name      : TestCase_133
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key397", ValueType.BOOL(true)), ("key398", ValueType.FD(1i32)), ("key399", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_133(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_133 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#196: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_133 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_13400
     * @tc.name      : TestCase_134
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key400", ValueType.BOOL(true)), ("key401", ValueType.FD(1i32)), ("key402", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_134(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_134 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#197: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_134 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_13500
     * @tc.name      : TestCase_135
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key403", ValueType.BOOL(true)), ("key404", ValueType.FD(1i32)), ("key405", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_135(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_135 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#198: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_135 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_13600
     * @tc.name      : TestCase_136
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key406", ValueType.BOOL(true)), ("key407", ValueType.FD(1i32)), ("key408", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_136(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_136 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#199: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_136 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_13700
     * @tc.name      : TestCase_137
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key409", ValueType.BOOL(true)), ("key410", ValueType.FD(1i32)), ("key411", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_137(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_137 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#200: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_137 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_13800
     * @tc.name      : TestCase_138
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key412", ValueType.BOOL(true)), ("key413", ValueType.FD(1i32)), ("key414", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_138(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_138 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#201: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_138 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_13900
     * @tc.name      : TestCase_139
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key415", ValueType.BOOL(true)), ("key416", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key417", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_139(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_139 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#202: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_139 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_14000
     * @tc.name      : TestCase_140
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key418", ValueType.BOOL(true)), ("key419", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key420", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_140(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_140 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#203: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_140 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_14100
     * @tc.name      : TestCase_141
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key421", ValueType.BOOL(true)), ("key422", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key423", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_141(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_141 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#204: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_141 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_14200
     * @tc.name      : TestCase_142
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key424", ValueType.BOOL(true)), ("key425", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key426", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_142(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_142 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#205: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_142 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_14300
     * @tc.name      : TestCase_143
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key427", ValueType.BOOL(true)), ("key428", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key429", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_143(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_143 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#206: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_143 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_14400
     * @tc.name      : TestCase_144
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key430", ValueType.BOOL(true)), ("key431", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key432", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_144(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_144 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#207: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_144 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_14500
     * @tc.name      : TestCase_145
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key433", ValueType.FD(1i32)), ("key434", ValueType.INT(-1i32)), ("key435", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_145(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_145 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#208: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_145 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_14600
     * @tc.name      : TestCase_146
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key436", ValueType.FD(1i32)), ("key437", ValueType.INT(-1i32)), ("key438", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_146(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_146 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#209: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_146 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_14700
     * @tc.name      : TestCase_147
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key439", ValueType.FD(1i32)), ("key440", ValueType.INT(-1i32)), ("key441", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_147(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_147 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#210: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_147 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_14800
     * @tc.name      : TestCase_148
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key442", ValueType.FD(1i32)), ("key443", ValueType.INT(-1i32)), ("key444", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_148(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_148 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#211: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_148 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_14900
     * @tc.name      : TestCase_149
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key445", ValueType.FD(1i32)), ("key446", ValueType.INT(-1i32)), ("key447", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_149(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_149 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#212: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_149 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_15000
     * @tc.name      : TestCase_150
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key448", ValueType.FD(1i32)), ("key449", ValueType.INT(-1i32)), ("key450", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_150(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_150 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#213: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_150 ends.")
    }
}
