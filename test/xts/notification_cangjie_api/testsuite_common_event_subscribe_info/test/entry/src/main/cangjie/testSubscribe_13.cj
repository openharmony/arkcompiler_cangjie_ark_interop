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
class testSubscribe_13 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_36100
     * @tc.name      : TestCase_361
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key433", ValueType.FD(1i32)), ("key434", ValueType.INT(-1i32)), ("key435", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_361(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_361 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_361 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_36200
     * @tc.name      : TestCase_362
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key436", ValueType.FD(1i32)), ("key437", ValueType.INT(-1i32)), ("key438", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_362(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_362 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_362 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_36300
     * @tc.name      : TestCase_363
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key439", ValueType.FD(1i32)), ("key440", ValueType.INT(-1i32)), ("key441", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_363(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_363 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_363 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_36400
     * @tc.name      : TestCase_364
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key442", ValueType.FD(1i32)), ("key443", ValueType.INT(-1i32)), ("key444", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_364(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_364 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_364 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_36500
     * @tc.name      : TestCase_365
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key445", ValueType.FD(1i32)), ("key446", ValueType.INT(-1i32)), ("key447", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_365(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_365 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_365 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_36600
     * @tc.name      : TestCase_366
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key448", ValueType.FD(1i32)), ("key449", ValueType.INT(-1i32)), ("key450", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_366(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_366 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_366 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_36700
     * @tc.name      : TestCase_367
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key451", ValueType.FD(1i32)), ("key452", ValueType.FLOAT64(-1.000000f64)), ("key453", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_367(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_367 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_367 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_36800
     * @tc.name      : TestCase_368
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key454", ValueType.FD(1i32)), ("key455", ValueType.FLOAT64(-1.000000f64)), ("key456", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_368(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_368 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_368 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_36900
     * @tc.name      : TestCase_369
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key457", ValueType.FD(1i32)), ("key458", ValueType.FLOAT64(-1.000000f64)), ("key459", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_369(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_369 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_369 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_37000
     * @tc.name      : TestCase_370
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key460", ValueType.FD(1i32)), ("key461", ValueType.FLOAT64(-1.000000f64)), ("key462", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_370(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_370 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_370 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_37100
     * @tc.name      : TestCase_371
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key463", ValueType.FD(1i32)), ("key464", ValueType.FLOAT64(-1.000000f64)), ("key465", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_371(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_371 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_371 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_37200
     * @tc.name      : TestCase_372
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key466", ValueType.FD(1i32)), ("key467", ValueType.FLOAT64(-1.000000f64)), ("key468", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_372(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_372 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_372 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_37300
     * @tc.name      : TestCase_373
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key469", ValueType.FD(1i32)), ("key470", ValueType.STRING("hello world")), ("key471", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_373(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_373 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_373 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_37400
     * @tc.name      : TestCase_374
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key472", ValueType.FD(1i32)), ("key473", ValueType.STRING("hello world")), ("key474", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_374(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_374 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_374 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_37500
     * @tc.name      : TestCase_375
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key475", ValueType.FD(1i32)), ("key476", ValueType.STRING("hello world")), ("key477", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_375(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_375 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_375 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_37600
     * @tc.name      : TestCase_376
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key478", ValueType.FD(1i32)), ("key479", ValueType.STRING("hello world")), ("key480", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_376(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_376 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_376 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_37700
     * @tc.name      : TestCase_377
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key481", ValueType.FD(1i32)), ("key482", ValueType.STRING("hello world")), ("key483", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_377(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_377 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_377 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_37800
     * @tc.name      : TestCase_378
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key484", ValueType.FD(1i32)), ("key485", ValueType.STRING("hello world")), ("key486", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_378(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_378 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_378 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_37900
     * @tc.name      : TestCase_379
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key487", ValueType.FD(1i32)), ("key488", ValueType.BOOL(true)), ("key489", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_379(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_379 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_379 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_38000
     * @tc.name      : TestCase_380
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key490", ValueType.FD(1i32)), ("key491", ValueType.BOOL(true)), ("key492", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_380(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_380 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_380 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_38100
     * @tc.name      : TestCase_381
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key493", ValueType.FD(1i32)), ("key494", ValueType.BOOL(true)), ("key495", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_381(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_381 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_381 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_38200
     * @tc.name      : TestCase_382
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key496", ValueType.FD(1i32)), ("key497", ValueType.BOOL(true)), ("key498", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_382(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_382 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_382 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_38300
     * @tc.name      : TestCase_383
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key499", ValueType.FD(1i32)), ("key500", ValueType.BOOL(true)), ("key501", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_383(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_383 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_383 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_38400
     * @tc.name      : TestCase_384
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key502", ValueType.FD(1i32)), ("key503", ValueType.BOOL(true)), ("key504", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_384(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_384 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_384 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_38500
     * @tc.name      : TestCase_385
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key505", ValueType.FD(1i32)), ("key506", ValueType.FD(1i32)), ("key507", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_385(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_385 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_385 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_38600
     * @tc.name      : TestCase_386
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key508", ValueType.FD(1i32)), ("key509", ValueType.FD(1i32)), ("key510", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_386(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_386 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_386 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_38700
     * @tc.name      : TestCase_387
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key511", ValueType.FD(1i32)), ("key512", ValueType.FD(1i32)), ("key513", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_387(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_387 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_387 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_38800
     * @tc.name      : TestCase_388
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key514", ValueType.FD(1i32)), ("key515", ValueType.FD(1i32)), ("key516", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_388(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_388 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_388 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_38900
     * @tc.name      : TestCase_389
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key517", ValueType.FD(1i32)), ("key518", ValueType.FD(1i32)), ("key519", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_389(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_389 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_389 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_39000
     * @tc.name      : TestCase_390
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo (["common.event.ABILITY_ADDED", "usual.event.DATE_CHANGED"], publisherPermission: "aaaa", publisherDeviceId: "aaaa", userId: 0i32, priority: 0i32, publisherBundleName: "aaaa")"+ "CommonEventData("", "", -1i32, "", HashMap([("key520", ValueType.FD(1i32)), ("key521", ValueType.FD(1i32)), ("key522", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_390(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_390 begins.")
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
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_390 ends.")
    }
}
