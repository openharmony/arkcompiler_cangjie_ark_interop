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

package ohos.multimedia.avcast_picker_param

import std.deriving.*
import ohos.labels.*

/**
 * Definition of av cast picker state.
 *
 * @relation enum AVCastPickerState
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.AVCast"
]
public enum AVCastPickerState {
    /**
     * The picker starts showing.
     *
     * @relation STATE_APPEARING
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    StateAppearing
    |
        /**
         * The picker finishes presenting.
         *
         * @relation STATE_DISAPPEARING
         */
        @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    StateDisappearing
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case StateAppearing => 0i32
                case StateDisappearing => 1i32
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/**
 * Definition of av cast picker style.
 *
 * @relation enum AVCastPickerState
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.AVCast"
]
public enum AVCastPickerStyle {
    /**
     * The picker shows in a panel style.
     *
     * @relation STYLE_PANEL
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    StylePanel
    |
        /**
         * The picker shows in a menu style.
         *
         * @relation STYLE_MENU
         */
        @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    StyleMenu
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case StylePanel => 0i32
                case StyleMenu => 1i32
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}
