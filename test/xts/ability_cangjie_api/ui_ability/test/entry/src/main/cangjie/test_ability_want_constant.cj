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

import kit.AbilityKit.*
import ohos.arkui.state_macro_manage.r
import ohos.base.*
import std.unittest.testmacro.*
import std.unittest.*
import std.unittest.common.*
import ohos.ui_test.*

@Test
class TestAbilityWantConstant {

    /*
     * @tc.number    : Sub_Cangjie_AbilityStage_TestAbilityWantConstant_0100
     * @tc.name      : test_wantConstant_Params
     * @tc.desc      : test AbilityStage test_wantConstant_Params
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_wantConstant_Params() {
        var str1 = Params
            .AbilityBackToOtherMissionStack
            .getValue()
            .toString()
        @Expect(str1, "ability.params.backToOtherMissionStack")

        var str2 = Params
            .AbilityRecoveryRestart
            .getValue()
            .toString()
        @Expect(str2, "ohos.ability.params.abilityRecoveryRestart")

        var str3 = Params
        .ContentTitleKey
            .getValue()
            .toString()
        @Expect(str3, "ohos.extra.param.key.contentTitle")

        var str4 = Params
        .ShareAbstractKey
            .getValue()
            .toString()
        @Expect(str4, "ohos.extra.param.key.shareAbstract")

        var str5 = Params
        .ShareUrlKey
            .getValue()
            .toString()
        @Expect(str5, "ohos.extra.param.key.shareUrl")

        var str6 = Params
        .SupportContinuePageStackKey
            .getValue()
            .toString()
        @Expect(str6, "ohos.extra.param.key.supportContinuePageStack")

        var str7 = Params
        .SupportContinueSourceExitKey
            .getValue()
            .toString()
        @Expect(str7, "ohos.extra.param.key.supportContinueSourceExit")
    }

    /*
     * @tc.number    : Sub_Cangjie_AbilityStage_TestAbilityWantConstant_0200
     * @tc.name      : test_wantConstant_Flags
     * @tc.desc      : test AbilityStage test_wantConstant_Flags
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    @TestCase
    @Tag[APILevel12, TestLevel0]
    func test_wantConstant_Flags() {
        var str1 = Flags
        .FlagAuthReadUriPermission
            .getValue()
        @Expect(str1, 0x00000001)

        var str2 = Flags
        .FlagAuthWriteUriPermission
            .getValue()
        @Expect(str2, 0x00000002)

        var str3 = Flags
            .FlagAuthPersistableUriPermission
            .getValue()
        @Expect(str3, 0x00000040)

        var str4 = Flags
        .FlagInstallOnDemand
            .getValue()
        @Expect(str4, 0x00000800)

        var str5 = Flags
        .FlagStartWithoutTips
            .getValue()
        @Expect(str5, 0x40000000)
    }
}
