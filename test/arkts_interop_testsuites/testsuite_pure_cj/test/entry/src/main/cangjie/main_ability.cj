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

import ohos.base.AppLog
import ohos.ability.Want
import ohos.ability.LaunchParam
import ohos.ability.LaunchReason
import ohos.ability.Ability
import ohos.ability.AbilityStage
import ohos.state_manage.AppStorage
import ohos.window.WindowStage
import ohos.ark_interop.JSRuntime

class MainAbility <: Ability {
    init() {
        super()
        registerSelf()
    }
    public func onCreate(want: Want, launchParam: LaunchParam): Unit {
        logger.info("MainAbility OnCreated.${want.abilityName}")
    }

    public func onWindowStageCreate(windowStage: WindowStage): Unit {
        logger.info("MainAbility onWindowStageCreate.")
        AppStorage.setOrCreate<JSRuntime>("jsRuntime", JSRuntime())
        windowStage.loadContent("EntryView")
    }
}
