# Foreground Color Setting

Sets the foreground color of a component.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func foregroundColor(ColoringStrategy)

```cangjie
public func foregroundColor(value: ColoringStrategy): This
```

**Function:** Sets the foreground color strategy.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ColoringStrategy](#) | Yes | - | The color strategy. |

## func foregroundColor(ResourceColor)

```cangjie
public func foregroundColor(value: ResourceColor): This
```

**Function:** Sets the foreground color of a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | Yes | - | The foreground color of the component or sets the foreground color based on the intelligent color picking strategy. Property animation is not supported. |