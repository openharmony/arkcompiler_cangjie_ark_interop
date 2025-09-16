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
    registerTestSuite("Test_EmptyAttrs_Margin", {=> Test_EmptyAttrs_Margin()})
    registerTestSuite("Test_EmptyAttrs_ConstraintSize", {=> Test_EmptyAttrs_ConstraintSize()})
    registerTestSuite("Test_EmptyAttrs_Padding", {=> Test_EmptyAttrs_Padding()})
    registerTestSuite("Test_EmptyAttrs_Width", {=> Test_EmptyAttrs_Width()})
    registerTestSuite("Test_EmptyAttrs_Size", {=> Test_EmptyAttrs_Size()})
    registerTestSuite("Test_EmptyAttrs_Height", {=> Test_EmptyAttrs_Height()})
    registerTestSuite("Test_EmptyAttrs_LayoutWeight", {=> Test_EmptyAttrs_LayoutWeight()})
}
