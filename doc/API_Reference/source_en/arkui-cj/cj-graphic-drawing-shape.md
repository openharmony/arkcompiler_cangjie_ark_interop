# Shape

The parent component for drawing components, which describes the common properties supported by all drawing components.

1. Drawing components use Shape as their parent component to achieve SVG-like effects.

2. Drawing components can be used independently to draw specified graphics on the page.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

Includes [Rect](./cj-graphic-drawing-rect.md), [Circle](./cj-graphic-drawing-circle.md), [Ellipse](./cj-graphic-drawing-ellipse.md), [Image](./cj-image-video-image.md), [Text](./cj-text-input-text.md), [Column](./cj-row-column-stack-column.md), [Row](./cj-row-column-stack-row.md), and Shape child components.

## Creating Components

### init(() -> Unit)

```cangjie
public init(child!: () -> Unit = { => })
```

**Function:** Creates a Shape drawing container and executes the `child` closure to declare its internal drawing child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| child | ()->Unit | No | { => } | **Named parameter.** Declares the child components supported within the Shape container. |

### init(PixelMap)

```cangjie
public init(value!: PixelMap)
```

**Function:** Creates a Shape based on the specified `PixelMap`, using the pixel map as the drawing content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap) | Yes | - | **Named parameter.** The drawing target. The graphics can be drawn on the specified PixelMap object. If not set, the drawing will be performed on the current drawing target. |

## Common Properties/Common Events

Common Properties: Supports common properties.

Common Events: Fully supported.

## Component Properties

### func mesh(Array\<Float64>, UInt32, UInt32)

```cangjie
public func mesh(array: Array<Float64>, column: UInt32, row: UInt32): This
```

**Function:** Sets mesh deformation data, defines a grid based on the given number of columns and rows, and uses a coordinate array to perform grid distortion/sampling transformation on the content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| array | Array\<Float64> | Yes | - | An array of length (column + 1) * (row + 1) * 2, which records the vertex positions of the distorted bitmap. The sequence of grid control point coordinates (arranged as [x0, y0, x1, y1, …]). |
| column | UInt32 | Yes | - | Number of grid columns. |
| row | UInt32 | Yes | - | Number of grid rows. |

### func viewPort(Length, Length, Length, Length)

```cangjie
public func viewPort(
    x!: Length = 0.vp,
    y!: Length = 0.vp,
    width!: Length = 0.vp,
    height!: Length = 0.vp
): This
```

**Function:** Sets the viewport of the Shape.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | **Named parameter.** The x-coordinate of the viewport starting point. |
| y | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | **Named parameter.** The y-coordinate of the viewport starting point. |
| width | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | **Named parameter.** The width of the viewport. |
| height | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | **Named parameter.** The height of the viewport. |

## Basic Type Definitions

### class ShapeComponent

```cangjie
public abstract class ShapeComponent <: ContainerBase {}
```

**Function:** The abstract base class for graphic drawing components, providing common drawing properties and capabilities such as fill, stroke, anti-aliasing, and dimensions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- [ContainerBase](./cj-ui-framework.md#containerbase)

#### func antiAlias(Bool)

```cangjie
public func antiAlias(value: Bool): This
```

**Function:** Enables or disables anti-aliasing rendering.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether to enable anti-aliasing (`true` to enable, `false` to disable). |

#### func fill(ResourceColor)

```cangjie
public func fill(value: ResourceColor): This
```

**Function:** Sets the fill color of the area (invalid values are handled as defaults).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | Fill color (supports resource colors/solid colors). |

#### func fillOpacity(Float64)

```cangjie
public func fillOpacity(value: Float64): This
```

**Function:** Sets the opacity of the fill area.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | - | Opacity value, range 0.0–1.0. |

#### func fillOpacity(AppResource)

```cangjie
public func fillOpacity(value: AppResource): This
```

**Function:** Sets the opacity of the fill area from a resource.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | Opacity resource. |

#### func stroke(ResourceColor)

```cangjie
public func stroke(value: ResourceColor): This
```

**Function:** Sets the stroke (border) color; defaults to no stroke if not set.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | Stroke color (supports resource colors/solid colors). |

#### func strokeDashArray(Array\<Length>)

```cangjie
public func strokeDashArray(value: Array<Length>): This
```

**Function:** Sets the dashed line style for the stroke (sequence of line segment and gap lengths).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Array\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)> | Yes | - | Array of lengths for the dashed pattern, where each element represents the length of a line segment or gap, supporting length units. |

#### func strokeDashOffset(Length)

```cangjie
public func strokeDashOffset(value: Length): This
```

**Function:** Sets the drawing offset for the starting position of the dashed line.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | Starting offset, supporting length units. |

#### func strokeLineCap(LineCapStyle)

```cangjie
public func strokeLineCap(value: LineCapStyle): This
```

