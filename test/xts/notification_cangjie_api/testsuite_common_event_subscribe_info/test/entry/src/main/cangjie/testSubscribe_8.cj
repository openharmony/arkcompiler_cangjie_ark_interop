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
class testSubscribe_8 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_21100
     * @tc.name      : TestCase_211
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key631", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key632", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key633", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_211(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_211 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#274: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_211 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_21200
     * @tc.name      : TestCase_212
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key634", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key635", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key636", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_212(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_212 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#275: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_212 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_21300
     * @tc.name      : TestCase_213
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key637", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key638", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key639", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_213(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_213 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#276: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_213 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_21400
     * @tc.name      : TestCase_214
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key640", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key641", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key642", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_214(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_214 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#277: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_214 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_21500
     * @tc.name      : TestCase_215
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key643", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key644", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key645", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_215(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_215 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#278: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_215 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_21600
     * @tc.name      : TestCase_216
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "", publisherDeviceId: "", userId: -1i32, priority: -1i32, publisherBundleName: "")"+ "CommonEventData("", "", -1i32, "", HashMap([("key646", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key647", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key648", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_216(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_216 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "", publisherDeviceId: "", userId: -1i32,
                    priority: -1i32, publisherBundleName: ""))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#279: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_216 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_21700
     * @tc.name      : TestCase_217
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key1", ValueType.INT(-1i32)), ("key2", ValueType.INT(-1i32)), ("key3", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_217(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_217 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_217 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_21800
     * @tc.name      : TestCase_218
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("aaaa", "aaaa", 0i32, "aaaa", HashMap([("key4", ValueType.INT(-1i32)), ("key5", ValueType.INT(-1i32)), ("key6", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_218(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_218 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_218 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_21900
     * @tc.name      : TestCase_219
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("#!$@$23", "#!$@$23", 1i32, " ", HashMap([("key7", ValueType.INT(-1i32)), ("key8", ValueType.INT(-1i32)), ("key9", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_219(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_219 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_219 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_22000
     * @tc.name      : TestCase_220
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("reason", "reason", -1i32, "", HashMap([("key10", ValueType.INT(-1i32)), ("key11", ValueType.INT(-1i32)), ("key12", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_220(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_220 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_220 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_22100
     * @tc.name      : TestCase_221
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("1234567890", "1234567890", -1i32, "", HashMap([("key13", ValueType.INT(-1i32)), ("key14", ValueType.INT(-1i32)), ("key15", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_221(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_221 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_221 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_22200
     * @tc.name      : TestCase_222
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("!#$@%^&*", "!#$@%^&*", -1i32, "", HashMap([("key16", ValueType.INT(-1i32)), ("key17", ValueType.INT(-1i32)), ("key18", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_222(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_222 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_222 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_22300
     * @tc.name      : TestCase_223
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key19", ValueType.INT(-1i32)), ("key20", ValueType.FLOAT64(-1.000000f64)), ("key21", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_223(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_223 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_223 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_22400
     * @tc.name      : TestCase_224
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key22", ValueType.INT(-1i32)), ("key23", ValueType.FLOAT64(-1.000000f64)), ("key24", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_224(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_224 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_224 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_22500
     * @tc.name      : TestCase_225
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key25", ValueType.INT(-1i32)), ("key26", ValueType.FLOAT64(-1.000000f64)), ("key27", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_225(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_225 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_225 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_22600
     * @tc.name      : TestCase_226
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key28", ValueType.INT(-1i32)), ("key29", ValueType.FLOAT64(-1.000000f64)), ("key30", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_226(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_226 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_226 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_22700
     * @tc.name      : TestCase_227
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key31", ValueType.INT(-1i32)), ("key32", ValueType.FLOAT64(-1.000000f64)), ("key33", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_227(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_227 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_227 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_22800
     * @tc.name      : TestCase_228
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key34", ValueType.INT(-1i32)), ("key35", ValueType.FLOAT64(-1.000000f64)), ("key36", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_228(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_228 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_228 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_22900
     * @tc.name      : TestCase_229
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key37", ValueType.INT(-1i32)), ("key38", ValueType.STRING("hello world")), ("key39", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_229(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_229 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_229 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_23000
     * @tc.name      : TestCase_230
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key40", ValueType.INT(-1i32)), ("key41", ValueType.STRING("hello world")), ("key42", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_230(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_230 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_230 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_23100
     * @tc.name      : TestCase_231
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key43", ValueType.INT(-1i32)), ("key44", ValueType.STRING("hello world")), ("key45", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_231(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_231 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_231 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_23200
     * @tc.name      : TestCase_232
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key46", ValueType.INT(-1i32)), ("key47", ValueType.STRING("hello world")), ("key48", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_232(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_232 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_232 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_23300
     * @tc.name      : TestCase_233
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key49", ValueType.INT(-1i32)), ("key50", ValueType.STRING("hello world")), ("key51", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_233(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_233 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_233 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_23400
     * @tc.name      : TestCase_234
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key52", ValueType.INT(-1i32)), ("key53", ValueType.STRING("hello world")), ("key54", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_234(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_234 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_234 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_23500
     * @tc.name      : TestCase_235
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key55", ValueType.INT(-1i32)), ("key56", ValueType.BOOL(true)), ("key57", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_235(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_235 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_235 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_23600
     * @tc.name      : TestCase_236
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key58", ValueType.INT(-1i32)), ("key59", ValueType.BOOL(true)), ("key60", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_236(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_236 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_236 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_23700
     * @tc.name      : TestCase_237
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key61", ValueType.INT(-1i32)), ("key62", ValueType.BOOL(true)), ("key63", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_237(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_237 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_237 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_23800
     * @tc.name      : TestCase_238
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key64", ValueType.INT(-1i32)), ("key65", ValueType.BOOL(true)), ("key66", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_238(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_238 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_238 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_23900
     * @tc.name      : TestCase_239
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key67", ValueType.INT(-1i32)), ("key68", ValueType.BOOL(true)), ("key69", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_239(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_239 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_239 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_24000
     * @tc.name      : TestCase_240
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key70", ValueType.INT(-1i32)), ("key71", ValueType.BOOL(true)), ("key72", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_240(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_240 begins.")
        Hilog.info(0u32, "cangjietest", "", "define local variable sub")
        let sub = CommonEventManager.createSubscriber(
            CommonEventSubscribeInfo(["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"],
                publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32,
                publisherBundleName: "aaaa"))
        Hilog.info(0u32, "cangjietest", "", "subscribe")
        CommonEventManager.subscribe(sub, {
            e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "", "onframe")
        })
        @Expect(true)
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_240 ends.")
    }
}
