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
    AccessibilityFocus
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ClearAccessibilityFocus
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Focus
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ClearFocus
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ClearSelection
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Click
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    LongClick
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Cut
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Copy
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Paste
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Select
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    SetText
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Delete
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ScrollForward
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ScrollBackward
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    SetSelection
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    SetCursorPosition
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Home
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Back
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    RecentTask
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    NotificationCenter
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    ControlCenter
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Common
    | ...

    prop value: String {
        get() {
            match (this) {
                case AccessibilityFocus => 'accessibilityfocus'
                case ClearAccessibilityFocus => 'clearaccessibilityfocus'
                case Focus => 'focus'
                case ClearFocus => 'clearfocus'
                case ClearSelection => 'clearselection'
                case Click => 'click'
                case LongClick => 'longclick'
                case Cut => 'cut'
                case Copy => 'copy'
                case Paste => 'paste'
                case Select => 'select'
                case SetText => 'settext'
                case Delete => 'delete'
                case ScrollForward => 'scrollforward'
                case ScrollBackward => 'scrollbackward'
                case SetSelection => 'setselection'
                case SetCursorPosition => 'setcursorposition'
                case Home => 'home'
                case Back => 'back'
                case RecentTask => 'recenttask'
                case NotificationCenter => 'notificationcenter'
                case ControlCenter => 'controlcenter'
                case Common => 'common'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(action: String): Action {
        match (action) {
            case 'accessibilityFocus' => AccessibilityFocus
            case 'clearAccessibilityFocus' => ClearAccessibilityFocus
            case 'focus' => Focus
            case 'clearFocus' => ClearFocus
            case 'clearSelection' => ClearSelection
            case 'click' => Click
            case 'longClick' => LongClick
            case 'cut' => Cut
            case 'copy' => Copy
            case 'paste' => Paste
            case 'select' => Select
            case 'setText' => SetText
            case 'delete' => Delete
            case 'scrollForward' => ScrollForward
            case 'scrollBackward' => ScrollBackward
            case 'setSelection' => SetSelection
            case 'setCursorPosition' => SetCursorPosition
            case 'home' => Home
            case 'back' => Back
            case 'recentTask' => RecentTask
            case 'notificationCenter' => NotificationCenter
            case 'controlCenter' => ControlCenter
            case 'common' => Common
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
    AccessibilityFocus
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    AccessibilityFocusClear
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Click
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    LongClick
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Focus
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Select
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    HoverEnter
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    HoverExit
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    TextUpdate
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    TextSelectionUpdate
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Scroll
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    RequestFocusForAccessibility
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    AnnounceForAccessibility
    | ...

    prop value: String {
        get() {
            match (this) {
                case AccessibilityFocus => 'accessibilityFocus'
                case AccessibilityFocusClear => 'accessibilityFocusClear'
                case Click => 'click'
                case LongClick => 'longClick'
                case Focus => 'focus'
                case Select => 'select'
                case HoverEnter => 'hoverEnter'
                case HoverExit => 'hoverExit'
                case TextUpdate => 'textUpdate'
                case TextSelectionUpdate => 'textSelectionUpdate'
                case Scroll => 'scroll'
                case RequestFocusForAccessibility => 'requestFocusForAccessibility'
                case AnnounceForAccessibility => 'announceForAccessibility'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(evenType: String): EventType {
        match (evenType) {
            case 'accessibilityFocus' => AccessibilityFocus
            case 'accessibilityFocusClear' => AccessibilityFocusClear
            case 'click' => Click
            case 'longClick' => LongClick
            case 'focus' => Focus
            case 'select' => Select
            case 'hoverEnter' => HoverEnter
            case 'hoverExit' => HoverExit
            case 'textUpdate' => TextUpdate
            case 'textSelectionUpdate' => TextSelectionUpdate
            case 'scroll' => Scroll
            case 'requestFocusForAccessibility' => RequestFocusForAccessibility
            case 'announceForAccessibility' => AnnounceForAccessibility
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
    Add
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Remove
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Bounds
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Active
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Focus
    | ...

    prop value: String {
        get() {
            match (this) {
                case Add => 'add'
                case Remove => 'remove'
                case Bounds => 'bounds'
                case Active => 'active'
                case Focus => 'focus'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(windowUpdateType: String): WindowUpdateType {
        match (windowUpdateType) {
            case 'add' => Add
            case 'remove' => Remove
            case 'bounds' => Bounds
            case 'active' => Active
            case 'focus' => Focus
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
    Char
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Word
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Line
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Page
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    Paragraph
    | ...

    prop value: String {
        get() {
            match (this) {
                case Char => 'char'
                case Word => 'word'
                case Line => 'line'
                case Page => 'page'
                case Paragraph => 'paragraph'
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(text: String): TextMoveUnit {
        match (text) {
            case 'char' => Char
            case 'word' => Word
            case 'line' => Line
            case 'page' => Page
            case 'paragraph' => Paragraph
            case _ => throw NoneValueException("TextMoveUnit parse enum value error")
        }
    }
}
