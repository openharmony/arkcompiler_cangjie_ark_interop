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

package ohos.ability

import ohos.ffi.*
import ohos.labels.*

func cjShareExtAbilityOnCreate(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<ShareExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such UIExtensionAbility: " + id.toString())
        case Some(ability) => ability.onCreate()
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class ShareExtensionAbility <: UIExtensionAbility {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onCreate(): Unit {}
}
