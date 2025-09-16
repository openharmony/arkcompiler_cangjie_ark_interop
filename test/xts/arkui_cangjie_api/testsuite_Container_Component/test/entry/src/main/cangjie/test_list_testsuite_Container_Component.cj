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
let _ = testsuite()

func testsuite(): Unit {
    registerTestSuite("Test_GridCol_Component", {=> Test_GridCol_Component()})
    registerTestSuite("Test_Scroll_Component", {=> Test_Scroll_Component()})
    registerTestSuite("Test_Column_Component", {=> Test_Column_Component()})
    registerTestSuite("Test_Flex_Component", {=> Test_Flex_Component()})
    registerTestSuite("Test_Grid_Component", {=> Test_Grid_Component()})
    registerTestSuite("Test_Swiper_Component", {=> Test_Swiper_Component()})
    registerTestSuite("Test_GridRow_Component", {=> Test_GridRow_Component()})
    registerTestSuite("Test_Stack_Component", {=> Test_Stack_Component()})
    registerTestSuite("Test_ListItemGroup_Component", {=> Test_ListItemGroup_Component()})
    registerTestSuite("Test_List_Component", {=> Test_List_Component()})
    registerTestSuite("Test_Row_Component", {=> Test_Row_Component()})
    registerTestSuite("Test_ListItem_Component", {=> Test_ListItem_Component()})
    registerTestSuite("Test_Scroll2_Component", {=> Test_Scroll2_Component()})
    registerTestSuite("Test_TabContent_Component", {=> Test_TabContent_Component()})
    registerTestSuite("Test_GridItem_Component", {=> Test_GridItem_Component()})
    registerTestSuite("Test_Tabs_Component", {=> Test_Tabs_Component()})
}
