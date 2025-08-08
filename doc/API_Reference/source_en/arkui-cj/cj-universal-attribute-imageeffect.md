# Image Effects

Configure blur, shadow, spherical effects for components, and set image effects for pictures.

## func blendMode(BlendMode, BlendApplyType)

```cangjie
public func blendMode(value: BlendMode, `type`: BlendApplyType): This
```

**Function:** Blends the current control's content (including child node content) with the existing content on the underlying canvas (which may be an off-screen canvas).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [BlendMode](./cj-common-types.md#enum-blendmode) | Yes | \- | Blending mode.<br> Initial value: BlendMode.NONE.<br> **Note:** <br>When blending mode is set to BlendMode.NONE, the blend effect actually defaults to BlendMode.SRC_OVER, and BlendApplyType does not take effect. |
| blendType | [BlendApplyType](./cj-common-types.md#enum-blendapplytype) | Yes | \- | Whether blendMode is implemented off-screen.<br> **Note:** <br> 1. When BlendApplyType.FAST is set, it does not use off-screen.<br>2. When BlendApplyType.OFFSCREEN is set, an off-screen canvas of the current component's size will be created. The current component's content (including child components) will be drawn onto the off-screen canvas, then blended with the existing content on the underlying canvas using the specified blending mode. When this implementation is used, interfaces requiring screenshots such as [linearGradientBlur](#func-lineargradientblurfloat64-lineargradientbluroptions), [backgroundEffect](./cj-universal-attribute-background.md#func-backgroundeffectbackgroundeffectoptions), and [brightness](#func-brightnessfloat64) will not capture the correct image. |

## func blur(Float64)

```cangjie
public func blur(value: Float64): This
```

**Function:** Adds a content blur effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | \- | Adds a content blur effect to the current component. The input parameter is the blur radius. A larger radius results in more blur, and 0 means no blur. |

## func blur(Int64)

```cangjie
public func blur(value: Int64): This
```

**Function:** Adds a content blur effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int64 | Yes | \- | Adds a background blur effect to the current component. The input parameter is the blur radius. A larger radius results in more blur, and 0 means no blur. |

## func brightness(Float64)

```cangjie
public func brightness(value: Float64): This
```

**Function:** Adds a highlight effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | \- | Adds a highlight effect to the current component. The input parameter is the highlight ratio. A value of 1 has no effect. Values less than 1.0 darken the brightness (0.0 is completely black). Values greater than 1.0 increase brightness (higher values make it brighter). A brightness of 2.0 turns the image completely white.<br> Initial value: 1.0. <br>Range: [0.0, 2.0].<br>**Note:**<br> Values less than 0.0 are treated as 0.0. |

## func brightness(Int64)

```cangjie
public func brightness(value: Int64): This
```

**Function:** Adds a highlight effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int64 | Yes | \- | Adds a highlight effect to the current component. The input parameter is the highlight ratio. A value of 1 has no effect. Values less than 1 darken the brightness (0 is completely black). Values greater than 1 increase brightness (higher values make it brighter). A brightness of 2 turns the image completely white.<br> Initial value: 1. <br>Range: [0, 2].<br>**Note:**<br> Values less than 0 are treated as 0. |

## func colorBlend(ResourceColor)

```cangjie
public func colorBlend(color: ResourceColor): This
```

**Function:** Adds a color overlay effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| color | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | Yes | \- | Adds a color overlay effect to the current component. The input parameter is the overlay color. |

## func contrast(Float64)

```cangjie
public func contrast(value: Float64): This
```

**Function:** Adds a contrast effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | \- | Adds a contrast effect to the current component. The input parameter is the contrast value. A value of 1 displays the original image. Values greater than 1.0 increase contrast (higher values make the image sharper). Values less than 1.0 decrease contrast (lower values reduce clarity). A contrast of 0.0 turns the image completely gray.<br> Initial value: 1.0. <br>Recommended range: [0.0, 10.0).<br>**Note:**<br> Values less than 0.0 are treated as 0.0. |

## func contrast(Int64)

```cangjie
public func contrast(value: Int64): This
```

**Function:** Adds a contrast effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int64 | Yes | \- | Adds a contrast effect to the current component. The input parameter is the contrast value. A value of 1 displays the original image. Values greater than 1 increase contrast (higher values make the image sharper). Values less than 1 decrease contrast (lower values reduce clarity). A contrast of 0 turns the image completely gray.<br> Initial value: 1. <br>Recommended range: [0, 10).<br> **Note:** <br> Values less than 0 are treated as 0. |

## func freeze(Bool)

```cangjie
public func freeze(value: Bool): This
```

**Function:** Sets whether the current control and its child controls are rendered off-screen as a whole and cached for repeated drawing, without updating internal properties.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | \- | Whether the current control and its child controls are rendered off-screen as a whole and cached for repeated drawing, without updating internal properties. When the current control's opacity is not 1, the rendering effect may differ.<br> Initial value: false. <br> true: Rendered off-screen and cached for repeated drawing. false: Rendered off-screen but not cached for repeated drawing. |

## func grayscale(Float64)

```cangjie
public func grayscale(value: Float64): This
```

**Function:** Adds a grayscale effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | \- | Adds a grayscale effect to the current component. The value defines the grayscale conversion ratio. An input of 1.0 converts the image completely to grayscale. An input of 0.0 leaves the image unchanged. Inputs between 0.0 and 1.0 produce linear changes in effect. <br> Initial value: 0.0. <br>Range: [0.0, 1.0].<br>**Note:**<br> Values less than 0.0 are treated as 0.0. Values greater than 1.0 are treated as 1.0. |

## func grayscale(Int64)

```cangjie
public func grayscale(value: Int64): This
```

**Function:** Adds a grayscale effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int64 | Yes | \- | Adds a grayscale effect to the current component. The value defines the grayscale conversion ratio. An input of 1 converts the image completely to grayscale. An input of 0 leaves the image unchanged. Inputs between 0 and 1 produce linear changes in effect. <br> Initial value: 0. <br>Range: [0, 1].<br>**Note:**<br> Values less than 0 are treated as 0. Values greater than 1 are treated as 1. |

## func hueRotate(Float32)

```cangjie
public func hueRotate(value: Float32): This
```

**Function:** Hue rotation effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float32 | Yes | \- | Hue rotation effect. The input parameter is the rotation angle.<br>Initial value: 0.0. <br>Range: (-∞, +∞). <br>**Note:**<br> A 360-degree hue rotation displays the original color. Rotating 180 degrees first and then -180 degrees will also display the original color. |

## func hueRotate(Int32)

```cangjie
public func hueRotate(value: Int32): This
```

**Function:** Hue rotation effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int32 | Yes | \- | Hue rotation effect. The input parameter is the rotation angle.<br>Initial value: 0. <br>Range: (-∞, +∞). <br>**Note:**<br> A 360-degree hue rotation displays the original color. Rotating 180 degrees first and then -180 degrees will also display the original color. |

## func invert(Float64)

```cangjie
public func invert(value: Float64): This
```

**Function:** Inverts the input image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | \- | Inverts the input image. The input parameter is the inversion ratio. A value of 1.0 completely inverts the image, while 0.0 leaves it unchanged.<br> Initial value: 0.0. <br>Range: [0.0, 1.0].<br>**Note:**<br> Values less than 0.0 are treated as 0.0. |

## func invert(Int64)

```cangjie
public func invert(value: Int64): This
```

**Function:** Inverts the input image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int64 | Yes | \- | Inverts the input image. The input parameter is the inversion ratio. A value of 1 completely inverts the image, while 0 leaves it unchanged.<br> Initial value: 0. <br>Range: [0, 1].<br>**Note:**<br> Values less than 0 are treated as 0. |

## func invert(Float64, Float64, Float64, Float64)

```cangjie
public func invert(low!: Float64, high!: Float64, threshold!: Float64, thresholdRange!: Float64): This
```

**Function:** Inverts the input image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| low | Float64 | Yes | \- | **Named parameter.** Value when the background color's grayscale value is above the threshold range.<br> Range: [0,1]. |
| high | Float64 | Yes | \- | **Named parameter.** Value when the background color's grayscale value is below the threshold range.<br> Range: [0,1]. |
| threshold | Float64 | Yes | \- | **Named parameter.** Grayscale threshold.<br> Range: [0,1]. |
| thresholdRange | Float64 | Yes | \- | **Named parameter.** Threshold range.<br> Range: [0,1]. <br>**Note:**<br> The threshold range is formed by offsetting the grayscale threshold by thresholdRange. When the background color's grayscale value is within this range, the value transitions linearly from high to low. |

## func lightUpEffect(Float64)

```cangjie
public func lightUpEffect(value: Float64): This
```

**Function:** Sets the brightness level of a component's image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | \- | The brightness level of the component's image.<br> Valid range: [0,1].<br> If value equals 0, the image is completely black; if value equals 1, the image is fully bright. Values between 0 and 1 indicate increasing brightness. Values < 0 or > 1 are abnormal cases: values < 0 are treated as 0, and values > 1 are treated as 1. |

## func linearGradientBlur(Float64, LinearGradientBlurOptions)

```cangjie
public func linearGradientBlur(value: Float64, options: LinearGradientBlurOptions): This
```

**Function:** Adds a linear gradient blur effect to the component's content.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | \- | Blur radius. Larger values result in stronger blur; 0 means no blur.<br> Valid range: [0, 1000].<br> Linear gradient blur consists of two parts: fractionStops and direction. |
| options | [LinearGradientBlurOptions](#class-lineargradientbluroptions) | Yes | \- | The linear gradient blur effect. |

## func renderGroup(Bool)

```cangjie
public func renderGroup(value: Bool): This
```

**Function:** Sets whether the current control and its child controls are first rendered off-screen as a whole and then composited with the parent control.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | \- | Whether the current control and its child controls are first rendered off-screen as a whole and then composited with the parent control. Rendering effects may differ when the current control's opacity is not 1.<br> Default: false. |

## func pixelStretchEffect(Length, Length, Length, Length)

```cangjie
public func pixelStretchEffect(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp,
    left!: Length = 0.vp): This
```

**Function:** Sets the pixel stretch distance at the edges of the component's image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

> **Note:**
>
> - Positive values indicate outward expansion, enlarging the original image size. The edges are filled with edge pixels, and the fill distance is the set edge stretch distance.
> - Negative values indicate inward shrinkage, but the final image size remains unchanged.<br> Shrinkage method:<br> The image is shrunk based on the parameter settings, with the shrinkage size being the absolute values of the edge stretch distances in all four directions. The image is then expanded back to its original size using edge pixels.
> - Parameter constraints: The stretch directions for all four edges must be uniformly non-positive or non-negative (i.e., all edges expand outward or shrink inward).<br> All inputs must be either percentages or specific values; mixing percentages and specific values is not supported.<br> In all abnormal cases, the effect defaults to {0, 0, 0, 0}, i.e., the same as the original image.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| top | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** The pixel stretch distance at the top edge of the component's image. |
| right | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** The pixel stretch distance at the right edge of the component's image. |
| bottom | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** The pixel stretch distance at the bottom edge of the component's image. |
| left | [Length](./cj-common-types.md#interface-length) | No | 0.vp | **Named parameter.** The pixel stretch distance at the left edge of the component's image. |

## func saturate(Float64)

```cangjie
public func saturate(value: Float64): This
```

**Function:** Adds a saturation effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | \- | Adds a saturation effect to the current component. Saturation is the ratio of chromatic to achromatic (gray) components in a color. A value of 1 displays the original image; values > 1.0 increase chromatic components (higher saturation), while values < 1.0 increase achromatic components (lower saturation).<br> Default: 1.0.<br> Recommended range: [0.0, 50.0).<br>**Note:**<br> Values < 0.0 are treated as 0.0. |

## func saturate(Int64)

```cangjie
public func saturate(value: Int64): This
```

**Function:** Adds a saturation effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int64 | Yes | \- | Adds a saturation effect to the current component. Saturation is the ratio of chromatic to achromatic (gray) components in a color. A value of 1 displays the original image; values > 1 increase chromatic components (higher saturation), while values < 1 increase achromatic components (lower saturation).<br> Default: 1.<br> Recommended range: [0, 50).<br>**Note:**<br> Values < 0 are treated as 0. |

## func sepia(Float64)

```cangjie
public func sepia(value: Float64): This
```

**Function:** Converts the image to sepia tone.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | \- | Converts the image to sepia tone, reducing color saturation to create a warm, vintage style. The input value represents the sepia filter intensity: 1 results in a fully sepia image, values ≤ 0 leave the image unchanged, and values > 1 further amplify the color shift, making the image brighter and more yellow/red (non-standard sepia effect).<br> Valid range: [0.0, +∞), recommended range: (0.0, 1.0]. |

## func sepia(Int64)

```cangjie
public func sepia(value: Int64): This
```

**Function:** Converts the image to sepia tone.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int64 | Yes | \- | Converts the image to sepia tone, reducing color saturation to create a warm, vintage style. The input value represents the sepia filter intensity: 1 results in a fully sepia image, values ≤ 0 leave the image unchanged, and values > 1 further amplify the color shift, making the image brighter and more yellow/red (non-standard sepia effect).<br> Valid range: [0, +∞), recommended range: (0, 1]. |

## func shadow(Float64, ResourceColor, Float64, Float64)

```cangjie
public func shadow(
    radius!: Float64,
    color!: ResourceColor = Color(0x666666),
    offsetX!: Float64 = 0.0,
    offsetY!: Float64 = 0.0
): This
```

**Function:** Adds a shadow effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| radius | Float64 | Yes | \- | **Named parameter.** The blur radius of the shadow.<br> Valid range: [0, +∞).<br> Unit: px.<br>**Note:**<br> Values < 0 are treated as 0. |
| color | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | No | 0x666666 | **Named parameter.** The color of the shadow. |
| offsetX | Float64 | No | 0.0 | **Named parameter.** The X-axis offset of the shadow.<br> Unit: px. |
| offsetY | Float64 | No | 0.0 | **Named parameter.** The Y-axis offset of the shadow.<br> Unit: px. |

## func shadow(Int64, ResourceColor, Int64, Int64)

```cangjie
public func shadow(
    radius!: Int64,
    color!: ResourceColor = Color(0x666666),
    offsetX!: Int64 = 0,
    offsetY!: Int64 = 0
): This
```

**Function:** Adds a shadow effect to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| radius | Int64 | Yes | \- | **Named parameter.** The blur radius of the shadow.<br> Valid range: [0, +∞).<br> Unit: px.<br>**Note:**<br> Values < 0 are treated as 0. |
| color | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | No | 0x666666 | **Named parameter.** The color of the shadow. |
| offsetX | Int64 | No | 0 | **Named parameter.** The X-axis offset of the shadow.<br> Unit: px. |
| offsetY | Int64 | No | 0 | **Named parameter.** The Y-axis offset of the shadow.<br> Unit: px. |

## func sphericalEffect(Float64)

```cangjie
public func sphericalEffect(value: Float64): This
```

**Function:** Sets the spherical effect level of the component's image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | \- | Sets the spherical effect level of the component's image.<br> Valid range: [0,1].<br> **Note:** <br> 1. A value of 0 leaves the image unchanged, while 1 results in a fully spherical effect. Values between 0 and 1 increase the spherical effect. Values < 0 or > 1 are abnormal cases: values < 0 are treated as 0, and values > 1 are treated as 1. <br> 2. Component shadows and outlines do not support the spherical effect.<br> 3. When value > 0, the component freezes and renders to an off-screen transparent buffer. To update component properties, set value to 0. |

## func systemBarEffect()

```cangjie
public func systemBarEffect(): This
```

**Function:** Applies intelligent color inversion with a blur effect based on the background.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

## func useShadowBatching(Bool)

```cangjie
public func useShadowBatching(value: Bool): This
```

**Function:** Enables shadow batching for child nodes within the control, causing shadows of same-layer elements to overlap.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | \- | Enables shadow batching for child nodes within the control, causing shadows of same-layer elements to overlap. <br> Default: false.<br>**Note:** <br> 1. By default, shadows of child nodes with large radii will overlap. When enabled, shadows of elements will not overlap.<br>2. Nested use of useShadowBatching is not recommended. If nested, it only affects the current child nodes and does not propagate. |

## Basic Type Definitions

### class LinearGradientBlurOptions

```cangjie
public class LinearGradientBlurOptions {
    public LinearGradientBlurOptions(
        public var fractionStops!: Array<(Float64, Float64)>,
        public var direction!: GradientDirection
    )
}
```

**Function:** Sets the linear gradient blur effect.

**Initial Version:** 19

#### var direction

```cangjie
public var direction: GradientDirection
```

**Function:** The direction of the gradient blur.

**Type:** [GradientDirection](./cj-common-types.md#enum-gradientdirection)

**Read/Write:** Read-Write

**Initial Version:** 19

#### var fractionStops

```cangjie
public var fractionStops: Array<(Float64, Float64)>
```

**Function:** Each tuple in the array (values 0-1, < 0 treated as 0, > 1 treated as 1) represents [blur intensity, blur position].

**Type:** Array\<(Float64, Float64)>

**Read/Write:** Read-Write

**Initial Version:** 19

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 19> **Note:**
>
> The blur positions must be strictly increasing. If the data provided by developers does not comply with the specifications, it will be logged. The gradient blur array must contain at least 2 tuples; otherwise, the gradient blur effect will not be applied.

#### LinearGradientBlurOptions(Array\<(Float64, Float64)>, GradientDirection)

```cangjie
public LinearGradientBlurOptions(
    public var fractionStops!: Array<(Float64, Float64)>,
    public var direction!: GradientDirection
)
```

**Function:** Creates a LinearGradientBlurOptions object.

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fractionStops | Array\<(Float64, Float64)> | Yes | \- | **Named parameter.** Each tuple in the array (values between 0-1, clamped to 0 if less than 0 and to 1 if greater than 1) represents [blur intensity, blur position]. The blur positions must be strictly increasing. If the data provided by developers does not comply with the specifications, it will be logged. The gradient blur array must contain at least 2 tuples; otherwise, the gradient blur effect will not be applied. |
| direction | [GradientDirection](./cj-common-types.md#enum-gradientdirection) | Yes | \- | **Named parameter.** The direction of the gradient blur. <br>Default: GradientDirection.Bottom. |

## Example Code

### Example 1 (Setting Different Image Effects)

Configures various image effects, including shadow, grayscale, highlight, saturation, contrast, inversion, color blending, hue rotation, etc.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    @State
    var cnt: Int64 = 0
    func build() {
        Scroll() {
            Column(10) {
                Text("font blur")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Flex(FlexParams(alignItems: ItemAlign.Center)) {
                    Text("original text")
                        .margin(10)
                    Text("blur text")
                        .blur(5)
                        .margin(10)
                    Text("blur text")
                        .blur(10)
                        .margin(10)
                    Text("blur text")
                        .blur(15)
                        .margin(10)
                }
                    .width(90.percent)
                    .height(40)
                    .backgroundColor(0xF9CF93)

                // Blurring the background
                Text("backdropBlur")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Text("")
                    .width(90.percent)
                    .height(40)
                    .fontSize(16)
                    .backdropBlur(3)
                    .backgroundImage(src: @r(app.media.icon))
                    .backgroundImageSize(width: 300, height: 160)

                Text("shadow")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .shadow(radius: 10)
                    .height(40)

                // Grayscale effect (0~1). The closer to 1, the more pronounced the grayscale.
                Text("grayscale")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                Image(@r(app.media.icon))
                    .grayscale(0.3)
                    .height(40)
                Image(@r(app.media.icon))
                    .grayscale(0.8)
                    .height(40)

                // Highlight effect. 1 represents the normal image; values < 1 darken the image, while values > 1 increase brightness.
                Text("brightness")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                Image(@r(app.media.icon))
                    .brightness(1.8)
                    .height(40)
                Image(@r(app.media.icon))
                    .brightness(0)
                    .height(40)

                // Saturation. The original image has a value of 1.
                Text("saturate")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .saturate(2.0)
                    .height(40)
                Image(@r(app.media.icon))
                    .saturate(0.7)
                    .height(40)

                // Contrast. 1 represents the original image; values > 1 increase clarity, while values < 1 reduce it.
                Text("contrast")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .contrast(2.0)
                    .height(40)
                Image(@r(app.media.icon))
                    .contrast(0.8)
                    .height(40)

                // Image inversion ratio
                Text("invert")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .invert(0.2)
                    .height(40)
                Image(@r(app.media.icon))
                    .invert(0.8)
                    .height(40)

                // Color blending
                Text("colorBlend")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .colorBlend(Color.GREEN)
                    .height(40)
                Image(@r(app.media.icon))
                    .colorBlend(Color.BLUE)
                    .height(40)

                // Sepia effect
                Text("sepia")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .sepia(0.8)
                    .height(40)

                // Hue rotation
                Text("hueRotate")
                    .fontSize(15)
                    .fontColor(0xCCCCCC)
                    .width(90.percent)
                Image(@r(app.media.icon))
                    .hueRotate(90)
                    .height(40)
            }
        }
    }
}
```

![uni_image_effect](figures/uni_image_effect.png)

### Example 2 (Setting Different Image Transformation Effects)

This example demonstrates:
- Using `invert` for intelligent foreground color inversion.
- Using `pixelStretchEffect` to set the edge pixel extension effect of a component's image.
- Using `blendMode` to blend the current component's content with the canvas below.
- Using `lightUpEffect` to set the image brightening effect of a component.
- Using `sphericalEffect` to set the spherical distortion effect of a component's image.
- Using `renderGroup` to determine whether a component is rendered off-screen first and then merged with the parent control.
- Using `systemBarEffect` for intelligent inversion of the system navigation bar.
- Using `useShadowBatching` with `shadow` to achieve non-overlapping shadows within the same layer.
- Using `freeze` to determine whether the current control and its children are rendered off-screen and cached for repeated drawing.
- Using `linearGradientBlur` to set the linear gradient blur effect of a component's content.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import ohos.resource_manager.{AppResource, __GenerateResource__}

@Entry
@Component
class EntryView {
    public func build() {
        Scroll() {
            Column() {
                Text("invert").margin(5)
                Stack() {
                    Column()
                    Stack() {
                        Image(@r(app.media.background))
                        Column() {
                            Column()
                                .width(100.percent)
                                .height(30.vp)
                                .invert(
                                    low: 0.0,
                                    high: 1.0,
                                    threshold: 0.5,
                                    thresholdRange: 0.2
                                )
                            Column()
                                .width(100.percent)
                                .height(30.vp)
                                .invert(
                                    low: 0.2,
                                    high: 0.5,
                                    threshold: 0.3,
                                    thresholdRange: 0.2
                                )
                        }
                    }
                    .width(100.vp)
                    .height(100.vp)
                }

                Text("pixelStretchEffect").margin(5)
                Column() {
                    Text('This is the text content with letterSpacing 0.')
                        .letterSpacing(0)
                        .fontSize(12)
                        .borderWidth(1.vp)
                        .padding(10.vp)
                        .width(50.percent)
                        .pixelStretchEffect(top: 5.vp, left: 20.vp, bottom: 10.vp)
                        .id("test_pixelStretchEffect")
                }
                .width(200.vp)
                .height(110.vp)
                Column() {
                    Text('This is the text content with letterSpacing 0.')
                        .letterSpacing(0)
                        .fontSize(12)
                        .borderWidth(1.vp)
                        .padding(10.vp)
                        .width(50.percent)
                }
                .width(200.vp)
                .height(110.vp)

                Text("blendMode")
                Column() {
                    Column() {
                        Text("Blue")
                            .width(40)
                            .height(40)
                            .backgroundColor(Color.BLUE)
                        Text("red")
                            .width(40)
                            .height(40)
                            .backgroundColor(Color.RED)
                            .position(x: 20, y: 20)
                    }
                        .height(80)
                        .width(100)
                        .blendMode(BlendMode.OVERLAY, BlendApplyType.OFFSCREEN)
                        .id("test_blendMode")
                }
                    .height(90)
                    .width(200)
                    .backgroundImage(repeat: ImageRepeat.X, src: @r(app.media.background))

                Text("lightUpEffect")
                Text('This is the text content with letterSpacing 0.')
                    .borderWidth(1)
                    .padding(10)
                    .width(100)
                    .lightUpEffect(0.6)
                    .id("test_lightUpEffect")

                Text("sphericalEffect")
                TextInput(placeholder: "Enter the transformation range percentage ([0%,100%])")
                    .width(200)
                    .height(35)
                    .caretColor(Color.RED)
                    .placeholderColor(Color.BLUE)
                    .placeholderFont(size: 20.vp)
                    .sphericalEffect(0.5)
                    .id("test_sphericalEffect")

                Text("renderGroup")
                Column() {
                    Row() {
                        Row() {
                            Row()
                                .backgroundColor(Color.BLACK)
                                .width(100.vp)
                                .height(100.vp)
                                .opacity(1)
                        }
                        .backgroundColor(Color.WHITE)
                        .width(150.vp)
                        .height(150.vp)
                        .justifyContent(FlexAlign.CENTER)
                        .opacity(0.6)
                        .renderGroup(true)
                    }
                    .backgroundColor(Color.BLACK)
                    .width(200)
                    .height(200)
                    .justifyContent(FlexAlign.CENTER)
                    .opacity(1)
                    .margin(20.vp)

                    Row() {
                        Row() {
                            Row()
                                .backgroundColor(Color.BLACK)
                                .width(100.vp)
                                .height(100.vp)
                                .opacity(1)
                        }
                        .backgroundColor(Color.WHITE)
                        .width(150.vp)
                        .height(150.vp)
                        .justifyContent(FlexAlign.CENTER)
                        .opacity(0.6)
                        .renderGroup(false)
                        .id("test_renderGroup")
                    }
                    .backgroundColor(Color.BLACK)
                    .width(200)
                    .height(200)
                    .justifyContent(FlexAlign.CENTER)
                    .opacity(1)
                    .margin(20.vp)
                }
                .width(380.vp)
                .height(500.vp)

                Text("systemBarEffect")
                Stack() {
                    Image("")
                        .width(100)
                        .height(100)
                        .backgroundColor(Color.BLUE)
                    Column()
                        .width(80)
                        .height(10)
                        .systemBarEffect()
                        .borderRadius(5)
                        .margin(bottom: 20)
                        .id("test_systemBarEffect")
                }

                Text("useShadowBatching")
                Column() {
                    Column() {
                    }
                    .width(200)
                    .height(30)
                    .margin(top: 5)
                    .backgroundColor(0xFFE4C4)
                    .shadow(radius: 120, color: Color.GREEN, offsetX: 0, offsetY: 0)

                    Column() {
                    }
                    .width(200)
                    .height(30)
                    .margin(top: 5)
                    .backgroundColor(0xFFE4C4)
                    .shadow(radius: 120, color: Color.RED, offsetX: 0, offsetY: 0)
                    .backgroundColor(Color.WHITE)
                }
                .borderWidth(1)
                .width(300)
                .height(100)
                .useShadowBatching(true)
                .id("test_useShadowBatching")

                Text("freeze")
                Column() {
                    Text("freeze: true")
                        .width(100)
                        .height(40)
                        .backgroundColor(Color.BLUE)
                }
                .opacity(0.5)
                .freeze(true)
                .id("test_freeze")
                Column() {
                    Text("freeze: false")
                        .width(100)
                        .height(40)
                        .backgroundColor(Color.BLUE)
                }
                .opacity(0.5)
                .freeze(false)

                Text("linearGradientBlur")
                Image(@r(app.media.startIcon))
                    .linearGradientBlur(
                        60.0,
                        LinearGradientBlurOptions(fractionStops: [(0.0, 0.0), (0.0, 0.33), (1.0, 0.66), (1.0, 1.0)],
                        direction: GradientDirection.BOTTOM)
                    )
                    .width(200)
                    .height(200)
                    .id("test_linearGradientBlur")
            }
            .width(380)
            .borderWidth(1)
            .backgroundColor(Color.GRAY)
        }
    }
}
```

![uni_image_effect](figures/uni_image_effect_1.png)

![uni_image_effect](figures/uni_image_effect_2.png)

![uni_image_effect](figures/uni_image_effect_3.png)