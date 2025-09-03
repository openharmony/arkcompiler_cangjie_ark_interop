# StepperItem

Used as a child component of the [Stepper](cj-navigation-switching-stepper.md) component.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

Supports a single child component.

## Creating the Component

### init(() -> Unit)

```cangjie
public init(child: () -> Unit)
```

**Function:** Creates a child component for the [Stepper](cj-navigation-switching-stepper.md) component's page.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| child | ()->Unit | Yes | - | The child component of StepperItem. |

## Common Attributes/Common Events

Common Attributes: All supported.

Common Events: All supported.

## Component Attributes

### func nextLabel(String)

```cangjie
public func nextLabel(value: String): This
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | <font color="red" face="bold">please add description</font> |

### func prevLabel(String)

```cangjie
public func prevLabel(value: String): This
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | <font color="red" face="bold">please add description</font> |

### func status(ItemState)

```cangjie
public func status(status!: ItemState = ItemState.Normal): This
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| status | [ItemState](<font color="red" face="bold">please add link</font>) | No | ItemState.Normal | <font color="red" face="bold">please add description</font> |

## enum ItemState

```cangjie
public enum ItemState <: Equatable<ItemState> {
    | Normal
    | Disabled
    | Waiting
    | Skip
    | ...
}
```

**Function:** Item state.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ItemState>

### Disabled

```cangjie
Disabled
```

**Function:** Disabled state. The right text button appears grayed out and cannot be clicked to proceed to the next StepperItem.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Normal

```cangjie
Normal
```

**Function:** Normal state. The right text button appears normally and can be clicked to proceed to the next StepperItem.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Skip

```cangjie
Skip
```

**Function:** Skip state. The right text button defaults to displaying "Skip". Custom logic can be defined in the Stepper's onSkip callback.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Waiting

```cangjie
Waiting
```

**Function:** Waiting state. The right text button is not displayed, showing a progress bar instead. Cannot be clicked to proceed to the next StepperItem.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(ItemState)

```cangjie
public operator func !=(other: ItemState): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ItemState](#enum-itemstate) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are not equal, otherwise returns false. |

### func ==(ItemState)

```cangjie
public operator func ==(other: ItemState): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ItemState](#enum-itemstate) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |