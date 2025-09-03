# Setting Component-Bound Gestures

Used to configure gestures bound to components. Gestures can be added or removed by calling the interface through a UIGestureEvent object.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func !=(GesturePriority)

```cangjie
public operator func !=(other: GesturePriority): Bool
```

**Function:** Determines whether two enumeration values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [GesturePriority](#enum-gesturepriority) | Yes | - | Another enumeration value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are unequal, otherwise returns `false`. |

## func ==(GesturePriority)

```cangjie
public operator func ==(other: GesturePriority): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [GesturePriority](#enum-gesturepriority) | Yes | - | Another enumeration value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

## Basic Type Definitions

### enum GesturePriority

```cangjie
public enum GesturePriority <: Equatable<GesturePriority> {
    | Low
    | High
    | ...
}
```

**Function:** Gesture priority levels.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<GesturePriority>

#### High

```cangjie
High
```

**Function:** High gesture priority.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Low

```cangjie
Low
```

**Function:** Low gesture priority.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21