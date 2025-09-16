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
class testSubscribe_30 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_87100
     * @tc.name      : TestCase_871
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key19", ValueType.INT(-1i32)), ("key20", ValueType.FLOAT64(-1.000000f64)), ("key21", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_871(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_871 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#718: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_871 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_87200
     * @tc.name      : TestCase_872
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key22", ValueType.INT(-1i32)), ("key23", ValueType.FLOAT64(-1.000000f64)), ("key24", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_872(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_872 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#719: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_872 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_87300
     * @tc.name      : TestCase_873
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key25", ValueType.INT(-1i32)), ("key26", ValueType.FLOAT64(-1.000000f64)), ("key27", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_873(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_873 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#720: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_873 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_87400
     * @tc.name      : TestCase_874
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key28", ValueType.INT(-1i32)), ("key29", ValueType.FLOAT64(-1.000000f64)), ("key30", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_874(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_874 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#721: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_874 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_87500
     * @tc.name      : TestCase_875
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key31", ValueType.INT(-1i32)), ("key32", ValueType.FLOAT64(-1.000000f64)), ("key33", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_875(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_875 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#722: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_875 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_87600
     * @tc.name      : TestCase_876
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key34", ValueType.INT(-1i32)), ("key35", ValueType.FLOAT64(-1.000000f64)), ("key36", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_876(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_876 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#723: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_876 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_87700
     * @tc.name      : TestCase_877
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key37", ValueType.INT(-1i32)), ("key38", ValueType.STRING("hello world")), ("key39", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_877(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_877 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#724: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_877 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_87800
     * @tc.name      : TestCase_878
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key40", ValueType.INT(-1i32)), ("key41", ValueType.STRING("hello world")), ("key42", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_878(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_878 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#725: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_878 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_87900
     * @tc.name      : TestCase_879
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key43", ValueType.INT(-1i32)), ("key44", ValueType.STRING("hello world")), ("key45", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_879(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_879 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#726: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_879 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_88000
     * @tc.name      : TestCase_880
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key46", ValueType.INT(-1i32)), ("key47", ValueType.STRING("hello world")), ("key48", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_880(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_880 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#727: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_880 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_88100
     * @tc.name      : TestCase_881
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key49", ValueType.INT(-1i32)), ("key50", ValueType.STRING("hello world")), ("key51", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_881(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_881 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#728: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_881 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_88200
     * @tc.name      : TestCase_882
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key52", ValueType.INT(-1i32)), ("key53", ValueType.STRING("hello world")), ("key54", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_882(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_882 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#729: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_882 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_88300
     * @tc.name      : TestCase_883
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key55", ValueType.INT(-1i32)), ("key56", ValueType.BOOL(true)), ("key57", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_883(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_883 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#730: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_883 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_88400
     * @tc.name      : TestCase_884
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key58", ValueType.INT(-1i32)), ("key59", ValueType.BOOL(true)), ("key60", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_884(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_884 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#731: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_884 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_88500
     * @tc.name      : TestCase_885
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key61", ValueType.INT(-1i32)), ("key62", ValueType.BOOL(true)), ("key63", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_885(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_885 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#732: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_885 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_88600
     * @tc.name      : TestCase_886
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key64", ValueType.INT(-1i32)), ("key65", ValueType.BOOL(true)), ("key66", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_886(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_886 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#733: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_886 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_88700
     * @tc.name      : TestCase_887
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key67", ValueType.INT(-1i32)), ("key68", ValueType.BOOL(true)), ("key69", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_887(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_887 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#734: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_887 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_88800
     * @tc.name      : TestCase_888
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key70", ValueType.INT(-1i32)), ("key71", ValueType.BOOL(true)), ("key72", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_888(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_888 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#735: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_888 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_88900
     * @tc.name      : TestCase_889
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key73", ValueType.INT(-1i32)), ("key74", ValueType.FD(1i32)), ("key75", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_889(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_889 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#736: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_889 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_89000
     * @tc.name      : TestCase_890
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key76", ValueType.INT(-1i32)), ("key77", ValueType.FD(1i32)), ("key78", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_890(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_890 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#737: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_890 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_89100
     * @tc.name      : TestCase_891
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key79", ValueType.INT(-1i32)), ("key80", ValueType.FD(1i32)), ("key81", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_891(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_891 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#738: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_891 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_89200
     * @tc.name      : TestCase_892
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key82", ValueType.INT(-1i32)), ("key83", ValueType.FD(1i32)), ("key84", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_892(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_892 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#739: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_892 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_89300
     * @tc.name      : TestCase_893
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key85", ValueType.INT(-1i32)), ("key86", ValueType.FD(1i32)), ("key87", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_893(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_893 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#740: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_893 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_89400
     * @tc.name      : TestCase_894
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key88", ValueType.INT(-1i32)), ("key89", ValueType.FD(1i32)), ("key90", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_894(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_894 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#741: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_894 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_89500
     * @tc.name      : TestCase_895
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key91", ValueType.INT(-1i32)), ("key92", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key93", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_895(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_895 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#742: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_895 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_89600
     * @tc.name      : TestCase_896
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key94", ValueType.INT(-1i32)), ("key95", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key96", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_896(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_896 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#743: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_896 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_89700
     * @tc.name      : TestCase_897
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key97", ValueType.INT(-1i32)), ("key98", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key99", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_897(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_897 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#744: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_897 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_89800
     * @tc.name      : TestCase_898
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key100", ValueType.INT(-1i32)), ("key101", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key102", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_898(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_898 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#745: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_898 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_89900
     * @tc.name      : TestCase_899
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key103", ValueType.INT(-1i32)), ("key104", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key105", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_899(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_899 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#746: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_899 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_90000
     * @tc.name      : TestCase_900
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3", userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3")"+ "CommonEventData("", "", -1i32, "", HashMap([("key106", ValueType.INT(-1i32)), ("key107", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key108", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_900(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_900 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "@POD3e3", publisherDeviceId: "@POD3e3",
                    userId: 10000i32, priority: 10000i32, publisherBundleName: "@POD3e3"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#747: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_900 ends.")
    }
}
