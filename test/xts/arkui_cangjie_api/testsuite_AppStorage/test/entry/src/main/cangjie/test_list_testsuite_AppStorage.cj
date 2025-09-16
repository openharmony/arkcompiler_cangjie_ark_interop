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
    registerTestSuite("Test_AppStorageLink_setOrCreateAndHas_Component",
        {=> Test_AppStorageLink_setOrCreateAndHas_Component()})
    registerTestSuite("Test_AppStorageProp_SetAndGet_Component", {=> Test_AppStorageProp_SetAndGet_Component()})
    registerTestSuite("Test_AppStorageLink_SetAndGet_Component", {=> Test_AppStorageLink_SetAndGet_Component()})
    registerTestSuite("Test_AppStorageProp_setOrCreateAndHas_Component",
        {=> Test_AppStorageProp_setOrCreateAndHas_Component()})
    registerTestSuite("Test_AppStorage_Clear_Component", {=> Test_AppStorage_Clear_Component()})
    registerTestSuite("Test_AppStorageLink_Component", {=> Test_AppStorageLink_Component()})
    registerTestSuite("Test_AppStorage_SetAndLink_Component", {=> Test_AppStorage_SetAndLink_Component()})
    registerTestSuite("Test_AppStorage_Link_Component", {=> Test_AppStorage_Link_Component()})
    registerTestSuite("Test_AppStorageProp_Component", {=> Test_AppStorageProp_Component()})
    registerTestSuite("Test_AppStorageLink00_Component", {=> Test_AppStorageLink00_Component()})
}
