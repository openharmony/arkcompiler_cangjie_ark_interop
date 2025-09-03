# Image

The Image component is used to display images in applications. It supports image formats including png, jpg, jpeg, bmp, svg, webp, gif, and heif.

> **Notes:**
>
> - When copying the Image component using shortcut keys, the component must be in a [focused state](./cj-universal-attribute-focus.md#func-focusontouchbool). By default, the Image component is not focusable. To enable focus, set the [focusable](cj-apis-window.md#var-focusable) attribute to true, allowing the TAB key to shift focus to the component. Then, set the [focusOnTouch](./cj-universal-attribute-focus.md#func-focusontouchbool) attribute to true to enable focus on click.
> - The component supports SVG image sources. For SVG tag documentation, refer to [SVG Tag Specifications](../apis/ImageKit/cj-apis-image.md#svg标签说明).
> - Animated image playback depends on the visibility changes of the Image node. By default, playback is disabled. When the node becomes visible, the animation starts via callback; when the node becomes invisible, the animation stops. Visibility state is determined by the [onVisibleAreaChange](./cj-ui-framework.md#func-onvisibleareachangearrayfloat64-boolfloat64---unit) event. When the visibility threshold ratios is greater than 0, the Image is considered visible.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Required Permissions

When using network images, add the internet usage permission `ohos.permission.INTERNET` to the "requestPermissions" section in module.json5.

```json
"requestPermissions": [
    { "name": "ohos.permission.INTERNET"}
]
```

## Child Components

None

## Creating the Component

### init(ResourceStr)

```cangjie
public init(src: ResourceStr)
```

**Function:** Obtains an image from the specified data source for subsequent rendering and display.

> **Notes:**
>
> - If the Image component fails to load the image or the image dimensions are 0, the component size automatically becomes 0 and does not follow the parent component's layout constraints.
> - By default, the Image component centers and crops the image. For example, if the component's width and height are set equally but the original image has unequal dimensions, the middle area is cropped.
> - If the Image loads successfully and no width or height is set for the component, its display size adapts to the parent component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | The image data source.<br/>ResourceStr can be used to load both network and local images. |

### init(PixelMap)

```cangjie
public init(src: PixelMap)
```

**Function:** Obtains an image from the specified data source for subsequent rendering and display.

> **Notes:**
>
> - If the Image component fails to load the image or the image dimensions are 0, the component size automatically becomes 0 and does not follow the parent component's layout constraints.
> - By default, the Image component centers and crops the image. For example, if the component's width and height are set equally but the original image has unequal dimensions, the middle area is cropped.
> - If the Image loads successfully and no width or height is set for the component, its display size adapts to the parent component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | [PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap) | Yes | - | The image data source.<br/>PixelMap is a pixel-based format, commonly used for image editing scenarios. |

## Common Attributes/Common Events

Common Attributes: All supported.

> **Note:**
>
> The Image component does not support the common attribute [foregroundColor](./cj-universal-attribute-foregroundcolor.md#func-foregroundcolorresourcecolor). Instead, use the Image component's [fillColor](#func-fillcolorresourcecolor) attribute to set the fill color.

Common Events: All supported.

## Component Attributes

### func alt(ResourceStr)

```cangjie
public func alt(src: ResourceStr): This
```

**Function:** Sets the placeholder image displayed during image loading.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| src | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | The placeholder image displayed during loading. Does not support local images (png, jpg, bmp, svg, gif, and heif types), but supports network images. |

### func autoResize(Bool)

```cangjie
public func autoResize(autoResize: Bool): This
```

**Function:** Sets whether to automatically scale the image source during decoding.

> **Note:**
>
> This operation determines the source dimensions for drawing based on the display area size, helping reduce memory usage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| autoResize | Bool | Yes | - | Whether to automatically scale the image source during decoding. When set to true, the component determines the source dimensions for drawing based on the display area size, reducing memory usage. For example, if the original image is 1920x1080 and the display area is 200x200, the image will be downsampled to 200x200, significantly saving memory.<br/>Default: false. |

### func fillColor(ResourceColor)

```cangjie
public func fillColor(value: ResourceColor): This
```

**Function:** Sets the fill color for SVG images. Only applies to SVG sources.

> **Note:**
>
> To modify the color of PNG images, use [colorFilter](#class-colorfilter).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | The fill color.<br/>By default, no fill is applied. If an invalid value is provided, the system uses the default theme color: black in light mode and white in dark mode. |

### func fitOriginalSize(Bool)

```cangjie
public func fitOriginalSize(isFitOriginalSize: Bool): This
```

**Function:** Sets whether the display size of the image follows the source dimensions. If the Image component's size is not set, its display size will follow the source dimensions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| isFitOriginalSize | Bool | Yes | - | Whether to follow the source dimensions.<br/>Default: false. |

### func interpolation(ImageInterpolation)

```cangjie
public func interpolation(interpolation: ImageInterpolation): This
```

**Function:** Sets the interpolation effect for the image.

> **Notes:**
>
> - Reduces aliasing issues when low-resolution images are displayed at larger sizes. Only applies to upscaled images.
> - SVG sources do not support this attribute.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| interpolation | [ImageInterpolation](#enum-imageinterpolation) | Yes | - | The interpolation effect for the image.<br/>Default: ImageInterpolation.Low. |

### func matchTextDirection(Bool)

```cangjie
public func matchTextDirection(isMatchTextDirection: Bool): This
```

**Function:** Sets whether the image mirrors its display in RTL (right-to-left) language environments.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| isMatchTextDirection | Bool | Yes | - | Whether to follow the system language direction.<br/>Default: false. |

### func objectFit(ImageFit)

```cangjie
public func objectFit(value: ImageFit): This
```

**Function:** Sets the fill effect for the image.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [ImageFit](./cj-common-types.md#enum-imagefit) | Yes | - | The fill effect for the image.<br/>Default: ImageFit.Cover. |

### func objectRepeat(ImageRepeat)

```cangjie
public func objectRepeat(objectRepeat: ImageRepeat): This
```

**Function:** Sets the repeat style for the image.

> **Notes:**
>
> - Repeats from the center outward, truncating if insufficient space remains for another image.
> - SVG sources do not support this attribute.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| objectRepeat | [ImageRepeat](./cj-common-types.md#enum-imagerepeat) | Yes | - | The repeat style for the image.<br/>Default: ImageRepeat.NoRepeat. |

### func renderMode(ImageRenderMode)

```cangjie
public func renderMode(renderMode: ImageRenderMode): This
```

**Function:** Sets the rendering mode for the image.

> **Notes:**
>
> - SVG sources do not support this attribute.
> - If [ColorFilter](#class-colorfilter) is set, this attribute does not take effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| renderMode | [ImageRenderMode](#enum-imagerendermode) | Yes | - | The rendering mode for the image (original color or black).<br/>Default: ImageRenderMode.Original. |

### func sourceSize(Length, Length)

```cangjie
public func sourceSize(width: Length, height: Length): This
```

**Function:** Decodes the original image into a PixelMap with the specified dimensions. PixelMap resources do not support this function.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| width | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The decoded image width.<br>Unit: vp. |
| height | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | The decoded image height.<br>Unit: vp. |

### func syncLoad(Bool)

```cangjie
public func syncLoad(syncLoad: Bool): This
```

**Function:** Sets whether to load the image synchronously.

> **Note:**
>
> For small local images, set `syncLoad` to true since the loading time is short and can be executed on the main thread.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| syncLoad | Bool | Yes | - | Whether to load the image synchronously. By default, loading is asynchronous. Synchronous loading blocks the UI thread and does not display a placeholder.<br/>Default: false. |

## Component Events

### func onComplete(ImageCompleteCallback)

```cangjie
public func onComplete(callback: ImageCompleteCallback): This
```

**Function:** Triggered when the image loads successfully, returning the loaded image dimensions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [ImageCompleteCallback](<font color="red" face="bold">please add link</font>) | Yes | - | Callback function triggered when the image loads successfully. |

### func onError(ImageErrorCallback)

```cangjie
public func onError(callback: ImageErrorCallback): This
```

**Function:** Triggered when an error occurs during image loading.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [ImageErrorCallback](<font color="red" face="bold">please add link</font>) | Yes | - | Callback function triggered when an error occurs during image loading. |

### func onFinish(() -> Unit)

```cangjie
public func onFinish(callback: () -> Unit): This
```

**Function:** Triggered when an animated SVG image finishes playing. If the animation is set to loop infinitely, this event will not be triggered.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | () -> Unit | Yes | - | Callback function triggered when the SVG animation finishes playing. |

## Basic Type Definitions

### class ColorFilter

```cangjie
public class ColorFilter {
    public init(array: Array<Float32>)
}
```

**Function:** A color filter matrix.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### init(Array\<Float32>)

```cangjie
public init(array: Array<Float32>)
```

**Function:** Constructs a color filter matrix.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| array | Array\<Float32> | Yes | - | A 4x5 filter matrix. |### class ImageLoadResult

```cangjie
public class ImageLoadResult {
    public var width: Float64 = 0.0
    public var height: Float64 = 0.0
    public var componentWidth: Float64 = 0.0
    public var componentHeight: Float64 = 0.0
    public var loadingStatus: Int32 = 0
    public var contentWidth: Float64 = 0.0
    public var contentHeight: Float64 = 0.0
    public var contentOffsetX: Float64 = 0.0
    public var contentOffsetY: Float64 = 0.0
}
```

**Function:** Image loading success type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var componentHeight

```cangjie
public var componentHeight: Float64 = 0.0
```

**Function:** Height of the component, in px.

**Type:** Float64

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var componentWidth

```cangjie
public var componentWidth: Float64 = 0.0
```

**Function:** Width of the component, in px.

**Type:** Float64

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var contentHeight

```cangjie
public var contentHeight: Float64 = 0.0
```

**Function:** Actual rendered height of the image, in px.

> **Note:**
>
> Valid only when loadingStatus returns 1.

**Type:** Float64

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var contentOffsetX

```cangjie
public var contentOffsetX: Float64 = 0.0
```

**Function:** X-axis offset of the actual rendered content relative to the component itself, in px.

> **Note:**
>
> Valid only when loadingStatus returns 1.

**Type:** Float64

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var contentOffsetY

```cangjie
public var contentOffsetY: Float64 = 0.0
```

**Function:** Y-axis offset of the actual rendered content relative to the component itself, in px.

> **Note:**
>
> Valid only when loadingStatus returns 1.

**Type:** Float64

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var contentWidth

```cangjie
public var contentWidth: Float64 = 0.0
```

**Function:** Actual rendered width of the image, in px.

> **Note:**
>
> Valid only when loadingStatus returns 1.

**Type:** Float64

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var height

```cangjie
public var height: Float64 = 0.0
```

**Function:** Height of the image, in px.

**Type:** Float64

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var loadingStatus

```cangjie
public var loadingStatus: Int32 = 0
```

**Function:** Status of successful image loading.

**Type:** Int32

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var width

```cangjie
public var width: Float64 = 0.0
```

**Function:** Width of the image, in px.

**Type:** Float64

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### enum ImageInterpolation

```cangjie
public enum ImageInterpolation <: Equatable<ImageInterpolation> {
    | None
    | High
    | Medium
    | Low
    | ...
}
```

**Function:** Image interpolation method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ImageInterpolation>

#### High

```cangjie
High
```

**Function:** High-quality interpolation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Low

```cangjie
Low
```

**Function:** Low-quality interpolation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Medium

```cangjie
Medium
```

**Function:** Medium-quality interpolation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### None

```cangjie
None
```

**Function:** No interpolation.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func !=(ImageInterpolation)

```cangjie
public operator func !=(other: ImageInterpolation): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[ImageInterpolation](#enum-imageinterpolation)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are not equal, otherwise returns false.|

#### func ==(ImageInterpolation)

```cangjie
public operator func ==(other: ImageInterpolation): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[ImageInterpolation](#enum-imageinterpolation)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are equal, otherwise returns false.|

### enum ImageRenderMode

```cangjie
public enum ImageRenderMode <: Equatable<ImageRenderMode> {
    | Original
    | Template
    | ...
}
```

**Function:** Image rendering mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<ImageRenderMode>

#### Original

```cangjie
Original
```

**Function:** Renders the image as-is, including colors.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Template

```cangjie
Template
```

**Function:** Renders the image as a template, ignoring color information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func !=(ImageRenderMode)

```cangjie
public operator func !=(other: ImageRenderMode): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[ImageRenderMode](#enum-imagerendermode)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are not equal, otherwise returns false.|

#### func ==(ImageRenderMode)

```cangjie
public operator func ==(other: ImageRenderMode): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[ImageRenderMode](#enum-imagerendermode)|Yes|-|Another enumeration value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are equal, otherwise returns false.|

## Example Code

### Example 1 (Loading Basic Image Types)

Loading basic image types such as png, gif, svg, and jpg.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.__GenerateResource__

@Entry
@Component
class EntryView {
    func build() {
        Flex(FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Start)) {
                Row() {
                    // Load png format image
                    Image(@r(app.media.startIcon))
                    .width(110)
                    .height(110)
                    .margin(15)
                    .overlay(title: "png", align: Alignment.Bottom, offset: ContentOffset(x: 0, y: 20))
                    // Load gif format image
                    Image(@r(app.media.list))
                    .width(110).height(110).margin(15)
                    .overlay(title: "gif", align: Alignment.Bottom, offset: ContentOffset(x: 0, y: 20))
                }
                Row() {
                    // Load svg format image
                    Image(@r(app.media.svg))
                    .width(110)
                    .height(110)
                    .margin(15)
                    .overlay(title: "svg", align: Alignment.Bottom, offset: ContentOffset(x: 0, y: 20))
                    // Load jpg format image
                    Image(@r(app.media.startIcon_jpg))
                    .width(110)
                    .height(110)
                    .margin(15)
                    .overlay(title: "jpg", align: Alignment.Bottom, offset: ContentOffset(x: 0, y: 20))
                }
            }
            .height(320)
            .width(360)
            .padding(right: 10, top: 10)
    }
}
```

![image1](figures/image1.gif)### Example 2 (Adding Events to Images)

Adding onClick and onFinish events to images.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.AppResource
import kit.LocalizationKit.__GenerateResource__

@Entry
@Component
class EntryView {
    let imageOne: AppResource= @r(app.media.startIcon)
    let imageTwo = @r(app.media.background)
    let imageThree = @r(app.media.svg_move)
    @State var src: AppResource = this.imageOne
    @State var src2: AppResource = this.imageThree

    func build() {
        Column(){
            // Add click event to the image; load a specific image after clicking
            Image(this.src)
            .width(100)
            .height(100)
            .onClick{
                    evt =>
                    this.src =this.imageTwo
            }
            // When loading an SVG format image
            Image(this.src2)
            .width(100)
            .height(100)
            .onFinish{
                    // Load another image when SVG animation playback completes
                    =>
                    this.src2 =this.imageOne
            }
        }
    }
}
```

![image2](figures/image2.gif)

### Example 3 (Applying Color Filter Effects to Images)

This example demonstrates applying color filter effects to images using colorFilter.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.AppResource
import kit.LocalizationKit.__GenerateResource__

@Entry
@Component
class EntryView {
    let blueColor = ColorFilter([0.38, 0.0, 0.0, 0.0, 0.0,
                                0.0, 0.81, 0.0, 0.0, 0.0,
                                0.0, 0.0, 0.43, 0.0, 0.0,
                                0.0, 0.0, 0.0, 1.0, 0.0])
    let colorFilter = ColorFilter([1.0, 0.0, 1.0, 0.0, 1.0,
                                   0.0, 0.0, 0.0, 1.0, 0.0,
                                   1.0, 0.0, 1.0, 0.0, 0.0,
                                   0.0, 1.0, 0.0, 1.0, 0.0])

    @State var DrawingColorFilterFirst: ColorFilter = blueColor
    @State var DrawingColorFilterSecond: ColorFilter = colorFilter

    func build() {
        Column(5){
            Image(@r(app.media.startIcon))
            .width(100)
            .height(100)
            .colorFilter(this.DrawingColorFilterFirst)
            .onClick{
                    evt =>
                    this.DrawingColorFilterFirst = colorFilter
            }
            Image(@r(app.media.startIcon))
            .width(110)
            .height(110)
            .margin(15)
            .colorFilter(this.DrawingColorFilterSecond)
            .onClick{
                    evt =>
                    this.DrawingColorFilterSecond = blueColor
            }
        }
    }
}
```

![image3](figures/image3.gif)

### Example 4 (Setting Fill Effects for Images)

This example demonstrates setting fill effects for images using objectFit.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.__GenerateResource__

@Entry
@Component
class EntryView {
    func build() {
        Flex(FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Start)) {
                Row() {
                    // Load PNG format image
                    Image(@r(app.media.startIcon))
                    .width(110)
                    .height(110)
                    .margin(15)
                    .overlay(title: "png", align: Alignment.Bottom, offset: ContentOffset(x: 0, y: 20))
                    .border(width: 2, color: Color.PINK)
                    .objectFit(ImageFit.TOP_START)
                    // Load GIF format image
                    Image(@r(app.media.list))
                    .width(110)
                    .height(110)
                    .margin(15)
                    .overlay(title: "gif", align: Alignment.Bottom, offset: ContentOffset(x: 0, y: 20))
                    .border(width: 2, color: Color.PINK)
                    .objectFit(ImageFit.BOTTOM_START)
                }
                Row() {
                    // Load SVG format image
                    Image(@r(app.media.svg))
                    .width(110)
                    .height(110)
                    .margin(15)
                    .overlay(title: "svg", align: Alignment.Bottom, offset: ContentOffset(x: 0, y: 20))
                    .border(width: 2, color: Color.PINK)
                    .objectFit(ImageFit.TOP_END)
                    // Load JPG format image
                    Image(@r(app.media.startIcon_jpg))
                    .width(110)
                    .height(110)
                    .margin(15)
                    .overlay(title: "jpg", align: Alignment.Bottom, offset: ContentOffset(x: 0, y: 20))
                    .border(width: 2, color: Color.PINK)
                    .objectFit(ImageFit.CENTER)
                }
            }
            .height(320)
            .width(360)
            .padding(right: 10, top: 10)
    }
}
```

![image4](figures/image4.gif)

### Example 5 (Switching Between Different Image Types)

This example demonstrates the display effects of PNG and SVG types as data sources.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.AppResource
import kit.LocalizationKit.__GenerateResource__

@Entry
@Component
class EntryView {
    let imageOne: AppResource= @r(app.media.startIcon)
    let imageTwo = @r(app.media.svg_move)
    @State var imageSrcIndex : Int64 = 0
    @State var imageSrcList : Array<AppResource> = [this.imageOne,this.imageTwo]

    func build() {
        Column(){
            Image(this.imageSrcList[this.imageSrcIndex])
                .width(100)
                .height(100)
            Button("Click to switch Image src")
                .padding(20)
                .onClick{
                    evt =>
                    this.imageSrcIndex = (this.imageSrcIndex + 1) % 2
            }
        }
    }
}
```

![image5](figures/image5.gif)

### Example 6 (Setting Image Decoding Size via sourceSize)

This example customizes the decoding size of images using the [sourceSize](#func-sourcesizelength-length) interface.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.AppResource
import kit.LocalizationKit.__GenerateResource__
import ohos.arkui.component.ImageFit

@Entry
@Component
class EntryView {
    @State var borderRadiusValue : Int64 = 10

    func build() {
        Column(){
            Image(@r(app.media.image))
                .sourceSize(500,500)
                .width(300)
                .height(300)
            Image(@r(app.media.image))
                .sourceSize(10,10)
                .width(300)
                .height(300)
                .borderWidth(1)
        }
        .height(100.percent)
        .width(100.percent)
    }
}
```

![image6](figures/image6_api.png)

### Example 7 (Setting Image Rendering Mode via renderMode)

This example sets the image rendering mode to grayscale using the [renderMode](#func-rendermodeimagerendermode) interface.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.AppResource
import kit.LocalizationKit.__GenerateResource__
import ohos.arkui.component.ImageFit

@Entry
@Component
class EntryView {
    @State var borderRadiusValue : Int64 = 10

    func build() {
        Column(){
            Image(@r(app.media.image))
                .renderMode(ImageRenderMode.Template)
                .width(300)
                .height(300)
        }
        .height(100.percent)
        .width(100.percent)
    }
}
```

![image7](figures/image7_api.png)

### Example 8 (Setting Image Repeat Style via objectRepeat)

This example repeats the image drawing on the vertical axis using the [objectRepeat](#func-objectrepeatimagerepeat) interface.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.AppResource
import kit.LocalizationKit.__GenerateResource__
import ohos.arkui.component.ImageFit

@Entry
@Component
class EntryView {
    @State var borderRadiusValue : Int64 = 10
    func build() {
        Column(){
            Image(@r(app.media.image))
                .objectRepeat(ImageRepeat.Y)
                .width(120)
                .height(300)
                .objectFit(ImageFit.Contain)
                .borderWidth(1)
        }
        .height(100.percent)
        .width(100.percent)
    }
}
```

![image8](figures/image8.png)

### Example 9 (Setting Fill Color for SVG Images)

This example repeats the image drawing on the vertical axis using the [fillColor](#func-fillcolorresourcecolor) interface.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.AppResource
import kit.LocalizationKit.__GenerateResource__

@Entry
@Component
class EntryView {
    @State var borderRadiusValue : Int64 = 10
    func build() {
        Column(){
            Text("No fillColor set")
            Image(@r(app.media.svg))
                .width(100)
                .height(100)
                .objectFit(ImageFit.Contain)
                .borderWidth(1)
            Text("fillColor set to Color.ORANGE")
            Image(@r(app.media.svg))
                .width(100)
                .height(100)
                .objectFit(ImageFit.Contain)
                .borderWidth(1)
                .fillColor(Color.ORANGE)
            Text("fillColor set to Color.BLUE")
            Image(@r(app.media.svg))
                .width(100)
                .height(100)
                .objectFit(ImageFit.Contain)
                .borderWidth(1)
                .fillColor(Color.Blue)
            Text("fillColor set to Color.Red")
            Image(@r(app.media.svg))
                .width(100)
                .height(100)
                .objectFit(ImageFit.Contain)
                .borderWidth(1)
                .fillColor(Color.Red)
        }
        .height(100.percent)
        .width(100.percent)
    }
}
```

![image9](figures/image9.png)