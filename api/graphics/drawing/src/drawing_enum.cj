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

package ohos.graphics.drawing

import ohos.labels.*

/**
 * Enumerate blending modes for colors.
 * Blend is a operation that use 4 components(red, green, blue, alpha) to generate
 * a new color from two colors(source, destination).
 *
 * @relation enum BlendMode
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum BlendMode {
    /**
     * Disable 4 regions(red, green, blue, alpha)
     *
     * @relation CLEAR = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Clear
    /**
     * Use components of the source
     *
     * @relation SRC = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Src
    /**
     * Use components of the destination
     *
     * @relation DST = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Dst
    /**
     * The source is placed above the destination.
     *
     * @relation SRC_OVER = 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    SrcOver
    /**
     * The Destination is placed above the source.
     *
     * @relation DST_OVER = 4,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    DstOver
    /**
     * Use source replaces the destination, and will not exceed the boundaries of the destination
     *
     * @relation SRC_IN = 5,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    SrcIn
    /**
     * Use destination, and will not exceed the boundaries of the source
     *
     * @relation DST_IN = 6,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    DstIn
    /**
     * Source is use in outside of the boundaries of the destination.
     *
     * @relation SRC_OUT = 7,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    SrcOut
    /**
     * Destination is use in outside of the boundaries of the source.
     *
     * @relation DST_OUT = 8,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    DstOut
    /**
     * Source which overlaps the destination will replaces the destination.
     *
     * @relation SRC_ATOP = 9,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    SrcAtop
    /**
     * Destination which overlaps the source will replaces the source.
     *
     * @relation DST_ATOP = 10,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    DstAtop
    /**
     * Combine regions where source and destination do not overlap.
     *
     * @relation XOR = 11,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Xor
    /**
     * The sum of the source and destination.
     *
     * @relation PLUS = 12,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Plus
    /**
     * All components are multiplied.
     *
     * @relation MODULATE = 13,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Modulate
    /**
     * Multiply the complement values of the background and source color values,
     * and then complement the result.
     *
     * @relation SCREEN = 14,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Screen
    /**
     * Multiplies or screens the colors, depending on destination
     *
     * @relation OVERLAY = 15,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Overlay
    /**
     * Choose a darker background and source color.
     *
     * @relation DARKEN = 16,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Darken
    /**
     * Choose a lighter background and source color.
     *
     * @relation LIGHTEN = 17,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Lighten
    /**
     * Brightens destination color to reflect the source color.
     *
     * @relation COLOR_DODGE = 18,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    ColorDodge
    /**
     * Darkens destination color to reflect the source color.
     *
     * @relation COLOR_BURN = 19,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    ColorBurn
    /**
     * Multiplies or screens the colors, depending on source
     *
     * @relation HARD_LIGHT = 20,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    HardLight
    /**
     * Lightens or Darkens the colors, depending on the source.
     *
     * @relation SOFT_LIGHT = 21,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    SoftLight
    /**
     * Subtract the darker of the two colors from the brighter color.
     *
     * @relation DIFFERENCE = 22,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Difference
    /**
     * Produces an effect similar to difference mode, but with lower contrast.
     *
     * @relation EXCLUSION = 23,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Exclusion
    /**
     * Multiply the source color by the destination color and replace the destination.
     *
     * @relation MULTIPLY = 24,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Multiply
    /**
     * Use the hue of the source and the saturation and brightness of the destination.
     *
     * @relation HUE = 25,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Hue
    /**
     * Use the saturation of the source and the hue and brightness of the destination.
     *
     * @relation SATURATION = 26,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Saturation
    /**
     * Use the hue and saturation of the source and the brightness of the destination.
     *
     * @relation COLOR = 27,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Color
    /**
     * Use the brightness of the source and the hue and saturation of the destination.
     *
     * @relation LUMINOSITY = 28,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Luminosity
    | ...
}

/**
 * Enumerates direction for adding closed contours.
 *
 * @relation enum PathDirection
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum PathDirection {
    /**
     * Clockwise direction for adding closed contours.
     *
     * @relation CLOCKWISE = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Clockwise
    /**
     * Counter-clockwise direction for adding closed contours.
     *
     * @relation COUNTER_CLOCKWISE = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    CounterClockwise
    | ...
}

/**
 * Enumerates fill type of path.
 *
 * @relation enum PathFillType
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum PathFillType {
    /**
     * Specifies that "inside" is computed by a non-zero sum of signed edge crossings.
     *
     * @relation WINDING = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Winding
    /**
     * Specifies that "inside" is computed by an odd number of edge crossings.
     *
     * @relation EVEN_ODD = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    EvenOdd
    /**
     * Same as winding, but draws outside of the path, rather than inside.
     *
     * @relation INVERSE_WINDING = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    InverseWinding
    /**
     * Same as evenOdd, but draws outside of the path, rather than inside.
     *
     * @relation INVERSE_EVEN_ODD = 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    InverseEvenOdd
    | ...
}

/**
 * Enumerate path measure flags for matrix.
 *
 * @relation enum PathMeasureMatrixFlags
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum PathMeasureMatrixFlags {
    /**
     * Gets position.
     *
     * @relation GET_POSITION_MATRIX = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    GetPositionMatrix
    /**
     * Gets tangent.
     *
     * @relation GET_TANGENT_MATRIX = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    GetTangentMatrix
    /**
     * Gets both position and tangent.
     *
     * @relation GET_POSITION_AND_TANGENT_MATRIX = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    GetPositionAndTangentMatrix
    | ...
}

/**
 * Enumerates of operations when two paths are combined.
 *
 * @relation enum PathOp
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum PathOp {
    /**
     * Difference operation.
     *
     * @relation DIFFERENCE = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Difference
    /**
     * Intersect operation.
     *
     * @relation INTERSECT = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Intersect
    /**
     * Union operation.
     *
     * @relation UNION = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Union
    /**
     * Xor operation.
     *
     * @relation XOR = 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Xor
    /**
     * Reverse difference operation.
     *
     * @relation REVERSE_DIFFERENCE = 4,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    ReverseDifference
    | ...
}

/**
 * Enumerates of types of operation for the path.
 *
 * @relation enum PathIteratorVerb
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum PathIteratorVerb {
    /**
     * Move operation.
     *
     * @relation MOVE = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Move
    /**
     * Line operation.
     *
     * @relation LINE = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Line
    /**
     * Quad operation.
     *
     * @relation QUAD = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Quad
    /**
     * Conic operation.
     *
     * @relation CONIC = 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Conic
    /**
     * Cubic operation.
     *
     * @relation CUBIC = 4,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Cubic
    /**
     * Close operation.
     *
     * @relation CLOSE = 5,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Close
    /**
     * There are no more operations in the path.
     *
     * @relation DONE = CLOSE + 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Done
    | ...
}

/**
 * Enumerates of scale to fit flags, selects if an array of points are drawn as discrete points,
 * as lines, or as an open polygon.
 *
 * @relation enum PointMode
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum PointMode {
    /**
     * Draws each point separately.
     *
     * @relation POINTS = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Points
    /**
     * Draws each pair of points as a line segment.
     *
     * @relation LINES = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Lines
    /**
     * Draws the array of points as a open polygon.
     *
     * @relation POLYGON = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Polygon
    | ...
}

/**
 * Enumerates storage filter mode.
 *
 * @relation enum FilterMode
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum FilterMode {
    /**
     * Single sample point (nearest neighbor).
     *
     * @relation FILTER_MODE_NEAREST = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    FilterModeNearest
    /**
     * Interpolate between 2x2 sample points (bilinear interpolation).
     *
     * @relation FILTER_MODE_LINEAR = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    FilterModeLinear
    | ...
}

/**
 * Enumerates storage filter mode.
 *
 * @relation enum ShadowFlag
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum ShadowFlag {
    /**
     * Use no shadow flags.
     *
     * @relation NONE = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    None
    /**
     * The occluding object is transparent.
     *
     * @relation TRANSPARENT_OCCLUDER = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    TransparentOccluder
    /**
     * No need to analyze shadows.
     *
     * @relation GEOMETRIC_ONLY = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    GeometricOnly
    /**
     * Use all shadow flags.
     *
     * @relation ALL = 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    All
    | ...
}

/**
 * Enumerates clip operations.
 *
 * @relation enum ClipOp
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum ClipOp {
    /**
     * Clips with difference.
     *
     * @relation DIFFERENCE = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Difference
    /**
     * Clips with intersection.
     *
     * @relation INTERSECT = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Intersect
    | ...
}

/**
 * Encoding type of the description text.
 *
 * @relation enum TextEncoding
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum TextEncoding {
    /**
     * Use 1 byte to represent UTF-8 or ASCII
     *
     * @relation TEXT_ENCODING_UTF8 = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    TextEncodingUTF8
    /**
     * Use 2 bytes to represent most of unicode
     *
     * @relation TEXT_ENCODING_UTF16 = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    TextEncodingUTF16
    /**
     * Use 4 bytes to represent all unicode.
     *
     * @relation TEXT_ENCODING_UTF32 = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    TextEncodingUTF32
    /**
     * Use 2 bytes to represent the glyph index.
     *
     * @relation TEXT_ENCODING_GLYPH_ID = 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    TextEncodingGlyphId
    | ...
}

/**
 * Enumerates text edging types.
 *
 * @relation enum FontEdging
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum FontEdging {
    /**
     * Uses anti aliasing, default value.
     *
     * @relation ALIAS = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Alias
    /**
     * Uses sub-pixel anti aliasing.
     *
     * @relation ANTI_ALIAS = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    AntiAlias
    /**
     * Uses sub-pixel anti aliasing and enable sub-pixel localization.
     *
     * @relation SUBPIXEL_ANTI_ALIAS = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    SbupixelAntiAlias
    | ...
}

/**
 * Enumerates text hinting types.
 *
 * @relation enum FontHinting
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum FontHinting {
    /**
     * Not use text hinting.
     *
     * @relation NONE = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    None
    /**
     * Uses slight text hinting.
     *
     * @relation SLIGHT = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Slight
    /**
     * Uses normal text hinting.
     *
     * @relation NORMAL = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Normal
    /**
     * Uses full text hinting.
     *
     * @relation FULL = 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Full
    | ...
}

/**
 * Indicate when certain metrics are valid; the underline or strikeout metrics may be valid and zero.
 * Fonts with embedded bitmaps may not have valid underline or strikeout metrics.
 *
 * @relation enum FontMetricsFlags
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum FontMetricsFlags {
    /**
     * Set if underlineThickness of FontMetrics is valid.
     *
     * @relation UNDERLINE_THICKNESS_VALID = 1 << 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    UnderlineThicknessValid
    /**
     * Set if underlinePosition of FontMetrics is valid.
     *
     * @relation UNDERLINE_POSITION_VALID = 1 << 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    UnderlinePositionValid
    /**
     * Set if strikethroughThickness of FontMetrics is valid.
     *
     * @relation STRIKETHROUGH_THICKNESS_VALID = 1 << 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    StrikethroughThicknessValid
    /**
     * Set if strikethroughPosition of FontMetrics is valid.
     *
     * @relation STRIKETHROUGH_POSITION_VALID = 1 << 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    StrikethroughPositionValid
    /**
     * set if top, bottom, xMin, xMax of FontMetrics invalid.
     *
     * @relation BOUNDS_INVALID = 1 << 4,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    BoundsInvalid
    | ...
}

/**
 * Enumerate rect types. Optional setting per rectangular grid entry to make it transparent,
 * or to fill the grid entry with a color. only used in Lattice.
 *
 * @relation enum RectType
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum RectType {
    /**
     * Draws image into lattice rect.
     *
     * @relation DEFAULT = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Default
    /**
     * Skips lattice rect by making it transparent.
     *
     * @relation TRANSPARENT = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Transparent
    /**
     * Draws one of fColors into lattice rect.
     *
     * @relation FIXEDCOLOR = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Fixedcolor
    | ...
}

/**
 * How to transform path at each point (based on the current position and tangent).
 *
 * @relation enum PathDashStyle
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum PathDashStyle {
    /**
     * Translate the shape to each position.
     *
     * @relation TRANSLATE = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Translate
    /**
     * Rotate the shape about its center.
     *
     * @relation ROTATE = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Rotate
    /**
     * Transform each point, and turn lines into curves.
     *
     * @relation MORPH = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Morph
    | ...
}

/**
 * Enumerates tile modes that describe an image or texture.
 *
 * @relation enum TileMode
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum TileMode {
    /**
     * Replicate the edge color if the shader effect draws outside of its original bounds.
     *
     * @relation CLAMP = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Clamp
    /**
     * Repeat the shader effect image horizontally and vertically.
     *
     * @relation REPEAT = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Repeat
    /**
     * Repeat the shader effect image horizontally and vertically, alternating mirror images
     *
     * @relation MIRROR = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Mirror
    /**
     * Only draw within the original domain, return transparent-black everywhere else.
     *
     * @relation DECAL = 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Decal
    | ...
}

/**
 * Enumerate join styles. The join style defines the shape of the joins of a
 * polyline segment drawn by the pen.
 *
 * @relation enum JoinStyle
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum JoinStyle {
    /**
     * Miter corner. If the angle of a polyline is small, its miter length may be inappropriate.
     * In this case, you need to use the miter limit to limit the miter length.
     *
     * @relation MITER_JOIN = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    MiterJoin
    /**
     * Round corner.
     *
     * @relation ROUND_JOIN = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    RoundJoin
    /**
     * Bevel corner.
     *
     * @relation BEVEL_JOIN = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    BevelJoin
    | ...
}

/**
 * Enumerates cap styles of a pen. The cap style defines
 * the style of both ends of a segment drawn by the pen.
 *
 * @relation enum CapStyle
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum CapStyle {
    /**
     * No cap style. Both ends of the segment are cut off square.
     *
     * @relation FLAT_CAP = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    FlapCap
    /**
     * Square cap style. Both ends have a square, the height of which
     * is half of the width of the segment, with the same width.
     *
     * @relation SQUARE_CAP = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    SquareCap
    /**
     * Round cap style. Both ends have a semicircle centered, the diameter of which
     * is the same as the width of the segment.
     *
     * @relation ROUND_CAP = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    RoundCap
    | ...
}

/**
 * Enumerates blur type.
 *
 * @relation enum BlurType
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum BlurType {
    /**
     * Fuzzy inside and outside.
     *
     * @relation NORMAL = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Normal
    /**
     * Solid inside, fuzzy outside.
     *
     * @relation SOLID = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Solid
    /**
     * Nothing inside, fuzzy outside.
     *
     * @relation OUTER = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Outer
    /**
     * Fuzzy inside, nothing outside.
     *
     * @relation INNER = 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Inner
    | ...
}

/**
 * Describes a scale-to-fit values.
 *
 * @relation enum ScaleToFit
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum ScaleToFit {
    /**
     * Scales in x and y to fill destination Rect.
     *
     * @relation FILL_SCALE_TO_FIT = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    FillScaleToFit
    /**
     * Scales and aligns to left and top.
     *
     * @relation START_SCALE_TO_FIT = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    StartScaleToFit
    /**
     * Scales and aligns to center.
     *
     * @relation CENTER_SCALE_TO_FIT = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    CenterScaleToFit
    /**
     * Scales and aligns to right and bottom.
     *
     * @relation END_SCALE_TO_FIT = 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    EndScaleToFit
    | ...
}

/**
 * Enumerates of operations when two regions are combined.
 *
 * @relation enum RegionOp
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum RegionOp {
    /**
     * Difference operation.
     *
     * @relation DIFFERENCE = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Difference
    /**
     * Intersect operation.
     *
     * @relation INTERSECT = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Intersect
    /**
     * Union operation.
     *
     * @relation UNION = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Union
    /**
     * Xor operation.
     *
     * @relation XOR = 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Xor
    /**
     * Reverse difference operation.
     *
     * @relation REVERSE_DIFFERENCE = 4,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    ReverseDifference
    /**
     * Replace operation.
     *
     * @relation REPLACE = 5,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Replace
    | ...
}

/**
 * Enumerates of corner radius position.
 *
 * @relation enum CornerPos
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum CornerPos {
    /**
     * Index of top-left corner radius.
     *
     * @relation TOP_LEFT_POS = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    TopLeftPos
    /**
     * Index of top-right corner radius.
     *
     * @relation TOP_RIGHT_POS = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    TopRightPos
    /**
     * Index of bottom-right corner radius.
     *
     * @relation BOTTOM_RIGHT_POS = 2,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    BottomRightPos
    /**
     * Index of bottom-left corner radius.
     *
     * @relation BOTTOM_LEFT_POS = 3,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    BottomLeftPos
    | ...
}

/**
 * Enumeration defines the constraint type.
 *
 * @relation enum SrcRectConstraint
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphics.Drawing"
]
public enum SrcRectConstraint {
    /**
     * Using sampling only inside bounds in a slower manner.
     *
     * @relation STRICT = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Strict
    /**
     * Using sampling outside bounds in a faster manner.
     *
     * @relation FAST = 1,
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphics.Drawing"
    ]
    Fast
    | ...
}
