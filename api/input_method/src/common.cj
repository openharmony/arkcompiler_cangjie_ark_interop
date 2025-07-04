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

package ohos.input_method

import ohos.base.*
import ohos.labels.*
import ohos.ffi.*
import std.deriving.*

public const MAX_TYPE_NUM: Int32 = 0x7F
const EVENT_IME_CHANGE_MASK = 1u32
const EVENT_INSERT_TEXT: Int8 = 0
const EVENT_DELETE_LEFT: Int8 = 1
const EVENT_DELETE_RIGHT: Int8 = 2
const EVENT_SEND_KEYBOARD_STATUS: Int8 = 3
const EVENT_SEND_FUNCTION_KEY: Int8 = 4
const EVENT_MOVE_CURSOR: Int8 = 5
const EVENT_HANDLE_EXTEND_ACTION: Int8 = 6
const EVENT_GET_LEFT_TEXT_OF_CURSOR: Int8 = 7
const EVENT_GET_RIGHT_TEXT_OF_CURSOR: Int8 = 8
const EVENT_GET_TEXT_INDEX_AT_CURSOR: Int8 = 9
const EVENT_SELECT_BY_MOVEMENT: Int8 = 10
const EVENT_SELECT_BY_RANGE: Int8 = 11
const EVENT_IME_CHANGE: Int8 = 12

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public class InputMethodProperty <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public InputMethodProperty(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let name: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let id: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let label: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let labelId: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let icon: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let iconId: UInt32
    ) {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func toString(): String {
        "name: ${name}\nid: ${id}\nlabel: ${label}\nlabelId: ${labelId}\nicon: ${icon}\niconId: ${iconId}\n"
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public class InputMethodSubtype <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public InputMethodSubtype(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let name: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let id: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let locale: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let language: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let label: ?String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let labelId: ?UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let icon: ?String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let iconId: ?UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let mode: ?String
    ) {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func toString(): String {
        let sb = StringBuilder()
        sb.append("name: ${name}\nid: ${id}\nlocale: ${locale}\nlanguage: ${language}\n")
        sb.append("label: ${label}\nlabelId: ${labelId}\nicon: ${icon}\niconId: ${iconId}\nmode: ${mode}\n")
        sb.toString()
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public enum TextInputType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    TEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    MULTILINE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    NUMBER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    PHONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    DATETIME
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    EMAIL_ADDRESS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    URL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    VISIBLE_PASSWORD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    NUMBER_PASSWORD
    | ...

    func getValue(): Int8 {
        match (this) {
            case NONE => -1
            case TEXT => 0
            case MULTILINE => 1
            case NUMBER => 2
            case PHONE => 3
            case DATETIME => 4
            case EMAIL_ADDRESS => 5
            case URL => 6
            case VISIBLE_PASSWORD => 7
            case NUMBER_PASSWORD => 8
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public enum EnterKeyType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    UNSPECIFIED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    GO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    SEARCH
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    SEND
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    NEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    DONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    PREVIOUS
    /**
     * The enter key type is NEWLINE.
     *
     * @relation NEWLINE
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    NEWLINE
    | ...

    func getValue(): Int8 {
        match (this) {
            case UNSPECIFIED => 0
            case NONE => 1
            case GO => 2
            case SEARCH => 3
            case SEND => 4
            case NEXT => 5
            case DONE => 6
            case PREVIOUS => 7
            case NEWLINE => 8
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func of(value: Int32): EnterKeyType {
        match (value) {
            case 0 => UNSPECIFIED
            case 1 => NONE
            case 2 => GO
            case 3 => SEARCH
            case 4 => SEND
            case 5 => NEXT
            case 6 => DONE
            case 7 => PREVIOUS
            case 8 => NEWLINE
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public enum KeyboardStatus {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    HIDE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    SHOW
    | ...

    func getValue(): Int8 {
        match (this) {
            case NONE => 0
            case HIDE => 1
            case SHOW => 2
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func of(value: Int32): KeyboardStatus {
        match (value) {
            case 0 => NONE
            case 1 => HIDE
            case 2 => SHOW
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public enum Direction {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    CURSOR_UP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    CURSOR_DOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    CURSOR_LEFT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    CURSOR_RIGHT
    | ...

    func getValue(): Int8 {
        match (this) {
            case CURSOR_UP => 0
            case CURSOR_DOWN => 1
            case CURSOR_LEFT => 2
            case CURSOR_RIGHT => 3
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func of(value: Int32): Direction {
        match (value) {
            case 0 => CURSOR_UP
            case 1 => CURSOR_DOWN
            case 2 => CURSOR_LEFT
            case 3 => CURSOR_RIGHT
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public enum ExtendAction {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    SELECT_ALL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    CUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    COPY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    PASTE
    | ...

    func getValue(): Int8 {
        match (this) {
            case SELECT_ALL => 0
            case CUT => 3
            case COPY => 4
            case PASTE => 5
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func of(value: Int32): ExtendAction {
        match (value) {
            case 0 => SELECT_ALL
            case 3 => CUT
            case 4 => COPY
            case 5 => PASTE
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public class FunctionKey {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public FunctionKey(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let enterKeyType: EnterKeyType
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public class InputAttribute {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public InputAttribute(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let textInputType: TextInputType,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let enterKeyType: EnterKeyType
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public class CursorInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public CursorInfo(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let left: Float64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let top: Float64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let width: Float64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let height: Float64
    ) {}

    func toCCursorInfo(): CCursorInfo {
        CCursorInfo(left, top, width, height)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public class Range {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public Range(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let start: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let end: Int32
    ) {}

    func toCRange(): CRange {
        CRange(start, end)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public class TextConfig {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public TextConfig(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public var inputAttribute!: InputAttribute,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public var cursorInfo!: CursorInfo = CursorInfo(-1.0, -1.0, -1.0, -1.0),
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public var selection!: Range = Range(-1, -1),
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public var windowId!: UInt32 = 0xFFFF_FFFF
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public class Movement {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public Movement(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let direction: Direction
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public class InputWindowInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public InputWindowInfo(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let name: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let left: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let top: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let width: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.MiscServices.InputMethodFramework"
        ]
        public let height: Int32
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public enum IMFEventType <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    InsertText
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    DeleteLeft
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    DeleteRight
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    SendKeyboardStatus
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    SendFunctionKey
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    MoveCursor
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    HandleExtendAction
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    GetLeftTextOfCursor
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    GetRightTextOfCursor
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    GetTextIndexAtCursor
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    SelectByRange
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    SelectByMovement
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    ImeChange
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func toString(): String {
        return match (this) {
            case InsertText => "insertText"
            case DeleteLeft => "deleteLeft"
            case DeleteRight => "deleteRight"
            case SendKeyboardStatus => "sendKeyboardStatus"
            case SendFunctionKey => "sendFunctionKey"
            case MoveCursor => "moveCursor"
            case HandleExtendAction => "handleExtendAction"
            case GetLeftTextOfCursor => "getLeftTextOfCursor"
            case GetRightTextOfCursor => "getRightTextOfCursor"
            case GetTextIndexAtCursor => "getTextIndexAtCursor"
            case SelectByRange => "selectByRange"
            case SelectByMovement => "selectByMovement"
            case ImeChange => "imeChange"
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    func getValue(): Int8 {
        return match (this) {
            case InsertText => EVENT_INSERT_TEXT
            case DeleteLeft => EVENT_DELETE_LEFT
            case DeleteRight => EVENT_DELETE_RIGHT
            case SendKeyboardStatus => EVENT_SEND_KEYBOARD_STATUS
            case SendFunctionKey => EVENT_SEND_FUNCTION_KEY
            case MoveCursor => EVENT_MOVE_CURSOR
            case HandleExtendAction => EVENT_HANDLE_EXTEND_ACTION
            case GetLeftTextOfCursor => EVENT_GET_LEFT_TEXT_OF_CURSOR
            case GetRightTextOfCursor => EVENT_GET_RIGHT_TEXT_OF_CURSOR
            case GetTextIndexAtCursor => EVENT_GET_TEXT_INDEX_AT_CURSOR
            case SelectByRange => EVENT_SELECT_BY_RANGE
            case SelectByMovement => EVENT_SELECT_BY_MOVEMENT
            case ImeChange => EVENT_IME_CHANGE
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * requestKeyboardReason of input click
 *
 * @relation export enum RequestKeyboardReason
 */
@Derive[ToString, Equatable]
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public enum RequestKeyboardReason {
    /**
     * The request keyboard reason is NONE.
     *
     * @relation NONE = 0
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    None
    /**
     * The request keyboard reason is MOUSE.
     *
     * @relation MOUSE = 1
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    Mouse
    /**
     * The request keyboard reason is TOUCH.
     *
     * @relation TOUCH = 2
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    Touch
    /**
     * The request keyboard reason is OTHER.
     *
     * @relation OTHER = 20
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    Other
    | ...

    func getValue(): Int32 {
        return match (this) {
            case None => 0
            case Mouse => 1
            case Touch => 2
            case Other => 20
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}
