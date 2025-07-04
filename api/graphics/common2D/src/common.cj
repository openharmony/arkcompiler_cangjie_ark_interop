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

package ohos.graphics.common2D

import ohos.labels.*

/**
 * Provide a description in the form of color ARGB.
 *
 * @relation interface Color
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public class Color {
    var alpha_: UInt8
    var red_: UInt8
    var green_: UInt8
    var blue_: UInt8

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public init(alpha: UInt8, red: UInt8, green: UInt8, blue: UInt8) {
        alpha_ = alpha
        red_ = red
        green_ = green
        blue_ = blue
    }

    /**
     * Alpha component of color, from 0 to 255.
     *
     * @relation alpha: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public mut prop alpha: UInt8 {
        get() {
            alpha_
        }
        set(value) {
            alpha_ = value
        }
    }

    /**
     * Red component of color, from 0 to 255.
     *
     * @relation red: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public mut prop red: UInt8 {
        get() {
            red_
        }
        set(value) {
            red_ = value
        }
    }

    /**
     * Green component of color, from 0 to 255.
     *
     * @relation green: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public mut prop green: UInt8 {
        get() {
            green_
        }
        set(value) {
            green_ = value
        }
    }

    /**
     * Blue component of color, from 0 to 255.
     *
     * @relation blue: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public mut prop blue: UInt8 {
        get() {
            blue_
        }
        set(value) {
            blue_ = value
        }
    }
}

/**
 * Provides the definition of the rectangle.
 *
 * @relation interface Rect
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public class Rect {
    var left_: Float32
    var top_: Float32
    var right_: Float32
    var bottom_: Float32

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public init(left: Float32, top: Float32, right: Float32, bottom: Float32) {
        left_ = left
        top_ = top
        right_ = right
        bottom_ = bottom
    }

    /**
     * Left Position of Rectangle.
     *
     * @relation left: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public mut prop left: Float32 {
        get() {
            left_
        }
        set(value) {
            left_ = value
        }
    }

    /**
     * Top side position of the rectangle
     *
     * @relation top: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public mut prop top: Float32 {
        get() {
            top_
        }
        set(value) {
            top_ = value
        }
    }

    /**
     * Right Position of Rectangle.
     *
     * @relation right: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public mut prop right: Float32 {
        get() {
            right_
        }
        set(value) {
            right_ = value
        }
    }

    /**
     * Position of the bottom side of the rectangle.
     *
     * @relation bottom: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public mut prop bottom: Float32 {
        get() {
            bottom_
        }
        set(value) {
            bottom_ = value
        }
    }
}

/**
 * Coordinates in the font layout.
 *
 * @relation interface Point
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public open class Point {
    var x_: Float32
    var y_: Float32

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public init(x: Float32, y: Float32) {
        x_ = x
        y_ = y
    }

    /**
     * X-axis coordinate.
     *
     * @relation x: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public mut prop x: Float32 {
        get() {
            x_
        }
        set(value) {
            x_ = value
        }
    }

    /**
     * Y-axis coordinate.
     *
     * @relation y: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public mut prop y: Float32 {
        get() {
            y_
        }
        set(value) {
            y_ = value
        }
    }
}

/**
 * Provides the definition of the point in 3D.
 *
 * @relation interface Point
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public class Point3d <: Point {
    var z_: Float32

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public init(x: Float32, y: Float32, z: Float32) {
        super(x, y)
        z_ = z
    }

    /**
     * Z-axis coordinate.
     *
     * @relation z: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    public mut prop z: Float32 {
        get() {
            z_
        }
        set(value) {
            z_ = value
        }
    }
}
