# Custom Gesture Determination

Provides components with the capability for custom gesture determination. Developers can decide whether to respond to gestures during gesture recognition as needed.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func !=(GestureTypes)

```cangjie
public operator func !=(other: GestureTypes): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [GestureTypes](#enum-gesturetypes) | Yes | - | The other enumeration value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are not equal, otherwise returns `false`. |

## func ==(GestureTypes)

```cangjie
public operator func ==(other: GestureTypes): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [GestureTypes](#enum-gesturetypes) | Yes | - | The other enumeration value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

## Basic Type Definitions

### enum GestureTypes

```cangjie
public enum GestureTypes <: Equatable<GestureTypes> {
    | TAP_GESTURE
    | LONG_PRESS_GESTURE
    | PAN_GESTURE
    | PINCH_GESTURE
    | SWIPE_GESTURE
    | ROTATION_GESTURE
    | DRAG
    | CLICK
    | ...
}
```

**Function:** Gesture types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<GestureTypes>

#### CLICK

```cangjie
CLICK
```

**Function:** Click gesture.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### DRAG

```cangjie
DRAG
```

**Function:** Drag gesture.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### LONG_PRESS_GESTURE

```cangjie
LONG_PRESS_GESTURE
```

**Function:** Long press gesture.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### PAN_GESTURE

```cangjie
PAN_GESTURE
```

**Function:** Pan gesture.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### PINCH_GESTURE

```cangjie
PINCH_GESTURE
```

**Function:** Pinch gesture.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### ROTATION_GESTURE

```cangjie
ROTATION_GESTURE
```

**Function:** Rotation gesture.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### SWIPE_GESTURE

```cangjie
SWIPE_GESTURE
```

**Function:** Swipe gesture.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### TAP_GESTURE

```cangjie
TAP_GESTURE
```

**Function:** Tap gesture.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21