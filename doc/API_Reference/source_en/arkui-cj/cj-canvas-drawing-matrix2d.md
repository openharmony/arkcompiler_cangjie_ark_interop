# Matrix2D

A matrix object capable of performing transformations such as scaling, rotation, and translation.

## Import Module

```cangjie
import kit.ArkUI.*
```

## class Matrix2D

```cangjie
public class Matrix2D {
    public init(unit!: LengthMetricsUnit = LengthMetricsUnit.DEFAULT)
}
```

**Function:** Matrix object type.

**Initial Version:** 21

### prop rotateX

```cangjie
public mut prop rotateX: Float64
```

**Function:** Horizontal skew coefficient.

**Type:** Float64

**Read/Write Permission:** Read-Write

**Initial Version:** 21

### prop rotateY

```cangjie
public mut prop rotateY: Float64
```

**Function:** Vertical skew coefficient.

**Type:** Float64

**Read/Write Permission:** Read-Write

**Initial Version:** 21

### prop scaleX

```cangjie
public mut prop scaleX: Float64
```

**Function:** Horizontal scaling coefficient.

**Type:** Float64

**Read/Write Permission:** Read-Write

**Initial Version:** 21

### prop scaleY

```cangjie
public mut prop scaleY: Float64
```

**Function:** Vertical scaling coefficient.

**Type:** Float64

**Read/Write Permission:** Read-Write

**Initial Version:** 21

### prop translateX

```cangjie
public mut prop translateX: Float64
```

**Function:** Horizontal translation distance. Default unit: vp.

**Type:** Float64

**Read/Write Permission:** Read-Write

**Initial Version:** 21

### prop translateY

```cangjie
public mut prop translateY: Float64
```

**Function:** Vertical translation distance. Default unit: vp.

**Type:** Float64

**Read/Write Permission:** Read-Write

**Initial Version:** 21

### init(LengthMetricsUnit)

```cangjie
public init(unit!: LengthMetricsUnit = LengthMetricsUnit.DEFAULT)
```

**Function:** Creates a Matrix2D type matrix object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| unit | [LengthMetricsUnit](./cj-common-types.md#enum-lengthmetricsunit) | No | LengthMetricsUnit.DEFAULT | **Named parameter.** Configures the unit mode of the Matrix2D object. Once configured, it cannot be dynamically changed. Configuration method is the same as [CanvasRenderingContext2D](./cj-canvas-drawing-canvasrenderingcontext2d.md#class-canvasrenderingcontext2d). |

### func identity()

```cangjie
public func identity(): This
```

**Function:** Creates an identity matrix.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

### func invert()

```cangjie
public func invert(): This
```

**Function:** Obtains the inverse matrix of the current matrix.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

### func rotate(Float64, Float64, Float64)

```cangjie
public func rotate(degree: Float64, rx!: Float64 = 0.0, ry!: Float64 = 0.0): This
```

**Function:** Performs a right-multiplication rotation operation on the current matrix centered at the rotation point.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| degree | Float64 | Yes | - | Rotation angle. Clockwise direction is positive. Convert degrees to radians via degree * Math.PI / 180. Default unit: radians. |
| rx | Float64 | No | 0.0 | **Named parameter.** Horizontal coordinate of the rotation point. Default unit: vp. |
| ry | Float64 | No | 0.0 | **Named parameter.** Vertical coordinate of the rotation point. Default unit: vp. |

### func scale(Float64, Float64)

```cangjie
public func scale(sx!: Float64 = 1.0, sy!: Float64 = 1.0): This
```

**Function:** Performs a right-multiplication scaling operation on the current matrix.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| sx | Float64 | No | 1.0 | **Named parameter.** Horizontal scaling coefficient. |
| sy | Float64 | No | 1.0 | **Named parameter.** Vertical scaling coefficient. |

### func translate(Float64, Float64)

```cangjie
public func translate(tx!: Float64 = 0.0, ty!: Float64 = 0.0): This
```

**Function:** Performs a left-multiplication translation operation on the current matrix.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| tx | Float64 | No | 0.0 | **Named parameter.** Horizontal translation distance. Default unit: vp. |
| ty | Float64 | No | 0.0 | **Named parameter.** Vertical translation distance. Default unit: vp. |

## Example Code

<!-- run -->

```cangjie

package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    private let settings: RenderingContextSettings = RenderingContextSettings(antialias: true)
    private let context1: CanvasRenderingContext2D = CanvasRenderingContext2D(this.settings)
    private let matrix: Matrix2D = Matrix2D()

    func build() {
        Row {
            Canvas(this.context1)
                .width(240.vp)
                .height(180.vp)
                .backgroundColor(0xffff00)
                .onReady(
                    {
                        =>
                        this.context1.fillRect(100, 20, 50, 50)
                        this.matrix.scaleX = 1.0
                        this.matrix.scaleY = 1.0
                        this.matrix.rotateX = -0.5
                        this.matrix.rotateY = 0.5
                        this.matrix.translateX = 10.0
                        this.matrix.translateY = 10.0
                        this.context1.setTransform(this.matrix)
                        this.context1.fillRect(100, 20, 50, 50)
                    }
                )
        }.height(100.percent).width(100.percent)
    }
}
```

![matrix2D_1](./figures/matrix2D_1.png)