**Function:** Sets the drawing style for the stroke endpoints.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [LineCapStyle](./cj-common-types.md#enum-linecapstyle) | Yes | - | Endpoint style (e.g., butt, round, square). |

#### func strokeLineJoin(LineJoinStyle)

```cangjie
public func strokeLineJoin(value: LineJoinStyle): This
```

**Function:** Sets the connection style for stroke corners.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [LineJoinStyle](./cj-common-types.md#enum-linejoinstyle) | Yes | - | Corner style (e.g., miter, round, bevel). |

#### func strokeMiterLimit(Float64)

```cangjie
public func strokeMiterLimit(miterLimit: Float64): This
```

**Function:** Sets the miter limit (maximum ratio of the length of the miter to the line width), effective only for miter corner styles.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| miterLimit | Float64 | Yes | - | Miter limit ratio. |

#### func strokeOpacity(Float64)

```cangjie
public func strokeOpacity(value: Float64): This
```

**Function:** Sets the opacity of the stroke.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | - | Opacity value, range 0.0–1.0. |

#### func strokeOpacity(AppResource)

```cangjie
public func strokeOpacity(value: AppResource): This
```

**Function:** Sets the opacity of the stroke from a resource.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [AppResource](<font color="red" face="bold">please add link</font>) | Yes | - | Opacity resource. |

#### func strokeWidth(Length)

```cangjie
public func strokeWidth(value: Length): This
```

**Function:** Sets the stroke (border) width, supporting length units.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | Stroke width (e.g., vp/px, etc.). |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(10) {
            Text("basic")
                .fontSize(11)
                .fontColor(0xCCCCCC)
                .width(320)
            Shape() {
                Rect()
                    .width(300)
                    .height(50)
                Ellipse()
                    .width(300)
                    .height(50)
                    .offset(x: 0, y: 60)
                Path()
                    .width(300)
                    .height(10)
                    .commands("M0 0 L900 0")
                    .offset(x: 0, y: 120)
            }
            .width(350)
            .height(140)
            .viewPort(x: -2, y: -2, width: 304, height: 130)
            .fill(0x317AF7)
            .stroke(Color.Black)
            .strokeWidth(4)
            .strokeDashArray([20])```markdown
            .strokeDashOffset(10)
            .strokeLineCap(LineCapStyle.Round)
            .strokeLineJoin(LineJoinStyle.Round)
            .antiAlias(true)
            // Draw a 300*50 rectangle with border at points (0,0) and (-5,-5) of Shape. The reason for setting negative viewport coordinates is that the default drawing start point is at the midpoint of the stroke width, so viewport needs to offset by half stroke width to fully display the border
            Shape() {
                Rect()
                    .width(300)
                    .height(50)
            }
            .width(350)
            .height(80)
            .viewPort(x: 0, y: 0, width: 320, height: 70)
            .fill(0x317AF7)
            .stroke(Color.Black)
            .strokeWidth(10)

            Shape() {
                Rect()
                    .width(300)
                    .height(50)
            }
            .width(350)
            .height(80)
            .viewPort(x: -5, y: -5, width: 320, height: 70)
            .fill(0x317AF7)
            .stroke(Color.Black)
            .strokeWidth(10)

            Text("path")
                .fontSize(11)
                .fontColor(0xCCCCCC)
                .width(320)
            // Draw a straight path at point (0,-5) of Shape with color 0xEE8443, stroke width 10, and dash gap 20
            Shape() {
                Path()
                    .width(300)
                    .height(10)
                    .commands("M0 0 L900 0")
            }
            .width(350)
            .height(20)
            .viewPort(x: 0, y: -5, width: 300, height: 20)
            .stroke(0xEE8443)
            .strokeWidth(10)
            .strokeDashArray([20])
            // Draw a straight path at point (0,-5) of Shape with color 0xEE8443, stroke width 10, dash gap 20, and left offset 10
            Shape() {
                Path()
                    .width(300)
                    .height(10)
                    .commands("M0 0 L900 0")
            }
            .width(350)
            .height(20)
            .viewPort(x: 0, y: -5, width: 300, height: 20)
            .stroke(0xEE8443)
            .strokeWidth(10)
            .strokeDashArray([20])
            .strokeDashOffset(10)
            // Draw a straight path at point (0,-5) of Shape with color 0xEE8443, stroke width 10, and opacity 0.5
            Shape() {
                Path()
                    .width(300)
                    .height(10)
                    .commands("M0 0 L900 0")
            }
            .width(350)
            .height(20)
            .viewPort(x: 0, y: -5, width: 300, height: 20)
            .stroke(0xEE8443)
            .strokeWidth(10)
            .strokeOpacity(0.5)
            // Draw a straight path at point (0,-5) of Shape with color 0xEE8443, stroke width 10, dash gap 20, and rounded line ends
            Shape() {
                Path()
                    .width(300)
                    .height(10)
                    .commands("M0 0 L900 0")
            }
            .width(350)
            .height(20)
            .viewPort(x: 0, y: -5, width: 300, height: 20)
            .stroke(0xEE8443)
            .strokeWidth(10)
            .strokeDashArray([20])
            .strokeLineCap(LineCapStyle.Round)
            // Draw a closed path at point (-20,-5) of Shape with fill color 0x317AF7, stroke width 10, border color 0xEE8443, and sharp corners (default)
            Shape() {
                Path()
                    .width(200)
                    .height(60)
                    .commands("M0 0 L400 0 L400 150 Z")
            }
            .width(300)
            .height(200)
            .viewPort(x: -20, y: -5, width: 310, height: 90)
            .fill(0x317AF7)
            .stroke(0xEE8443)
            .strokeWidth(10)
            .strokeLineJoin(LineJoinStyle.Miter)
            .strokeMiterLimit(5)
        }.width(100.percent).margin(top: 15)
    }
}
```

![shape2](./figures/shape2.png)
```