# Gesture Binding Methods

Bind different types of gesture events to components and set up corresponding response methods.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func !=(GestureMask)

```cangjie
public operator func !=(other: GestureMask): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [GestureMask](#enum-gesturemask) | Yes | - | Another enumeration value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are not equal, otherwise returns `false`. |

## func ==(GestureMask)

```cangjie
public operator func ==(other: GestureMask): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [GestureMask](#enum-gesturemask) | Yes | - | Another enumeration value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

## Basic Type Definitions

### enum GestureMask

```cangjie
public enum GestureMask <: Equatable<GestureMask> {
    | Normal
    | IgnoreInternal
    | ...
}
```

**Function:** Gesture mask.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parent Type:**

- Equatable\<GestureMask>

#### IgnoreInternal

```cangjie
IgnoreInternal
```

**Function:** Blocks gestures from child components, including system-built-in gestures on child components. For example, when a child component is a List component, its built-in swipe gesture will also be blocked. If the parent and child components have overlapping areas, only the overlapping part will be blocked.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### Normal

```cangjie
Normal
```

**Function:** Does not block gestures from child components. Gestures are recognized according to the default recognition sequence.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21