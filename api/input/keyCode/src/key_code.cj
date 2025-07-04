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

package ohos.multimodalInput.keyCode

import std.deriving.*
import ohos.labels.*

/**
 * KeyCode
 *
 * @enum { Int32 }
 * @syscap SystemCapability.MultimodalInput.Input.Core
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.MultimodalInput.Input.Core"
]
public enum KeyCode {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_FN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_UNKNOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_HOME
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BACK
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEDIA_PLAY_PAUSE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEDIA_STOP
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEDIA_NEXT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEDIA_PREVIOUS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEDIA_REWIND
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEDIA_FAST_FORWARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_VOLUME_UP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_VOLUME_DOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_POWER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CAMERA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_VOLUME_MUTE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MUTE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BRIGHTNESS_UP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BRIGHTNESS_DOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_0
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_1
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_2
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_3
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_4
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_5
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_6
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_7
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_8
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_9
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_STAR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_POUND
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DPAD_UP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DPAD_DOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DPAD_LEFT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DPAD_RIGHT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DPAD_CENTER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_A
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_B
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_C
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_D
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_E
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_G
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_H
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_I
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_J
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_K
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_L
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_M
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_N
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_O
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_P
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_Q
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_R
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_S
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_T
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_U
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_V
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_W
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_X
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_Y
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_Z
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_COMMA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PERIOD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ALT_LEFT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ALT_RIGHT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SHIFT_LEFT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SHIFT_RIGHT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_TAB
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SPACE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SYM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_EXPLORER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ENVELOPE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ENTER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DEL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_GRAVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MINUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_EQUALS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_LEFT_BRACKET
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_RIGHT_BRACKET
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BACKSLASH
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SEMICOLON
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_APOSTROPHE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SLASH
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_AT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PLUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MENU
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PAGE_UP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PAGE_DOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ESCAPE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_FORWARD_DEL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CTRL_LEFT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CTRL_RIGHT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CAPS_LOCK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SCROLL_LOCK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_META_LEFT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_META_RIGHT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_FUNCTION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SYSRQ
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BREAK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MOVE_HOME
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MOVE_END
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_INSERT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_FORWARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEDIA_PLAY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEDIA_PAUSE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEDIA_CLOSE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEDIA_EJECT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEDIA_RECORD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F1
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F2
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F3
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F4
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F5
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F6
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F7
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F8
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F9
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F10
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F11
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F12
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUM_LOCK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_0
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_1
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_2
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_3
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_4
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_5
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_6
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_7
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_8
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_9
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_DIVIDE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_MULTIPLY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_SUBTRACT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_ADD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_DOT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_COMMA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_ENTER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_EQUALS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_LEFT_PAREN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_RIGHT_PAREN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_VIRTUAL_MULTITASK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SLEEP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ZENKAKU_HANKAKU
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_102ND
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_RO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KATAKANA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_HIRAGANA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_HENKAN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KATAKANA_HIRAGANA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MUHENKAN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_LINEFEED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MACRO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NUMPAD_PLUSMINUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SCALE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_HANGUEL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_HANJA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_YEN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_STOP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_AGAIN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PROPS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_UNDO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_COPY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_OPEN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PASTE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_FIND
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_HELP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CALC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_FILE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BOOKMARKS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PLAYPAUSE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PREVIOUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_STOPCD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CONFIG
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_REFRESH
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_EXIT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_EDIT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SCROLLUP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SCROLLDOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NEW
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_REDO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CLOSE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PLAY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BASSBOOST
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PRINT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CHAT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_FINANCE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CANCEL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KBDILLUM_TOGGLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KBDILLUM_DOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KBDILLUM_UP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SEND
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_REPLY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_FORWARDMAIL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SAVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DOCUMENTS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_VIDEO_NEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_VIDEO_PREV
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BRIGHTNESS_CYCLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BRIGHTNESS_ZERO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DISPLAY_OFF
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BTN_MISC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_GOTO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_INFO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PROGRAM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PVR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SUBTITLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_FULL_SCREEN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KEYBOARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ASPECT_RATIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_TV
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_TV2
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_VCR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_VCR2
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SAT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_TAPE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_TUNER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PLAYER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DVD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_AUDIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_VIDEO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEMO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CALENDAR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_RED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_GREEN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_YELLOW
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BLUE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CHANNELUP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CHANNELDOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_LAST
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_RESTART
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SLOW
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SHUFFLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_VIDEOPHONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_GAMES
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ZOOMIN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ZOOMOUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ZOOMRESET
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_WORDPROCESSOR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_EDITOR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SPREADSHEET
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_GRAPHICSEDITOR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PRESENTATION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DATABASE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_NEWS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_VOICEMAIL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ADDRESSBOOK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MESSENGER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BRIGHTNESS_TOGGLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SPELLCHECK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_COFFEE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MEDIA_REPEAT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_IMAGES
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTONCONFIG
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_TASKMANAGER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_JOURNAL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CONTROLPANEL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_APPSELECT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SCREENSAVER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ASSISTANT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KBD_LAYOUT_NEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BRIGHTNESS_MIN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BRIGHTNESS_MAX
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KBDINPUTASSIST_PREV
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KBDINPUTASSIST_NEXT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KBDINPUTASSIST_PREVGROUP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KBDINPUTASSIST_NEXTGROUP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KBDINPUTASSIST_ACCEPT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_KBDINPUTASSIST_CANCEL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_FRONT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SETUP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_WAKEUP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SENDFILE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DELETEFILE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_XFER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PROG1
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PROG2
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MSDOS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SCREENLOCK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DIRECTION_ROTATE_DISPLAY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CYCLEWINDOWS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_COMPUTER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_EJECTCLOSECD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ISO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_MOVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F13
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F14
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F15
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F16
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F17
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F18
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F19
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F20
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F21
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F22
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F23
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_F24
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PROG3
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_PROG4
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_DASHBOARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SUSPEND
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_HP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SOUND
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_QUESTION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CONNECT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SPORT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SHOP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_ALTERASE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SWITCHVIDEOMODE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BATTERY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BLUETOOTH
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_WLAN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_UWB
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_WWAN_WIMAX
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_RFKILL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_CHANNEL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BTN_0
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BTN_1
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BTN_2
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BTN_3
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BTN_4
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BTN_5
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BTN_6
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BTN_7
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BTN_8
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BTN_9
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_SEARCH
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_A
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_B
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_X
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_Y
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_L1
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_R1
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_L2
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_R2
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_SELECT
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_START
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_MODE
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_THUMBL
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MultimodalInput.Input.Core"
    ]
    KEYCODE_BUTTON_THUMBR
    | ...

    protected func get(): Int32 {
        match (this) {
            case KEYCODE_FN => 0
            case KEYCODE_UNKNOWN => -1
            case KEYCODE_HOME => 1
            case KEYCODE_BACK => 2
            case KEYCODE_MEDIA_PLAY_PAUSE => 10
            case KEYCODE_MEDIA_STOP => 11
            case KEYCODE_MEDIA_NEXT => 12
            case KEYCODE_MEDIA_PREVIOUS => 13
            case KEYCODE_MEDIA_REWIND => 14
            case KEYCODE_MEDIA_FAST_FORWARD => 15
            case KEYCODE_VOLUME_UP => 16
            case KEYCODE_VOLUME_DOWN => 17
            case KEYCODE_POWER => 18
            case KEYCODE_CAMERA => 19
            case KEYCODE_VOLUME_MUTE => 22
            case KEYCODE_MUTE => 23
            case KEYCODE_BRIGHTNESS_UP => 40
            case KEYCODE_BRIGHTNESS_DOWN => 41
            case KEYCODE_0 => 2000
            case KEYCODE_1 => 2001
            case KEYCODE_2 => 2002
            case KEYCODE_3 => 2003
            case KEYCODE_4 => 2004
            case KEYCODE_5 => 2005
            case KEYCODE_6 => 2006
            case KEYCODE_7 => 2007
            case KEYCODE_8 => 2008
            case KEYCODE_9 => 2009
            case KEYCODE_STAR => 2010
            case KEYCODE_POUND => 2011
            case KEYCODE_DPAD_UP => 2012
            case KEYCODE_DPAD_DOWN => 2013
            case KEYCODE_DPAD_LEFT => 2014
            case KEYCODE_DPAD_RIGHT => 2015
            case KEYCODE_DPAD_CENTER => 2016
            case KEYCODE_A => 2017
            case KEYCODE_B => 2018
            case KEYCODE_C => 2019
            case KEYCODE_D => 2020
            case KEYCODE_E => 2021
            case KEYCODE_F => 2022
            case KEYCODE_G => 2023
            case KEYCODE_H => 2024
            case KEYCODE_I => 2025
            case KEYCODE_J => 2026
            case KEYCODE_K => 2027
            case KEYCODE_L => 2028
            case KEYCODE_M => 2029
            case KEYCODE_N => 2030
            case KEYCODE_O => 2031
            case KEYCODE_P => 2032
            case KEYCODE_Q => 2033
            case KEYCODE_R => 2034
            case KEYCODE_S => 2035
            case KEYCODE_T => 2036
            case KEYCODE_U => 2037
            case KEYCODE_V => 2038
            case KEYCODE_W => 2039
            case KEYCODE_X => 2040
            case KEYCODE_Y => 2041
            case KEYCODE_Z => 2042
            case KEYCODE_COMMA => 2043
            case KEYCODE_PERIOD => 2044
            case KEYCODE_ALT_LEFT => 2045
            case KEYCODE_ALT_RIGHT => 2046
            case KEYCODE_SHIFT_LEFT => 2047
            case KEYCODE_SHIFT_RIGHT => 2048
            case KEYCODE_TAB => 2049
            case KEYCODE_SPACE => 2050
            case KEYCODE_SYM => 2051
            case KEYCODE_EXPLORER => 2052
            case KEYCODE_ENVELOPE => 2053
            case KEYCODE_ENTER => 2054
            case KEYCODE_DEL => 2055
            case KEYCODE_GRAVE => 2056
            case KEYCODE_MINUS => 2057
            case KEYCODE_EQUALS => 2058
            case KEYCODE_LEFT_BRACKET => 2059
            case KEYCODE_RIGHT_BRACKET => 2060
            case KEYCODE_BACKSLASH => 2061
            case KEYCODE_SEMICOLON => 2062
            case KEYCODE_APOSTROPHE => 2063
            case KEYCODE_SLASH => 2064
            case KEYCODE_AT => 2065
            case KEYCODE_PLUS => 2066
            case KEYCODE_MENU => 2067
            case KEYCODE_PAGE_UP => 2068
            case KEYCODE_PAGE_DOWN => 2069
            case KEYCODE_ESCAPE => 2070
            case KEYCODE_FORWARD_DEL => 2071
            case KEYCODE_CTRL_LEFT => 2072
            case KEYCODE_CTRL_RIGHT => 2073
            case KEYCODE_CAPS_LOCK => 2074
            case KEYCODE_SCROLL_LOCK => 2075
            case KEYCODE_META_LEFT => 2076
            case KEYCODE_META_RIGHT => 2077
            case KEYCODE_FUNCTION => 2078
            case KEYCODE_SYSRQ => 2079
            case KEYCODE_BREAK => 2080
            case KEYCODE_MOVE_HOME => 2081
            case KEYCODE_MOVE_END => 2082
            case KEYCODE_INSERT => 2083
            case KEYCODE_FORWARD => 2084
            case KEYCODE_MEDIA_PLAY => 2085
            case KEYCODE_MEDIA_PAUSE => 2086
            case KEYCODE_MEDIA_CLOSE => 2087
            case KEYCODE_MEDIA_EJECT => 2088
            case KEYCODE_MEDIA_RECORD => 2089
            case KEYCODE_F1 => 2090
            case KEYCODE_F2 => 2091
            case KEYCODE_F3 => 2092
            case KEYCODE_F4 => 2093
            case KEYCODE_F5 => 2094
            case KEYCODE_F6 => 2095
            case KEYCODE_F7 => 2096
            case KEYCODE_F8 => 2097
            case KEYCODE_F9 => 2098
            case KEYCODE_F10 => 2099
            case KEYCODE_F11 => 2100
            case KEYCODE_F12 => 2101
            case KEYCODE_NUM_LOCK => 2102
            case KEYCODE_NUMPAD_0 => 2103
            case KEYCODE_NUMPAD_1 => 2104
            case KEYCODE_NUMPAD_2 => 2105
            case KEYCODE_NUMPAD_3 => 2106
            case KEYCODE_NUMPAD_4 => 2107
            case KEYCODE_NUMPAD_5 => 2108
            case KEYCODE_NUMPAD_6 => 2109
            case KEYCODE_NUMPAD_7 => 2110
            case KEYCODE_NUMPAD_8 => 2111
            case KEYCODE_NUMPAD_9 => 2112
            case KEYCODE_NUMPAD_DIVIDE => 2113
            case KEYCODE_NUMPAD_MULTIPLY => 2114
            case KEYCODE_NUMPAD_SUBTRACT => 2115
            case KEYCODE_NUMPAD_ADD => 2116
            case KEYCODE_NUMPAD_DOT => 2117
            case KEYCODE_NUMPAD_COMMA => 2118
            case KEYCODE_NUMPAD_ENTER => 2119
            case KEYCODE_NUMPAD_EQUALS => 2120
            case KEYCODE_NUMPAD_LEFT_PAREN => 2121
            case KEYCODE_NUMPAD_RIGHT_PAREN => 2122
            case KEYCODE_VIRTUAL_MULTITASK => 2210
            case KEYCODE_SLEEP => 2600
            case KEYCODE_ZENKAKU_HANKAKU => 2601
            case KEYCODE_102ND => 2602
            case KEYCODE_RO => 2603
            case KEYCODE_KATAKANA => 2604
            case KEYCODE_HIRAGANA => 2605
            case KEYCODE_HENKAN => 2606
            case KEYCODE_KATAKANA_HIRAGANA => 2607
            case KEYCODE_MUHENKAN => 2608
            case KEYCODE_LINEFEED => 2609
            case KEYCODE_MACRO => 2610
            case KEYCODE_NUMPAD_PLUSMINUS => 2611
            case KEYCODE_SCALE => 2612
            case KEYCODE_HANGUEL => 2613
            case KEYCODE_HANJA => 2614
            case KEYCODE_YEN => 2615
            case KEYCODE_STOP => 2616
            case KEYCODE_AGAIN => 2617
            case KEYCODE_PROPS => 2618
            case KEYCODE_UNDO => 2619
            case KEYCODE_COPY => 2620
            case KEYCODE_OPEN => 2621
            case KEYCODE_PASTE => 2622
            case KEYCODE_FIND => 2623
            case KEYCODE_CUT => 2624
            case KEYCODE_HELP => 2625
            case KEYCODE_CALC => 2626
            case KEYCODE_FILE => 2627
            case KEYCODE_BOOKMARKS => 2628
            case KEYCODE_NEXT => 2629
            case KEYCODE_PLAYPAUSE => 2630
            case KEYCODE_PREVIOUS => 2631
            case KEYCODE_STOPCD => 2632
            case KEYCODE_CONFIG => 2634
            case KEYCODE_REFRESH => 2635
            case KEYCODE_EXIT => 2636
            case KEYCODE_EDIT => 2637
            case KEYCODE_SCROLLUP => 2638
            case KEYCODE_SCROLLDOWN => 2639
            case KEYCODE_NEW => 2640
            case KEYCODE_REDO => 2641
            case KEYCODE_CLOSE => 2642
            case KEYCODE_PLAY => 2643
            case KEYCODE_BASSBOOST => 2644
            case KEYCODE_PRINT => 2645
            case KEYCODE_CHAT => 2646
            case KEYCODE_FINANCE => 2647
            case KEYCODE_CANCEL => 2648
            case KEYCODE_KBDILLUM_TOGGLE => 2649
            case KEYCODE_KBDILLUM_DOWN => 2650
            case KEYCODE_KBDILLUM_UP => 2651
            case KEYCODE_SEND => 2652
            case KEYCODE_REPLY => 2653
            case KEYCODE_FORWARDMAIL => 2654
            case KEYCODE_SAVE => 2655
            case KEYCODE_DOCUMENTS => 2656
            case KEYCODE_VIDEO_NEXT => 2657
            case KEYCODE_VIDEO_PREV => 2658
            case KEYCODE_BRIGHTNESS_CYCLE => 2659
            case KEYCODE_BRIGHTNESS_ZERO => 2660
            case KEYCODE_DISPLAY_OFF => 2661
            case KEYCODE_BTN_MISC => 2662
            case KEYCODE_GOTO => 2663
            case KEYCODE_INFO => 2664
            case KEYCODE_PROGRAM => 2665
            case KEYCODE_PVR => 2666
            case KEYCODE_SUBTITLE => 2667
            case KEYCODE_FULL_SCREEN => 2668
            case KEYCODE_KEYBOARD => 2669
            case KEYCODE_ASPECT_RATIO => 2670
            case KEYCODE_PC => 2671
            case KEYCODE_TV => 2672
            case KEYCODE_TV2 => 2673
            case KEYCODE_VCR => 2674
            case KEYCODE_VCR2 => 2675
            case KEYCODE_SAT => 2676
            case KEYCODE_CD => 2677
            case KEYCODE_TAPE => 2678
            case KEYCODE_TUNER => 2679
            case KEYCODE_PLAYER => 2680
            case KEYCODE_DVD => 2681
            case KEYCODE_AUDIO => 2682
            case KEYCODE_VIDEO => 2683
            case KEYCODE_MEMO => 2684
            case KEYCODE_CALENDAR => 2685
            case KEYCODE_RED => 2686
            case KEYCODE_GREEN => 2687
            case KEYCODE_YELLOW => 2688
            case KEYCODE_BLUE => 2689
            case KEYCODE_CHANNELUP => 2690
            case KEYCODE_CHANNELDOWN => 2691
            case KEYCODE_LAST => 2692
            case KEYCODE_RESTART => 2693
            case KEYCODE_SLOW => 2694
            case KEYCODE_SHUFFLE => 2695
            case KEYCODE_VIDEOPHONE => 2696
            case KEYCODE_GAMES => 2697
            case KEYCODE_ZOOMIN => 2698
            case KEYCODE_ZOOMOUT => 2699
            case KEYCODE_ZOOMRESET => 2700
            case KEYCODE_WORDPROCESSOR => 2701
            case KEYCODE_EDITOR => 2702
            case KEYCODE_SPREADSHEET => 2703
            case KEYCODE_GRAPHICSEDITOR => 2704
            case KEYCODE_PRESENTATION => 2705
            case KEYCODE_DATABASE => 2706
            case KEYCODE_NEWS => 2707
            case KEYCODE_VOICEMAIL => 2708
            case KEYCODE_ADDRESSBOOK => 2709
            case KEYCODE_MESSENGER => 2710
            case KEYCODE_BRIGHTNESS_TOGGLE => 2711
            case KEYCODE_SPELLCHECK => 2712
            case KEYCODE_COFFEE => 2713
            case KEYCODE_MEDIA_REPEAT => 2714
            case KEYCODE_IMAGES => 2715
            case KEYCODE_BUTTONCONFIG => 2716
            case KEYCODE_TASKMANAGER => 2717
            case KEYCODE_JOURNAL => 2718
            case KEYCODE_CONTROLPANEL => 2719
            case KEYCODE_APPSELECT => 2720
            case KEYCODE_SCREENSAVER => 2721
            case KEYCODE_ASSISTANT => 2722
            case KEYCODE_KBD_LAYOUT_NEXT => 2723
            case KEYCODE_BRIGHTNESS_MIN => 2724
            case KEYCODE_BRIGHTNESS_MAX => 2725
            case KEYCODE_KBDINPUTASSIST_PREV => 2726
            case KEYCODE_KBDINPUTASSIST_NEXT => 2727
            case KEYCODE_KBDINPUTASSIST_PREVGROUP => 2728
            case KEYCODE_KBDINPUTASSIST_NEXTGROUP => 2729
            case KEYCODE_KBDINPUTASSIST_ACCEPT => 2730
            case KEYCODE_KBDINPUTASSIST_CANCEL => 2731
            case KEYCODE_FRONT => 2800
            case KEYCODE_SETUP => 2801
            case KEYCODE_WAKEUP => 2802
            case KEYCODE_SENDFILE => 2803
            case KEYCODE_DELETEFILE => 2804
            case KEYCODE_XFER => 2805
            case KEYCODE_PROG1 => 2806
            case KEYCODE_PROG2 => 2807
            case KEYCODE_MSDOS => 2808
            case KEYCODE_SCREENLOCK => 2809
            case KEYCODE_DIRECTION_ROTATE_DISPLAY => 2810
            case KEYCODE_CYCLEWINDOWS => 2811
            case KEYCODE_COMPUTER => 2812
            case KEYCODE_EJECTCLOSECD => 2813
            case KEYCODE_ISO => 2814
            case KEYCODE_MOVE => 2815
            case KEYCODE_F13 => 2816
            case KEYCODE_F14 => 2817
            case KEYCODE_F15 => 2818
            case KEYCODE_F16 => 2819
            case KEYCODE_F17 => 2820
            case KEYCODE_F18 => 2821
            case KEYCODE_F19 => 2822
            case KEYCODE_F20 => 2823
            case KEYCODE_F21 => 2824
            case KEYCODE_F22 => 2825
            case KEYCODE_F23 => 2826
            case KEYCODE_F24 => 2827
            case KEYCODE_PROG3 => 2828
            case KEYCODE_PROG4 => 2829
            case KEYCODE_DASHBOARD => 2830
            case KEYCODE_SUSPEND => 2831
            case KEYCODE_HP => 2832
            case KEYCODE_SOUND => 2833
            case KEYCODE_QUESTION => 2834
            case KEYCODE_CONNECT => 2836
            case KEYCODE_SPORT => 2837
            case KEYCODE_SHOP => 2838
            case KEYCODE_ALTERASE => 2839
            case KEYCODE_SWITCHVIDEOMODE => 2841
            case KEYCODE_BATTERY => 2842
            case KEYCODE_BLUETOOTH => 2843
            case KEYCODE_WLAN => 2844
            case KEYCODE_UWB => 2845
            case KEYCODE_WWAN_WIMAX => 2846
            case KEYCODE_RFKILL => 2847
            case KEYCODE_CHANNEL => 3001
            case KEYCODE_BTN_0 => 3100
            case KEYCODE_BTN_1 => 3101
            case KEYCODE_BTN_2 => 3102
            case KEYCODE_BTN_3 => 3103
            case KEYCODE_BTN_4 => 3104
            case KEYCODE_BTN_5 => 3105
            case KEYCODE_BTN_6 => 3106
            case KEYCODE_BTN_7 => 3107
            case KEYCODE_BTN_8 => 3108
            case KEYCODE_BTN_9 => 3109
            case KEYCODE_SEARCH => 9
            case KEYCODE_BUTTON_A => 2301
            case KEYCODE_BUTTON_B => 2302
            case KEYCODE_BUTTON_X => 2304
            case KEYCODE_BUTTON_Y => 2305
            case KEYCODE_BUTTON_L1 => 2307
            case KEYCODE_BUTTON_R1 => 2308
            case KEYCODE_BUTTON_L2 => 2309
            case KEYCODE_BUTTON_R2 => 2310
            case KEYCODE_BUTTON_SELECT => 2311
            case KEYCODE_BUTTON_START => 2312
            case KEYCODE_BUTTON_MODE => 2313
            case KEYCODE_BUTTON_THUMBL => 2314
            case KEYCODE_BUTTON_THUMBR => 2315
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    protected static func parse(val: Int32): KeyCode {
        match (val) {
            case 0 => KEYCODE_FN
            case -1 => KEYCODE_UNKNOWN
            case 1 => KEYCODE_HOME
            case 2 => KEYCODE_BACK
            case 10 => KEYCODE_MEDIA_PLAY_PAUSE
            case 11 => KEYCODE_MEDIA_STOP
            case 12 => KEYCODE_MEDIA_NEXT
            case 13 => KEYCODE_MEDIA_PREVIOUS
            case 14 => KEYCODE_MEDIA_REWIND
            case 15 => KEYCODE_MEDIA_FAST_FORWARD
            case 16 => KEYCODE_VOLUME_UP
            case 17 => KEYCODE_VOLUME_DOWN
            case 18 => KEYCODE_POWER
            case 19 => KEYCODE_CAMERA
            case 22 => KEYCODE_VOLUME_MUTE
            case 23 => KEYCODE_MUTE
            case 40 => KEYCODE_BRIGHTNESS_UP
            case 41 => KEYCODE_BRIGHTNESS_DOWN
            case 2000 => KEYCODE_0
            case 2001 => KEYCODE_1
            case 2002 => KEYCODE_2
            case 2003 => KEYCODE_3
            case 2004 => KEYCODE_4
            case 2005 => KEYCODE_5
            case 2006 => KEYCODE_6
            case 2007 => KEYCODE_7
            case 2008 => KEYCODE_8
            case 2009 => KEYCODE_9
            case 2010 => KEYCODE_STAR
            case 2011 => KEYCODE_POUND
            case 2012 => KEYCODE_DPAD_UP
            case 2013 => KEYCODE_DPAD_DOWN
            case 2014 => KEYCODE_DPAD_LEFT
            case 2015 => KEYCODE_DPAD_RIGHT
            case 2016 => KEYCODE_DPAD_CENTER
            case 2017 => KEYCODE_A
            case 2018 => KEYCODE_B
            case 2019 => KEYCODE_C
            case 2020 => KEYCODE_D
            case 2021 => KEYCODE_E
            case 2022 => KEYCODE_F
            case 2023 => KEYCODE_G
            case 2024 => KEYCODE_H
            case 2025 => KEYCODE_I
            case 2026 => KEYCODE_J
            case 2027 => KEYCODE_K
            case 2028 => KEYCODE_L
            case 2029 => KEYCODE_M
            case 2030 => KEYCODE_N
            case 2031 => KEYCODE_O
            case 2032 => KEYCODE_P
            case 2033 => KEYCODE_Q
            case 2034 => KEYCODE_R
            case 2035 => KEYCODE_S
            case 2036 => KEYCODE_T
            case 2037 => KEYCODE_U
            case 2038 => KEYCODE_V
            case 2039 => KEYCODE_W
            case 2040 => KEYCODE_X
            case 2041 => KEYCODE_Y
            case 2042 => KEYCODE_Z
            case 2043 => KEYCODE_COMMA
            case 2044 => KEYCODE_PERIOD
            case 2045 => KEYCODE_ALT_LEFT
            case 2046 => KEYCODE_ALT_RIGHT
            case 2047 => KEYCODE_SHIFT_LEFT
            case 2048 => KEYCODE_SHIFT_RIGHT
            case 2049 => KEYCODE_TAB
            case 2050 => KEYCODE_SPACE
            case 2051 => KEYCODE_SYM
            case 2052 => KEYCODE_EXPLORER
            case 2053 => KEYCODE_ENVELOPE
            case 2054 => KEYCODE_ENTER
            case 2055 => KEYCODE_DEL
            case 2056 => KEYCODE_GRAVE
            case 2057 => KEYCODE_MINUS
            case 2058 => KEYCODE_EQUALS
            case 2059 => KEYCODE_LEFT_BRACKET
            case 2060 => KEYCODE_RIGHT_BRACKET
            case 2061 => KEYCODE_BACKSLASH
            case 2062 => KEYCODE_SEMICOLON
            case 2063 => KEYCODE_APOSTROPHE
            case 2064 => KEYCODE_SLASH
            case 2065 => KEYCODE_AT
            case 2066 => KEYCODE_PLUS
            case 2067 => KEYCODE_MENU
            case 2068 => KEYCODE_PAGE_UP
            case 2069 => KEYCODE_PAGE_DOWN
            case 2070 => KEYCODE_ESCAPE
            case 2071 => KEYCODE_FORWARD_DEL
            case 2072 => KEYCODE_CTRL_LEFT
            case 2073 => KEYCODE_CTRL_RIGHT
            case 2074 => KEYCODE_CAPS_LOCK
            case 2075 => KEYCODE_SCROLL_LOCK
            case 2076 => KEYCODE_META_LEFT
            case 2077 => KEYCODE_META_RIGHT
            case 2078 => KEYCODE_FUNCTION
            case 2079 => KEYCODE_SYSRQ
            case 2080 => KEYCODE_BREAK
            case 2081 => KEYCODE_MOVE_HOME
            case 2082 => KEYCODE_MOVE_END
            case 2083 => KEYCODE_INSERT
            case 2084 => KEYCODE_FORWARD
            case 2085 => KEYCODE_MEDIA_PLAY
            case 2086 => KEYCODE_MEDIA_PAUSE
            case 2087 => KEYCODE_MEDIA_CLOSE
            case 2088 => KEYCODE_MEDIA_EJECT
            case 2089 => KEYCODE_MEDIA_RECORD
            case 2090 => KEYCODE_F1
            case 2091 => KEYCODE_F2
            case 2092 => KEYCODE_F3
            case 2093 => KEYCODE_F4
            case 2094 => KEYCODE_F5
            case 2095 => KEYCODE_F6
            case 2096 => KEYCODE_F7
            case 2097 => KEYCODE_F8
            case 2098 => KEYCODE_F9
            case 2099 => KEYCODE_F10
            case 2100 => KEYCODE_F11
            case 2101 => KEYCODE_F12
            case 2102 => KEYCODE_NUM_LOCK
            case 2103 => KEYCODE_NUMPAD_0
            case 2104 => KEYCODE_NUMPAD_1
            case 2105 => KEYCODE_NUMPAD_2
            case 2106 => KEYCODE_NUMPAD_3
            case 2107 => KEYCODE_NUMPAD_4
            case 2108 => KEYCODE_NUMPAD_5
            case 2109 => KEYCODE_NUMPAD_6
            case 2110 => KEYCODE_NUMPAD_7
            case 2111 => KEYCODE_NUMPAD_8
            case 2112 => KEYCODE_NUMPAD_9
            case 2113 => KEYCODE_NUMPAD_DIVIDE
            case 2114 => KEYCODE_NUMPAD_MULTIPLY
            case 2115 => KEYCODE_NUMPAD_SUBTRACT
            case 2116 => KEYCODE_NUMPAD_ADD
            case 2117 => KEYCODE_NUMPAD_DOT
            case 2118 => KEYCODE_NUMPAD_COMMA
            case 2119 => KEYCODE_NUMPAD_ENTER
            case 2120 => KEYCODE_NUMPAD_EQUALS
            case 2121 => KEYCODE_NUMPAD_LEFT_PAREN
            case 2122 => KEYCODE_NUMPAD_RIGHT_PAREN
            case 2210 => KEYCODE_VIRTUAL_MULTITASK
            case 2600 => KEYCODE_SLEEP
            case 2601 => KEYCODE_ZENKAKU_HANKAKU
            case 2602 => KEYCODE_102ND
            case 2603 => KEYCODE_RO
            case 2604 => KEYCODE_KATAKANA
            case 2605 => KEYCODE_HIRAGANA
            case 2606 => KEYCODE_HENKAN
            case 2607 => KEYCODE_KATAKANA_HIRAGANA
            case 2608 => KEYCODE_MUHENKAN
            case 2609 => KEYCODE_LINEFEED
            case 2610 => KEYCODE_MACRO
            case 2611 => KEYCODE_NUMPAD_PLUSMINUS
            case 2612 => KEYCODE_SCALE
            case 2613 => KEYCODE_HANGUEL
            case 2614 => KEYCODE_HANJA
            case 2615 => KEYCODE_YEN
            case 2616 => KEYCODE_STOP
            case 2617 => KEYCODE_AGAIN
            case 2618 => KEYCODE_PROPS
            case 2619 => KEYCODE_UNDO
            case 2620 => KEYCODE_COPY
            case 2621 => KEYCODE_OPEN
            case 2622 => KEYCODE_PASTE
            case 2623 => KEYCODE_FIND
            case 2624 => KEYCODE_CUT
            case 2625 => KEYCODE_HELP
            case 2626 => KEYCODE_CALC
            case 2627 => KEYCODE_FILE
            case 2628 => KEYCODE_BOOKMARKS
            case 2629 => KEYCODE_NEXT
            case 2630 => KEYCODE_PLAYPAUSE
            case 2631 => KEYCODE_PREVIOUS
            case 2632 => KEYCODE_STOPCD
            case 2634 => KEYCODE_CONFIG
            case 2635 => KEYCODE_REFRESH
            case 2636 => KEYCODE_EXIT
            case 2637 => KEYCODE_EDIT
            case 2638 => KEYCODE_SCROLLUP
            case 2639 => KEYCODE_SCROLLDOWN
            case 2640 => KEYCODE_NEW
            case 2641 => KEYCODE_REDO
            case 2642 => KEYCODE_CLOSE
            case 2643 => KEYCODE_PLAY
            case 2644 => KEYCODE_BASSBOOST
            case 2645 => KEYCODE_PRINT
            case 2646 => KEYCODE_CHAT
            case 2647 => KEYCODE_FINANCE
            case 2648 => KEYCODE_CANCEL
            case 2649 => KEYCODE_KBDILLUM_TOGGLE
            case 2650 => KEYCODE_KBDILLUM_DOWN
            case 2651 => KEYCODE_KBDILLUM_UP
            case 2652 => KEYCODE_SEND
            case 2653 => KEYCODE_REPLY
            case 2654 => KEYCODE_FORWARDMAIL
            case 2655 => KEYCODE_SAVE
            case 2656 => KEYCODE_DOCUMENTS
            case 2657 => KEYCODE_VIDEO_NEXT
            case 2658 => KEYCODE_VIDEO_PREV
            case 2659 => KEYCODE_BRIGHTNESS_CYCLE
            case 2660 => KEYCODE_BRIGHTNESS_ZERO
            case 2661 => KEYCODE_DISPLAY_OFF
            case 2662 => KEYCODE_BTN_MISC
            case 2663 => KEYCODE_GOTO
            case 2664 => KEYCODE_INFO
            case 2665 => KEYCODE_PROGRAM
            case 2666 => KEYCODE_PVR
            case 2667 => KEYCODE_SUBTITLE
            case 2668 => KEYCODE_FULL_SCREEN
            case 2669 => KEYCODE_KEYBOARD
            case 2670 => KEYCODE_ASPECT_RATIO
            case 2671 => KEYCODE_PC
            case 2672 => KEYCODE_TV
            case 2673 => KEYCODE_TV2
            case 2674 => KEYCODE_VCR
            case 2675 => KEYCODE_VCR2
            case 2676 => KEYCODE_SAT
            case 2677 => KEYCODE_CD
            case 2678 => KEYCODE_TAPE
            case 2679 => KEYCODE_TUNER
            case 2680 => KEYCODE_PLAYER
            case 2681 => KEYCODE_DVD
            case 2682 => KEYCODE_AUDIO
            case 2683 => KEYCODE_VIDEO
            case 2684 => KEYCODE_MEMO
            case 2685 => KEYCODE_CALENDAR
            case 2686 => KEYCODE_RED
            case 2687 => KEYCODE_GREEN
            case 2688 => KEYCODE_YELLOW
            case 2689 => KEYCODE_BLUE
            case 2690 => KEYCODE_CHANNELUP
            case 2691 => KEYCODE_CHANNELDOWN
            case 2692 => KEYCODE_LAST
            case 2693 => KEYCODE_RESTART
            case 2694 => KEYCODE_SLOW
            case 2695 => KEYCODE_SHUFFLE
            case 2696 => KEYCODE_VIDEOPHONE
            case 2697 => KEYCODE_GAMES
            case 2698 => KEYCODE_ZOOMIN
            case 2699 => KEYCODE_ZOOMOUT
            case 2700 => KEYCODE_ZOOMRESET
            case 2701 => KEYCODE_WORDPROCESSOR
            case 2702 => KEYCODE_EDITOR
            case 2703 => KEYCODE_SPREADSHEET
            case 2704 => KEYCODE_GRAPHICSEDITOR
            case 2705 => KEYCODE_PRESENTATION
            case 2706 => KEYCODE_DATABASE
            case 2707 => KEYCODE_NEWS
            case 2708 => KEYCODE_VOICEMAIL
            case 2709 => KEYCODE_ADDRESSBOOK
            case 2710 => KEYCODE_MESSENGER
            case 2711 => KEYCODE_BRIGHTNESS_TOGGLE
            case 2712 => KEYCODE_SPELLCHECK
            case 2713 => KEYCODE_COFFEE
            case 2714 => KEYCODE_MEDIA_REPEAT
            case 2715 => KEYCODE_IMAGES
            case 2716 => KEYCODE_BUTTONCONFIG
            case 2717 => KEYCODE_TASKMANAGER
            case 2718 => KEYCODE_JOURNAL
            case 2719 => KEYCODE_CONTROLPANEL
            case 2720 => KEYCODE_APPSELECT
            case 2721 => KEYCODE_SCREENSAVER
            case 2722 => KEYCODE_ASSISTANT
            case 2723 => KEYCODE_KBD_LAYOUT_NEXT
            case 2724 => KEYCODE_BRIGHTNESS_MIN
            case 2725 => KEYCODE_BRIGHTNESS_MAX
            case 2726 => KEYCODE_KBDINPUTASSIST_PREV
            case 2727 => KEYCODE_KBDINPUTASSIST_NEXT
            case 2728 => KEYCODE_KBDINPUTASSIST_PREVGROUP
            case 2729 => KEYCODE_KBDINPUTASSIST_NEXTGROUP
            case 2730 => KEYCODE_KBDINPUTASSIST_ACCEPT
            case 2731 => KEYCODE_KBDINPUTASSIST_CANCEL
            case 2800 => KEYCODE_FRONT
            case 2801 => KEYCODE_SETUP
            case 2802 => KEYCODE_WAKEUP
            case 2803 => KEYCODE_SENDFILE
            case 2804 => KEYCODE_DELETEFILE
            case 2805 => KEYCODE_XFER
            case 2806 => KEYCODE_PROG1
            case 2807 => KEYCODE_PROG2
            case 2808 => KEYCODE_MSDOS
            case 2809 => KEYCODE_SCREENLOCK
            case 2810 => KEYCODE_DIRECTION_ROTATE_DISPLAY
            case 2811 => KEYCODE_CYCLEWINDOWS
            case 2812 => KEYCODE_COMPUTER
            case 2813 => KEYCODE_EJECTCLOSECD
            case 2814 => KEYCODE_ISO
            case 2815 => KEYCODE_MOVE
            case 2816 => KEYCODE_F13
            case 2817 => KEYCODE_F14
            case 2818 => KEYCODE_F15
            case 2819 => KEYCODE_F16
            case 2820 => KEYCODE_F17
            case 2821 => KEYCODE_F18
            case 2822 => KEYCODE_F19
            case 2823 => KEYCODE_F20
            case 2824 => KEYCODE_F21
            case 2825 => KEYCODE_F22
            case 2826 => KEYCODE_F23
            case 2827 => KEYCODE_F24
            case 2828 => KEYCODE_PROG3
            case 2829 => KEYCODE_PROG4
            case 2830 => KEYCODE_DASHBOARD
            case 2831 => KEYCODE_SUSPEND
            case 2832 => KEYCODE_HP
            case 2833 => KEYCODE_SOUND
            case 2834 => KEYCODE_QUESTION
            case 2836 => KEYCODE_CONNECT
            case 2837 => KEYCODE_SPORT
            case 2838 => KEYCODE_SHOP
            case 2839 => KEYCODE_ALTERASE
            case 2841 => KEYCODE_SWITCHVIDEOMODE
            case 2842 => KEYCODE_BATTERY
            case 2843 => KEYCODE_BLUETOOTH
            case 2844 => KEYCODE_WLAN
            case 2845 => KEYCODE_UWB
            case 2846 => KEYCODE_WWAN_WIMAX
            case 2847 => KEYCODE_RFKILL
            case 3001 => KEYCODE_CHANNEL
            case 3100 => KEYCODE_BTN_0
            case 3101 => KEYCODE_BTN_1
            case 3102 => KEYCODE_BTN_2
            case 3103 => KEYCODE_BTN_3
            case 3104 => KEYCODE_BTN_4
            case 3105 => KEYCODE_BTN_5
            case 3106 => KEYCODE_BTN_6
            case 3107 => KEYCODE_BTN_7
            case 3108 => KEYCODE_BTN_8
            case 3109 => KEYCODE_BTN_9
            case 9 => KEYCODE_SEARCH
            case 2301 => KEYCODE_BUTTON_A
            case 2302 => KEYCODE_BUTTON_B
            case 2304 => KEYCODE_BUTTON_X
            case 2305 => KEYCODE_BUTTON_Y
            case 2307 => KEYCODE_BUTTON_L1
            case 2308 => KEYCODE_BUTTON_R1
            case 2309 => KEYCODE_BUTTON_L2
            case 2310 => KEYCODE_BUTTON_R2
            case 2311 => KEYCODE_BUTTON_SELECT
            case 2312 => KEYCODE_BUTTON_START
            case 2313 => KEYCODE_BUTTON_MODE
            case 2314 => KEYCODE_BUTTON_THUMBL
            case 2315 => KEYCODE_BUTTON_THUMBR
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    protected static func tryParse(val: ?Int32): ?KeyCode {
        match (val) {
            case Some(v) => parse(v)
            case None => None
        }
    }
}
