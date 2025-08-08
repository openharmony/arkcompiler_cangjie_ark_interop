# Layout Constraints

Control the display effect of components through aspect ratio and display priority constraints.

## func aspectRatio(Float64)

```cangjie
public func aspectRatio(value: Float64): This
```

**Function:** Specifies the aspect ratio of the current component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | - | The aspect ratio of the current component, where aspectRatio = width/height. <br> **Note:** <br> This property does not take effect when no value is set or when an invalid value (≤ 0.0) is set. <br> For example, when a Row has only its width set and no child components, and aspectRatio is either not set or set to a negative value, the height of the Row will be 0.0. |

## func aspectRatio(Int64)

```cangjie
public func aspectRatio(value: Int64): This
```

**Function:** Specifies the aspect ratio of the current component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Int64 | Yes | - | The aspect ratio of the current component, where aspectRatio = width/height. <br> **Note:** <br> This property does not take effect when no value is set or when an invalid value (≤ 0) is set. <br> For example, when a Row has only its width set and no child components, and aspectRatio is either not set or set to a negative value, the height of the Row will be 0. |

> **Notes:**
>
> - When only width and aspectRatio are set, height = width / aspectRatio.
> - When only height and aspectRatio are set, width = height * aspectRatio.
> - When width, height, and aspectRatio are all set, height does not take effect, and height = width / aspectRatio.
> - After setting the aspectRatio property, the component's dimensions will be constrained by the parent component's content area size.

## func displayPriority(Int32)

```cangjie
public func displayPriority(value: Int32): This
```

**Function:** Sets the display priority of the current component within a layout container.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Int32 | Yes | - | The display priority of the current component within a layout container. <br> Default: 1. <br> **Note:** <br> Only takes effect in [Row](./cj-row-column-stack-row.md#row) or [Column](./cj-row-column-stack-column.md#column) container components. <br> Numbers after the decimal point do not distinguish priorities, meaning values within the interval [x, x + 1) are treated as the same priority. For example, 1.0 and 1.9 have the same priority. When the displayPriority of child components is ≤ 1, there is no difference in priority. When the displayPriority of child components is > 1, higher values indicate higher priority. If the parent container has insufficient space, lower-priority child components will be hidden. If child components of a certain priority are hidden, all child components with lower priorities will also be hidden. |