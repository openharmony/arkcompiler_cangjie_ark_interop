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
    registerTestSuite("CloseKVStore_1", {=> CloseKVStore_1()})
    registerTestSuite("CloseKVStore_2", {=> CloseKVStore_2()})
    registerTestSuite("CloseKVStore_3", {=> CloseKVStore_3()})
    registerTestSuite("CloseKVStore_4", {=> CloseKVStore_4()})
    registerTestSuite("CloseKVStore_5", {=> CloseKVStore_5()})
    registerTestSuite("CloseKVStore_6", {=> CloseKVStore_6()})
    registerTestSuite("CloseKVStore_7", {=> CloseKVStore_7()})
    registerTestSuite("CloseKVStore_8", {=> CloseKVStore_8()})
    registerTestSuite("CloseKVStore_9", {=> CloseKVStore_9()})
    registerTestSuite("CreateKVManager_1", {=> CreateKVManager_1()})
    registerTestSuite("DeleteKVStore_1", {=> DeleteKVStore_1()})
    registerTestSuite("DeleteKVStore_2", {=> DeleteKVStore_2()})
    registerTestSuite("DeleteKVStore_3", {=> DeleteKVStore_3()})
    registerTestSuite("DeleteKVStore_4", {=> DeleteKVStore_4()})
    registerTestSuite("DeleteKVStore_5", {=> DeleteKVStore_5()})
    registerTestSuite("DeleteKVStore_6", {=> DeleteKVStore_6()})
    registerTestSuite("DeleteKVStore_7", {=> DeleteKVStore_7()})
    registerTestSuite("DeleteKVStore_8", {=> DeleteKVStore_8()})
    registerTestSuite("DeleteKVStore_9", {=> DeleteKVStore_9()})
    registerTestSuite("GetAllKVStoreId_1", {=> GetAllKVStoreId_1()})
    registerTestSuite("GetAllKVStoreId_2", {=> GetAllKVStoreId_2()})
}
