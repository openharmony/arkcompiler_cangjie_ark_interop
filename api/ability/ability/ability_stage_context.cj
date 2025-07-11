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

import ohos.base.*
import ohos.ffi.*
import ohos.bundle_manager.*
import ohos.labels.*

@C
struct CurrentHapModuleInfo {
    CurrentHapModuleInfo(
        let name: CString,
        let icon: CString,
        let iconId: Int32,
        let label: CString,
        let labelId: Int32,
        let description: CString,
        let descriptionId: Int32,
        let mainElementName: CString,
        let installationFree: Bool,
        let hashValue: CString
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(this.name)
            LibC.free(this.icon)
            LibC.free(this.label)
            LibC.free(this.description)
            LibC.free(this.mainElementName)
            LibC.free(this.hashValue)
        }
    }
}

foreign func FFICJGetHapModuleInfo(id: Int64): RetHapModuleInfoV2

foreign func FFICJGetConfiguration(id: Int64): CConfiguration

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class AbilityStageContext <: Context {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var currentHapModuleInfo: HapModuleInfo

    init(id: Int64) {
        super(id)
        unsafe {
            let hapInfo = FFICJGetHapModuleInfo(id)
            this.currentHapModuleInfo = HapModuleInfo(hapInfo)
            hapInfo.free()
        }
    }
}
