# Border Settings

Configure the border style of components.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func border(Length, ResourceColor, Length, BorderStyle)

```cangjie
public func border(width!: Length, color!: ResourceColor = Color.Black, radius!: Length = 0.vp,
    style!: BorderStyle = BorderStyle.Solid): This
```

**Description:** Sets the border style of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| width | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#) | Yes | - | Border width. |
| color | [ResourceColor](#) | No | Color.Black | Border color. |
| radius | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#) | No | 0.vp | Border corner radius. |
| style | [BorderStyle](#) | No | BorderStyle.Solid | Border style. |

## func borderColor(ResourceColor)

```cangjie
public func borderColor(value: ResourceColor): This
```

**Description:** Sets the border color of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](#) | Yes | - | Border color. |

## func borderRadius(Length)

```cangjie
public func borderRadius(value: Length): This
```

**Description:** Sets the corner radius of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#) | Yes | - | Corner radius. |

## func borderRadius(Length, Length, Length, Length)

```cangjie
public func borderRadius(topLeft!: Length = 0.vp, topRight!: Length = 0.vp, bottomLeft!: Length = 0.vp,
    bottomRight!: Length = 0.vp): This
```

**Description:** Sets the corner radius for all four corners of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| topLeft | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#) | No | 0.vp | Top-left corner radius. |
| topRight | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#) | No | 0.vp | Top-right corner radius. |
| bottomLeft | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#) | No | 0.vp | Bottom-left corner radius. |
| bottomRight | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#) | No | 0.vp | Bottom-right corner radius. |

## func borderStyle(BorderStyle)

```cangjie
public func borderStyle(value: BorderStyle): This
```

**Description:** Sets the border style of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [BorderStyle](#) | Yes | - | Border style value. |

## func borderWidth(EdgeWidths)

```cangjie
public func borderWidth(value: EdgeWidths): This
```

**Description:** Sets the brightness of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [EdgeWidths](#) | Yes | - | Edge widths. |

## func borderWidth(Length)

```cangjie
public func borderWidth(value: Length): This
```

**Description:** Sets the border width of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#) | Yes | - | Border width. |

**Exceptions:**

- IllegalArgumentException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | Percentage values are not supported. | todo | todo |

## Basic Type Definitions

### class EdgeWidths

```cangjie
public class EdgeWidths {
    public var top: Length
    public var right: Length
    public var bottom: Length
    public var left: Length
    public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)
}
```

**Description:** Sets the border width of the popup backplate. At least one parameter must be provided when initializing this object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var bottom

```cangjie
public var bottom: Length
```

**Description:** Bottom border width.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var left

```cangjie
public var left: Length
```

**Description:** Left border width.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var right

```cangjie
public var right: Length
```

**Description:** Right border width.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var top

```cangjie
public var top: Length
```

**Description:** Top border width.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(Length, Length, Length, Length)

```cangjie
public init(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp)
```

**Description:** Constructs an EdgeWidths object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| top | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Top border width. |
| right | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Right border width. |
| bottom | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Bottom border width. |
| left | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** Left border width. |