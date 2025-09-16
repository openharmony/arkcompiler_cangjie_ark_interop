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
    registerTestSuite("test_Support_1", {
        => test_Support_1()
    })
    registerTestSuite("test_Support_2", {
        => test_Support_2()
    })
    registerTestSuite("test_Support_3", {
        => test_Support_3()
    })
    registerTestSuite("test_Support_4", {
        => test_Support_4()
    })
    registerTestSuite("test_Support_5", {
        => test_Support_5()
    })
    registerTestSuite("test_Support_6", {
        => test_Support_6()
    })
    registerTestSuite("testCreateSubscriber_1", {
        => testCreateSubscriber_1()
    })
    registerTestSuite("testPublish_1", {
        => testPublish_1()
    })
    registerTestSuite("testPublish_2", {
        => testPublish_2()
    })
    registerTestSuite("testUnsubscribe_1", {
        => testUnsubscribe_1()
    })
}
