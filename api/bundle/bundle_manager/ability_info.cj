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

package ohos.bundle.bundle_manager

import ohos.labels.*
import ohos.skill.*
import ohos.metadata.*

/**
* Obtains configuration information about an ability
*
* @relation export interface AbilityInfo
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class AbilityInfo {
    /**
    * Indicates the name of the bundle containing the ability
    *
    * @relation readonly bundleName: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let bundleName: String
    /**
    * Indicates the module name of the package to which the capability belongs
    *
    * @relation readonly moduleName: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleName: String
    /**
    * Ability simplified class name
    *
    * @relation readonly name: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let name: String
    /**
    * Indicates the label of the ability
    *
    * @relation readonly label: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let label: String
    /**
    * Indicates the label id of the ability
    *
    * @relation readonly labelId: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let labelId: Int32
    /**
    * Indicates the ability
    *
    * @relation readonly description: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let description: String
    /**
    * Indicates the description id of the ability
    *
    * @relation readonly descriptionId: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let descriptionId: Int32
    /**
    * Indicates the icon of the ability
    *
    * @relation readonly icon: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let icon: String
    /**
    * Indicates the icon id of the ability
    *
    * @relation readonly iconId: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let iconId: Int32
    /**
    * Process of ability, if user do not set it, the value equal application process
    *
    * @relation readonly process: string
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let process: String
    /**
    * Indicates whether this ability can be called by other abilities
    *
    * @relation readonly exported: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let exported: Bool
    /**
    * Enumerates ability display orientations
    *
    * @relation readonly orientation: bundleManager.DisplayOrientation
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let orientation: DisplayOrientation
    /**
    * Enumerates ability launch type
    *
    * @relation readonly launchType: bundleManager.LaunchType
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let launchType: LaunchType
    /**
    * The permissions that others need to launch this ability
    *
    * @relation readonly permissions: Array<string>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let permissions: Array<String>
    /**
    * The device types that this ability can run on
    *
    * @relation readonly deviceTypes: Array<string>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let deviceTypes: Array<String>
    /**
    * Obtains configuration information about an application
    *
    * @relation readonly applicationInfo: ApplicationInfo
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let applicationInfo: ApplicationInfo
    /**
    * Indicates the metadata of ability
    *
    * @relation readonly metadata: Array<Metadata>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadata: Array<Metadata>
    /**
    * Indicates whether the ability is enabled
    *
    * @relation readonly enabled: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let enabled: Bool
    /**
    * Indicates which window mode is supported
    *
    * @relation readonly supportWindowModes: Array<bundleManager.SupportWindowMode>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let supportWindowModes: Array<SupportWindowMode>
    /**
    * Indicates window size
    *
    * @relation readonly windowSize: WindowSize
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let windowSize: WindowSize
    /**
    * Indicates whether to hide the application icon from the dock area
    *
    * @relation readonly excludeFromDock: boolean
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let excludeFromDock: Bool
    /**
    * Indicates skills of the ability
    *
    * @relation readonly skills: Array<Skill>
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let skills: Array<Skill>
    /**
    * Indicates the appIndex of application, only work in clone app mode
    *
    * @relation readonly appIndex: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appIndex: Int32

    protected init(ret: RetAbilityInfoV2) {
        this.bundleName = ret.bundleName.toString()
        this.moduleName = ret.moduleName.toString()
        this.name = ret.name.toString()
        this.label = ret.label.toString()
        this.labelId = ret.labelId
        this.description = ret.description.toString()
        this.descriptionId = ret.descriptionId
        this.icon = ret.icon.toString()
        this.iconId = ret.iconId
        this.process = ret.process.toString()
        this.exported = ret.exported
        this.orientation = DisplayOrientation.parse(ret.orientation)
        this.launchType = LaunchType.parse(ret.launchType)
        this.permissions = readArrStr(ret.permissions)
        this.deviceTypes = readArrStr(ret.deviceTypes)
        this.applicationInfo = ApplicationInfo(ret.applicationInfo)
        this.metadata = readArrMetadata(ret.metadata)
        this.enabled = ret.enabled
        this.supportWindowModes = readArrInt32(ret.supportWindowModes)
        this.windowSize = WindowSize(ret.windowSize)
        this.excludeFromDock = ret.excludeFromDock
        this.skills = readArrSkill(ret.skills)
        this.appIndex = ret.appIndex
    }
}

/**
* Indicates the window size.
*
* @relation export interface WindowSize
*/
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class WindowSize {
    /**
    * Indicates maximum ratio of width over height of window under free window status.
    *
    * @relation readonly maxWindowRatio: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxWindowRatio: Float64
    /**
    * Indicates minimum ratio of width over height of window under free window status.
    *
    * @relation readonly minWindowRatio: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let minWindowRatio: Float64
    /**
    * Indicates maximum width of window under free window status.
    *
    * @relation readonly maxWindowWidth: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxWindowWidth: UInt32
    /**
    * Indicates minimum width of window under free window status.
    *
    * @relation readonly minWindowWidth: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let minWindowWidth: UInt32
    /**
    * Indicates maximum height of window under free window status.
    *
    * @relation readonly maxWindowHeight: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxWindowHeight: UInt32
    /**
    * Indicates minimum height of window under free window status.
    *
    * @relation readonly minWindowHeight: number
    */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let minWindowHeight: UInt32

    init(ret: RetWindowSize) {
        this.maxWindowRatio = ret.maxWindowRatio
        this.minWindowRatio = ret.minWindowRatio
        this.maxWindowWidth = ret.maxWindowWidth
        this.minWindowWidth = ret.minWindowWidth
        this.maxWindowHeight = ret.maxWindowHeight
        this.minWindowHeight = ret.minWindowHeight
    }
}