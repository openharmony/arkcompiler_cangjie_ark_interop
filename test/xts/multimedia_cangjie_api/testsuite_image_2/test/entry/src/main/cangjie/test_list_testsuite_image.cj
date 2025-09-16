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

let _ = testsuite()

func testsuite(): Unit {
    registerTestSuite("Test_createImageSource_03", {=> Test_createImageSource_03()})
    registerTestSuite("Test_image", {=> Test_image()})
    registerTestSuite("Test_ImagePacker_05", {=> Test_ImagePacker_05()})
    registerTestSuite("Test_createImageReceCreator_06", {=> Test_createImageReceCreator_06()})
    registerTestSuite("Test_createPixelMap_01", {=> Test_createPixelMap_01()})
    registerTestSuite("Test_ImageSource_creatPixelMap_04", {=> Test_ImageSource_creatPixelMap_04()})
    registerTestSuite("Test_readPixelMap_02", {=> Test_readPixelMap_02()})
    registerTestSuite("Test_Image_release", {=> Test_Image_release()})
}
