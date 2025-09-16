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
class testSubscribe_11 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_30100
     * @tc.name      : TestCase_301
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key253", ValueType.STRING("hello world")), ("key254", ValueType.STRING("hello world")), ("key255", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_301(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_301 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_301 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_30200
     * @tc.name      : TestCase_302
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key256", ValueType.STRING("hello world")), ("key257", ValueType.STRING("hello world")), ("key258", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_302(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_302 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_302 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_30300
     * @tc.name      : TestCase_303
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key259", ValueType.STRING("hello world")), ("key260", ValueType.STRING("hello world")), ("key261", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_303(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_303 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_303 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_30400
     * @tc.name      : TestCase_304
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key262", ValueType.STRING("hello world")), ("key263", ValueType.STRING("hello world")), ("key264", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_304(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_304 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_304 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_30500
     * @tc.name      : TestCase_305
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key265", ValueType.STRING("hello world")), ("key266", ValueType.STRING("hello world")), ("key267", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_305(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_305 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_305 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_30600
     * @tc.name      : TestCase_306
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key268", ValueType.STRING("hello world")), ("key269", ValueType.STRING("hello world")), ("key270", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_306(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_306 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_306 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_30700
     * @tc.name      : TestCase_307
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key271", ValueType.STRING("hello world")), ("key272", ValueType.BOOL(true)), ("key273", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_307(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_307 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_307 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_30800
     * @tc.name      : TestCase_308
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key274", ValueType.STRING("hello world")), ("key275", ValueType.BOOL(true)), ("key276", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_308(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_308 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_308 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_30900
     * @tc.name      : TestCase_309
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key277", ValueType.STRING("hello world")), ("key278", ValueType.BOOL(true)), ("key279", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_309(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_309 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_309 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_31000
     * @tc.name      : TestCase_310
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key280", ValueType.STRING("hello world")), ("key281", ValueType.BOOL(true)), ("key282", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_310(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_310 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_310 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_31100
     * @tc.name      : TestCase_311
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key283", ValueType.STRING("hello world")), ("key284", ValueType.BOOL(true)), ("key285", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_311(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_311 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_311 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_31200
     * @tc.name      : TestCase_312
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key286", ValueType.STRING("hello world")), ("key287", ValueType.BOOL(true)), ("key288", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_312(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_312 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_312 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_31300
     * @tc.name      : TestCase_313
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key289", ValueType.STRING("hello world")), ("key290", ValueType.FD(1i32)), ("key291", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_313(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_313 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_313 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_31400
     * @tc.name      : TestCase_314
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key292", ValueType.STRING("hello world")), ("key293", ValueType.FD(1i32)), ("key294", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_314(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_314 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_314 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_31500
     * @tc.name      : TestCase_315
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key295", ValueType.STRING("hello world")), ("key296", ValueType.FD(1i32)), ("key297", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_315(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_315 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_315 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_31600
     * @tc.name      : TestCase_316
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key298", ValueType.STRING("hello world")), ("key299", ValueType.FD(1i32)), ("key300", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_316(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_316 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_316 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_31700
     * @tc.name      : TestCase_317
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key301", ValueType.STRING("hello world")), ("key302", ValueType.FD(1i32)), ("key303", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_317(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_317 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_317 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_31800
     * @tc.name      : TestCase_318
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key304", ValueType.STRING("hello world")), ("key305", ValueType.FD(1i32)), ("key306", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_318(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_318 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_318 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_31900
     * @tc.name      : TestCase_319
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key307", ValueType.STRING("hello world")), ("key308", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key309", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_319(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_319 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_319 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_32000
     * @tc.name      : TestCase_320
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key310", ValueType.STRING("hello world")), ("key311", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key312", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_320(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_320 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_320 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_32100
     * @tc.name      : TestCase_321
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key313", ValueType.STRING("hello world")), ("key314", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key315", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_321(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_321 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_321 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_32200
     * @tc.name      : TestCase_322
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key316", ValueType.STRING("hello world")), ("key317", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key318", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_322(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_322 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_322 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_32300
     * @tc.name      : TestCase_323
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key319", ValueType.STRING("hello world")), ("key320", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key321", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_323(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_323 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_323 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_32400
     * @tc.name      : TestCase_324
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key322", ValueType.STRING("hello world")), ("key323", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key324", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_324(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_324 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_324 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_32500
     * @tc.name      : TestCase_325
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key325", ValueType.BOOL(true)), ("key326", ValueType.INT(-1i32)), ("key327", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_325(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_325 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_325 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_32600
     * @tc.name      : TestCase_326
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key328", ValueType.BOOL(true)), ("key329", ValueType.INT(-1i32)), ("key330", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_326(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_326 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_326 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_32700
     * @tc.name      : TestCase_327
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key331", ValueType.BOOL(true)), ("key332", ValueType.INT(-1i32)), ("key333", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_327(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_327 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_327 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_32800
     * @tc.name      : TestCase_328
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key334", ValueType.BOOL(true)), ("key335", ValueType.INT(-1i32)), ("key336", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_328(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_328 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_328 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_32900
     * @tc.name      : TestCase_329
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key337", ValueType.BOOL(true)), ("key338", ValueType.INT(-1i32)), ("key339", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_329(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_329 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_329 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_33000
     * @tc.name      : TestCase_330
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key340", ValueType.BOOL(true)), ("key341", ValueType.INT(-1i32)), ("key342", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_330(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_330 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_330 ends.")
    }
}
