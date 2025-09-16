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
    registerTestSuite("Test_ShapeCropping_Component", {=> Test_ShapeCropping_Component()})
    registerTestSuite("Test_Focus_Component", {=> Test_Focus_Component()})
    registerTestSuite("Test_TextCommon_Component", {=> Test_TextCommon_Component()})
    registerTestSuite("Test_Flex_Component", {=> Test_Flex_Component()})
    registerTestSuite("Test_Size_Component", {=> Test_Size_Component()})
    registerTestSuite("Test_Position_Component", {=> Test_Position_Component()})
    registerTestSuite("Test_Opacity_Component", {=> Test_Opacity_Component()})
    registerTestSuite("Test_Border_Component", {=> Test_Border_Component()})
    registerTestSuite("Test_BindSheet_Component", {=> Test_BindSheet_Component()})
    registerTestSuite("Test_Popup_Component", {=> Test_Popup_Component()})
    registerTestSuite("Test_ImageEffect_Component", {=> Test_ImageEffect_Component()})
    registerTestSuite("Test_Transform_Component", {=> Test_Transform_Component()})
    registerTestSuite("Test_BindContentCover_Component", {=> Test_BindContentCover_Component()})
    registerTestSuite("Test_Background_Component", {=> Test_Background_Component()})
    registerTestSuite("Test_ForegroundColor_Component", {=> Test_ForegroundColor_Component()})
}
