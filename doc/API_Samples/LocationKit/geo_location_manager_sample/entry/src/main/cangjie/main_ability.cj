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

internal import ohos.base.AppLog
internal import ohos.ability.Want
internal import ohos.ability.UIAbility
internal import ohos.ability.LaunchParam
internal import ohos.ability.LaunchReason
internal import ohos.window.WindowStage
import kit.UIKit.AsyncError
import kit.AbilityKit.*

class MainAbility <: UIAbility {
    public init() {
        super()
        registerSelf()
    }

    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        AppLog.info("MainAbility OnCreated.${want.abilityName}")
        match (launchParam.launchReason) {
            case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
            case _ => ()
        }
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        AppLog.info("MainAbility onWindowStageCreate.")
        windowStage.loadContent("EntryView")
        var resultCallback = {
            errorCode: Option<AsyncError>, data: Option<AccessCtrlPermissionRequestResult> => match (errorCode) {
                case Some(e) => AppLog.error("requestPermissionsFromUser failed, errcode: ${e.code}")
                case _ => match (data) {
                    case Some(value) => for (i in (0..value
                            .permissions
                            .size)) {
                        if (value.authResults[i] == 0) {
                            // 用户已授权
                            AppLog.info("permission: ${value.permissions[i]} is granted.")
                        } else {
                            // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
                            AppLog.info("permission: ${value.permissions[i]} is denied by user.")
                        }
                    }
                    case _ => AppLog.error("requestPermissionsFromUser error: data is null")
                }
            }
        }
        let permissionList = ["ohos.permission.LOCATION", "ohos.permission.APPROXIMATELY_LOCATION"]
        let atManager = AbilityAccessCtrl.createAtManager()
        // 申请权限，requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
        atManager.requestPermissionsFromUser(getStageContext(this.context), permissionList, resultCallback)
    }
}
