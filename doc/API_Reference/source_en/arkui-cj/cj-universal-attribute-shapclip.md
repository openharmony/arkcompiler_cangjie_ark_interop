# Shape Clipping

Used for clipping and masking components.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func clip(Bool)

```cangjie
public func clip(value: Bool): This
```

**Function:** Sets whether to clip content that exceeds the component boundaries.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether to clip. |

## func clipShape(BaseShape)

```cangjie
public func clipShape(value: BaseShape): This
```

**Function:** Sets the clipping shape for the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [BaseShape](#) | Yes | - | The clipping shape. |

## func maskShape(BaseShape)

```cangjie
public func maskShape(value: BaseShape): This
```

**Function:** Adds a mask of the specified shape to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [BaseShape](<font color="red" face="bold">please add link</font>) | Yes | - | Adds a mask of the specified shape to the current component. |