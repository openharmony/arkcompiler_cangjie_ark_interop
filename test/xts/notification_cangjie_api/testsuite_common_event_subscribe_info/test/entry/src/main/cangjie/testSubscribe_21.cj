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
class testSubscribe_21 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_60100
     * @tc.name      : TestCase_601
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key505", ValueType.FD(1i32)), ("key506", ValueType.FD(1i32)), ("key507", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_601(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_601 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#448: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_601 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_60200
     * @tc.name      : TestCase_602
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key508", ValueType.FD(1i32)), ("key509", ValueType.FD(1i32)), ("key510", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_602(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_602 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#449: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_602 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_60300
     * @tc.name      : TestCase_603
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key511", ValueType.FD(1i32)), ("key512", ValueType.FD(1i32)), ("key513", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_603(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_603 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#450: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_603 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_60400
     * @tc.name      : TestCase_604
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key514", ValueType.FD(1i32)), ("key515", ValueType.FD(1i32)), ("key516", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_604(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_604 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#451: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_604 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_60500
     * @tc.name      : TestCase_605
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key517", ValueType.FD(1i32)), ("key518", ValueType.FD(1i32)), ("key519", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_605(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_605 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#452: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_605 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_60600
     * @tc.name      : TestCase_606
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key520", ValueType.FD(1i32)), ("key521", ValueType.FD(1i32)), ("key522", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_606(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_606 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#453: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_606 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_60700
     * @tc.name      : TestCase_607
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key523", ValueType.FD(1i32)), ("key524", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key525", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_607(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_607 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#454: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_607 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_60800
     * @tc.name      : TestCase_608
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key526", ValueType.FD(1i32)), ("key527", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key528", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_608(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_608 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#455: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_608 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_60900
     * @tc.name      : TestCase_609
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key529", ValueType.FD(1i32)), ("key530", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key531", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_609(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_609 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#456: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_609 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_61000
     * @tc.name      : TestCase_610
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key532", ValueType.FD(1i32)), ("key533", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key534", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_610(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_610 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#457: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_610 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_61100
     * @tc.name      : TestCase_611
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key535", ValueType.FD(1i32)), ("key536", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key537", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_611(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_611 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#458: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_611 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_61200
     * @tc.name      : TestCase_612
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key538", ValueType.FD(1i32)), ("key539", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key540", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_612(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_612 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#459: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_612 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_61300
     * @tc.name      : TestCase_613
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key541", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key542", ValueType.INT(-1i32)), ("key543", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_613(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_613 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#460: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_613 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_61400
     * @tc.name      : TestCase_614
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key544", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key545", ValueType.INT(-1i32)), ("key546", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_614(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_614 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#461: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_614 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_61500
     * @tc.name      : TestCase_615
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key547", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key548", ValueType.INT(-1i32)), ("key549", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_615(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_615 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#462: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_615 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_61600
     * @tc.name      : TestCase_616
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key550", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key551", ValueType.INT(-1i32)), ("key552", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_616(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_616 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#463: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_616 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_61700
     * @tc.name      : TestCase_617
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key553", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key554", ValueType.INT(-1i32)), ("key555", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_617(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_617 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#464: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_617 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_61800
     * @tc.name      : TestCase_618
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key556", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key557", ValueType.INT(-1i32)), ("key558", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_618(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_618 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#465: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_618 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_61900
     * @tc.name      : TestCase_619
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key559", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key560", ValueType.FLOAT64(-1.000000f64)), ("key561", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_619(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_619 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#466: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_619 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_62000
     * @tc.name      : TestCase_620
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key562", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key563", ValueType.FLOAT64(-1.000000f64)), ("key564", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_620(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_620 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#467: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_620 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_62100
     * @tc.name      : TestCase_621
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key565", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key566", ValueType.FLOAT64(-1.000000f64)), ("key567", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_621(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_621 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#468: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_621 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_62200
     * @tc.name      : TestCase_622
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key568", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key569", ValueType.FLOAT64(-1.000000f64)), ("key570", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_622(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_622 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#469: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_622 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_62300
     * @tc.name      : TestCase_623
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key571", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key572", ValueType.FLOAT64(-1.000000f64)), ("key573", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_623(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_623 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#470: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_623 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_62400
     * @tc.name      : TestCase_624
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key574", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key575", ValueType.FLOAT64(-1.000000f64)), ("key576", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_624(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_624 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#471: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_624 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_62500
     * @tc.name      : TestCase_625
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key577", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key578", ValueType.STRING("hello world")), ("key579", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_625(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_625 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#472: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_625 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_62600
     * @tc.name      : TestCase_626
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key580", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key581", ValueType.STRING("hello world")), ("key582", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_626(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_626 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#473: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_626 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_62700
     * @tc.name      : TestCase_627
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key583", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key584", ValueType.STRING("hello world")), ("key585", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_627(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_627 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#474: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_627 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_62800
     * @tc.name      : TestCase_628
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key586", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key587", ValueType.STRING("hello world")), ("key588", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_628(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_628 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#475: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_628 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_62900
     * @tc.name      : TestCase_629
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key589", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key590", ValueType.STRING("hello world")), ("key591", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_629(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_629 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#476: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_629 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_63000
     * @tc.name      : TestCase_630
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32, priority: 1i32, publisherBundleName: "3213")"+ "CommonEventData("", "", -1i32, "", HashMap([("key592", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key593", ValueType.STRING("hello world")), ("key594", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_630(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_630 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "3213", publisherDeviceId: "3213", userId: 1i32,
                    priority: 1i32, publisherBundleName: "3213"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#477: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_630 ends.")
    }
}
