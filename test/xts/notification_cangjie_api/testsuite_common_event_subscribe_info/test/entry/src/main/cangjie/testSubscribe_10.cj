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
class testSubscribe_10 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_27100
     * @tc.name      : TestCase_271
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key163", ValueType.FLOAT64(-1.000000f64)), ("key164", ValueType.BOOL(true)), ("key165", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_271(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_271 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_271 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_27200
     * @tc.name      : TestCase_272
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key166", ValueType.FLOAT64(-1.000000f64)), ("key167", ValueType.BOOL(true)), ("key168", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_272(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_272 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_272 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_27300
     * @tc.name      : TestCase_273
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key169", ValueType.FLOAT64(-1.000000f64)), ("key170", ValueType.BOOL(true)), ("key171", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_273(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_273 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_273 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_27400
     * @tc.name      : TestCase_274
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key172", ValueType.FLOAT64(-1.000000f64)), ("key173", ValueType.BOOL(true)), ("key174", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_274(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_274 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_274 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_27500
     * @tc.name      : TestCase_275
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key175", ValueType.FLOAT64(-1.000000f64)), ("key176", ValueType.BOOL(true)), ("key177", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_275(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_275 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_275 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_27600
     * @tc.name      : TestCase_276
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key178", ValueType.FLOAT64(-1.000000f64)), ("key179", ValueType.BOOL(true)), ("key180", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_276(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_276 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_276 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_27700
     * @tc.name      : TestCase_277
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key181", ValueType.FLOAT64(-1.000000f64)), ("key182", ValueType.FD(1i32)), ("key183", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_277(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_277 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_277 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_27800
     * @tc.name      : TestCase_278
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key184", ValueType.FLOAT64(-1.000000f64)), ("key185", ValueType.FD(1i32)), ("key186", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_278(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_278 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_278 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_27900
     * @tc.name      : TestCase_279
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key187", ValueType.FLOAT64(-1.000000f64)), ("key188", ValueType.FD(1i32)), ("key189", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_279(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_279 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_279 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_28000
     * @tc.name      : TestCase_280
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key190", ValueType.FLOAT64(-1.000000f64)), ("key191", ValueType.FD(1i32)), ("key192", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_280(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_280 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_280 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_28100
     * @tc.name      : TestCase_281
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key193", ValueType.FLOAT64(-1.000000f64)), ("key194", ValueType.FD(1i32)), ("key195", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_281(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_281 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_281 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_28200
     * @tc.name      : TestCase_282
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key196", ValueType.FLOAT64(-1.000000f64)), ("key197", ValueType.FD(1i32)), ("key198", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_282(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_282 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_282 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_28300
     * @tc.name      : TestCase_283
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key199", ValueType.FLOAT64(-1.000000f64)), ("key200", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key201", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_283(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_283 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_283 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_28400
     * @tc.name      : TestCase_284
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key202", ValueType.FLOAT64(-1.000000f64)), ("key203", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key204", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_284(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_284 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_284 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_28500
     * @tc.name      : TestCase_285
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key205", ValueType.FLOAT64(-1.000000f64)), ("key206", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key207", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_285(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_285 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_285 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_28600
     * @tc.name      : TestCase_286
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key208", ValueType.FLOAT64(-1.000000f64)), ("key209", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key210", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_286(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_286 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_286 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_28700
     * @tc.name      : TestCase_287
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key211", ValueType.FLOAT64(-1.000000f64)), ("key212", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key213", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_287(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_287 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_287 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_28800
     * @tc.name      : TestCase_288
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key214", ValueType.FLOAT64(-1.000000f64)), ("key215", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key216", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_288(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_288 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_288 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_28900
     * @tc.name      : TestCase_289
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key217", ValueType.STRING("hello world")), ("key218", ValueType.INT(-1i32)), ("key219", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_289(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_289 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_289 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_29000
     * @tc.name      : TestCase_290
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key220", ValueType.STRING("hello world")), ("key221", ValueType.INT(-1i32)), ("key222", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_290(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_290 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_290 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_29100
     * @tc.name      : TestCase_291
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key223", ValueType.STRING("hello world")), ("key224", ValueType.INT(-1i32)), ("key225", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_291(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_291 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_291 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_29200
     * @tc.name      : TestCase_292
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key226", ValueType.STRING("hello world")), ("key227", ValueType.INT(-1i32)), ("key228", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_292(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_292 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_292 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_29300
     * @tc.name      : TestCase_293
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key229", ValueType.STRING("hello world")), ("key230", ValueType.INT(-1i32)), ("key231", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_293(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_293 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_293 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_29400
     * @tc.name      : TestCase_294
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key232", ValueType.STRING("hello world")), ("key233", ValueType.INT(-1i32)), ("key234", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_294(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_294 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_294 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_29500
     * @tc.name      : TestCase_295
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key235", ValueType.STRING("hello world")), ("key236", ValueType.FLOAT64(-1.000000f64)), ("key237", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_295(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_295 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_295 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_29600
     * @tc.name      : TestCase_296
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key238", ValueType.STRING("hello world")), ("key239", ValueType.FLOAT64(-1.000000f64)), ("key240", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_296(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_296 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_296 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_29700
     * @tc.name      : TestCase_297
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key241", ValueType.STRING("hello world")), ("key242", ValueType.FLOAT64(-1.000000f64)), ("key243", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_297(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_297 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_297 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_29800
     * @tc.name      : TestCase_298
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key244", ValueType.STRING("hello world")), ("key245", ValueType.FLOAT64(-1.000000f64)), ("key246", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_298(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_298 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_298 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_29900
     * @tc.name      : TestCase_299
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key247", ValueType.STRING("hello world")), ("key248", ValueType.FLOAT64(-1.000000f64)), ("key249", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_299(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_299 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_299 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_30000
     * @tc.name      : TestCase_300
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key250", ValueType.STRING("hello world")), ("key251", ValueType.FLOAT64(-1.000000f64)), ("key252", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_300(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_300 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_300 ends.")
    }
}
