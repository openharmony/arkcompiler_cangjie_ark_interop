# Background Settings

Set the background style of components.

## func backdropBlur(Float64)

```cangjie
public func backdropBlur(value: Float64): This
```

**Function:** Adds a background blur effect to the component, allowing customization of blur radius and grayscale parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name    | Type     | Required | Default Value | Description     |
|:-------| :---------- | :------- | :-------- |:--------|
| value  | Float64  | Yes | - | Adds a background blur effect to the current component. The input parameter is the blur radius. A larger radius results in more blur, while 0 means no blur. |

> **Note:**
>
> Both `blur` and `backdropBlur` are real-time blur interfaces that render every frame, resulting in higher performance overhead.

## func backgroundColor(ResourceColor)

```cangjie
public open func backgroundColor(color: ResourceColor): This
```

**Function:** Sets the background color of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name    | Type     | Required | Default Value | Description     |
|:-------| :---------- | :------- | :-------- |:--------|
| color | [ResourceColor](./cj-common-types.md#interface-resourcecolor)  | Yes | - | The background color of the component. |

> **Note:**
>
> When specifying a background color via `inactiveColor` in [backgroundBlurStyle](./cj-universal-attribute-background.md#func-backgroundblurstyleblurstyle-optionbackgroundblurstyleoptions), it is not recommended to additionally set the background color via [backgroundColor](./cj-universal-attribute-background.md#func-backgroundcolorresourcecolor).

## func backgroundImage(AppResource, ImageRepeat)

```cangjie
public func backgroundImage(src!: AppResource, repeat!: ImageRepeat = ImageRepeat.NoRepeat): This
```

**Function:** Sets the background image of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name    | Type          | Required | Default Value | Description                                      |
|:--------|:--------------| :------- | :-------- |:----------------------------------------|
| src  | [AppResource](../apis/LocalizationKit/cj-apis-resource_manager.md#class-appresource)  | Yes | - | **Named parameter.** Image address, supporting network image resources, local image resource addresses, and Base64. SVG-type images are not supported. |
| repeat  | [ImageRepeat](./cj-common-types.md#enum-imagerepeat) | No | ImageRepeat.NoRepeat | **Named parameter.** Sets the repeat style of the background image, defaulting to no repeat. When the set background image has a transparent background and `backgroundColor` is also set, the two will be displayed in superposition, with the background color at the bottom.|

## func backgroundImage(String, ImageRepeat)

```cangjie
public func backgroundImage(src!: String, repeat!: ImageRepeat = ImageRepeat.NoRepeat): This
```

**Function:** Sets the background image of the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name     | Type          | Required | Default Value | Description                                      |
|:--------|:--------------| :------- | :-------- |:----------------------------------------|
| src | String | Yes | - | **Named parameter.** Image address, supporting network image resources, local image resource addresses, and Base64. SVG-type images are not supported. |
| repeat  | [ImageRepeat](./cj-common-types.md#enum-imagerepeat) | No | ImageRepeat.NoRepeat | **Named parameter.** The repeat style of the background image, defaulting to no repeat. When the set background image has a transparent background and `backgroundColor` is also set, the two will be displayed in superposition, with the background color at the bottom.|

## func backgroundImageSize(ImageSize)

```cangjie
public func backgroundImageSize(imageSize: ImageSize): This
```

**Function:** Sets the width and height of the component's background image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type| Required | Default Value | Description                                |
|:----|:---------------|:---| :-------- |:----------------------------------|
|imageSize | [ImageSize](./cj-common-types.md#enum-imagesize) | Yes  | - | The height and width of the background image.<br>Initial value: ImageSize.Auto.|

## func backgroundImageSize(Length, Length)

```cangjie
public func backgroundImageSize(width!: Length = 0.vp, height!: Length = 0.vp): This
```

**Function:** Sets the width and height of the component's background image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name     | Type        | Required | Default Value | Description                                              |
|:--------|:------------| :------- | :-------- |:------------------------------------------------|
| width | [Length](./cj-common-types.md#interface-length)  | No | 0.vp | **Named parameter.** The width of the background image.|
| height | [Length](./cj-common-types.md#interface-length)  | No | 0.vp | **Named parameter.** The height of the background image. |

> **Note:**
>
> - If only one property is set, the second property will adjust while maintaining the original aspect ratio of the image. By default, the original aspect ratio remains unchanged. The value ranges for `width` and `height` are: [0, +∞).
> - If both `width` and `height` are set to values less than or equal to 0, they will be displayed as 0. If only one of `width` or `height` is unset or set to a value less than or equal to 0, the other will adjust based on the original aspect ratio of the image.

## func backgroundImagePosition(Length, Length)

```cangjie
public func backgroundImagePosition(x!: Length = 0.vp, y!: Length = 0.vp): This
```

**Function:** Sets the position of the background image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type  | Required | Default Value | Description       |
|:----|:------|:---|:----|:--------------|
| x  | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** The x-coordinate relative to the top-left corner of the component. |
| y  | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** The y-coordinate relative to the top-left corner of the component. |

> **Note:**
>
> When setting percentage values for `x` and `y`, the offset is calculated relative to the component's own width and height.

## func backgroundImagePosition(Alignment)

```cangjie
public func backgroundImagePosition(align: Alignment): This
```

**Function:** Sets the position of the background image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type  | Required | Default Value | Description                   |
|:----|:------|:---|:------|:--------------------------------|
| align | [Alignment](./cj-common-types.md#enum-alignment) | Yes  | - | The display position of the background image within the component. |

## func BackgroundBlurStyle(BlurStyle, Option\<BackgroundBlurStyleOptions>)

```cangjie
public func backgroundBlurStyle(value!: BlurStyle, options!: Option<BackgroundBlurStyleOptions> = None): This
```

**Function:** Provides the current component with a blur capability between the background and content, encapsulating different blur radii, mask colors, mask transparency, saturation, and brightness via enumeration values.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|value|[BlurStyle](./cj-universal-attribute-background.md#enum-blurstyle)|Yes|-| **Named parameter.** Background blur style. The blur style encapsulates five parameters: blur radius, mask color, mask transparency, saturation, and brightness.|
|options|[BackgroundBlurStyleOptions](./cj-universal-attribute-background.md#class-backgroundblurstyleoptions)|No|None| **Named parameter.** Background blur options.|

## func backgroundImageResizable(EdgeWidths)

```cangjie
public func backgroundImageResizable(slice: EdgeWidths): This
```

**Function:** Sets the resizable image options for the background image when stretched.

When valid `ResizableOptions` are set, the `repeat` parameter in the [backgroundImage](./cj-universal-attribute-background.md#func-backgroundimageappresource-imagerepeat) property will not take effect.

If `top + bottom` exceeds the original image height or `left + right` exceeds the original image width, the `ResizableOptions` property setting will not take effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|slice|[EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths)|Yes|-|Border width type, used to describe the width of different directions of the component border.<br>This property only takes effect when both `bottom` and `right` are greater than 0. Default unit: vp.|

## func backgroundBrightness(Float64, Float64)

```cangjie
public func backgroundBrightness(rate: Float64, lightUpDegree: Float64): This
```

**Function:** Sets the background brightening effect of the component, including the brightness change rate and brightening degree.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|rate|Float64|Yes|-|Brightness change rate. A higher rate results in a faster decrease in brightening degree. If `rate` is 0, `lightUpDegree` will not take effect, meaning no brightening effect will occur.<br>Initial value: 0.0.<br>Value range: [-1.0, 1.0].|
|lightUpDegree|Float64|Yes|-|Brightening degree. A higher value results in a greater increase in brightness.<br>Initial value: 0.0.<br>Value range: (0.0, +∞).|

## func backgroundEffect(BackgroundEffectOptions)

```cangjie
public func backgroundEffect(value: BackgroundEffectOptions): This
```

**Function:** Sets the background properties of the component, including blur radius, brightness, saturation, color, and other parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|value|[BackgroundEffectOptions](./cj-universal-attribute-background.md#class-backgroundeffectoptions)|Yes|-|Component background properties include: saturation, brightness, color.|

## func background(() -> Unit, Alignment)

```cangjie
public func background(builder: () -> Unit, align!: Alignment=Alignment.Center): This
```

**Function:** Sets the component background.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

|Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|builder|() -> Unit|Yes|-|Custom background. Use in combination with `@Builder` and `bind` methods.|
|align|[Alignment](./cj-common-types.md#enum-alignment)|No|Alignment.Center| **Named parameter.** The alignment of the custom background with the component.<br>When `background`, `backgroundColor`, and `backgroundImage` are all set, they will be displayed in superposition, with `background` on the top layer.|

## Basic Type Definitions

### class BackgroundBlurStyleOptions

```cangjie
public class BackgroundBlurStyleOptions <: BlurStyleOptions {
    public let inactiveColor: Color
    public let policy: BlurStyleActivePolicy
    public init(
        colorMode!: ThemeColorMode = ThemeColorMode.SYSTEM,
        adaptiveColor!: AdaptiveColor = AdaptiveColor.DEFAULT,
        blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]),
        scale!: Float32 = 1.0,
        policy!: BlurStyleActivePolicy = BlurStyleActivePolicy.ALWAYS_ACTIVE,
        inactiveColor!: ResourceColor = Color.TRANSPARENT
    )
}
```

**Function:** Background blur options type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parent Types:**

- [BlurStyleOptions](./cj-universal-attribute-foregroundblurstyle.md#class-blurstyleoptions)

#### let inactiveColor

```cangjie
public let inactiveColor: ResourceColor
```
**Function:** When the window loses focus, the blur effect on controls within the window will be removed, and the `inactiveColor` will be used as the background color for the controls.

**Type:** [ResourceColor](./cj-common-types.md#interface-resourcecolor)

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let policy

```cangjie
public let policy: BlurStyleActivePolicy
```

**Function:** Blur activation policy.

**Type:** [BlurStyleActivePolicy](./cj-common-types.md#enum-blurstyleactivepolicy)

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### init(ThemeColorMode, AdaptiveColor, BlurOptions, Float32, BlurStyleActivePolicy, ResourceColor)

```cangjie
public init(colorMode!: ThemeColorMode, adaptiveColor!: AdaptiveColor,
blurOptions!: BlurOptions, scale!: Float32, policy!: BlurStyleActivePolicy, inactiveColor!: ResourceColor)
```

**Function:** Constructs an object of type `BackgroundBlurStyleOptions`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| colorMode | [ThemeColorMode](./cj-common-types.md#enum-themecolormode) | No | ThemeColorMode.SYSTEM | **Named parameter.** The dark/light mode used for content blur effects. |
| adaptiveColor | [AdaptiveColor](./cj-common-types.md#enum-adaptivecolor) | No | AdaptiveColor.DEFAULT | **Named parameter.** The color sampling mode used for content blur effects. |
| blurOptions | [BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions) | No | grayscale[0.0, 0.0] | **Named parameter.** Grayscale blur parameters. |
| scale | Float32 | No | 1.0 | **Named parameter.** The intensity of the content blur effect. |
| policy | [BlurStyleActivePolicy](./cj-common-types.md#enum-blurstyleactivepolicy) | No | BlurStyleActivePolicy.ALWAYS_ACTIVE | **Named parameter.** The internal blur activation policy. |
| inactiveColor | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | No | Color.TRANSPARENT | **Named parameter.** When the window loses focus, the blur effect on controls within the window will be removed, and `inactiveColor` will be used as the background color for the controls. |

### class BackgroundEffectOptions

```cangjie
public class BackgroundEffectOptions {
    public let adaptiveColor: AdaptiveColor
    public let blurOptions: BlurOptions
    public let brightness: Float64
    public let color: Color
    public let inactiveColor: Color
    public let policy: BlurStyleActivePolicy
    public let radius: Float64
    public let saturation: Float64
    public init(
        adaptiveColor!: AdaptiveColor = AdaptiveColor.DEFAULT,
        blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]),
        brightness!: Float64 = 1.0,
        color!: Color = Color.TRANSPARENT,
        inactiveColor!: Color = Color.TRANSPARENT,
        policy!: BlurStyleActivePolicy = BlurStyleActivePolicy.ALWAYS_ACTIVE,
        radius!: Float64,
        saturation!: Float64 = 1.0
        )
}
```

**Function:** Background effect parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

#### let adaptiveColor

```cangjie
public let adaptiveColor: AdaptiveColor
```

**Function:** The color sampling mode used for background blur effects, default is `DEFAULT`. When using `AVERAGE`, the `color` must include transparency for the sampling mode to take effect.

**Type:** [AdaptiveColor](./cj-common-types.md#enum-adaptivecolor)

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let blurOptions

```cangjie
public let blurOptions: BlurOptions
```

**Function:** Grayscale blur parameters.

**Type:** [BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions)

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let brightness

```cangjie
public let brightness: Float64
```

**Function:** Brightness, value range: [0, +∞). Recommended range: [0, 2].

**Type:** Float64

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let color

```cangjie
public let color: Color
```

**Function:** Color.

**Type:** [Color](./cj-common-types.md#color)

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let inactiveColor

```cangjie
public let inactiveColor: Color
```

**Function:** When the window loses focus, the blur effect on controls within the window will be removed, and `inactiveColor` will be used as the background color for the controls.

**Type:** [Color](./cj-common-types.md#color)

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let policy

```cangjie
public let policy: BlurStyleActivePolicy
```

**Function:** Blur activation policy.

**Type:** [BlurStyleActivePolicy](./cj-universal-attribute-background.md#enum-blurstyleactivepolicy)

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let radius

```cangjie
public let radius: Float64
```

**Function:** Blur radius, value range: [0, +∞). Initial value: 0.0.

**Type:** Float64

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### let saturation

```cangjie
public let saturation: Float64
```

**Function:** Saturation, value range: [0, +∞). Recommended range: [0, 50].

**Type:** Float64

**Read/Write Capability:** Read-only

**Initial Version:** 19

#### init(AdaptiveColor, BlurOptions, Float64, Color, Color, BlurStyleActivePolicy, Float64, Float64)

```cangjie
public init(adaptiveColor!: AdaptiveColor = AdaptiveColor.DEFAULT, blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]), brightness!: Float64 = 1.0, color!: Color = Color.TRANSPARENT, inactiveColor!: Color = Color.TRANSPARENT, policy!: BlurStyleActivePolicy = BlurStyleActivePolicy.ALWAYS_ACTIVE, radius!: Float64, saturation!: Float64 = 1.0)  
```

**Function:** Constructs an object of type `BackgroundEffectOptions`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| adaptiveColor | [AdaptiveColor](./cj-common-types.md#enum-adaptivecolor) | No | AdaptiveColor.DEFAULT | **Named parameter.** The color sampling mode used for background blur effects, default is `DEFAULT`. When using `AVERAGE`, the `color` must include transparency for the sampling mode to take effect. |
| blurOptions | [BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions) | No | BlurOptions([0.0, 0.0]) | **Named parameter.** Grayscale blur parameters. |
| brightness | Float64 | No | 1.0 | **Named parameter.** Brightness, value range: [0, +∞), recommended range: [0, 2]. |
| color | [Color](./cj-common-types.md#color) | No | Color.TRANSPARENT | **Named parameter.** Color. |
| inactiveColor | [Color](./cj-common-types.md#color) | No | Color.TRANSPARENT | **Named parameter.** When the window loses focus, the blur effect on controls within the window will be removed, and `inactiveColor` will be used as the background color for the controls. |
| policy | [BlurStyleActivePolicy](./cj-common-types.md#enum-blurstyleactivepolicy) | No | BlurStyleActivePolicy.ALWAYS_ACTIVE | **Named parameter.** Internal blur activation policy. |
| radius | Float64 | Yes | - | **Named parameter.** Blur radius, value range: [0, +∞).<br>Initial value: 0.0. |
| saturation | Float64 | No | 1.0 | **Named parameter.** Saturation, value range: [0, +∞), recommended range: [0, 50]. |

### enum BlurStyle

```cangjie
public enum BlurStyle {
    | BACKGROUND_THIN
    | BACKGROUND_REGULAR
    | BACKGROUND_THICK
    | BACKGROUND_ULTRA_THICK
    | COMPONENT_ULTRA_THIN
    | COMPONENT_THIN
    | COMPONENT_REGULAR
    | COMPONENT_THICK
    | COMPONENT_ULTRA_THICK
    | Regular
    | NONE
    | Thin
    | Thick
}
```

**Function:** Blur settings.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

#### BACKGROUND_THIN

```cangjie
BACKGROUND_THIN
```

**Function:** Close-range depth-of-field blur.

**Initial Version:** 12

#### BACKGROUND_REGULAR

```cangjie
BACKGROUND_REGULAR
```

**Function:** Mid-range depth-of-field blur.

**Initial Version:** 12

#### BACKGROUND_THICK

```cangjie
BACKGROUND_THICK
```

**Function:** Far-range depth-of-field blur.

**Initial Version:** 12

#### BACKGROUND_ULTRA_THICK

```cangjie
BACKGROUND_ULTRA_THICK
```

**Function:** Ultra-far-range depth-of-field blur.

**Initial Version:** 12

#### COMPONENT_ULTRA_THIN

```cangjie
COMPONENT_ULTRA_THIN
```

**Function:** Ultra-thin material blur for components.

**Initial Version:** 12

#### COMPONENT_THIN

```cangjie
COMPONENT_THIN
```

**Function:** Standard material blur for components.

**Initial Version:** 12#### COMPONENT_REGULAR

```cangjie
COMPONENT_REGULAR
```

**Function:** Regular material blur for components.

**Initial Version:** 12

#### COMPONENT_THICK

```cangjie
COMPONENT_THICK
```

**Function:** Thick material blur for components.

**Initial Version:** 12

#### COMPONENT_ULTRA_THICK

```cangjie
COMPONENT_ULTRA_THICK
```

**Function:** Ultra-thick material blur for components.

**Initial Version:** 12

#### NONE

```cangjie
NONE
```

**Function:** Disable blur effect.

**Initial Version:** 12

#### Regular

```cangjie
Regular
```

**Function:** Regular thickness material blur.

**Initial Version:** 12

#### Thin

```cangjie
Thin
```

**Function:** Lightweight material blur.

**Initial Version:** 12

#### Thick

```cangjie
Thick
```

**Function:** Thick material blur.

**Initial Version:** 12

#### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Get the numeric value of the enumeration.

**Return Value:**

|Type|Description|
| :-------   | :---------- |
| Int32   |  Numeric value of the enumeration.  |

### enum BlurStyleActivePolicy

```cangjie
public enum BlurStyleActivePolicy {
    | ALWAYS_ACTIVE
    | ALWAYS_INACTIVE
    | FOLLOWS_WINDOW_ACTIVE_STATE
}
```

**Function:** Blur effect configuration.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

#### ALWAYS_ACTIVE

```cangjie
ALWAYS_ACTIVE
```

**Function:** Blur effect is always active.

**Initial Version:** 19

#### ALWAYS_INACTIVE

```cangjie
ALWAYS_INACTIVE
```

**Function:** Blur effect is always inactive.

**Initial Version:** 19

#### FOLLOWS_WINDOW_ACTIVE_STATE

```cangjie
FOLLOWS_WINDOW_ACTIVE_STATE
```

**Function:** Blur effect follows window focus state - inactive when out of focus, active when in focus.

**Initial Version:** 19

#### getValue

```cangjie
public getValue(): Int32
```

**Function:** Get the numeric value of the enumeration.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Return Value:**

|Type|Description|
| :-------   | :---------- |
| Int32   |  Numeric value of the enumeration.  |