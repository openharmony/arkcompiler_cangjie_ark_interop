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
class testSubscribe_32 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_93100
     * @tc.name      : TestCase_931
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key199", ValueType.FLOAT64(-1.000000f64)), ("key200", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key201", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_931(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_931 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#778: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_931 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_93200
     * @tc.name      : TestCase_932
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key202", ValueType.FLOAT64(-1.000000f64)), ("key203", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key204", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_932(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_932 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#779: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_932 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_93300
     * @tc.name      : TestCase_933
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key205", ValueType.FLOAT64(-1.000000f64)), ("key206", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key207", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_933(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_933 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#780: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_933 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_93400
     * @tc.name      : TestCase_934
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key208", ValueType.FLOAT64(-1.000000f64)), ("key209", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key210", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_934(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_934 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#781: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_934 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_93500
     * @tc.name      : TestCase_935
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key211", ValueType.FLOAT64(-1.000000f64)), ("key212", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key213", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_935(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_935 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#782: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_935 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_93600
     * @tc.name      : TestCase_936
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key214", ValueType.FLOAT64(-1.000000f64)), ("key215", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key216", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_936(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_936 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#783: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_936 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_93700
     * @tc.name      : TestCase_937
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key217", ValueType.STRING("hello world")), ("key218", ValueType.INT(-1i32)), ("key219", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_937(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_937 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#784: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_937 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_93800
     * @tc.name      : TestCase_938
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key220", ValueType.STRING("hello world")), ("key221", ValueType.INT(-1i32)), ("key222", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_938(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_938 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#785: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_938 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_93900
     * @tc.name      : TestCase_939
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key223", ValueType.STRING("hello world")), ("key224", ValueType.INT(-1i32)), ("key225", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_939(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_939 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#786: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_939 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_94000
     * @tc.name      : TestCase_940
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key226", ValueType.STRING("hello world")), ("key227", ValueType.INT(-1i32)), ("key228", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_940(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_940 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#787: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_940 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_94100
     * @tc.name      : TestCase_941
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key229", ValueType.STRING("hello world")), ("key230", ValueType.INT(-1i32)), ("key231", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_941(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_941 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#788: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_941 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_94200
     * @tc.name      : TestCase_942
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key232", ValueType.STRING("hello world")), ("key233", ValueType.INT(-1i32)), ("key234", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_942(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_942 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#789: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_942 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_94300
     * @tc.name      : TestCase_943
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key235", ValueType.STRING("hello world")), ("key236", ValueType.FLOAT64(-1.000000f64)), ("key237", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_943(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_943 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#790: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_943 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_94400
     * @tc.name      : TestCase_944
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key238", ValueType.STRING("hello world")), ("key239", ValueType.FLOAT64(-1.000000f64)), ("key240", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_944(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_944 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#791: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_944 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_94500
     * @tc.name      : TestCase_945
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key241", ValueType.STRING("hello world")), ("key242", ValueType.FLOAT64(-1.000000f64)), ("key243", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_945(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_945 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#792: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_945 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_94600
     * @tc.name      : TestCase_946
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key244", ValueType.STRING("hello world")), ("key245", ValueType.FLOAT64(-1.000000f64)), ("key246", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_946(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_946 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#793: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_946 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_94700
     * @tc.name      : TestCase_947
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key247", ValueType.STRING("hello world")), ("key248", ValueType.FLOAT64(-1.000000f64)), ("key249", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_947(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_947 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#794: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_947 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_94800
     * @tc.name      : TestCase_948
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key250", ValueType.STRING("hello world")), ("key251", ValueType.FLOAT64(-1.000000f64)), ("key252", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_948(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_948 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#795: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_948 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_94900
     * @tc.name      : TestCase_949
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key253", ValueType.STRING("hello world")), ("key254", ValueType.STRING("hello world")), ("key255", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_949(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_949 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#796: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_949 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_95000
     * @tc.name      : TestCase_950
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key256", ValueType.STRING("hello world")), ("key257", ValueType.STRING("hello world")), ("key258", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_950(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_950 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#797: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_950 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_95100
     * @tc.name      : TestCase_951
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key259", ValueType.STRING("hello world")), ("key260", ValueType.STRING("hello world")), ("key261", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_951(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_951 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#798: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_951 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_95200
     * @tc.name      : TestCase_952
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key262", ValueType.STRING("hello world")), ("key263", ValueType.STRING("hello world")), ("key264", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_952(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_952 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#799: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_952 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_95300
     * @tc.name      : TestCase_953
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key265", ValueType.STRING("hello world")), ("key266", ValueType.STRING("hello world")), ("key267", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_953(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_953 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#800: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_953 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_95400
     * @tc.name      : TestCase_954
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key268", ValueType.STRING("hello world")), ("key269", ValueType.STRING("hello world")), ("key270", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_954(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_954 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#801: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_954 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_95500
     * @tc.name      : TestCase_955
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key271", ValueType.STRING("hello world")), ("key272", ValueType.BOOL(true)), ("key273", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_955(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_955 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#802: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_955 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_95600
     * @tc.name      : TestCase_956
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key274", ValueType.STRING("hello world")), ("key275", ValueType.BOOL(true)), ("key276", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_956(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_956 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#803: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_956 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_95700
     * @tc.name      : TestCase_957
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key277", ValueType.STRING("hello world")), ("key278", ValueType.BOOL(true)), ("key279", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_957(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_957 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#804: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_957 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_95800
     * @tc.name      : TestCase_958
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key280", ValueType.STRING("hello world")), ("key281", ValueType.BOOL(true)), ("key282", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_958(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_958 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#805: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_958 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_95900
     * @tc.name      : TestCase_959
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key283", ValueType.STRING("hello world")), ("key284", ValueType.BOOL(true)), ("key285", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_959(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_959 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#806: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_959 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_96000
     * @tc.name      : TestCase_960
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key286", ValueType.STRING("hello world")), ("key287", ValueType.BOOL(true)), ("key288", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_960(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_960 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#807: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_960 ends.")
    }
}
