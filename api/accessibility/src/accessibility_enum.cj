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
