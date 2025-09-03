# Component Content Filling Mode

Determines how the final component content after animation is rendered on the component during width/height animations.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func renderFit(RenderFit)

```cangjie
public func renderFit(fitMode: RenderFit): This
```

**Description:** Sets the rendering adaptation mode of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fitMode | [RenderFit](#) | Yes | - | Rendering adaptation mode. |

## func !=(RenderFit)

```cangjie
public operator func !=(other: RenderFit): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [RenderFit](#enum-renderfit) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

## func ==(RenderFit)

```cangjie
public operator func ==(other: RenderFit): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [RenderFit](#enum-renderfit) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

## Basic Type Definitions

### enum RenderFit

```cangjie
public enum RenderFit <: Equatable<RenderFit> {
    | CENTER
    | TOP
    | BOTTOM
    | LEFT
    | RIGHT
    | TOP_LEFT
    | TOP_RIGHT
    | BOTTOM_LEFT
    | BOTTOM_RIGHT
    | RESIZE_FILL
    | RESIZE_CONTAIN
    | RESIZE_CONTAIN_TOP_LEFT
    | RESIZE_CONTAIN_BOTTOM_RIGHT
    | RESIZE_COVER
    | RESIZE_COVER_TOP_LEFT
    | RESIZE_COVER_BOTTOM_RIGHT
    | ...
}
```

**Description:** Component content filling style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<RenderFit>

#### BOTTOM

```cangjie
BOTTOM
```

**Description:** Maintains the final animation content size and keeps the content bottom-center aligned with the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### BOTTOM_LEFT

```cangjie
BOTTOM_LEFT
```

**Description:** Maintains the final animation content size and keeps the content bottom-left aligned with the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### BOTTOM_RIGHT

```cangjie
BOTTOM_RIGHT
```

**Description:** Maintains the final animation content size and keeps the content bottom-right aligned with the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### CENTER

```cangjie
CENTER
```

**Description:** Maintains the final animation content size and keeps the content center aligned with the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### LEFT

```cangjie
LEFT
```

**Description:** Maintains the final animation content size and keeps the content left aligned with the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### RESIZE_CONTAIN

```cangjie
RESIZE_CONTAIN
```

**Description:** Scales the final animation content while maintaining aspect ratio to ensure complete display within the component, keeping center alignment.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### RESIZE_CONTAIN_BOTTOM_RIGHT

```cangjie
RESIZE_CONTAIN_BOTTOM_RIGHT
```

**Description:** Scales the final animation content while maintaining aspect ratio to ensure complete display within the component. When width space remains, content stays right-aligned; when height space remains, content stays bottom-aligned.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### RESIZE_CONTAIN_TOP_LEFT

```cangjie
RESIZE_CONTAIN_TOP_LEFT
```

**Description:** Scales the final animation content while maintaining aspect ratio to ensure complete display within the component. When width space remains, content stays left-aligned; when height space remains, content stays top-aligned.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### RESIZE_COVER

```cangjie
RESIZE_COVER
```

**Description:** Scales the final animation content while maintaining aspect ratio to ensure content dimensions are equal to or larger than the component, keeping center alignment and displaying the middle portion.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### RESIZE_COVER_BOTTOM_RIGHT

```cangjie
RESIZE_COVER_BOTTOM_RIGHT
```

**Description:** Scales the final animation content while maintaining aspect ratio to ensure content dimensions are exactly equal to or larger than the component. When width space remains, content stays right-aligned (displaying right portion); when height space remains, content stays bottom-aligned (displaying bottom portion).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### RESIZE_COVER_TOP_LEFT

```cangjie
RESIZE_COVER_TOP_LEFT
```

**Description:** Scales the final animation content while maintaining aspect ratio to ensure content dimensions are exactly equal to or larger than the component. When width space remains, content stays left-aligned (displaying left portion); when height space remains, content stays top-aligned (displaying top portion).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### RESIZE_FILL

```cangjie
RESIZE_FILL
```

**Description:** Ignores the aspect ratio of the final animation content and always scales content to match component dimensions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### RIGHT

```cangjie
RIGHT
```

**Description:** Maintains the final animation content size and keeps the content right aligned with the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### TOP

```cangjie
TOP
```

**Description:** Maintains the final animation content size and keeps the content top-center aligned with the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### TOP_LEFT

```cangjie
TOP_LEFT
```

**Description:** Maintains the final animation content size and keeps the content top-left aligned with the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### TOP_RIGHT

```cangjie
TOP_RIGHT
```

**Description:** Maintains the final animation content size and keeps the content top-right aligned with the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21