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
class testSubscribe_25 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_72100
     * @tc.name      : TestCase_721
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key217", ValueType.STRING("hello world")), ("key218", ValueType.INT(-1i32)), ("key219", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_721(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_721 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#568: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_721 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_72200
     * @tc.name      : TestCase_722
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key220", ValueType.STRING("hello world")), ("key221", ValueType.INT(-1i32)), ("key222", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_722(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_722 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#569: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_722 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_72300
     * @tc.name      : TestCase_723
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key223", ValueType.STRING("hello world")), ("key224", ValueType.INT(-1i32)), ("key225", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_723(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_723 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#570: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_723 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_72400
     * @tc.name      : TestCase_724
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key226", ValueType.STRING("hello world")), ("key227", ValueType.INT(-1i32)), ("key228", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_724(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_724 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#571: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_724 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_72500
     * @tc.name      : TestCase_725
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key229", ValueType.STRING("hello world")), ("key230", ValueType.INT(-1i32)), ("key231", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_725(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_725 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#572: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_725 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_72600
     * @tc.name      : TestCase_726
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key232", ValueType.STRING("hello world")), ("key233", ValueType.INT(-1i32)), ("key234", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_726(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_726 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#573: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_726 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_72700
     * @tc.name      : TestCase_727
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key235", ValueType.STRING("hello world")), ("key236", ValueType.FLOAT64(-1.000000f64)), ("key237", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_727(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_727 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#574: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_727 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_72800
     * @tc.name      : TestCase_728
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key238", ValueType.STRING("hello world")), ("key239", ValueType.FLOAT64(-1.000000f64)), ("key240", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_728(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_728 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#575: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_728 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_72900
     * @tc.name      : TestCase_729
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key241", ValueType.STRING("hello world")), ("key242", ValueType.FLOAT64(-1.000000f64)), ("key243", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_729(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_729 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#576: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_729 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_73000
     * @tc.name      : TestCase_730
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key244", ValueType.STRING("hello world")), ("key245", ValueType.FLOAT64(-1.000000f64)), ("key246", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_730(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_730 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#577: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_730 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_73100
     * @tc.name      : TestCase_731
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key247", ValueType.STRING("hello world")), ("key248", ValueType.FLOAT64(-1.000000f64)), ("key249", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_731(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_731 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#578: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_731 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_73200
     * @tc.name      : TestCase_732
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key250", ValueType.STRING("hello world")), ("key251", ValueType.FLOAT64(-1.000000f64)), ("key252", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_732(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_732 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#579: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_732 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_73300
     * @tc.name      : TestCase_733
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key253", ValueType.STRING("hello world")), ("key254", ValueType.STRING("hello world")), ("key255", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_733(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_733 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#580: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_733 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_73400
     * @tc.name      : TestCase_734
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key256", ValueType.STRING("hello world")), ("key257", ValueType.STRING("hello world")), ("key258", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_734(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_734 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#581: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_734 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_73500
     * @tc.name      : TestCase_735
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key259", ValueType.STRING("hello world")), ("key260", ValueType.STRING("hello world")), ("key261", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_735(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_735 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#582: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_735 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_73600
     * @tc.name      : TestCase_736
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key262", ValueType.STRING("hello world")), ("key263", ValueType.STRING("hello world")), ("key264", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_736(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_736 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#583: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_736 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_73700
     * @tc.name      : TestCase_737
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key265", ValueType.STRING("hello world")), ("key266", ValueType.STRING("hello world")), ("key267", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_737(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_737 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#584: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_737 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_73800
     * @tc.name      : TestCase_738
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key268", ValueType.STRING("hello world")), ("key269", ValueType.STRING("hello world")), ("key270", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_738(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_738 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#585: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_738 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_73900
     * @tc.name      : TestCase_739
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key271", ValueType.STRING("hello world")), ("key272", ValueType.BOOL(true)), ("key273", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_739(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_739 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#586: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_739 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_74000
     * @tc.name      : TestCase_740
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key274", ValueType.STRING("hello world")), ("key275", ValueType.BOOL(true)), ("key276", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_740(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_740 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#587: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_740 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_74100
     * @tc.name      : TestCase_741
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key277", ValueType.STRING("hello world")), ("key278", ValueType.BOOL(true)), ("key279", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_741(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_741 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#588: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_741 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_74200
     * @tc.name      : TestCase_742
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key280", ValueType.STRING("hello world")), ("key281", ValueType.BOOL(true)), ("key282", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_742(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_742 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#589: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_742 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_74300
     * @tc.name      : TestCase_743
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key283", ValueType.STRING("hello world")), ("key284", ValueType.BOOL(true)), ("key285", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_743(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_743 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#590: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_743 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_74400
     * @tc.name      : TestCase_744
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key286", ValueType.STRING("hello world")), ("key287", ValueType.BOOL(true)), ("key288", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_744(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_744 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#591: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_744 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_74500
     * @tc.name      : TestCase_745
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key289", ValueType.STRING("hello world")), ("key290", ValueType.FD(1i32)), ("key291", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_745(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_745 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#592: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_745 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_74600
     * @tc.name      : TestCase_746
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key292", ValueType.STRING("hello world")), ("key293", ValueType.FD(1i32)), ("key294", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_746(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_746 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#593: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_746 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_74700
     * @tc.name      : TestCase_747
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key295", ValueType.STRING("hello world")), ("key296", ValueType.FD(1i32)), ("key297", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_747(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_747 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#594: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_747 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_74800
     * @tc.name      : TestCase_748
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key298", ValueType.STRING("hello world")), ("key299", ValueType.FD(1i32)), ("key300", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_748(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_748 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#595: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_748 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_74900
     * @tc.name      : TestCase_749
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key301", ValueType.STRING("hello world")), ("key302", ValueType.FD(1i32)), ("key303", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_749(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_749 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#596: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_749 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_75000
     * @tc.name      : TestCase_750
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./", userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./")"+ "CommonEventData("", "", -1i32, "", HashMap([("key304", ValueType.STRING("hello world")), ("key305", ValueType.FD(1i32)), ("key306", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_750(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_750 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "#@#$%*d./", publisherDeviceId: "#@#$%*d./",
                    userId: 10i32, priority: 10i32, publisherBundleName: "#@#$%*d./"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#597: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_750 ends.")
    }
}
