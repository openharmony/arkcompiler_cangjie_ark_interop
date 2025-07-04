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
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class CurrentHapInfo {
    CurrentHapInfo(
        private let name_: String,
        private let icon_: String,
        private let iconId_: Int32,
        private let label_: String,
        private let labelId_: Int32,
        private let description_: String,
        private let descriptionId_: Int32,
        private let mainElementName_: String,
        private let installationFree_: Bool,
        private let hashValue_: String
    ) {}

    init(appInfo: CurrentHapModuleInfo) {
        this.name_ = appInfo.name.toString()
        this.icon_ = appInfo.icon.toString()
        this.iconId_ = appInfo.iconId
        this.label_ = appInfo.label.toString()
        this.labelId_ = appInfo.labelId
        this.description_ = appInfo.description.toString()
        this.descriptionId_ = appInfo.descriptionId
        this.mainElementName_ = appInfo.mainElementName.toString()
        this.installationFree_ = appInfo.installationFree
        this.hashValue_ = appInfo.hashValue.toString()
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop name: String {
        get() {
            this.name_
        }
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop icon: String {
        get() {
            this.icon_
        }
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop iconId: Int32 {
        get() {
            this.iconId_
        }
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop label: String {
        get() {
            this.label_
        }
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop labelId: Int32 {
        get() {
            this.labelId_
        }
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop description: String {
        get() {
            this.description_
        }
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop descriptionId: Int32 {
        get() {
            this.descriptionId_
        }
    }
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop mainElementName: String {
        get() {
            this.mainElementName_
        }
    }
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop installationFree: Bool {
        get() {
            this.installationFree_
        }
    }
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public prop hashValue: String {
        get() {
            this.hashValue_
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class AbilityStageContext <: Context {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var hapModuleInfo: Option<CurrentHapInfo> = None
    private var currentHapModuleInfo_: ?HapModuleInfo = None
    private var config_: ?AbilityConfiguration = None

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop currentHapModuleInfo: HapModuleInfo {
        get() {
            return currentHapModuleInfo_.getOrThrow()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop config: AbilityConfiguration {
        get() {
            return config_.getOrThrow()
        }
    }

    init(id: Int64) {
        super(id)
        unsafe {
            let hapInfo = FFICJGetHapModuleInfo(id)
            this.currentHapModuleInfo_ = Some(HapModuleInfo(hapInfo))
            hapInfo.free()

            let conf = FFICJGetConfiguration(id)
            this.config_ = Some(conf.toConfiguration())
            conf.free()
        }
        let info = this.currentHapModuleInfo_.getOrThrow()
        this.hapModuleInfo = Some(
            CurrentHapInfo(info.name, info.icon, info.iconId, info.label, info.labelId, info.description,
                info.descriptionId, info.mainElementName, info.installationFree, info.hashValue))
    }

    func onConfigurationUpdated(newConfig: AbilityConfiguration): Unit {
        this.config_ = newConfig
    }
}
