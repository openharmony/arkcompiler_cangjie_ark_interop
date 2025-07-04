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
import ohos.bundle_manager.*
import ohos.labels.*

foreign {
    func FFICJExtCtxGetCurrentHapModuleInfo(id: Int64, hapPtr: CPointer<RetHapModuleInfoV2>): Int32

    func FFICJExtCtxGetConfig(id: Int64, cfgPtr: CPointer<CConfiguration>): Int32

    func FFICJExtCtxGetExtAbilityInfo(id: Int64, extInfoPtr: CPointer<RetExtensionAbilityInfoV2>): Int32
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class ExtensionContext <: Context {
    protected init(id: Int64) {
        super(id)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop currentHapModuleInfo: HapModuleInfo {
        get() {
            unsafe {
                let hapPtr = LibC.malloc<RetHapModuleInfoV2>()
                if (hapPtr.isNull()) {
                    throw IllegalMemoryException("Failed to allocate memory")
                }
                let errorCode = FFICJExtCtxGetCurrentHapModuleInfo(this.getID(), hapPtr)
                if (errorCode != 0) {
                    LibC.free<RetHapModuleInfoV2>(hapPtr)
                    throw BusinessException(innerToErrorCode(errorCode), getErrorMsg(innerToErrorCode(errorCode)))
                }
                let ret = hapPtr.read()
                let hapModuleInfo = HapModuleInfo(ret)
                ret.free()
                LibC.free<RetHapModuleInfoV2>(hapPtr)
                return hapModuleInfo
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop config: AbilityConfiguration {
        get() {
            unsafe {
                var cfg = CConfiguration()
                let errorCode = FFICJExtCtxGetConfig(this.getID(), inout cfg)
                if (errorCode != 0) {
                    throw BusinessException(innerToErrorCode(errorCode), getErrorMsg(innerToErrorCode(errorCode)))
                }
                let configuration = cfg.toConfiguration()
                cfg.free()
                return configuration
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop extensionAbilityInfo: ExtensionAbilityInfo {
        get() {
            unsafe {
                let extInfoPtr = LibC.malloc<RetExtensionAbilityInfoV2>()
                if (extInfoPtr.isNull()) {
                    throw IllegalMemoryException("Failed to allocate memory")
                }
                let errorCode = FFICJExtCtxGetExtAbilityInfo(this.getID(), extInfoPtr)
                if (errorCode != 0) {
                    LibC.free<RetExtensionAbilityInfoV2>(extInfoPtr)
                    throw BusinessException(innerToErrorCode(errorCode), getErrorMsg(innerToErrorCode(errorCode)))
                }
                let ret = extInfoPtr.read()
                let extensionAbilityInfo = ExtensionAbilityInfo(ret)
                ret.free()
                LibC.free<RetExtensionAbilityInfoV2>(extInfoPtr)
                return extensionAbilityInfo
            }
        }
    }
}
