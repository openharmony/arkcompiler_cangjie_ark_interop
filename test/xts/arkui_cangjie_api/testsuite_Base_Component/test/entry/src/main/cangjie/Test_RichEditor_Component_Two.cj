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

import kit.PerformanceAnalysisKit.Hilog
import std.unittest.testmacro.*
import ohos.ui_test.*
import std.unittest.*

@Test
class Test_RichEditor_Component_Two {
    prop driver: Driver {
        get() {
            OpenHarmonyTestRunner.driver
        }
    }

    protected override func beforeAll() {
        driver.delayMs(3000)
        driver.findComponent(On().onType("Scroll")).getOrThrow().scrollSearch(On().id("View_RichEditor")).getOrThrow().click()
        driver.delayMs(1000)
    }

    protected override func afterAll() {
        driver.delayMs(1000)
        driver.pressBack()
        driver.delayMs(1000)
        driver.pressBack()
    }

    
    /*
    * @tc.number    : Sub_Cangjie_UIKit_RichEditor_Component_Two_0100
    * @tc.name      : Test_RichEditor_Component_015
    * @tc.desc      : test UIKit RichEditor
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_RichEditor_Component_015() {
        let textContent = driver.findComponent(On().id("RichEditorKey"))
        textContent.getOrThrow().click()
        textContent.getOrThrow().clearText()
        let textDid1 = driver.findComponent(On().id("textDid1"))
        let textDid2 = driver.findComponent(On().id("textDid2"))
        driver.delayMs(500)
        driver.triggerKey(2024)
        driver.delayMs(500)
        driver.triggerKey(2021)
        driver.delayMs(500)
        driver.triggerKey(2028)
        driver.delayMs(500)
        driver.triggerKey(2028)
        driver.delayMs(500)
        driver.triggerKey(2031)
        driver.delayMs(500)
        driver.triggerKey(2050)
        driver.delayMs(500)
        driver.triggerKey(2019)
        driver.delayMs(500)
        driver.triggerKey(2017)
        driver.delayMs(500)
        driver.triggerKey(2030)
        driver.delayMs(500)
        driver.triggerKey(2023)
        driver.delayMs(500)
        driver.triggerKey(2026)
        driver.delayMs(500)
        driver.triggerKey(2025)
        driver.delayMs(500)
        driver.triggerKey(2021)
        driver.delayMs(500)
        let t1 = textDid1.getOrThrow().getText()
        let t2 = textDid2.getOrThrow().getText()
        @Expect(t1, "12--12")
        @Expect(t2, "12--13")
        textContent.getOrThrow().longClick()
        driver.delayMs(500)
        driver.findComponent(On().text("全选")).getOrThrow().click()
        driver.delayMs(500)
        driver.findComponent(On().text("剪切")).getOrThrow().click()
        driver.delayMs(500)
        let t3 = textDid1.getOrThrow().getText()
        let t4 = textDid2.getOrThrow().getText()
        @Expect(t3, "0--13")
        @Expect(t4, "0--0")
        textContent.getOrThrow().longClick()
        driver.delayMs(500)
        driver.findComponent(On().text("粘贴")).getOrThrow().click()
        driver.delayMs(500)
        let t5 = textDid1.getOrThrow().getText()
        let t6 = textDid2.getOrThrow().getText()
        @Expect(t5, "0--0")
        @Expect(t6, "0--13")
        textContent.getOrThrow().clearText()
        Hilog.info(0,"",   "cangjietest", "Test_RichEditor_Component_015 End")
    }

    
    /*
    * @tc.number    : Sub_Cangjie_UIKit_RichEditor_Component_Two_0200
    * @tc.name      : Test_RichEditor_Component_016
    * @tc.desc      : test UIKit RichEditor
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_RichEditor_Component_016() {
        let textContent = driver.findComponent(On().id("RichEditorKey"))
        driver.triggerKey(2119)
        driver.delayMs(500)
        driver.triggerKey(2024)
        driver.delayMs(500)
        driver.triggerKey(2021)
        driver.delayMs(500)
        driver.triggerKey(2028)
        driver.delayMs(500)
        driver.triggerKey(2028)
        driver.delayMs(500)
        driver.triggerKey(2031)
        driver.delayMs(500)
        driver.triggerKey(2050)
        driver.delayMs(500)

        driver.triggerKey(2019)
        driver.delayMs(500)
        driver.triggerKey(2017)
        driver.delayMs(500)
        driver.triggerKey(2030)
        driver.delayMs(500)
        driver.triggerKey(2023)
        driver.delayMs(500)
        driver.triggerKey(2026)
        driver.delayMs(500)
        driver.triggerKey(2025)
        driver.delayMs(500)
        driver.triggerKey(2021)
        driver.delayMs(500)
        driver.triggerKey(2119)
        driver.delayMs(500)
        let textDid1 = driver.findComponent(On().id("textDid1"))
        let textDid2 = driver.findComponent(On().id("textDid2"))
        let t1 = textDid1.getOrThrow().getText()
        let t2 = textDid2.getOrThrow().getText()
        @Expect(t1, "14--14")
        @Expect(t2, "14--15")
        textContent.getOrThrow().longClick()
        driver.delayMs(500)
        driver.findComponent(On().text("全选")).getOrThrow().click()
        driver.delayMs(500)
        driver.findComponent(On().text("剪切")).getOrThrow().click()
        driver.delayMs(500)
        let t3 = textDid1.getOrThrow().getText()
        let t4 = textDid2.getOrThrow().getText()
        @Expect(t3, "0--15")
        @Expect(t4, "0--0")
        textContent.getOrThrow().longClick()
        driver.delayMs(500)
        driver.findComponent(On().text("粘贴")).getOrThrow().click()
        driver.delayMs(500)
        let t5 = textDid1.getOrThrow().getText()
        let t6 = textDid2.getOrThrow().getText()
        @Expect(t5, "0--0")
        @Expect(t6, "0--15")
        textContent.getOrThrow().clearText()
        Hilog.info(0,"",   "cangjietest", "Test_RichEditor_Component_016 End")
    }

    
    /*
    * @tc.number    : Sub_Cangjie_UIKit_RichEditor_Component_Two_0300
    * @tc.name      : Test_RichEditor_Component_018
    * @tc.desc      : test UIKit RichEditor
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_RichEditor_Component_018() {
        let textContent = driver.findComponent(On().id("RichEditorKey"))
        let textDid1 = driver.findComponent(On().id("textDid1"))
        let textDid2 = driver.findComponent(On().id("textDid2"))
        let t1 = textDid1.getOrThrow().getText()
        let t2 = textDid2.getOrThrow().getText()
        @Expect(t1, "0--1")
        @Expect(t2, "0--0")
        driver.delayMs(500)
        driver.click(868, 2296)
        driver.delayMs(500)
        driver.click(936, 1943)
        driver.delayMs(500)
        driver.click(751, 2136)
        driver.delayMs(500)
        driver.click(134, 2132)
        driver.delayMs(500)
        driver.click(1057, 1964)
        driver.delayMs(500)
        driver.findComponent(On().text("你好")).getOrThrow().click()
        driver.delayMs(500)
        driver.triggerKey(2055)
        driver.delayMs(500)
        let t3 = textDid1.getOrThrow().getText()
        let t4 = textDid2.getOrThrow().getText()
        @Expect(t3, "1--2")
        @Expect(t4, "1--1")
        textContent.getOrThrow().clearText()
        Hilog.info(0,"",   "cangjietest", "Test_RichEditor_Component_018 End")
    }

    
    /*
    * @tc.number    : Sub_Cangjie_UIKit_RichEditor_Component_Two_0400
    * @tc.name      : Test_RichEditor_Component_019
    * @tc.desc      : test UIKit RichEditor
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_RichEditor_Component_019() {
        let textContent = driver.findComponent(On().id("RichEditorKey"))
        textContent.getOrThrow().clearText()
        let textDid1 = driver.findComponent(On().id("textDid1"))
        let textDid2 = driver.findComponent(On().id("textDid2"))
        let t1 = textDid1.getOrThrow().getText()
        let t2 = textDid2.getOrThrow().getText()
        @Expect(t1, "0--1")
        @Expect(t2, "0--0")
        driver.delayMs(500)
        driver.click(868, 2296)
        driver.delayMs(500)
        driver.click(936, 1943)
        driver.delayMs(500)
        driver.click(751, 2136)
        driver.delayMs(500)
        driver.click(134, 2132)
        driver.delayMs(500)
        driver.click(1057, 1964)
        driver.delayMs(500)
        driver.click(104, 1778)
        driver.delayMs(1000)
        driver.click(507, 2291)
        driver.delayMs(1000)
        driver.click(151, 2102)
        driver.delayMs(1000)
        driver.click(873, 2287)
        driver.delayMs(1000)
        driver.click(629, 2115)
        driver.delayMs(1000)
        driver.click(894, 2111)
        driver.delayMs(1000)
        driver.click(927, 1972)
        driver.delayMs(1000)
        driver.click(314, 1947)
        driver.delayMs(1000)
        driver.findComponent(On().text("仓颉")).getOrThrow().click()
        driver.delayMs(500)
        driver.triggerKey(2055)
        driver.triggerKey(2055)
        driver.triggerKey(2055)
        driver.delayMs(500)
        let t3 = textDid1.getOrThrow().getText()
        let t4 = textDid2.getOrThrow().getText()
        @Expect(t3, "1--2")
        @Expect(t4, "1--1")
        textContent.getOrThrow().clearText()
        Hilog.info(0,"",   "cangjietest", "Test_RichEditor_Component_019 End")
    }

    
    /*
    * @tc.number    : Sub_Cangjie_UIKit_RichEditor_Component_Two_0500
    * @tc.name      : Test_RichEditor_Component_020
    * @tc.desc      : test UIKit RichEditor
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_RichEditor_Component_020() {
        let textContent = driver.findComponent(On().id("RichEditorKey"))
        textContent.getOrThrow().clearText()
        let textDid1 = driver.findComponent(On().id("textDid1"))
        let textDid2 = driver.findComponent(On().id("textDid2"))
        let t1 = textDid1.getOrThrow().getText()
        let t2 = textDid2.getOrThrow().getText()
        @Expect(t1, "0--1")
        @Expect(t2, "0--0")
        driver.delayMs(500)
        driver.click(868, 2296)
        driver.delayMs(500)
        driver.click(936, 1943)
        driver.delayMs(500)
        driver.click(751, 2136)
        driver.delayMs(500)
        driver.click(134, 2132)
        driver.delayMs(500)
        driver.click(1057, 1964)
        driver.delayMs(500)
        driver.findComponent(On().text("你好")).getOrThrow().click()
        driver.delayMs(500)
        textContent.getOrThrow().longClick()
        driver.delayMs(500)
        driver.findComponent(On().text("全选")).getOrThrow().click()
        driver.delayMs(500)
        driver.findComponent(On().text("剪切")).getOrThrow().click()
        driver.delayMs(500)
        let t3 = textDid1.getOrThrow().getText()
        let t4 = textDid2.getOrThrow().getText()
        @Expect(t3, "0--2")
        @Expect(t4, "0--0")
        textContent.getOrThrow().clearText()
        Hilog.info(0,"",   "cangjietest", "Test_RichEditor_Component_020 End")
    }

    
    /*
    * @tc.number    : Sub_Cangjie_UIKit_RichEditor_Component_Two_0600
    * @tc.name      : Test_RichEditor_Component_021
    * @tc.desc      : test UIKit RichEditor
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_RichEditor_Component_021() {
        let textContent = driver.findComponent(On().id("RichEditorKey"))
        textContent.getOrThrow().clearText()
        driver.delayMs(500)
        driver.click(1187, 2447)
        driver.delayMs(500)
        driver.click(868, 2296)
        driver.delayMs(500)
        driver.click(936, 1943)
        driver.delayMs(500)
        driver.click(751, 2136)
        driver.delayMs(500)
        driver.click(134, 2132)
        driver.delayMs(500)
        driver.click(1057, 1964)
        driver.delayMs(500)
        driver.findComponent(On().text("你好")).getOrThrow().click()
        driver.delayMs(500)
        driver.click(1187, 2447)
        driver.delayMs(500)
        textContent.getOrThrow().longClick()
        driver.delayMs(500)
        driver.findComponent(On().text("全选")).getOrThrow().click()
        driver.delayMs(500)
        driver.findComponent(On().text("剪切")).getOrThrow().click()
        driver.delayMs(500)
        let textDid1 = driver.findComponent(On().id("textDid1"))
        let textDid2 = driver.findComponent(On().id("textDid2"))
        let t3 = textDid1.getOrThrow().getText()
        let t4 = textDid2.getOrThrow().getText()
        @Expect(t3, "0--4")
        @Expect(t4, "0--0")
        textContent.getOrThrow().clearText()
        Hilog.info(0,"",   "cangjietest", "Test_RichEditor_Component_021 End")
    }
    
    /*
    * @tc.number    : Sub_Cangjie_UIKit_RichEditor_Component_Two_0700
    * @tc.name      : Test_RichEditor_Component_022
    * @tc.desc      : test UIKit RichEditor
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_RichEditor_Component_022() {
        let textContent = driver.findComponent(On().id("RichEditorKey"))
        driver.findComponent(On().id("addTextSpan1")).getOrThrow().click()
        driver.delayMs(500)
        let textDid1 = driver.findComponent(On().id("textDid1"))
        let textDid2 = driver.findComponent(On().id("textDid2"))
        let t1 = textDid1.getOrThrow().getText()
        let t2 = textDid2.getOrThrow().getText()
        @Expect(t1, "0--0")
        @Expect(t2, "0--15")

        textContent.getOrThrow().clearText()
        Hilog.info(0,"",   "cangjietest", "Test_RichEditor_Component_022 End")
    }

    
    /*
    * @tc.number    : Sub_Cangjie_UIKit_RichEditor_Component_Two_0800
    * @tc.name      : Test_RichEditor_Component_024
    * @tc.desc      : test UIKit RichEditor
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_RichEditor_Component_024() {
        let textContent = driver.findComponent(On().id("RichEditorKey"))
        driver.findComponent(On().id("addTextSpan3")).getOrThrow().click()
        driver.delayMs(500)
        let textDid1 = driver.findComponent(On().id("textDid1"))
        let textDid2 = driver.findComponent(On().id("textDid2"))
        let t1 = textDid1.getOrThrow().getText()
        let t2 = textDid2.getOrThrow().getText()
        @Expect(t1, "0--0")
        @Expect(t2, "0--0")

        textContent.getOrThrow().clearText()
        Hilog.info(0,"",   "cangjietest", "Test_RichEditor_Component_024 End")
    }

    
    /*
    * @tc.number    : Sub_Cangjie_UIKit_RichEditor_Component_Two_0900
    * @tc.name      : Test_RichEditor_Component_025
    * @tc.desc      : test UIKit RichEditor
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_RichEditor_Component_025() {
        let textContent = driver.findComponent(On().id("RichEditorKey"))
        driver.findComponent(On().id("addTextSpan4")).getOrThrow().click()
        driver.delayMs(500)
        let textDid1 = driver.findComponent(On().id("textDid1"))
        let textDid2 = driver.findComponent(On().id("textDid2"))
        let t1 = textDid1.getOrThrow().getText()
        let t2 = textDid2.getOrThrow().getText()
        @Expect(t1, "0--0")
        @Expect(t2, "0--7")

        textContent.getOrThrow().clearText()
        Hilog.info(0,"",   "cangjietest", "Test_RichEditor_Component_025 End")
    }
    
    /*
    * @tc.number    : Sub_Cangjie_UIKit_RichEditor_Component_Two_1000
    * @tc.name      : Test_RichEditor_Component_017
    * @tc.desc      : test UIKit RichEditor
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 0
    */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func Test_RichEditor_Component_017() {
        driver.swipe(1162, 70, 1162, 1300, speed: 600)
        driver.delayMs(500)
        driver.click(1066, 302)
        driver.delayMs(500)
        driver.findComponent(On().id("__SearchField__homPageSearchInput")).getOrThrow().inputText("输入法")
        driver.delayMs(500)
        driver.findComponent(On().text("小艺输入法")).getOrThrow().click()
        driver.delayMs(500)
        driver.findComponent(On().text("输入设置")).getOrThrow().click()
        driver.delayMs(500)
        driver.click(1105, 1816)
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
        let textContent = driver.findComponent(On().id("RichEditorKey"))
        textContent.getOrThrow().clearText()
        let textDid1 = driver.findComponent(On().id("textDid1"))
        let textDid2 = driver.findComponent(On().id("textDid2"))
        let t1 = textDid1.getOrThrow().getText()
        let t2 = textDid2.getOrThrow().getText()
        @Expect(t1, "0--1")
        @Expect(t2, "0--0")
        driver.delayMs(500)
        driver.click(868, 2296)
        driver.delayMs(500)
        driver.click(936, 1943)
        driver.delayMs(500)
        driver.click(751, 2136)
        driver.delayMs(500)
        driver.click(134, 2132)
        driver.delayMs(500)
        driver.click(1057, 1964)
        driver.delayMs(500)
        let t3 = textDid1.getOrThrow().getText()
        let t4 = textDid2.getOrThrow().getText()
        @Expect(t3, "0--5")
        @Expect(t4, "0--6")
        textContent.getOrThrow().clearText()
        driver.swipe(1162, 70, 1162, 1300, speed: 600)
        driver.delayMs(500)
        driver.click(1066, 302)
        driver.delayMs(500)
        driver.findComponent(On().id("__SearchField__homPageSearchInput")).getOrThrow().inputText("输入法")
        driver.delayMs(500)
        driver.findComponent(On().text("小艺输入法")).getOrThrow().click()
        driver.delayMs(500)
        driver.findComponent(On().text("输入设置")).getOrThrow().click()
        driver.delayMs(500)
        driver.click(1105, 1816)
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
        driver.pressBack()
        driver.delayMs(500)
        Hilog.info(0,"",   "cangjietest", "Test_RichEditor_Component_017 End")
    }
}
