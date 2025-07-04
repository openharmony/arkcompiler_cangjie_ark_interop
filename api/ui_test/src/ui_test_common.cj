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

package ohos.ui_test

import ohos.labels.*
import ohos.base.*
import ohos.ffi.*
import std.convert.Parsable
import ohos.encoding.json.*
import std.convert.*
import ohos.system_parameter_enhance.*
import ohos.ability_delegator_registry.*
import ohos.ability.*

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public enum MatchPattern {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    EQUALS
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    CONTAINS
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    STARTS_WITH
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    ENDS_WITH
    | ...

    func getValue(): Int32 {
        match (this) {
            case EQUALS => 0
            case CONTAINS => 1
            case STARTS_WITH => 2
            case ENDS_WITH => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public enum DisplayRotation {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    ROTATION_0
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    ROTATION_90
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    ROTATION_180
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    ROTATION_270
    | ...

    func getValue(): Int32 {
        match (this) {
            case ROTATION_0 => 0
            case ROTATION_90 => 1
            case ROTATION_180 => 2
            case ROTATION_270 => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: String): DisplayRotation {
        match (val) {
            case "0" => ROTATION_0
            case "1" => ROTATION_90
            case "2" => ROTATION_180
            case "3" => ROTATION_270
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public enum WindowMode {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    FULLSCREEN
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    PRIMARY
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    SECONDARY
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    FLOATING
    | ...

    func getValue(): Int32 {
        match (this) {
            case FULLSCREEN => 0
            case PRIMARY => 1
            case SECONDARY => 2
            case FLOATING => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: String) {
        match (val) {
            case "0" => FULLSCREEN
            case "1" => PRIMARY
            case "2" => SECONDARY
            case "3" => FLOATING
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public enum ResizeDirection {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    LEFT
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    RIGHT
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    UP
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    DOWN
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    LEFT_UP
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    LEFT_DOWN
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    RIGHT_UP
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    RIGHT_DOWN
    | ...

    func getValue(): Int32 {
        match (this) {
            case LEFT => 0
            case RIGHT => 1
            case UP => 2
            case DOWN => 3
            case LEFT_UP => 4
            case LEFT_DOWN => 5
            case RIGHT_UP => 6
            case RIGHT_DOWN => 7
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public enum UiDirection {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    LEFT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    RIGHT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    UP
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    DOWN
    | ...

    func getValue(): Int32 {
        match (this) {
            case LEFT => 0
            case RIGHT => 1
            case UP => 2
            case DOWN => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public enum MouseButton {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    MOUSE_BUTTON_LEFT
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    MOUSE_BUTTON_RIGHT
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    MOUSE_BUTTON_MIDDLE
    | ...

    func getValue(): Int32 {
        match (this) {
            case MOUSE_BUTTON_LEFT => 0
            case MOUSE_BUTTON_RIGHT => 1
            case MOUSE_BUTTON_MIDDLE => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public class Point {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public Point(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let x: IntNative,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let y: IntNative
    ) {}

    init(jsonStr: String) {
        let jsonObj = JsonValue.fromStr(jsonStr).asObject()
        this.x = getNumberFromJsonObject(jsonObj, "x")
        this.y = getNumberFromJsonObject(jsonObj, "y")
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public class UIElementInfo {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public UIElementInfo(
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let bundleName: String,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let componentType: String,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let text: String
    ) {}

    init(cInfo: CUIElementInfo) {
        this.bundleName = cInfo.bundleName.toString()
        this.componentType = cInfo.componentType.toString()
        this.text = cInfo.text.toString()
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public class WindowFilter {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public WindowFilter(
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let bundleName!: ?String = None,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let title!: ?String = None,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let focused!: ?Bool = None,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let active!: ?Bool = None
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public class Rect {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public Rect(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let left: IntNative,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let top: IntNative,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let right: IntNative,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Test.UiTest"
        ]
        public let bottom: IntNative
    ) {}

    init(jsonStr: String) {
        let jsonObj = JsonValue.fromStr(jsonStr).asObject()
        this.left = getNumberFromJsonObject(jsonObj, "left")
        this.right = getNumberFromJsonObject(jsonObj, "right")
        this.top = getNumberFromJsonObject(jsonObj, "top")
        this.bottom = getNumberFromJsonObject(jsonObj, "bottom")
    }
}

func getNumberFromJsonObject(jsonObj: JsonObject, key: String): IntNative {
    if (let Some(num) <- jsonObj.get(key)) {
        IntNative(num.asInt().getValue())
    } else {
        throw Exception("getNumberFromJsonObject failed")
    }
}
