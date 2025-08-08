# Component Content Blur

Adds a blur effect to the current component's content.

## func foregroundBlurStyle(ForegroundBlurStyle, Option\<ForegroundBlurStyleOptions>)

```cangjie
public func foregroundBlurStyle(value: ForegroundBlurStyle, options!: Option<ForegroundBlurStyleOptions> = None): This
```

**Function:** Provides content blur capability for the current component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :------- | :---------- | :------- | :-------- | :---------- |
| value | [ForegroundBlurStyle](./cj-common-types.md#enum-foregroundblurstyle) | Yes | - | Content blur style. |
| options | Option\<[ForegroundBlurStyleOptions](./cj-universal-attribute-foregroundblurstyle.md#class-foregroundblurstyleoptions)> | No | None | **Named parameter.** Optional parameter for content blur options. |

## Basic Type Definitions

### class BlurStyleOptions

```cangjie
public open class BlurStyleOptions {
    public BlurStyleOptions (
        public let adaptiveColor: AdaptiveColor,
        public let blurOptions: BlurOptions,
        public let colorMode: ThemeColorMode,
        public let scale: Float32
    )
}
```

**Function:** Content blur options.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### let adaptiveColor

```cangjie
public let adaptiveColor: AdaptiveColor = AdaptiveColor.DEFAULT
```

**Function:** Color sampling mode used for the content blur effect.

**Type:** [AdaptiveColor](./cj-common-types.md#enum-adaptivecolor)

**Read/Write:** Read-only

**Since:** 19

#### let blurOptions

```cangjie
public let blurOptions: BlurOptions = BlurOptions([0.0, 0.0])
```

**Function:** Grayscale blur parameters.

**Type:** [BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions)

**Read/Write:** Read-only

**Since:** 19

#### let colorMode

```cangjie
public let colorMode: ThemeColorMode = ThemeColorMode.SYSTEM
```

**Function:** Light/dark color mode used for the content blur effect.

**Type:** [ThemeColorMode](./cj-common-types.md#enum-themecolormode)

**Read/Write:** Read-only

**Since:** 19

#### let scale

```cangjie
public let scale: Float32
```

**Function:** Intensity of the content blur effect. Valid range: [0.0, 1.0].

**Type:** Float32

**Read/Write:** Read-only

**Since:** 19

#### BlurStyleOptions(ThemeColorMode, AdaptiveColor, BlurOptions, Float32)

```cangjie
public BlurStyleOptions (
    public let adaptiveColor: AdaptiveColor,
    public let blurOptions: BlurOptions,
    public let colorMode: ThemeColorMode,
    public let scale: Float32
)
```

**Function:** Constructs a BlurStyleOptions object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :---- | :---- | :---- | :---- | :--- |
| adaptiveColor | [AdaptiveColor](./cj-common-types.md#enum-adaptivecolor) | Yes | - | Color sampling mode used for the content blur effect.<br>Initial value: AdaptiveColor.DEFAULT. |
| blurOptions | [BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions) | Yes | - | Grayscale blur parameters.<br>Initial value: BlurOptions([0.0, 0.0]). |
| colorMode | [ThemeColorMode](./cj-common-types.md#enum-themecolormode) | Yes | - | Light/dark color mode used for the content blur effect.<br>Initial value: ThemeColorMode.SYSTEM. |
| scale | Float32 | Yes | - | Intensity of the content blur effect.<br>Valid range: [0.0, 1.0].<br>Initial value: 1.0. |

### class BlurOptions

```cangjie
public class BlurOptions {
    public BlurOptions(public var grayscale: VArray<Float32, $2>)
}
```

**Function:** Grayscale blur parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### var grayscale

```cangjie
public var grayscale: VArray<Float32, $2>
```

**Function:** Grayscale blur parameters. Valid range: [0, 127].

**Type:** VArray\<Float32, $2>

**Read/Write:** Read-write

**Since:** 12

#### BlurOptions(VArray\<Float32, $2>)

```cangjie
public BlurOptions(public var grayscale: VArray<Float32, $2>)
```

**Function:** Constructs a BlurOptions object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :---- | :---- | :---- | :---- | :---- |
| grayscale | VArray\<Float32, $2> | Yes | \- | Grayscale blur parameters. Valid range: [0, 127]. |

### class ForegroundBlurStyleOptions

```cangjie
public class ForegroundBlurStyleOptions {
    public ForegroundBlurStyleOptions(
        public var adaptiveColor!: AdaptiveColor = DEFAULT,
        public var blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]),
        public var colorMode!: ThemeColorMode = SYSTEM,
        public var scale!: Float32 = 1.0
    )
}
```

**Function:** Content blur options.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### var adaptiveColor

```cangjie
public var adaptiveColor: AdaptiveColor = DEFAULT
```

**Function:** Color sampling mode used for the content blur effect.

**Type:** [AdaptiveColor](./cj-common-types.md#enum-adaptivecolor)

**Read/Write:** Read-write

**Since:** 12

#### var blurOptions

```cangjie
public var blurOptions: BlurOptions = BlurOptions([0.0, 0.0])
```

**Function:** Grayscale blur parameters.

**Type:** [BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions)

**Read/Write:** Read-write

**Since:** 12

#### var colorMode

```cangjie
public var colorMode: ThemeColorMode = SYSTEM
```

**Function:** Light/dark color mode used for the content blur effect.

**Type:** [ThemeColorMode](./cj-common-types.md#enum-themecolormode)

**Read/Write:** Read-write

**Since:** 12

#### var scale

```cangjie
public var scale: Float32 = 1.0
```

**Function:** Intensity of the content blur effect. Valid range: [0.0, 1.0].

**Type:** Float32

**Read/Write:** Read-write

**Since:** 19

#### ForegroundBlurStyleOptions(ThemeColorMode, AdaptiveColor, BlurOptions, Float32)

```cangjie
public ForegroundBlurStyleOptions(public var adaptiveColor!: AdaptiveColor = DEFAULT, public var blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]), public var colorMode!: ThemeColorMode = SYSTEM, public var scale!: Float32 = 1.0)
```

**Function:** Constructs a ForegroundBlurStyleOptions object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :---- | :---- | :---- | :---- | :--- |
| adaptiveColor | [AdaptiveColor](./cj-common-types.md#enum-adaptivecolor) | No | AdaptiveColor.DEFAULT | **Named parameter.** Color sampling mode used for the content blur effect. |
| blurOptions | [BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions) | No | BlurOptions([0.0, 0.0]) | **Named parameter.** Grayscale blur parameters. |
| colorMode | [ThemeColorMode](./cj-common-types.md#enum-themecolormode) | No | ThemeColorMode.SYSTEM | **Named parameter.** Light/dark color mode used for the content blur effect. |
| scale | Float32 | No | 1.0 | **Named parameter.** Intensity of the content blur effect.<br>Valid range: [0.0, 1.0]. |

### enum AdaptiveColor

```cangjie
public enum AdaptiveColor {
    | DEFAULT
    | AVERAGE
}
```

**Function:** Color sampling mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

#### DEFAULT

```cangjie
DEFAULT
```

**Function:** Disables color sampling blur. Uses the default color as the mask color. Non-DEFAULT methods are more time-consuming.

**Since:** 12

#### AVERAGE

```cangjie
AVERAGE
```

**Function:** Enables color sampling blur. Uses the average color of the sampling area as the mask color.**Starting Version:** 12  

## Sample Code  

<!-- run -->  

```cangjie  
package ohos_app_cangjie_entry  
import kit.UIKit.*  
import ohos.state_macro_manage.*  
import kit.LocalizationKit.*  

@Entry  
@Component  
class EntryView {  
    func build() {  
        Column {  
            Text("Thin Material")  
                .fontSize(30)  
                .fontColor(0xCCCCCC)  

            Image(@r(app.media.startIcon)).foregroundBlurStyle(  
                ForegroundBlurStyle.THIN,  
                options: ForegroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,  
                    adaptiveColor: AdaptiveColor.DEFAULT, blurOptions: BlurOptions([100.0, 100.0]), scale: 0.5)  
            )  
        }  
        .width(100.percent)  
        .height(100.percent)  
    }  
}  
```  

![foregroundBlurStyle](figures/uni-foreground.jpg)