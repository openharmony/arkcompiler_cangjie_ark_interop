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
    registerTestSuite("Test_Random_09", {=> Test_Random_09()})
    registerTestSuite("Test_generateSymKey_convertKey_03", {=> Test_generateSymKey_convertKey_03()})
    registerTestSuite("TestCryptoFramework_Init", {=> TestCryptoFramework_Init()})
    registerTestSuite("Test_SymKeyGenerator_02", {=> Test_SymKeyGenerator_02()})
    registerTestSuite("Test_init_update_doFinal_04", {=> Test_init_update_doFinal_04()})
    registerTestSuite("Test_Mac_08", {=> Test_Mac_08()})
    registerTestSuite("Test_createSymKeyGenerator_01", {=> Test_createSymKeyGenerator_01()})
    registerTestSuite("Test_creatCipher_05", {=> Test_creatCipher_05()})
    registerTestSuite("Test_Md_07", {=> Test_Md_07()})
    registerTestSuite("TestCryptoFramework_Create", {=> TestCryptoFramework_Create()})
}
