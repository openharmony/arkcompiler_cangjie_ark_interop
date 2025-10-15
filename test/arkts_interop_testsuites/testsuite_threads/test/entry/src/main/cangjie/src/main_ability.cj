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

import ohos.ability.*
import ohos.window.*
import ohos.base.*

class MainAbility <: Ability {
    public init() {
        super()
        registerSelf()
    }

    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        logger.info("MainAbility OnCreated.${want.abilityName}")
        match (launchParam.launchReason) {
            case LaunchReason.START_ABILITY => logger.info("START_ABILITY")
            case _ => ()
        }
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        logger.info("MainAbility onWindowStageCreate.")
        //        createJSRuntimeAndCheck("onWindowStageCreate")
        //        spawn {
        //            createJSRuntimeAndCheck("onWindowStageCreate spawn")
        //        }
        spawn (UIThread) {
            createJSRuntimeAndCheck("onWindowStageCreate spawn(UIThread)")
        }
        spawn {
            spawn (UIThread) {
                createJSRuntimeAndCheck("onWindowStageCreate spawn spawn(UIThread)")
            }
        }
        spawn (UIThread) {
            //            spawn {
            //                createJSRuntimeAndCheck("onWindowStageCreate spawn(UIThread) spawn")
            //            }
        }

        spawn (UIThread) {
            spawn (UIThread) {
                createJSRuntimeAndCheck("onWindowStageCreate spawn(UIThread) spawn(UIThread)")
            }
        }
        //        spawn {
        //            spawn {
        //                createJSRuntimeAndCheck("onWindowStageCreate spawn spawn")
        //            }
        //        }

        windowStage.loadContent("EntryView")
    }
}
