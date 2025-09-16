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
    registerTestSuite("Test_EmptyAttrs_Sepia", {=> Test_EmptyAttrs_Sepia()})
    registerTestSuite("Test_EmptyAttrs_ColorBlend", {=> Test_EmptyAttrs_ColorBlend()})
    registerTestSuite("Test_EmptyAttrs_Grayscale", {=> Test_EmptyAttrs_Grayscale()})
    registerTestSuite("Test_EmptyAttrs_BackdropBlur", {=> Test_EmptyAttrs_BackdropBlur()})
    registerTestSuite("Test_EmptyAttrs_Saturate", {=> Test_EmptyAttrs_Saturate()})
    registerTestSuite("Test_EmptyAttrs_Contrast", {=> Test_EmptyAttrs_Contrast()})
    registerTestSuite("Test_EmptyAttrs_Brightness", {=> Test_EmptyAttrs_Brightness()})
    registerTestSuite("Test_EmptyAttrs_Shadow", {=> Test_EmptyAttrs_Shadow()})
    registerTestSuite("Test_EmptyAttrs_Blur", {=> Test_EmptyAttrs_Blur()})
    registerTestSuite("Test_EmptyAttrs_HueRotate", {=> Test_EmptyAttrs_HueRotate()})
    registerTestSuite("Test_EmptyAttrs_Invert", {=> Test_EmptyAttrs_Invert()})
}
