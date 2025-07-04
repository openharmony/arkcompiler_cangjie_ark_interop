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

package ohos.display

import ohos.base.*
import ohos.labels.*

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum Orientation {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    PORTRAIT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LANDSCAPE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    PORTRAIT_INVERTED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LANDSCAPE_INVERTED
    | ...

    static func parse(val: UInt32) {
        match (val) {
            case 0 => PORTRAIT
            case 1 => LANDSCAPE
            case 2 => PORTRAIT_INVERTED
            case 3 => LANDSCAPE_INVERTED
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum DisplayState {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    STATE_UNKNOWN
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    STATE_OFF
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    STATE_ON
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    STATE_DOZE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    STATE_DOZE_SUSPEND
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    STATE_VR
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    STATE_ON_SUSPEND
    | ...

    static func parse(val: UInt32) {
        match (val) {
            case 0 => STATE_UNKNOWN
            case 1 => STATE_OFF
            case 2 => STATE_ON
            case 3 => STATE_DOZE
            case 4 => STATE_DOZE_SUSPEND
            case 5 => STATE_VR
            case 6 => STATE_ON_SUSPEND
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum FoldStatus {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    FOLD_STATUS_UNKNOWN
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    FOLD_STATUS_EXPANDED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    FOLD_STATUS_FOLDED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    FOLD_STATUS_HALF_FOLDED
    | ...

    static func parse(val: UInt32) {
        match (val) {
            case 0 => FOLD_STATUS_UNKNOWN
            case 1 => FOLD_STATUS_EXPANDED
            case 2 => FOLD_STATUS_FOLDED
            case 3 => FOLD_STATUS_HALF_FOLDED
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum FoldDisplayMode {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    FOLD_DISPLAY_MODE_UNKNOWN
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    FOLD_DISPLAY_MODE_FULL
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    FOLD_DISPLAY_MODE_MAIN
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    FOLD_DISPLAY_MODE_SUB
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    FOLD_DISPLAY_MODE_COORDINATION
    | ...

    func getValue(): UInt32 {
        match (this) {
            case FOLD_DISPLAY_MODE_UNKNOWN => 0
            case FOLD_DISPLAY_MODE_FULL => 1
            case FOLD_DISPLAY_MODE_MAIN => 2
            case FOLD_DISPLAY_MODE_SUB => 3
            case FOLD_DISPLAY_MODE_COORDINATION => 4
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func parse(val: UInt32) {
        match (val) {
            case 0 => FOLD_DISPLAY_MODE_UNKNOWN
            case 1 => FOLD_DISPLAY_MODE_FULL
            case 2 => FOLD_DISPLAY_MODE_MAIN
            case 3 => FOLD_DISPLAY_MODE_SUB
            case 4 => FOLD_DISPLAY_MODE_COORDINATION
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum HDRFormat {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    NONE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    VIDEO_HLG
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    VIDEO_HDR10
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    VIDEO_HDR_VIVID
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    IMAGE_HDR_VIVID_DUAL
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    IMAGE_HDR_VIVID_SINGLE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    IMAGE_HDR_ISO_DUAL
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    IMAGE_HDR_ISO_SINGLE
    | ...

    public func getValue(): UInt32 {
        match (this) {
            case NONE => 0
            case VIDEO_HLG => 1
            case VIDEO_HDR10 => 2
            case VIDEO_HDR_VIVID => 3
            case IMAGE_HDR_VIVID_DUAL => 4
            case IMAGE_HDR_VIVID_SINGLE => 5
            case IMAGE_HDR_ISO_DUAL => 6
            case IMAGE_HDR_ISO_SINGLE => 7
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    public static func parse(val: UInt32): HDRFormat {
        match (val) {
            case 0 => NONE
            case 1 => VIDEO_HLG
            case 2 => VIDEO_HDR10
            case 3 => VIDEO_HDR_VIVID
            case 4 => IMAGE_HDR_VIVID_DUAL
            case 5 => IMAGE_HDR_VIVID_SINGLE
            case 6 => IMAGE_HDR_ISO_DUAL
            case 7 => IMAGE_HDR_ISO_SINGLE
            case _ => throw IllegalArgumentException("Unknown value ${val}")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum ListenerType <: ToString {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LISTNER_TYPE_ADD
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LISTNER_TYPE_REMOVE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LISTNER_TYPE_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LISTNER_TYPE_FOLD_STATUS_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LISTNER_TYPE_FOLD_ANGLE_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LISTNER_TYPE_CAPTURE_STATUS_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LISTNER_TYPE_FOLD_DISPLAY_MODE_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LISTNER_TYPE_AVAILABLE_AREA_CHANGE
    | ...

    public func toString(): String {
        return match (this) {
            case LISTNER_TYPE_ADD => "add"
            case LISTNER_TYPE_REMOVE => "remove"
            case LISTNER_TYPE_CHANGE => "change"
            case LISTNER_TYPE_FOLD_STATUS_CHANGE => "foldStatusChange"
            case LISTNER_TYPE_FOLD_ANGLE_CHANGE => "foldAngleChange"
            case LISTNER_TYPE_CAPTURE_STATUS_CHANGE => "captureStatusChange"
            case LISTNER_TYPE_FOLD_DISPLAY_MODE_CHANGE => "foldDisplayModeChange"
            case LISTNER_TYPE_AVAILABLE_AREA_CHANGE => "availableAreaChange"
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}
