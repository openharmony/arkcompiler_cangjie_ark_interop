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

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum BundleFlag {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoDefault
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithApplication
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithHapModule
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithAbility
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithExtensionAbility
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithRequestedPermission
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithMetadata
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithDisable
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithSignature
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithMenu
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithRouterMap
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetBundleInfoWithSkill
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case GetBundleInfoDefault => 0x00000000
            case GetBundleInfoWithApplication => 0x00000001
            case GetBundleInfoWithHapModule => 0x00000002
            case GetBundleInfoWithAbility => 0x00000004
            case GetBundleInfoWithExtensionAbility => 0x00000008
            case GetBundleInfoWithRequestedPermission => 0x00000010
            case GetBundleInfoWithMetadata => 0x00000020
            case GetBundleInfoWithDisable => 0x00000040
            case GetBundleInfoWithSignature => 0x00000080
            case GetBundleInfoWithMenu => 0x00000100
            case GetBundleInfoWithRouterMap => 0x00000200
            case GetBundleInfoWithSkill => 0x00000800
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ApplicationFlag {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetApplicationInfoDefault
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetApplicationInfoWithPermission
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetApplicationInfoWithMetadata
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetApplicationInfoWithDisable
    | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum AbilityFlag {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetAbilityInfoDefault
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetAbilityInfoWithPermission
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetAbilityInfoWithApplication
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetAbilityInfoWithMetadata
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetAbilityInfoWithDisable
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetAbilityInfoOnlySystemApp
    | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ExtensionAbilityFlag {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetExtensionAbilityInfoDefault
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetExtensionAbilityInfoWithPermission
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetExtensionAbilityInfoWithApplication
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    GetExtensionAbilityInfoWithMetadata
    | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum CompatiblePolicy {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    BackwardCompatibility | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ProfileType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    IntentProfile | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum BundleType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    App
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AtomicService
    | ...

    protected static func parse(val: Int32): BundleType {
        match (val) {
            case 0 => App
            case 1 => AtomicService
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum PermissionGrantState {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PermissionDenied
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PermissionGranted
    | ...

    static func parse(val: Int32): PermissionGrantState {
        match (val) {
            case -1 => PermissionDenied
            case 0 => PermissionGranted
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: false,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum AbilityType {
    @!APILevel[
        21,
        stagemodelonly: false,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Page
    | @!APILevel[
        21,
        stagemodelonly: false,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Service
    | @!APILevel[
        21,
        stagemodelonly: false,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Data
    | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum DisplayOrientation {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Unspecified
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Landscape
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Portrait
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FollowRecent
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    LandscapeInverted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    PortraitInverted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotation
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationLandscape
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationPortrait
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationRestricted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationLandscapeRestricted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationPortraitRestricted
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Locked
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AutoRotationUnspecified
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FollowDesktop
    | ...

    static func parse(val: Int32): DisplayOrientation {
        match (val) {
            case 0 => Unspecified
            case 1 => Landscape
            case 2 => Portrait
            case 3 => FollowRecent
            case 4 => LandscapeInverted
            case 5 => PortraitInverted
            case 6 => AutoRotation
            case 7 => AutoRotationLandscape
            case 8 => AutoRotationPortrait
            case 9 => AutoRotationRestricted
            case 10 => AutoRotationLandscapeRestricted
            case 11 => AutoRotationPortraitRestricted
            case 12 => Locked
            case 13 => AutoRotationUnspecified
            case 14 => FollowDesktop
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum SupportWindowMode {
    @!APILevel[12, atomicservice: true, stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"]
    FullScreen
    | @!APILevel[12, atomicservice: true, stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"]
    Split
    | @!APILevel[12, atomicservice: true, stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"]
    Floating
    | ...

    static func parse(val: Int32): SupportWindowMode {
        match (val) {
            case 0 => FullScreen
            case 1 => Split
            case 2 => Floating
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum LaunchType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Singleton
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Multiton
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Specified
    | ...

    static func parse(val: Int32): LaunchType {
        match (val) {
            case 0 => Singleton
            case 1 => Multiton
            case 2 => Specified
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ExtensionAbilityType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Form
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    WorkScheduler
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    InputMethod
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Service
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Accessibility
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    DataShare
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    FileShare
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    StaticSubscriber
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Wallpaper
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Backup
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Window
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    EnterpriseAdmin
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Thumbnail
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Preview
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Print
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Share
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Push
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Driver
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Action
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AdsService
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    EmbeddedUI
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    InsightIntentUI
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Unspecified
    | ...

    static func parse(val: Int32): ExtensionAbilityType {
        match (val) {
            case 0 => Form
            case 1 => WorkScheduler
            case 2 => InputMethod
            case 3 => Service
            case 4 => Accessibility
            case 5 => DataShare
            case 6 => FileShare
            case 7 => StaticSubscriber
            case 8 => Wallpaper
            case 9 => Backup
            case 10 => Window
            case 11 => EnterpriseAdmin
            case 13 => Thumbnail
            case 14 => Preview
            case 15 => Print
            case 16 => Share
            case 17 => Push
            case 18 => Driver
            case 19 => Action
            case 20 => AdsService
            case 21 => EmbeddedUI
            case 22 => InsightIntentUI
            case 255 => Unspecified
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum ModuleType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Entry
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Feature
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Shared
    | ...

    static func parse(val: Int32): ModuleType {
        match (val) {
            case 1 => Entry
            case 2 => Feature
            case 3 => Shared
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.BundleManager.BundleFramework.Core"
]
public enum MultiAppModeType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    Unspecified
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    MultiInstance
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.BundleManager.BundleFramework.Core"
    ]
    AppClone
    | ...

    static func parse(val: UInt8): MultiAppModeType {
        match (val) {
            case 0 => Unspecified
            case 1 => MultiInstance
            case 2 => AppClone
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}
