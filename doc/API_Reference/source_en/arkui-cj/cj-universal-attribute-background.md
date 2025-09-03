# Background Settings

Configure the background style of components.

## Import Module

```cangjie
import kit.ArkUI.*
```

## func backdropBlur(Float64)

```cangjie
public func backdropBlur(value: Float64): This
```

**Description:** Sets the background blur effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | - | Blur radius. |

## func backgroundColor(ResourceColor)

```cangjie
public func backgroundColor(value: ResourceColor): This
```

**Description:** Sets the background color of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](#) | Yes | - | Background color. |

## func backgroundImage(ResourceStr)

```cangjie
public func backgroundImage(src: ResourceStr): This
```

**Description:** Sets the background image of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | [ResourceStr](#) | Yes | - | Image resource path. |

## func backgroundImage(ResourceStr, ImageRepeat)

```cangjie
public func backgroundImage(src: ResourceStr, repeat: ImageRepeat): This
```

**Description:** Sets the background image and repeat mode of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | [ResourceStr](#) | Yes | - | Image resource path. |
| repeat | [ImageRepeat](#) | Yes | - | Image repeat mode. |

## func backgroundImagePosition(Alignment)

```cangjie
public func backgroundImagePosition(value: Alignment): This
```

**Description:** Sets the alignment of the background image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Alignment](#) | Yes | - | Alignment mode. |

## func backgroundImagePosition(Length, Length)

```cangjie
public func backgroundImagePosition(x!: Length = 0.vp, y!: Length = 0.vp): This
```

**Description:** Sets the position of the background image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | X-axis position. |
| y | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | Y-axis position. |

## func backgroundImageSize(ImageSize)

```cangjie
public func backgroundImageSize(value: ImageSize): This
```

**Description:** Sets the size of the background image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ImageSize](#) | Yes | - | Image size. |

## func backgroundImageSize(Length, Length)

```cangjie
public func backgroundImageSize(width!: Length = 0.vp, height!: Length = 0.vp): This
```

**Description:** Sets the width and height of the background image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| width | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | Image width. |
| height | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0.vp | Image height. |

## Basic Type Definitions

### enum BlurStyle

```cangjie
public enum BlurStyle <: Equatable<BlurStyle> {
    | Thin
    | Regular
    | Thick
    | BackgroundThin
    | BackgroundRegular
    | BackgroundThick
    | BackgroundUltraThick
    | None
    | ComponentUltraThin
    | ComponentThin
    | ComponentRegular
    | ComponentThick
    | ComponentUltraThick
    | ...
}
```

**Description:** Blur settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<BlurStyle>

#### BackgroundRegular

```cangjie
BackgroundRegular
```

**Description:** Medium-depth background blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### BackgroundThick

```cangjie
BackgroundThick
```

**Description:** Far-depth background blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### BackgroundThin

```cangjie
BackgroundThin
```

**Description:** Near-depth background blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### BackgroundUltraThick

```cangjie
BackgroundUltraThick
```

**Description:** Ultra-far-depth background blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ComponentRegular

```cangjie
ComponentRegular
```

**Description:** Component normal material blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### ComponentThick

```cangjie
ComponentThick
```

**Description:** Component thick material blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### ComponentThin

```cangjie
ComponentThin
```

**Description:** Component thin material blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### ComponentUltraThick

```cangjie
ComponentUltraThick
```

**Description:** Component ultra-thick material blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### ComponentUltraThin

```cangjie
ComponentUltraThin
```

**Description:** Component ultra-thin material blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### None

```cangjie
None
```

**Description:** Disables blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Regular

```cangjie
Regular
```

**Description:** Normal thickness material blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Thick

```cangjie
Thick
```

**Description:** Thick material blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Thin

```cangjie
Thin
```

**Description:** Thin material blur.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func !=(BlurStyle)

```cangjie
public operator func !=(other: BlurStyle): Bool
```

**Description:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BlurStyle](#enum-blurstyle) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

#### func ==(BlurStyle)

```cangjie
public operator func ==(other: BlurStyle): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [BlurStyle](#enum-blurstyle) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |