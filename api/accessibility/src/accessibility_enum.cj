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

package ohos.accessibility

import std.deriving.*
import ohos.ffi.*
import ohos.labels.*

/**
 * The type of the Ability app.
 *
 * { 'audible' | 'generic' | 'haptic' | 'spoken' | 'visual' | 'all' }
 * @typedef {'audible' | 'generic' | 'haptic' | 'spoken' | 'visual' | 'all'}
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public enum AbilityType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ABILITYTYPE_AUDIBLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ABILITYTYPE_GENERIC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ABILITYTYPE_HAPTIC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ABILITYTYPE_SPOKEN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ABILITYTYPE_VISUAL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ABILITYTYPE_ALL
    | ...

    prop value: String {
        get() {
            match (this) {
                case ABILITYTYPE_AUDIBLE => 'audible'
                case ABILITYTYPE_GENERIC => 'generic'
                case ABILITYTYPE_HAPTIC => 'haptic'
                case ABILITYTYPE_SPOKEN => 'spoken'
                case ABILITYTYPE_VISUAL => 'visual'
                case ABILITYTYPE_ALL => 'all'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(abilityType: String): AbilityType {
        match (abilityType) {
            case 'audible' => ABILITYTYPE_AUDIBLE
            case 'generic' => ABILITYTYPE_GENERIC
            case 'haptic' => ABILITYTYPE_HAPTIC
            case 'spoken' => ABILITYTYPE_SPOKEN
            case 'visual' => ABILITYTYPE_VISUAL
            case 'all' => ABILITYTYPE_ALL
            case _ => throw NoneValueException("AbilityType parse enum value error")
        }
    }
}

/**
 * The action that the ability can execute.
 * value range: { 'accessibilityFocus' | 'clearAccessibilityFocus' | 'focus' | 'clearFocus' | 'clearSelection' |
 * 'click' | 'longClick' | 'cut' | 'copy' | 'paste' | 'select' | 'setText' | 'delete' |
 * 'scrollForward' | 'scrollBackward' | 'setSelection' | 'setCursorPosition' | 'home' |
 * 'back' | 'recentTask' | 'notificationCenter' | 'controlCenter' | 'common' }
 *
 * @typedef {'accessibilityFocus' | 'clearAccessibilityFocus' | 'focus' | 'clearFocus' | 'clearSelection' | 'click' | 'longClick' | 'cut' | 'copy' | 'paste' | 'select' | 'setText' | 'delete' | 'scrollForward' | 'scrollBackward' | 'setSelection' | 'setCursorPosition' | 'home' | 'back' | 'recentTask' | 'notificationCenter' | 'controlCenter' | 'common'}
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public enum Action {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_ACCESSIBILITYFOCUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_CLEARACCESSIBILITYFOCUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_FOCUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_CLEARFOCUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_CLEARSELECTION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_CLICK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_LONGCLICK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_CUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_COPY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_PASTE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_SELECT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_SETTEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_DELETE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_SCROLLFORWARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_SCROLLBACKWARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_SETSELECTION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_SETCURSORPOSITION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_HOME
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_BACK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_RECENTTASK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_NOTIFICATIONCENTER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_CONTROLCENTER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACTION_COMMON
    | ...

    prop value: String {
        get() {
            match (this) {
                case ACTION_ACCESSIBILITYFOCUS => 'accessibilityfocus'
                case ACTION_CLEARACCESSIBILITYFOCUS => 'clearaccessibilityfocus'
                case ACTION_FOCUS => 'focus'
                case ACTION_CLEARFOCUS => 'clearfocus'
                case ACTION_CLEARSELECTION => 'clearselection'
                case ACTION_CLICK => 'click'
                case ACTION_LONGCLICK => 'longclick'
                case ACTION_CUT => 'cut'
                case ACTION_COPY => 'copy'
                case ACTION_PASTE => 'paste'
                case ACTION_SELECT => 'select'
                case ACTION_SETTEXT => 'settext'
                case ACTION_DELETE => 'delete'
                case ACTION_SCROLLFORWARD => 'scrollforward'
                case ACTION_SCROLLBACKWARD => 'scrollbackward'
                case ACTION_SETSELECTION => 'setselection'
                case ACTION_SETCURSORPOSITION => 'setcursorposition'
                case ACTION_HOME => 'home'
                case ACTION_BACK => 'back'
                case ACTION_RECENTTASK => 'recenttask'
                case ACTION_NOTIFICATIONCENTER => 'notificationcenter'
                case ACTION_CONTROLCENTER => 'controlcenter'
                case ACTION_COMMON => 'common'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(action: String): Action {
        match (action) {
            case 'accessibilityFocus' => ACTION_ACCESSIBILITYFOCUS
            case 'clearAccessibilityFocus' => ACTION_CLEARACCESSIBILITYFOCUS
            case 'focus' => ACTION_FOCUS
            case 'clearFocus' => ACTION_CLEARFOCUS
            case 'clearSelection' => ACTION_CLEARSELECTION
            case 'click' => ACTION_CLICK
            case 'longClick' => ACTION_LONGCLICK
            case 'cut' => ACTION_CUT
            case 'copy' => ACTION_COPY
            case 'paste' => ACTION_PASTE
            case 'select' => ACTION_SELECT
            case 'setText' => ACTION_SETTEXT
            case 'delete' => ACTION_DELETE
            case 'scrollForward' => ACTION_SCROLLFORWARD
            case 'scrollBackward' => ACTION_SCROLLBACKWARD
            case 'setSelection' => ACTION_SETSELECTION
            case 'setCursorPosition' => ACTION_SETCURSORPOSITION
            case 'home' => ACTION_HOME
            case 'back' => ACTION_BACK
            case 'recentTask' => ACTION_RECENTTASK
            case 'notificationCenter' => ACTION_NOTIFICATIONCENTER
            case 'controlCenter' => ACTION_CONTROLCENTER
            case 'common' => ACTION_COMMON
            case _ => throw NoneValueException("Action parse enum value error")
        }
    }
}

/**
 * The type of the accessibility event.
 * windowsChange/windowContentChange/windowStateChange/announcement/notificationChange/textTraversedAtMove
 * value range: { 'accessibilityFocus' | 'accessibilityFocusClear' |
 * 'click' | 'longClick' | 'focus' | 'select' | 'hoverEnter' | 'hoverExit' |
 * 'textUpdate' | 'textSelectionUpdate' | 'scroll' | 'requestFocusForAccessibility' |
 * 'announceForAccessibility' }
 *
 * @typedef {'accessibilityFocus' | 'accessibilityFocusClear' | 'click' | 'longClick' | 'focus' | 'select' | 'hoverEnter' | 'hoverExit' | 'textUpdate' | 'textSelectionUpdate' | 'scroll' | 'requestFocusForAccessibility' | 'announceForAccessibility'}
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public enum EventType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_ACCESSIBILITYFOCUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_ACCESSIBILITYFOCUSCLEAR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_CLICK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_LONGCLICK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_FOCUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_SELECT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_HOVERENTER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_HOVEREXIT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_TEXTUPDATE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_TEXTSELECTIONUPDATE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_SCROLL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_REQUESTFOCUSFORACCESSIBILITY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    EVENTTYPE_ANNOUNCEFORACCESSIBILITY
    | ...

    prop value: String {
        get() {
            match (this) {
                case EVENTTYPE_ACCESSIBILITYFOCUS => 'accessibilityFocus'
                case EVENTTYPE_ACCESSIBILITYFOCUSCLEAR => 'accessibilityFocusClear'
                case EVENTTYPE_CLICK => 'click'
                case EVENTTYPE_LONGCLICK => 'longClick'
                case EVENTTYPE_FOCUS => 'focus'
                case EVENTTYPE_SELECT => 'select'
                case EVENTTYPE_HOVERENTER => 'hoverEnter'
                case EVENTTYPE_HOVEREXIT => 'hoverExit'
                case EVENTTYPE_TEXTUPDATE => 'textUpdate'
                case EVENTTYPE_TEXTSELECTIONUPDATE => 'textSelectionUpdate'
                case EVENTTYPE_SCROLL => 'scroll'
                case EVENTTYPE_REQUESTFOCUSFORACCESSIBILITY => 'requestFocusForAccessibility'
                case EVENTTYPE_ANNOUNCEFORACCESSIBILITY => 'announceForAccessibility'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(evenType: String): EventType {
        match (evenType) {
            case 'accessibilityFocus' => EVENTTYPE_ACCESSIBILITYFOCUS
            case 'accessibilityFocusClear' => EVENTTYPE_ACCESSIBILITYFOCUSCLEAR
            case 'click' => EVENTTYPE_CLICK
            case 'longClick' => EVENTTYPE_LONGCLICK
            case 'focus' => EVENTTYPE_FOCUS
            case 'select' => EVENTTYPE_SELECT
            case 'hoverEnter' => EVENTTYPE_HOVERENTER
            case 'hoverExit' => EVENTTYPE_HOVEREXIT
            case 'textUpdate' => EVENTTYPE_TEXTUPDATE
            case 'textSelectionUpdate' => EVENTTYPE_TEXTSELECTIONUPDATE
            case 'scroll' => EVENTTYPE_SCROLL
            case 'requestFocusForAccessibility' => EVENTTYPE_REQUESTFOCUSFORACCESSIBILITY
            case 'announceForAccessibility' => EVENTTYPE_ANNOUNCEFORACCESSIBILITY
            case _ => throw NoneValueException("EventType parse enum value error(${evenType})")
        }
    }
}

/**
 * The change type of the windowsChange event.
 * It's used when received the {@code windowsChange} event.
 *
 * @typedef {'add' | 'remove' | 'bounds' | 'active' | 'focus'}
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 * @since 7
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public enum WindowUpdateType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    WINDOWUPDATETYPE_ADD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    WINDOWUPDATETYPE_REMOVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    WINDOWUPDATETYPE_BOUNDS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    WINDOWUPDATETYPE_ACTIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    WINDOWUPDATETYPE_FOCUS
    | ...

    prop value: String {
        get() {
            match (this) {
                case WINDOWUPDATETYPE_ADD => 'add'
                case WINDOWUPDATETYPE_REMOVE => 'remove'
                case WINDOWUPDATETYPE_BOUNDS => 'bounds'
                case WINDOWUPDATETYPE_ACTIVE => 'active'
                case WINDOWUPDATETYPE_FOCUS => 'focus'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(windowUpdateType: String): WindowUpdateType {
        match (windowUpdateType) {
            case 'add' => WINDOWUPDATETYPE_ADD
            case 'remove' => WINDOWUPDATETYPE_REMOVE
            case 'bounds' => WINDOWUPDATETYPE_BOUNDS
            case 'active' => WINDOWUPDATETYPE_ACTIVE
            case 'focus' => WINDOWUPDATETYPE_FOCUS
            case _ => throw NoneValueException("WindowUpdateType parse enum value error(${windowUpdateType})")
        }
    }
}

/**
 * The type of the ability state.
 *
 * @typedef {'enable' | 'disable' | 'install'}
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public enum AbilityState {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ABILITYSTATE_ENABLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ABILITYSTATE_DISABLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ABILITYSTATE_INSTALL
    | ...

    prop value: String {
        get() {
            match (this) {
                case ABILITYSTATE_ENABLE => 'enable'
                case ABILITYSTATE_DISABLE => 'disable'
                case ABILITYSTATE_INSTALL => 'install'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(abilityState: String): AbilityState {
        match (abilityState) {
            case 'enable' => ABILITYSTATE_ENABLE
            case 'disable' => ABILITYSTATE_DISABLE
            case 'install' => ABILITYSTATE_INSTALL
            case _ => throw NoneValueException("AbilityState parse enum value error")
        }
    }
}

/**
 * The ability that accessibility subsystem support.
 * touchExplorer: Describes the capability to talkback.
 * magnification: Describes the capability to request to control the display magnification.
 * gesturesSimulation: Describes the capability to request to simulate the gesture.
 * windowContent: Describes the capability to search for the content of the active window.
 * filterKeyEvents: Describes the capability to request to filter key events.
 * fingerprintGesture: Describes the capability to request to fingerprint gesture.
 *
 * @typedef {'retrieve' | 'touchGuide' | 'keyEventObserver' | 'zoom' | 'gesture'}
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 * @since 7
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public enum Capability {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    CAPABILITY_RETRIEVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    CAPABILITY_TOUCHGUIDE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    CAPABILITY_KEYEVENTOBSERVER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    CAPABILITY_ZOOM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    CAPABILITY_GESTURE
    | ...

    prop value: String {
        get() {
            match (this) {
                case CAPABILITY_RETRIEVE => 'retrieve'
                case CAPABILITY_TOUCHGUIDE => 'touchGuide'
                case CAPABILITY_KEYEVENTOBSERVER => 'keyEventObserver'
                case CAPABILITY_ZOOM => 'zoom'
                case CAPABILITY_GESTURE => 'gesture'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(cap: String): Capability {
        match (cap) {
            case 'retrieve' => CAPABILITY_RETRIEVE
            case 'touchGuide' => CAPABILITY_TOUCHGUIDE
            case 'keyEventObserver' => CAPABILITY_KEYEVENTOBSERVER
            case 'zoom' => CAPABILITY_ZOOM
            case 'gesture' => CAPABILITY_GESTURE
            case _ => throw NoneValueException("Capability parse enum value error")
        }
    }
}

/**
 * The granularity of text move.
 *
 * @typedef {'char' | 'word' | 'line' | 'page' | 'paragraph'}
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public enum TextMoveUnit {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    TEXTMOVEUNIT_CHAR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    TEXTMOVEUNIT_WORD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    TEXTMOVEUNIT_LINE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    TEXTMOVEUNIT_PAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    TEXTMOVEUNIT_PARAGRAPH
    | ...

    prop value: String {
        get() {
            match (this) {
                case TEXTMOVEUNIT_CHAR => 'char'
                case TEXTMOVEUNIT_WORD => 'word'
                case TEXTMOVEUNIT_LINE => 'line'
                case TEXTMOVEUNIT_PAGE => 'page'
                case TEXTMOVEUNIT_PARAGRAPH => 'paragraph'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(text: String): TextMoveUnit {
        match (text) {
            case 'char' => TEXTMOVEUNIT_CHAR
            case 'word' => TEXTMOVEUNIT_WORD
            case 'line' => TEXTMOVEUNIT_LINE
            case 'page' => TEXTMOVEUNIT_PAGE
            case 'paragraph' => TEXTMOVEUNIT_PARAGRAPH
            case _ => throw NoneValueException("TextMoveUnit parse enum value error")
        }
    }
}

/**
 * Indicates the edge type of the captions font.
 *
 * @typedef {'none' | 'raised' | 'depressed' | 'uniform' | 'dropShadow'}
 * @syscap SystemCapability.BarrierFree.Accessibility.Hearing
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
]
public enum CaptionsFontEdgeType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTEDGETYPE_NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTEDGETYPE_RAISED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTEDGETYPE_DEPRESSED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTEDGETYPE_UNIFORM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTEDGETYPE_DROPSHADOW
    | ...

    prop value: String {
        get() {
            match (this) {
                case CAPTIONSFONTEDGETYPE_NONE => 'none'
                case CAPTIONSFONTEDGETYPE_RAISED => 'raised'
                case CAPTIONSFONTEDGETYPE_DEPRESSED => 'depressed'
                case CAPTIONSFONTEDGETYPE_UNIFORM => 'uniform'
                case CAPTIONSFONTEDGETYPE_DROPSHADOW => 'dropShadow'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(cap: String): CaptionsFontEdgeType {
        match (cap) {
            case 'none' => CAPTIONSFONTEDGETYPE_NONE
            case 'raised' => CAPTIONSFONTEDGETYPE_RAISED
            case 'depressed' => CAPTIONSFONTEDGETYPE_DEPRESSED
            case 'uniform' => CAPTIONSFONTEDGETYPE_UNIFORM
            case 'dropShadow' => CAPTIONSFONTEDGETYPE_DROPSHADOW
            case _ => throw NoneValueException("CaptionsFontEdgeType parse enum value error")
        }
    }
}
/**
 * Indicates the font family of captions.
 *
 * @typedef {'default' | 'monospacedSerif' | 'serif' | 'monospacedSansSerif' | 'sansSerif' | 'casual' | 'cursive' | 'smallCapitals'}
 * @syscap SystemCapability.BarrierFree.Accessibility.Hearing
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
]
public enum CaptionsFontFamily {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTFAMILY_DEFAULT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTFAMILY_MONOSPACEDSERIF
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTFAMILY_SERIF
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTFAMILY_MONOSPACEDSANSSERIF
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTFAMILY_SANSSERIF
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTFAMILY_CASUAL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTFAMILY_CURSIVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    CAPTIONSFONTFAMILY_SMALLCAPITALS
    | ...

    prop value: String {
        get() {
            match (this) {
                case CAPTIONSFONTFAMILY_DEFAULT => 'default'
                case CAPTIONSFONTFAMILY_MONOSPACEDSERIF => 'monospacedSerif'
                case CAPTIONSFONTFAMILY_SERIF => 'serif'
                case CAPTIONSFONTFAMILY_MONOSPACEDSANSSERIF => 'monospacedSansSerif'
                case CAPTIONSFONTFAMILY_SANSSERIF => 'sansSerif'
                case CAPTIONSFONTFAMILY_CASUAL => 'casual'
                case CAPTIONSFONTFAMILY_CURSIVE => 'cursive'
                case CAPTIONSFONTFAMILY_SMALLCAPITALS => 'smallCapitals'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(cap: String): CaptionsFontFamily {
        match (cap) {
            case 'default' => CAPTIONSFONTFAMILY_DEFAULT
            case 'monospacedSerif' => CAPTIONSFONTFAMILY_MONOSPACEDSERIF
            case 'serif' => CAPTIONSFONTFAMILY_SERIF
            case 'monospacedSansSerif' => CAPTIONSFONTFAMILY_MONOSPACEDSANSSERIF
            case 'sansSerif' => CAPTIONSFONTFAMILY_SANSSERIF
            case 'casual' => CAPTIONSFONTFAMILY_CASUAL
            case 'cursive' => CAPTIONSFONTFAMILY_CURSIVE
            case 'smallCapitals' => CAPTIONSFONTFAMILY_SMALLCAPITALS
            case _ => throw NoneValueException("CaptionsFontFamily parse enum value error")
        }
    }
}

@Derive[ToString, Equatable, Hashable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public enum AccCallBackType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ACCCALLBACKTYPE_ACCESSIBILITYSTATECHANGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Vision"
    ]
    ACCCALLBACKTYPE_TOUCHGUIDESTATECHANGE
    | ...

    prop value: String {
        get() {
            match (this) {
                case ACCCALLBACKTYPE_ACCESSIBILITYSTATECHANGE => "accessibilityStateChange"
                case ACCCALLBACKTYPE_TOUCHGUIDESTATECHANGE => "touchGuideStateChange"
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(v: String): AccCallBackType {
        match (v) {
            case "accessibilityStateChange" => ACCCALLBACKTYPE_ACCESSIBILITYSTATECHANGE
            case "touchGuideStateChange" => ACCCALLBACKTYPE_TOUCHGUIDESTATECHANGE
            case _ => throw NoneValueException("AccCallBackType parse enum value error")
        }
    }
}
