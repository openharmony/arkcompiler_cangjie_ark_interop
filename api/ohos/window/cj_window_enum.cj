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

package ohos.window

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum WindowType {
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    TYPE_APP
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    TYPE_SYSTEM_ALERT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    TYPE_FLOAT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    TYPE_DIALOG
    | ...

    func getValue(): UInt32 {
        return match (this) {
            case TYPE_APP => 0
            case TYPE_SYSTEM_ALERT => 1
            case TYPE_FLOAT => 8
            case TYPE_DIALOG => 16
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func toString(): String {
        return match (this) {
            case TYPE_APP => "TYPE_APP"
            case TYPE_SYSTEM_ALERT => "TYPE_SYSTEM_ALERT"
            case TYPE_FLOAT => "TYPE_FLOAT"
            case TYPE_DIALOG => "TYPE_DIALOG"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    operator func ==(r: WindowType): Bool {
        return this.getValue() == r.getValue()
    }

    operator func !=(r: WindowType): Bool {
        return this.getValue() != r.getValue()
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum Orientation {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    UNSPECIFIED
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    PORTRAIT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LANDSCAPE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    PORTRAIT_INVERTED
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LANDSCAPE_INVERTED
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    AUTO_ROTATION
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    AUTO_ROTATION_PORTRAIT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    AUTO_ROTATION_LANDSCAPE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    AUTO_ROTATION_RESTRICTED
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    AUTO_ROTATION_PORTRAIT_RESTRICTED
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    AUTO_ROTATION_LANDSCAPE_RESTRICTED
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    LOCKED
    | ...

    func getValue(): UInt32 {
        match (this) {
            case UNSPECIFIED => 0
            case PORTRAIT => 1
            case LANDSCAPE => 2
            case PORTRAIT_INVERTED => 3
            case LANDSCAPE_INVERTED => 4
            case AUTO_ROTATION => 5
            case AUTO_ROTATION_PORTRAIT => 6
            case AUTO_ROTATION_LANDSCAPE => 7
            case AUTO_ROTATION_RESTRICTED => 8
            case AUTO_ROTATION_PORTRAIT_RESTRICTED => 9
            case AUTO_ROTATION_LANDSCAPE_RESTRICTED => 10
            case LOCKED => 11
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: UInt32) {
        match (val) {
            case 0 => UNSPECIFIED
            case 1 => PORTRAIT
            case 2 => LANDSCAPE
            case 3 => PORTRAIT_INVERTED
            case 4 => LANDSCAPE_INVERTED
            case 5 => AUTO_ROTATION
            case 6 => AUTO_ROTATION_PORTRAIT
            case 7 => AUTO_ROTATION_LANDSCAPE
            case 8 => AUTO_ROTATION_RESTRICTED
            case 9 => AUTO_ROTATION_PORTRAIT_RESTRICTED
            case 10 => AUTO_ROTATION_LANDSCAPE_RESTRICTED
            case 11 => LOCKED
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func toString(): String {
        match (this) {
            case UNSPECIFIED => "UNSPECIFIED"
            case PORTRAIT => "PORTRAIT"
            case LANDSCAPE => "LANDSCAPE"
            case PORTRAIT_INVERTED => "PORTRAIT_INVERTED"
            case LANDSCAPE_INVERTED => "LANDSCAPE_INVERTED"
            case AUTO_ROTATION => "AUTO_ROTATION"
            case AUTO_ROTATION_PORTRAIT => "AUTO_ROTATION_PORTRAIT"
            case AUTO_ROTATION_LANDSCAPE => "AUTO_ROTATION_LANDSCAPE"
            case AUTO_ROTATION_RESTRICTED => "AUTO_ROTATION_RESTRICTED"
            case AUTO_ROTATION_PORTRAIT_RESTRICTED => "AUTO_ROTATION_PORTRAIT_RESTRICTED"
            case AUTO_ROTATION_LANDSCAPE_RESTRICTED => "AUTO_ROTATION_LANDSCAPE_RESTRICTED"
            case LOCKED => "LOCKED"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum AvoidAreaType {
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    TYPE_SYSTEM
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    TYPE_CUTOUT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    TYPE_SYSTEM_GESTURE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    TYPE_KEYBOARD
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    TYPE_NAVIGATION_INDICATOR
    | ...

    func getValue(): UInt32 {
        match (this) {
            case TYPE_SYSTEM => 0
            case TYPE_CUTOUT => 1
            case TYPE_SYSTEM_GESTURE => 2
            case TYPE_KEYBOARD => 3
            case TYPE_NAVIGATION_INDICATOR => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32) {
        match (val) {
            case 0 => TYPE_SYSTEM
            case 1 => TYPE_CUTOUT
            case 2 => TYPE_SYSTEM_GESTURE
            case 3 => TYPE_KEYBOARD
            case 4 => TYPE_NAVIGATION_INDICATOR
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func toString(): String {
        match (this) {
            case TYPE_SYSTEM => "TYPE_SYSTEM"
            case TYPE_CUTOUT => "TYPE_CUTOUT"
            case TYPE_SYSTEM_GESTURE => "TYPE_SYSTEM_GESTURE"
            case TYPE_KEYBOARD => "TYPE_KEYBOARD"
            case TYPE_NAVIGATION_INDICATOR => "TYPE_NAVIGATION_INDICATOR"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum WindowEventType {
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    WINDOW_SHOWN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    WINDOW_ACTIVE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    WINDOW_INACTIVE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    WINDOW_HIDDEN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    WINDOW_DESTROYED
    | ...

    func getValue(): UInt32 {
        match (this) {
            case WINDOW_SHOWN => 1
            case WINDOW_ACTIVE => 2
            case WINDOW_INACTIVE => 3
            case WINDOW_HIDDEN => 4
            case WINDOW_DESTROYED => 7
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32) {
        match (val) {
            case 1 => WINDOW_SHOWN
            case 2 => WINDOW_ACTIVE
            case 3 => WINDOW_INACTIVE
            case 4 => WINDOW_HIDDEN
            case 7 => WINDOW_DESTROYED
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func toString(): String {
        match (this) {
            case WINDOW_SHOWN => "WINDOW_SHOWN"
            case WINDOW_ACTIVE => "WINDOW_ACTIVE"
            case WINDOW_INACTIVE => "WINDOW_INACTIVE"
            case WINDOW_HIDDEN => "WINDOW_HIDDEN"
            case WINDOW_DESTROYED => "WINDOW_DESTROYED"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum WindowStageEventType {
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    SHOWN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    ACTIVE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    INACTIVE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    HIDDEN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    RESUMED
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    PAUSED
    | ...

    func getValue(): UInt32 {
        match (this) {
            case SHOWN => 1
            case ACTIVE => 2
            case INACTIVE => 3
            case HIDDEN => 4
            case RESUMED => 5
            case PAUSED => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32) {
        match (val) {
            case 1 => SHOWN
            case 2 => ACTIVE
            case 3 => INACTIVE
            case 4 => HIDDEN
            case 5 => RESUMED
            case 6 => PAUSED
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    operator func ==(r: WindowStageEventType): Bool {
        return this.getValue() == r.getValue()
    }

    operator func !=(r: WindowStageEventType): Bool {
        return this.getValue() != r.getValue()
    }

    func toString(): String {
        match (this) {
            case SHOWN => "SHOWN"
            case ACTIVE => "ACTIVE"
            case INACTIVE => "INACTIVE"
            case HIDDEN => "HIDDEN"
            case RESUMED => "RESUMED"
            case PAUSED => "PAUSED"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public enum WindowStatusType {
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    UNDEFINED
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    FULL_SCREEN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    MAXIMIZE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    MINIMIZE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    FLOATING
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    SPLIT_SCREEN
    | ...

    func getValue(): UInt32 {
        match (this) {
            case UNDEFINED => 0
            case FULL_SCREEN => 1
            case MAXIMIZE => 2
            case MINIMIZE => 3
            case FLOATING => 4
            case SPLIT_SCREEN => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32) {
        match (val) {
            case 0 => UNDEFINED
            case 1 => FULL_SCREEN
            case 2 => MAXIMIZE
            case 3 => MINIMIZE
            case 4 => FLOATING
            case 5 => SPLIT_SCREEN
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    operator func ==(r: WindowStatusType): Bool {
        return this.getValue() == r.getValue()
    }

    operator func !=(r: WindowStatusType): Bool {
        return this.getValue() != r.getValue()
    }

    func toString(): String {
        match (this) {
            case UNDEFINED => "UNDEFINED"
            case FULL_SCREEN => "FULL_SCREEN"
            case MAXIMIZE => "MAXIMIZE"
            case MINIMIZE => "MINIMIZE"
            case FLOATING => "FLOATING"
            case SPLIT_SCREEN => "SPLIT_SCREEN"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public enum ColorSpace {
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    DEFAULT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    WIDE_GAMUT
    | ...

    func getValue(): UInt32 {
        return match (this) {
            case DEFAULT => 0
            case WIDE_GAMUT => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): ColorSpace {
        return match (val) {
            case 0 => DEFAULT
            case 1 => WIDE_GAMUT
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    operator func ==(that: ColorSpace): Bool {
        return this.getValue() == that.getValue()
    }

    operator func !=(that: ColorSpace): Bool {
        return this.getValue() != that.getValue()
    }

    func toString(): String {
        match (this) {
            case DEFAULT => "DEFAULT"
            case WIDE_GAMUT => "WIDE_GAMUT"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
