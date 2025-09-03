# Graphic Transformations

Used to perform operations such as rotation, translation, scaling, and matrix transformations on components.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func rotate(Float32, Float32, Float32, Float32, Length, Length)

```cangjie
public func rotate(x!: Float32 = 0.0, y!: Float32 = 0.0, z!: Float32 = 1.0, angle!: Float32 = 0.0,
    centerX!: Length = 50.percent, centerY!: Length = 50.percent): This
```

**Function:** Sets the rotation of a component.

> **Note:**
>
> - Allows the component to rotate in a coordinate system with the top-left corner of the component as the origin (as shown in the figure below). The vector (x, y, z) specifies the rotation axis.
> - Both the rotation axis and the rotation center point are based on the coordinate system. The coordinate system does not move when the component is displaced.
> - Default values: When x, y, and z are not specified, their default values are 0, 0, and 1, respectively. If any of x, y, or z is specified, the unspecified values default to 0.
> ![coordinates](figures/coordinates.png)

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | Float32 | No | 0.0 | **Named parameter.** X-coordinate of the rotation axis vector. |
| y | Float32 | No | 0.0 | **Named parameter.** Y-coordinate of the rotation axis vector. |
| z | Float32 | No | 1.0 | **Named parameter.** Z-coordinate of the rotation axis vector. |
| angle | Float32 | No | 0.0 | **Named parameter.** Rotation angle. A positive value rotates clockwise relative to the rotation axis direction, while a negative value rotates counterclockwise. |
| centerX | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 50.percent | **Named parameter.** X-coordinate of the transformation center point. Represents the x-coordinate of the component's transformation center point (i.e., the anchor point). |
| centerY | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 50.percent | **Named parameter.** Y-coordinate of the transformation center point. Represents the y-coordinate of the component's transformation center point (i.e., the anchor point). |

## func scale(Float32, Float32, Float32, Length, Length)

```cangjie
public func scale(x!: Float32 = 1.0, y!: Float32 = 1.0, z!: Float32 = 1.0, centerX!: Length = 50.percent,
    centerY!: Length = 50.percent): This
```

**Function:** Sets the scaling of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | Float32 | No | 1.0 | X-axis scaling component. |
| y | Float32 | No | 1.0 | Y-axis scaling component. |
| z | Float32 | No | 1.0 | Z-axis scaling component. |
| centerX | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 50.percent | X-coordinate of the transformation center point. Represents the x-coordinate of the component's transformation center point (i.e., the anchor point). |
| centerY | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 50.percent | Y-coordinate of the transformation center point. Represents the y-coordinate of the component's transformation center point (i.e., the anchor point). |

## func translate(Length, Length, Length)

```cangjie
public func translate(x!: Length = 0.vp, y!: Length = 0.vp, z!: Length = 0.vp): This
```

**Function:** Sets the translation of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | X-axis translation distance. |
| y | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | Y-axis translation distance. |
| z | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | Z-axis translation distance. |