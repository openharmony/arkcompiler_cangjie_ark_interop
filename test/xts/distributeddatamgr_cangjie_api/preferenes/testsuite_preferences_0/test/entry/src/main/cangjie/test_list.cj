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
    registerTestSuite("TestGetPreferencesByName_1", {
        => TestGetPreferencesByName_1()
    })
    registerTestSuite("TestGetPreferencesByOptionsOnlyName_1", {
        => TestGetPreferencesByOptionsOnlyName_1()
    })
    registerTestSuite("TestGetPreferencesByOptionsNameAndGroupId_1", {
        => TestGetPreferencesByOptionsNameAndGroupId_1()
    })
    registerTestSuite("TestDeletePreferencesByNameFailDueToInvalidName_1",
        {
            => TestDeletePreferencesByNameFailDueToInvalidName_1()
        })
    registerTestSuite("TestDeletePreferencesByname_1", {
        => TestDeletePreferencesByname_1()
    })
    registerTestSuite("TestDeletePreferencesByOptionsOnlyName_1", {
        => TestDeletePreferencesByOptionsOnlyName_1()
    })
    registerTestSuite("TestDeletePreferencesByOptions_1", {
        => TestDeletePreferencesByOptions_1()
    })
    registerTestSuite("TestRemovePreferencesFromCacheByname_1", {
        => TestRemovePreferencesFromCacheByname_1()
    })
    registerTestSuite("TestRemovePreferencesFromCacheByOptionsOnlyName_1",
        {
            => TestRemovePreferencesFromCacheByOptionsOnlyName_1()
        })
    registerTestSuite("TestRemovePreferencesFromCacheByOptions_1", {
        => TestRemovePreferencesFromCacheByOptions_1()
    })
    registerTestSuite("TestPreferencesContext_1", {
        => TestPreferencesContext_1()
    })
    registerTestSuite("TestPutSuccess_1", {
        => TestPutSuccess_1()
    })
    registerTestSuite("TestPutFailDueToInvalidKV_1", {
        => TestPutFailDueToInvalidKV_1()
    })
    registerTestSuite("TestDelete_1", {
        => TestDelete_1()
    })
    registerTestSuite("TestClear_1", {
        => TestClear_1()
    })
    registerTestSuite("TestFlush_1", {
        => TestFlush_1()
    })
    registerTestSuite("TestOn_1", {
        => TestOn_1()
    })
    registerTestSuite("TestOff_1", {
        => TestOff_1()
    })
   registerTestSuite("TestOffCallback_1", {
       => TestOffCallback_1()
   })
}
