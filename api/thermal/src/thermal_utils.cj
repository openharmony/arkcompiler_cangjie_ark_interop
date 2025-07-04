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

package ohos.thermal

import std.deriving.Derive
import ohos.labels.*

/**
 * Enumerates the ThermalLevel types
 *
 * @relation enum ThermalLevel
 */
@Derive[ToString, Equatable]
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.ThermalManager"
]
public enum ThermalLevel {
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.ThermalManager"
    ]
    Cool
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.ThermalManager"
    ]
    Normal
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.ThermalManager"
    ]
    Warm
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.ThermalManager"
    ]
    Hot
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.ThermalManager"
    ]
    Overheated
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.ThermalManager"
    ]
    Warning
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.ThermalManager"
    ]
    Emergency
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.ThermalManager"
    ]
    Escape
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case Cool => 0i32
                case Normal => 1i32
                case Warm => 2i32
                case Hot => 3i32
                case Overheated => 4i32
                case Warning => 5i32
                case Emergency => 6i32
                case Escape => 7i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(level: Int32): ThermalLevel {
        match (level) {
            case 0i32 => Cool
            case 1i32 => Normal
            case 2i32 => Warm
            case 3i32 => Hot
            case 4i32 => Overheated
            case 5i32 => Warning
            case 6i32 => Emergency
            case 7i32 => Escape
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}
