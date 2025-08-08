# Graphic Transformations

Used to perform operations such as rotation, translation, scaling, and matrix transformations on components.

## func rotate(Float32, Float32, Float32, Float64, Length, Length)

```cangjie
public func rotate(
    x!: Float32 = 0.0,
    y!: Float32 = 0.0,
    z!: Float32 = 0.0,
    angle!: Float32 = 0.0,
    centerX!: Length = 50.percent,
    centerY!: Length = 50.percent
): This
```

**Function:** Sets component rotation.

> **Note:**
>
> - Allows the component to rotate in a coordinate system with the component's top-left corner as the origin (coordinate system shown in the figure below). The (x, y, z) parameters specify a vector as the rotation axis.
> - Both the rotation axis and center point are based on the coordinate system. The coordinate system does not move when the component is displaced.
> - Default values: When x, y, and z are unspecified, their default values are 0, 0, and 1 respectively. If any of x, y, or z is specified, unspecified values default to 0.
> ![coordinates](figures/coordinates.png)

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | Float32 | No | 0.0 | **Named parameter.** X-coordinate of the rotation axis vector. |
| y | Float32 | No | 0.0 | **Named parameter.** Y-coordinate of the rotation axis vector. |
| z | Float32 | No | 0.0 | **Named parameter.** Z-coordinate of the rotation axis vector. |
| angle | Float64 | No | 0.0 | Rotation angle. Positive values rotate clockwise relative to the rotation axis direction; negative values rotate counterclockwise. |
| centerX | [Length](cj-common-types.md#interface-length) | No | 50.percent | **Named parameter.** X-coordinate of the transformation center point. Represents the x-coordinate of the component's transformation center point (i.e., anchor point). |
| centerY | [Length](cj-common-types.md#interface-length) | No | 50.percent | **Named parameter.** Y-coordinate of the transformation center point. Represents the y-coordinate of the component's transformation center point (i.e., anchor point). |

## func rotateX(Float32)

```cangjie
public func rotateX(rotateVal: Float32): This
```

**Function:** Rotates the component by a specified angle around the X-axis.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| rotateVal | Float32 | Yes | - | X-coordinate of the rotation axis vector. |

## func rotateX(Int32)

```cangjie
public func rotateX(rotateVal: Int32): This
```

**Function:** Rotates the component by a specified angle around the X-axis.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| rotateVal | Int32 | Yes | - | X-coordinate of the rotation axis vector. |

## func rotateY(Float32)

```cangjie
public func rotateY(rotateVal: Float32): This
```

**Function:** Rotates the component by a specified angle around the Y-axis.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| rotateVal | Float32 | Yes | - | Y-coordinate of the rotation axis vector. |

## func rotateY(Int32)

```cangjie
public func rotateY(rotateVal: Int32): This
```

**Function:** Rotates the component by a specified angle around the Y-axis.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| rotateVal | Int32 | Yes | - | Y-coordinate of the rotation axis vector. |

## func rotate(Float32)

```cangjie
public func rotate(rotateZ: Float32): This
```

**Function:** Sets component rotation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| rotateZ | Float32 | Yes | - | Z-axis anchor point, i.e., the z-component of the 3D rotation center point. |

## func rotate(Int32)

```cangjie
public func rotate(rotateZ: Int32): This
```

**Function:** Sets component rotation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| rotateZ | Int32 | Yes | - | Z-axis anchor point, i.e., the z-component of the 3D rotation center point. |

## func scale(Float32)

```cangjie
public func scale(scaleValue: Float32): This
```

**Function:** Sets component scaling.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| scaleValue | Float32 | Yes | - | Scaling factor. |

## func scale(Int32)

```cangjie
public func scale(scaleValue: Int32): This
```

**Function:** Sets component scaling.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| scaleValue | Int32 | Yes | - | Scaling factor. |

## func scale(Float32, Float32, Float32, Length, Length)

```cangjie
public func scale(
    x!: Float32 = 1.0,
    y!: Float32 = 1.0,
    z!: Float32 = 1.0,
    centerX!: Length = 50.percent,
    centerY!: Length = 50.percent
): This
```

**Function:** Sets component scaling.

> **Note:**
>
> Allows separate scaling ratios for the X, Y, and Z axes, with a default value of 1.0. The scaling center point can be set via centerX and centerY. When passing Int32 or Float32 alone, scaling is applied to both X and Y axes.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | Float32 | No | 1.0 | **Named parameter.** X-axis scaling ratio. |
| y | Float32 | No | 1.0 | **Named parameter.** Y-axis scaling ratio. |
| z | Float32 | No | 1.0 | **Named parameter.** Z-axis scaling ratio. |
| centerX | [Length](cj-common-types.md#interface-length) | No | 50.percent | **Named parameter.** X-coordinate of the transformation center point. Represents the x-coordinate of the component's transformation center point (i.e., anchor point). |
| centerY | [Length](cj-common-types.md#interface-length) | No | 50.percent | **Named parameter.** Y-coordinate of the transformation center point. Represents the y-coordinate of the component's transformation center point (i.e., anchor point). |

## func scaleX(Float32)

```cangjie
public func scaleX(scale: Float32): This
```

**Function:** Sets the X-axis scaling ratio.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| scale | Float32 | Yes | - | X-axis scaling ratio. |

## func scaleX(Int32)

```cangjie
public func scaleX(scale: Int32): This
```

**Function:** Sets the X-axis scaling ratio.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| scale | Int32 | Yes | - | X-axis scaling ratio. |

## func scaleY(Float32)

```cangjie
public func scaleY(scale: Float32): This
```

**Function:** Sets the Y-axis scaling ratio.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| scale | Float32 | Yes | - | Y-axis scaling ratio. |

## func scaleY(Int32)

```cangjie
public func scaleY(scale: Int32): This
```

**Function:** Sets the Y-axis scaling ratio.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| scale | Int32 | Yes | - | Y-axis scaling ratio. |

## func transform(Matrix4Transit)

```cangjie
public func transform(matrix: Matrix4Transit): This
```

**Function:** Sets the transformation matrix for the current component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19**Parameters:**

| Name     | Type           | Required | Default | Description                          |
|:---------|:---------------|:---------|:--------|:-------------------------------------|
| matrix   | Matrix4Transit | Yes      | -       | The transformation matrix of the current component. |

## func translate(Length)

```cangjie
public func translate(value: Length): This
```

**Function:** Sets the translation distance of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type                                      | Required | Default | Description              |
|:----------|:------------------------------------------|:---------|:--------|:-------------------------|
| value     | [Length](./cj-common-types.md#interface-length) | Yes      | -       | Translation distance.    |

## func translate(Length, Length, Length)

```cangjie
public func translate(x!: Length = 0.vp, y!: Length = 0.vp, z!: Length = 0.vp): This
```

**Function:** Sets the translation distance of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

> **Note:**
>
> Allows the component to move in a coordinate system with the top-left corner of the component as the origin (as shown in the figure below). The values of x, y, and z represent the distance moved along the corresponding axis. A positive value indicates movement in the positive direction of the axis, while a negative value indicates movement in the negative direction.<br/>Default values:<br/>{x:&nbsp;0,y:&nbsp;0,z:&nbsp;0}<br/>Unit: vp.<br/>![coordinates](figures/coordinates.png) <br>**Note:** When moving along the z-axis, since the viewpoint position remains unchanged, components closer to the viewpoint will appear enlarged, while those farther away will appear smaller.<br/>![coordinateNode](figures/coordinateNote.png)|

**Parameters:**

| Name | Type                                      | Required | Default | Description                          |
|:-----|:------------------------------------------|:---------|:--------|:-------------------------------------|
| x    | [Length](cj-common-types.md#interface-length) | No       | 0.vp    | **Named parameter.** X-axis translation distance. |
| y    | [Length](cj-common-types.md#interface-length) | No       | 0.vp    | **Named parameter.** Y-axis translation distance. |
| z    | [Length](cj-common-types.md#interface-length) | No       | 0.vp    | **Named parameter.** Z-axis translation distance. |

## func translateX(Int64)

```cangjie
public func translateX(value: Int64): This
```

**Function:** Sets the X-axis translation distance of the component. The sign of the distance controls the direction of translation (unit: vp).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name  | Type  | Required | Default | Description              |
|:------|:-------|:---------|:--------|:-------------------------|
| value | Int64  | Yes      | -       | X-axis translation distance. |

## func translateX(Length)

```cangjie
public func translateX(value: Length): This
```

**Function:** Sets the X-axis translation distance of the component. The sign of the distance controls the direction of translation (unit: vp).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name  | Type                                      | Required | Default | Description              |
|:------|:------------------------------------------|:---------|:--------|:-------------------------|
| value | [Length](cj-common-types.md#interface-length) | Yes      | -       | X-axis translation distance. |

## func translateY(Int64)

```cangjie
public func translateY(value: Int64): This
```

**Function:** Sets the Y-axis translation distance of the component. The sign of the distance controls the direction of translation (unit: vp).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name  | Type  | Required | Default | Description              |
|:------|:-------|:---------|:--------|:-------------------------|
| value | Int64  | Yes      | -       | Y-axis translation distance. |

## func translateY(Length)

```cangjie
public func translateY(value: Length): This
```

**Function:** Sets the Y-axis translation distance of the component. The sign of the distance controls the direction of translation (unit: vp).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name  | Type                                      | Required | Default | Description              |
|:------|:------------------------------------------|:---------|:--------|:-------------------------|
| value | [Length](cj-common-types.md#interface-length) | Yes      | -       | Y-axis translation distance. |