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
class testSubscribe_62 {
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
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_183100
     * @tc.name      : TestCase_1831
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key307", ValueType.STRING("hello world")), ("key308", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key309", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1831(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1831 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1678: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1831 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_183200
     * @tc.name      : TestCase_1832
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key310", ValueType.STRING("hello world")), ("key311", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key312", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1832(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1832 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1679: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1832 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_183300
     * @tc.name      : TestCase_1833
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key313", ValueType.STRING("hello world")), ("key314", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key315", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1833(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1833 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1680: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1833 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_183400
     * @tc.name      : TestCase_1834
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key316", ValueType.STRING("hello world")), ("key317", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key318", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1834(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1834 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1681: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1834 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_183500
     * @tc.name      : TestCase_1835
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key319", ValueType.STRING("hello world")), ("key320", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key321", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1835(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1835 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1682: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1835 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_183600
     * @tc.name      : TestCase_1836
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key322", ValueType.STRING("hello world")), ("key323", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"])), ("key324", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1836(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1836 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1683: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1836 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_183700
     * @tc.name      : TestCase_1837
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key325", ValueType.BOOL(true)), ("key326", ValueType.INT(-1i32)), ("key327", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1837(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1837 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1684: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1837 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_183800
     * @tc.name      : TestCase_1838
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key328", ValueType.BOOL(true)), ("key329", ValueType.INT(-1i32)), ("key330", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1838(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1838 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1685: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1838 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_183900
     * @tc.name      : TestCase_1839
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key331", ValueType.BOOL(true)), ("key332", ValueType.INT(-1i32)), ("key333", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1839(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1839 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1686: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1839 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_184000
     * @tc.name      : TestCase_1840
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key334", ValueType.BOOL(true)), ("key335", ValueType.INT(-1i32)), ("key336", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1840(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1840 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1687: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1840 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_184100
     * @tc.name      : TestCase_1841
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key337", ValueType.BOOL(true)), ("key338", ValueType.INT(-1i32)), ("key339", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1841(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1841 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1688: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1841 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_184200
     * @tc.name      : TestCase_1842
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key340", ValueType.BOOL(true)), ("key341", ValueType.INT(-1i32)), ("key342", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1842(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1842 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1689: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1842 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_184300
     * @tc.name      : TestCase_1843
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key343", ValueType.BOOL(true)), ("key344", ValueType.FLOAT64(-1.000000f64)), ("key345", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1843(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1843 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1690: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1843 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_184400
     * @tc.name      : TestCase_1844
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key346", ValueType.BOOL(true)), ("key347", ValueType.FLOAT64(-1.000000f64)), ("key348", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1844(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1844 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1691: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1844 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_184500
     * @tc.name      : TestCase_1845
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key349", ValueType.BOOL(true)), ("key350", ValueType.FLOAT64(-1.000000f64)), ("key351", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1845(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1845 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1692: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1845 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_184600
     * @tc.name      : TestCase_1846
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key352", ValueType.BOOL(true)), ("key353", ValueType.FLOAT64(-1.000000f64)), ("key354", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1846(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1846 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1693: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1846 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_184700
     * @tc.name      : TestCase_1847
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key355", ValueType.BOOL(true)), ("key356", ValueType.FLOAT64(-1.000000f64)), ("key357", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1847(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1847 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1694: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1847 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_184800
     * @tc.name      : TestCase_1848
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key358", ValueType.BOOL(true)), ("key359", ValueType.FLOAT64(-1.000000f64)), ("key360", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1848(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1848 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1695: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1848 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_184900
     * @tc.name      : TestCase_1849
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key361", ValueType.BOOL(true)), ("key362", ValueType.STRING("hello world")), ("key363", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1849(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1849 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1696: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1849 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_185000
     * @tc.name      : TestCase_1850
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key364", ValueType.BOOL(true)), ("key365", ValueType.STRING("hello world")), ("key366", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1850(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1850 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1697: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1850 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_185100
     * @tc.name      : TestCase_1851
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key367", ValueType.BOOL(true)), ("key368", ValueType.STRING("hello world")), ("key369", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1851(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1851 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1698: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1851 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_185200
     * @tc.name      : TestCase_1852
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key370", ValueType.BOOL(true)), ("key371", ValueType.STRING("hello world")), ("key372", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1852(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1852 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1699: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1852 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_185300
     * @tc.name      : TestCase_1853
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key373", ValueType.BOOL(true)), ("key374", ValueType.STRING("hello world")), ("key375", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1853(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1853 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1700: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1853 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_185400
     * @tc.name      : TestCase_1854
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key376", ValueType.BOOL(true)), ("key377", ValueType.STRING("hello world")), ("key378", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1854(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1854 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1701: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1854 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_185500
     * @tc.name      : TestCase_1855
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key379", ValueType.BOOL(true)), ("key380", ValueType.BOOL(true)), ("key381", ValueType.INT(-1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1855(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1855 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1702: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1855 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_185600
     * @tc.name      : TestCase_1856
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key382", ValueType.BOOL(true)), ("key383", ValueType.BOOL(true)), ("key384", ValueType.FLOAT64(-1.000000f64))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1856(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1856 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1703: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1856 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_185700
     * @tc.name      : TestCase_1857
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key385", ValueType.BOOL(true)), ("key386", ValueType.BOOL(true)), ("key387", ValueType.STRING("hello world"))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1857(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1857 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1704: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1857 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_185800
     * @tc.name      : TestCase_1858
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key388", ValueType.BOOL(true)), ("key389", ValueType.BOOL(true)), ("key390", ValueType.BOOL(true))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1858(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1858 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1705: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1858 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_185900
     * @tc.name      : TestCase_1859
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key391", ValueType.BOOL(true)), ("key392", ValueType.BOOL(true)), ("key393", ValueType.FD(1i32))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1859(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1859 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1706: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1859 ends.")
    }

    /*
     * @tc.number    : Sub_Cangjie_testSubscribe_subscribe_186000
     * @tc.name      : TestCase_1860
     * @tc.desc      : test subscribe param use  "CommonEventSubscribeInfo ([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*", userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*")"+ "CommonEventData("", "", -1i32, "", HashMap([("key394", ValueType.BOOL(true)), ("key395", ValueType.BOOL(true)), ("key396", ValueType.ARRSTRING(["", "aaaa", "#!$@$23", "reason", "1234567890", "!#$@%^&*"]))]))"
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel21, TestLevel0]
    func TestCase_1860(): Unit {
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1860 begins.")
        Hilog.info(0u32, "cangjietest", "", "requestSuspendDelay failed")
        try {
            let sub = CommonEventManager.createSubscriber(
                CommonEventSubscribeInfo([], publisherPermission: "!#$@%^&*", publisherDeviceId: "!#$@%^&*",
                    userId: -1i32, priority: -1i32, publisherBundleName: "!#$@%^&*"))
            CommonEventManager.subscribe(sub, {
                e: Option<BusinessException>, a: Option<CommonEventData> => Hilog.info(0u32, "cangjietest", "",
                    "onframe")
            })
            @Expect("assertion#1707: not throw", "requestSuspendDelay failed")
        } catch (e: BusinessException) {
            @Expect(e.code, 401i32)
        }
        Hilog.info(0u32, "cangjietest", "", "testcase TestCase_1860 ends.")
    }
}
