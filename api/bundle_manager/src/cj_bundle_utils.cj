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

package ohos.bundle_manager

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import ohos.resource_manager.*
import std.collection.*

const BASE_USER_RANGE = 200000i32
const UNSPECIFIED_USERID = -2i32
const GET_BUNDLE_INFO = "GetBundleInfo"

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class Metadata {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var value: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var resource: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public init(name: String, value: String, resource: String) {
        this.name = name
        this.value = value
        this.resource = resource
    }

    init(ret: RetMetadata) {
        this.name = ret.name.toString()
        this.value = ret.value.toString()
        this.resource = ret.resource.toString()
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ModuleMetadata {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadata: Array<Metadata>

    init(ret: RetModuleMetadata) {
        this.moduleName = ret.moduleName.toString()
        let ptr = ret.metadata.head
        let size = ret.metadata.size
        if (ptr.isNotNull()) {
            this.metadata = unsafe { Array<Metadata>(size, {i => Metadata(ptr.read(i))}) }
        } else {
            throw IllegalMemoryException("Out of Memory!")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class UsedScene {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var abilities: Array<String>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var when: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public init(abilities: Array<String>, when: String) {
        this.abilities = abilities
        this.when = when
    }

    init(ret: RetUsedScene) {
        this.abilities = readArrStr(ret.abilities)
        this.when = ret.when.toString()
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ReqPermissionDetail {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var moduleName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var reason: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var reasonId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public var usedScene: UsedScene

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public init(name: String, moduleName: String, reason: String, reasonId: Int32, usedScene: UsedScene) {
        this.name = name
        this.moduleName = moduleName
        this.reason = reason
        this.reasonId = reasonId
        this.usedScene = usedScene
    }

    init(ret: RetReqPermissionDetail) {
        this.name = ret.name.toString()
        this.moduleName = ret.moduleName.toString()
        this.reason = ret.reason.toString()
        this.reasonId = ret.reasonId
        this.usedScene = UsedScene(ret.usedScene)
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class SignatureInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appId: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let fingerprint: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appIdentifier: String

    init(ret: RetSignatureInfo) {
        this.appId = ret.appId.toString()
        this.fingerprint = ret.fingerprint.toString()
        this.appIdentifier = ret.appIdentifier.toString()
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class MultiAppMode {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let multiAppModeType: MultiAppModeType
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let count: Int32

    init(ret: RetMultiAppMode) {
        this.multiAppModeType = MultiAppModeType.parse(ret.multiAppModeType)
        this.count = ret.count
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ApplicationInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let description: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let descriptionId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let enabled: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let label: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let labelId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let icon: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let iconId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let process: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let permissions: Array<String>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let codePath: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadataArray: Array<ModuleMetadata>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let removable: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let accessTokenId: UInt32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let uid: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let iconResource: AppResource
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let labelResource: AppResource
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let descriptionResource: AppResource
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appDistributionType: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appProvisionType: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let systemApp: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let bundleType: BundleType
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let debug: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let dataUnclearable: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let cloudFileSyncEnabled: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let nativeLibraryPath: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let multiAppMode: MultiAppMode
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appIndex: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let installSource: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let releaseType: String

    protected init(ret: RetApplicationInfoV2) {
        this.name = ret.name.toString()
        this.description = ret.description.toString()
        this.descriptionId = ret.descriptionId
        this.enabled = ret.enabled
        this.label = ret.label.toString()
        this.labelId = ret.labelId
        this.icon = ret.icon.toString()
        this.iconId = ret.iconId
        this.process = ret.process.toString()
        this.permissions = readArrStr(ret.permissions)
        this.codePath = ret.codePath.toString()
        this.metadataArray = readArrModuleMetadata(ret.metadataArray)
        this.removable = ret.removable
        this.accessTokenId = ret.accessTokenId
        this.uid = ret.uid
        this.iconResource = AppResource(ret.iconResource)
        this.labelResource = AppResource(ret.labelResource)
        this.descriptionResource = AppResource(ret.descriptionResource)
        this.appDistributionType = ret.appDistributionType.toString()
        this.appProvisionType = ret.appProvisionType.toString()
        this.systemApp = ret.systemApp
        this.bundleType = BundleType.parse(ret.bundleType)
        this.debug = ret.debug
        this.dataUnclearable = ret.dataUnclearable
        this.cloudFileSyncEnabled = ret.cloudFileSyncEnabled
        this.nativeLibraryPath = ret.nativeLibraryPath.toString()
        this.multiAppMode = MultiAppMode(ret.multiAppMode)
        this.appIndex = ret.appIndex
        this.installSource = ret.installSource.toString()
        this.releaseType = ret.releaseType.toString()
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class WindowSize {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxWindowRatio: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let minWindowRatio: Float64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxWindowWidth: UInt32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let minWindowWidth: UInt32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxWindowHeight: UInt32
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class AbilityInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let bundleName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let label: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let labelId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let description: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let descriptionId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let icon: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let iconId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let process: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let exported: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let orientation: DisplayOrientation
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let launchType: LaunchType
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let permissions: Array<String>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let deviceTypes: Array<String>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let applicationInfo: ApplicationInfo
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadata: Array<Metadata>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let enabled: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let supportWindowModes: Array<SupportWindowMode>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let windowSize: WindowSize
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let excludeFromDock: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let skills: Array<Skill>
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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class ExtensionAbilityInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let bundleName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let labelId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let descriptionId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let iconId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let exported: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let extensionAbilityType: ExtensionAbilityType
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let permissions: Array<String>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let applicationInfo: ApplicationInfo
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadata: Array<Metadata>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let enabled: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let readPermission: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let writePermission: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let extensionAbilityTypeName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let skills: Array<Skill>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appIndex: Int32

    protected init(ret: RetExtensionAbilityInfoV2) {
        this.bundleName = ret.bundleName.toString()
        this.moduleName = ret.moduleName.toString()
        this.name = ret.name.toString()
        this.labelId = ret.labelId
        this.descriptionId = ret.descriptionId
        this.iconId = ret.iconId
        this.exported = ret.exported
        this.extensionAbilityType = try {
            ExtensionAbilityType.parse(ret.extensionAbilityType)
        } catch (_: IllegalArgumentException) {
            Unspecified
        }
        this.permissions = readArrStr(ret.permissions)
        this.applicationInfo = ApplicationInfo(ret.applicationInfo)
        this.metadata = readArrMetadata(ret.metadata)
        this.enabled = ret.enabled
        this.readPermission = ret.readPermission.toString()
        this.writePermission = ret.writePermission.toString()
        this.extensionAbilityTypeName = ret.extensionAbilityTypeName.toString()
        this.skills = readArrSkill(ret.skills)
        this.appIndex = ret.appIndex
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class PreloadItem {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleName: String

    init(ret: RetPreloadItem) {
        this.moduleName = ret.moduleName.toString()
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class Dependency {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let bundleName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let versionCode: UInt32

    init(ret: RetDependency) {
        this.bundleName = ret.bundleName.toString()
        this.moduleName = ret.moduleName.toString()
        this.versionCode = ret.versionCode
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class HapModuleInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let icon: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let iconId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let label: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let labelId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let description: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let descriptionId: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let mainElementName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let abilitiesInfo: Array<AbilityInfo>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let extensionAbilitiesInfo: Array<ExtensionAbilityInfo>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let metadata: Array<Metadata>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let deviceTypes: Array<String>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let installationFree: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let hashValue: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let moduleType: ModuleType
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let preloads: Array<PreloadItem>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let dependencies: Array<Dependency>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let fileContextMenuConfig: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let routerMap: Array<RouterItem>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let codePath: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let nativeLibraryPath: String

    protected init(ret: RetHapModuleInfoV2) {
        this.name = ret.name.toString()
        this.icon = ret.icon.toString()
        this.iconId = ret.iconId
        this.label = ret.label.toString()
        this.labelId = ret.labelId
        this.description = ret.description.toString()
        this.descriptionId = ret.descriptionId
        this.mainElementName = ret.mainElementName.toString()
        this.abilitiesInfo = readArrAbilityInfo(ret.abilitiesInfo)
        this.extensionAbilitiesInfo = readArrExtensionAbilityInfo(ret.extensionAbilitiesInfo)
        this.metadata = readArrMetadata(ret.metadata)
        this.deviceTypes = readArrStr(ret.deviceTypes)
        this.installationFree = ret.installationFree
        this.hashValue = ret.hashValue.toString()
        this.moduleType = ModuleType.parse(ret.moduleType)
        this.preloads = readArrPreloadItem(ret.preloads)
        this.dependencies = readArrDependency(ret.dependencies)
        this.fileContextMenuConfig = ret.fileContextMenuConfig.toString()
        this.routerMap = readArrRouterItem(ret.routerMap)
        this.codePath = ret.codePath.toString()
        this.nativeLibraryPath = ret.nativeLibraryPath.toString()
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class DataItem {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let key: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let value: String

    init(ret: RetDataItem) {
        this.key = ret.key.toString()
        this.value = ret.value.toString()
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class RouterItem {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let pageSourceFile: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let buildFunction: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let data: Array<DataItem>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let customData: String

    init(ret: RetRouterItem) {
        this.name = ret.name.toString()
        this.pageSourceFile = ret.pageSourceFile.toString()
        this.buildFunction = ret.buildFunction.toString()
        this.data = readArrDataItem(ret.data)
        this.customData = ret.customData.toString()
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class BundleInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let vendor: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let versionCode: UInt32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let versionName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let minCompatibleVersionCode: UInt32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let targetVersion: UInt32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appInfo: ApplicationInfo
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let hapModulesInfo: Array<HapModuleInfo>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let reqPermissionDetails: Array<ReqPermissionDetail>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let permissionGrantStates: Array<PermissionGrantState>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let signatureInfo: SignatureInfo
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let installTime: Int64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let updateTime: Int64
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let uid: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let routerMap: Array<RouterItem>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let appIndex: Int32

    init(ret: RetBundleInfoV2) {
        this.name = ret.name.toString()
        this.vendor = ret.vendor.toString()
        this.versionCode = ret.versionCode
        this.versionName = ret.versionName.toString()
        this.minCompatibleVersionCode = ret.minCompatibleVersionCode
        this.targetVersion = ret.targetVersion
        this.appInfo = ApplicationInfo(ret.appInfo)
        this.hapModulesInfo = readArrHapModuleInfo(ret.hapInfo)
        this.reqPermissionDetails = readReqPermissionDetail(ret.perDetail)
        this.permissionGrantStates = readPermissionGrantState(ret.state)
        this.signatureInfo = SignatureInfo(ret.signInfo)
        this.installTime = ret.installTime
        this.updateTime = ret.updateTime
        this.uid = ret.uid
        this.routerMap = readArrRouterItem(ret.routerMap)
        this.appIndex = ret.appIndex
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class Skill {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let actions: Array<String>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let entities: Array<String>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let uris: Array<SkillUri>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let domainVerify: Bool

    init(ret: RetSkill) {
        this.actions = readArrStr(ret.actions)
        this.entities = readArrStr(ret.entities)
        this.uris = readArrSkillUri(ret.uris)
        this.domainVerify = ret.domainVerify
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public class SkillUri {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let scheme: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let host: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let port: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let path: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let pathStartWith: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let pathRegex: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let uriType: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let utd: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let maxFileSupported: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public let linkFeature: String

    init(ret: RetSkillUri) {
        this.scheme = ret.scheme.toString()
        this.host = ret.host.toString()
        this.port = ret.port.toString()
        this.path = ret.path.toString()
        this.pathStartWith = ret.pathStartWith.toString()
        this.pathRegex = ret.pathRegex.toString()
        this.uriType = ret.uriType.toString()
        this.utd = ret.utd.toString()
        this.maxFileSupported = ret.maxFileSupported
        this.linkFeature = ret.linkFeature.toString()
    }
}

func readArrSkillUri(cArr: CArrSkillUri): Array<SkillUri> {
    let result = ArrayList<SkillUri>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(SkillUri(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrSkill(cArr: CArrSkill): Array<Skill> {
    let result = ArrayList<Skill>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(Skill(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrHapModuleInfo(cArr: CArrRetHapModuleInfoV2): Array<HapModuleInfo> {
    let result = ArrayList<HapModuleInfo>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(HapModuleInfo(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readReqPermissionDetail(cArr: CArrRetReqPermissionDetail): Array<ReqPermissionDetail> {
    let result = ArrayList<ReqPermissionDetail>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(ReqPermissionDetail(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readPermissionGrantState(cArr: CArrI32): Array<PermissionGrantState> {
    let result = ArrayList<PermissionGrantState>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(PermissionGrantState.parse(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrStr(cArr: CArrString): Array<String> {
    let result = ArrayList<String>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(cArr.head.read(i).toString()) }
        }
    }
    return result.toArray()
}

func readArrModuleMetadata(cArr: CArrModuleMetadata): Array<ModuleMetadata> {
    let result = ArrayList<ModuleMetadata>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(ModuleMetadata(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrMetadata(cArr: CArrMetadata): Array<Metadata> {
    let result = ArrayList<Metadata>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(Metadata(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrInt32(cArr: CArrI32): Array<SupportWindowMode> {
    let result = ArrayList<SupportWindowMode>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(SupportWindowMode.parse(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrAbilityInfo(cArr: CArrRetAbilityInfoV2): Array<AbilityInfo> {
    let result = ArrayList<AbilityInfo>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(AbilityInfo(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrExtensionAbilityInfo(cArr: CArrRetExtensionAbilityInfoV2): Array<ExtensionAbilityInfo> {
    let result = ArrayList<ExtensionAbilityInfo>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(ExtensionAbilityInfo(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrPreloadItem(cArr: CArrRetPreloadItem): Array<PreloadItem> {
    let result = ArrayList<PreloadItem>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(PreloadItem(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrDependency(cArr: CArrRetDependency): Array<Dependency> {
    let result = ArrayList<Dependency>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(Dependency(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrDataItem(cArr: CArrRetDataItem): Array<DataItem> {
    let result = ArrayList<DataItem>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(DataItem(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

func readArrRouterItem(cArr: CArrRetRouterItem): Array<RouterItem> {
    let result = ArrayList<RouterItem>()
    if (cArr.head.isNotNull()) {
        for (i in 0..cArr.size) {
            unsafe { result.add(RouterItem(cArr.head.read(i))) }
        }
    }
    return result.toArray()
}

struct BMQuery <: Equatable<BMQuery> & Hashable {
    var nBundleName: String
    var nInterfaceType: String
    var nFlags: Int32
    var nUserId: Int32

    init(bundleName: String, interfaceType: String, flags: Int32, userId!: Int32 = UNSPECIFIED_USERID) {
        this.nBundleName = bundleName
        this.nInterfaceType = interfaceType
        this.nFlags = flags
        this.nUserId = userId
    }

    public operator override func ==(query: BMQuery): Bool {
        return nBundleName == query.nBundleName && nInterfaceType == query.nInterfaceType && nFlags == query.nFlags &&
            nUserId == query.nUserId
    }

    public operator override func !=(other: BMQuery): Bool {
        !(this == other)
    }

    @OverflowWrapping
    public override func hashCode(): Int64 {
        this.nBundleName.hashCode() ^ this.nInterfaceType.hashCode() ^ this.nFlags.hashCode() ^ this.nUserId.hashCode()
    }
}
