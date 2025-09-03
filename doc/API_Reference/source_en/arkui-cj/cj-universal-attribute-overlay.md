# Overlay

Sets the overlay text for a component.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func overlay(String, Alignment, OverlayOffset)

```cangjie
public func overlay(value!: String, align!: Alignment = Alignment.Center,
    offset!: OverlayOffset = OverlayOffset(x: 0.0, y: 0.0)): This
```

**Function:** Adds overlay text as a floating layer above the current component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | **Named parameter.** Content of the overlay text. |
| align | [Alignment](#) | No | Alignment.Center | **Named parameter.** Position of the overlay relative to the component. |
| offset | [OverlayOffset](#) | No | OverlayOffset(x: 0.0, y: 0.0) | **Named parameter.** Offset of the overlay based on its own top-left corner. The overlay is positioned at the top-left corner of the component by default. |

> **Note:**
>
> When both align and offset are set, their effects will overlap. The overlay will first be positioned relative to the component according to align, then offset from the current position's top-left corner.