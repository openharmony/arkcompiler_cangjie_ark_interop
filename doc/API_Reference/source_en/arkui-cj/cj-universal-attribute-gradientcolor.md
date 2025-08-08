# Color Gradient

Set color gradient effects for components.

> **Note:**
>
> - Color gradients are part of the component content and are drawn above the background.
> - Color gradients do not support explicit width/height animations. When width/height animations are executed, the color gradient will directly transition to the endpoint.

## func linearGradient(Option\<Float64>, GradientDirection, Array\<(Color,Float64)>, Bool)

```cangjie
public func linearGradient(
    angle!: Option<Float64> = None,
    direction!: GradientDirection = Bottom,
    colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
    repeating!: Bool = false
): This
```

**Function:** Sets a linear gradient.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| angle | Option\<Float64> | No | None | **Named parameter.** The starting angle of the linear gradient. Positive angles are measured clockwise from the 0-degree direction. |
| direction | [GradientDirection](./cj-common-types.md#enum-gradientdirection) | No | GradientDirection.Bottom | **Named parameter.** The direction of the linear gradient. This parameter becomes ineffective when angle is set. |
| colors | Array\<([Color](./cj-common-types.md#class-color),Float64)> | No | [(Color.TRANSPARENT, 0.0)] | **Named parameter.** An array specifying gradient colors and their corresponding percentage positions. Invalid colors will be skipped. |
| repeating | Bool | No | false | **Named parameter.** Repeats the gradient colors. |

## func sweepGradient((Length,Length), Float64, Float64, Float64, Array\<(Color,Float64)>, Bool)

```cangjie
public func sweepGradient(
    center: (Length, Length),
    start!: Float64 = 0.0,
    end!: Float64 = 0.0,
    rotation!: Float64 = 0.0,
    colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
    repeating!: Bool = false
): This
```

**Function:** Sets an angular gradient.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| center | ([Length](./cj-common-types.md#interface-length),[Length](./cj-common-types.md#interface-length)) | Yes | - | The center point of the angular gradient, i.e., the coordinates relative to the top-left corner of the current component. |
| start | Float64 | No | 0.0 | **Named parameter.** The starting point of the angular gradient. |
| end | Float64 | No | 0.0 | **Named parameter.** The ending point of the angular gradient. |
| rotation | Float64 | No | 0.0 | **Named parameter.** The rotation angle of the angular gradient. |
| colors | Array\<([Color](./cj-common-types.md#class-color),Float64)> | No | [(Color.TRANSPARENT, 0.0)] | **Named parameter.** An array specifying gradient colors and their corresponding percentage positions. Invalid colors will be skipped. |
| repeating | Bool | No | false | **Named parameter.** Repeats the gradient colors. |

> **Note:**
>
> When start, end, or rotation is set to a value less than 0, it will be treated as 0. When set to a value greater than 360, it will be treated as 360.

## func radialGradient((Length,Length), Float64, Array\<(Color,Float64)>, Bool)

```cangjie
public func radialGradient(
    center: (Length, Length),
    radius: Float64,
    colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
    repeating!: Bool = false
): This
```

**Function:** Sets a radial gradient.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| center | ([Length](./cj-common-types.md#interface-length),[Length](./cj-common-types.md#interface-length)) | Yes | - | The center point of the angular gradient, i.e., the coordinates relative to the top-left corner of the current component. |
| radius | Float64 | Yes | - | The radius of the radial gradient.<br>Range: \[0.0,+∞).<br> **Note:** <br> Values less than 0 will be treated as 0. Default: 0.0. |
| colors | Array\<([Color](./cj-common-types.md#class-color), Float64)> | No | [(Color.TRANSPARENT, 0.0)] | **Named parameter.** An array specifying gradient colors and their corresponding percentage positions. Invalid colors will be skipped. |
| repeating | Bool | No | false | **Named parameter.** Repeats the gradient colors. |

## func radialGradient((Length,Length), Length, Array\<(Color,Float64)>, Bool)

```cangjie
public func radialGradient(
    center: (Length, Length),
    radius: Length,
    colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
    repeating!: Bool = false
): This
```

**Function:** Sets a radial gradient.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| center | ([Length](./cj-common-types.md#interface-length), Length) | Yes | - | The center point of the angular gradient, i.e., the coordinates relative to the top-left corner of the current component. |
| radius | [Length](./cj-common-types.md#interface-length) | Yes | - | The radius of the radial gradient.<br>Range: \[0.0,+∞).<br>Note: Values less than 0.0 will be treated as 0.0. Default: 0.0.vp. |
| colors | Array\<([Color](./cj-common-types.md#class-color), Float64)> | No | [(Color.TRANSPARENT, 0.0)] | **Named parameter.** An array specifying gradient colors and their corresponding percentage positions. Invalid colors will be skipped. |
| repeating | Bool | No | false | **Named parameter.** Repeats the gradient colors. |

> **Note:**
>
> - Constraints for the colors parameter:
> - Color represents the fill color, and Float64 represents the position of the specified color, ranging from [0,1.0], where 0 represents the start of the gradient container and 1.0 represents the end. To achieve a multi-color gradient effect, the Float64 parameters in the array should be set in ascending order. If a subsequent Float64 parameter is smaller than the previous one, it will be treated as equal to the previous value.

## Example Code

### Example 1 (Linear Gradient from Right to Left)

This example demonstrates a linear gradient effect for a component using linearGradient.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Text("linearGradient")
                .fontSize(24.px)
                .width(90.percent)
                .fontColor(Color(0xCCCCCC))
            Row()
                .width(100.percent)
                .height(100.px)
                .linearGradient(
                    angle: 90.0,
                    colors: [(Color(0x0000ff), 0.0), (Color(0xff0000), 0.3), (Color(0xffff00), 1.0)],
                    repeating: false
                )

            Text("linearGradient Repeat")
                .fontSize(24.px)
                .width(90.percent)
                .fontColor(Color(0xCCCCCC))
            Row()
                .width(100.percent)
                .height(100.px)
                .linearGradient(
                    colors: [(Color(0x0000ff), 0.0), (Color(0xff0000), 0.3), (Color(0xffff00), 0.5)],
                    direction: GradientDirection.Left,
                    repeating: true
                )
        }
    }
}
```

![gradientColor1](figures/gradientColor1.png)

### Example 2 (Angular Gradient with Rotation)

This example demonstrates an angular gradient effect for a component using sweepGradient.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Text("sweepGradient")
                .fontSize(24.px)
                .width(30.percent)
                .fontColor(Color(0xCCCCCC))
            Row()
                .width(200.px)
                .height(200.px)
                .sweepGradient(
                    (100.0.px, 100.0.px),
                    start: 0.0,
                    end: 359.0,
                    colors: [(Color(0xff0000), 0.0), (Color(0x0000ff), 0.3), (Color(0xffff00), 1.0)],
                    repeating: false
                )

            Text("sweepGradient Reapeat")
                .fontSize(24.px)
                .width(30.percent)
                .fontColor(Color(0xCCCCCC))
            Row()
                .width(200.px)
                .height(200.px)
                .sweepGradient(
                    (100.0.px, 100.0.px),
                    start: 0.0,
                    end: 359.0,
                    rotation: 45.0,
                    colors: [(Color(0xff0000), 0.0), (Color(0x0000ff), 0.3), (Color(0xffff00), 0.5)],
                    repeating: true
                )
        }
    }
}
```

![gradientColor2](figures/gradientColor2.png)

### Example 3 (Radial Gradient)

This example demonstrates a radial gradient effect for a component using radialGradient.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Text("radialGradient")
                .fontSize(24.px)
                .width(30.percent)
                .fontColor(Color(0xCCCCCC))
            Row()
                .width(200.px)
                .height(200.px)
                .radialGradient(
                    (100.0.px, 100.0.px),
                    120.0,
                    colors: [(Color(0xff0000), 0.0), (Color(0x0000ff), 0.3), (Color(0xffff00), 1.0)]
                )

            Text("radialGradient Repeat")
                .fontSize(24.px)
                .width(30.percent)
                .fontColor(Color(0xCCCCCC))
            Row()
                .width(200.px)
                .height(200.px)
                .radialGradient(
                    (100.0.px, 100.0.px),
                    120.0,
                    colors: [(Color(0xff0000), 0.0), (Color(0x0000ff), 0.3), (Color(0xffff00), 0.5)],
                    repeating: true
                )
        }
    }
}
```

![gradientColor3](figures/gradientColor3.png)