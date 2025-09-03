# Touch Hot Zone Settings

Applicable to components that support generic click events, generic touch events, and generic gesture handling.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func responseRegion(Rectangle)

```cangjie
public func responseRegion(value: Rectangle): This
```

**Function:** Sets the response region of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Rectangle](#) | Yes | - | Response region rectangle. |

## func responseRegion(Array\<Rectangle>)

```cangjie
public func responseRegion(value: Array<Rectangle>): This
```

**Function:** Sets an array of response regions for a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Array\<[Rectangle](#)> | Yes | - | Array of rectangles. |