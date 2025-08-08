# 组件内容模糊

为当前组件添加内容模糊效果。

## func foregroundBlurStyle(ForegroundBlurStyle, Option\<ForegroundBlurStyleOptions>)

```cangjie
public func foregroundBlurStyle(value: ForegroundBlurStyle, options!: Option<ForegroundBlurStyleOptions> = None)：This
```

**功能：** 为当前组件提供内容模糊能力。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :-------   | :---------- | :------- | :-------- | :----------|
| value | [ForegroundBlurStyle](./cj-common-types.md#enum-foregroundblurstyle) | 是 | - | 内容模糊样式。 |
| options |Option\<[ForegroundBlurStyleOptions](./cj-universal-attribute-foregroundblurstyle.md#class-foregroundblurstyleoptions)> | 否 | None | **命名参数。**  可选参数，内容模糊选项。 |

## 基础类型定义

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

**功能：** 内容模糊选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### let adaptiveColor

```cangjie
public let adaptiveColor: AdaptiveColor = AdaptiveColor.DEFAULT
```

**功能：** 内容模糊效果使用的取色模式。

**类型：** [AdaptiveColor](./cj-common-types.md#enum-adaptivecolor)

**读写能力：** 只读

**起始版本：** 19

#### let blurOptions

```cangjie
public let blurOptions: BlurOptions = BlurOptions([0.0, 0.0])
```

**功能：** 灰阶模糊参数。

**类型：** [BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions)

**读写能力：** 只读

**起始版本：** 19

#### let colorMode

```cangjie
public let colorMode: ThemeColorMode = hemeColorMode.SYSTEM
```

**功能：** 内容模糊效果使用的深浅色模式。

**类型：** [ThemeColorMode](./cj-common-types.md#enum-themecolormode)

**读写能力：** 只读

**起始版本：** 19

#### let scale

```cangjie
public let scale: Float32
```

**功能：** 内容模糊效果程度。取值范围：[0.0, 1.0]。

**类型：** Float32

**读写能力：** 只读

**起始版本：** 19

#### BlurStyleOptions(ThemeColorMode, AdaptiveColor, BlurOptions, Float32)

```cangjie
public BlurStyleOptions (
    public let adaptiveColor: AdaptiveColor,
    public let blurOptions: BlurOptions,
    public let colorMode: ThemeColorMode,
    public let scale: Float32
)
```

**功能：** 构造一个BlurStyleOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :---- | :---- | :---- | :---- | :--- |
| adaptiveColor | [AdaptiveColor](./cj-common-types.md#enum-adaptivecolor) | 是 | - | 内容模糊效果使用的取色模式。<br>初始值：AdaptiveColor.DEFAULT。 |
| blurOptions | [BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions) | 是 | - | 灰阶模糊参数。<br>初始值：BlurOptions([0.0, 0.0])。 |
| colorMode | [ThemeColorMode](./cj-common-types.md#enum-themecolormode) | 是 | - | 内容模糊效果使用的深浅色模式。<br>初始值：ThemeColorMode.SYSTEM。 |
| scale | Float32 | 是 | - | 内容模糊效果程度。<br>取值范围：[0.0, 1.0]。<br>初始值：1.0。 |

### class BlurOptions

```cangjie
public class BlurOptions {
    public BlurOptions(public var grayscale: VArray<Float32, $2>)
}
```

**功能：** 灰阶模糊参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### var grayscale

```cangjie
public var grayscale: VArray<Float32, $2>
```

**功能：** 灰阶模糊参数，参数取值范围\[0, 127]。

**类型：** VArray\<Float32, $2>

**读写能力：** 可读写

**起始版本：** 12

#### BlurOptions(VArray\<Float32, $2>)

```cangjie
public BlurOptions(public var grayscale: VArray<Float32, $2>)
```

**功能：** 构造BlurOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :---- | :---- | :---- | :---- | :---- |
| grayscale | VArray\<Float32, $2> | 是 | \- | 灰阶模糊参数，参数取值范围\[0, 127]。 |

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

**功能：** 内容模糊选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### var adaptiveColor

```cangjie
public var adaptiveColor: AdaptiveColor = DEFAULT
```

**功能：** 内容模糊效果使用的取色模式。

**类型：** [AdaptiveColor](./cj-common-types.md#enum-adaptivecolor)

**读写能力：** 可读写

**起始版本：** 12

#### var blurOptions

```cangjie
public var blurOptions: BlurOptions = BlurOptions([0.0, 0.0])
```

**功能：** 灰阶模糊参数。

**类型：** [BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions)

**读写能力：** 可读写

**起始版本：** 12

#### var colorMode

```cangjie
public var colorMode: ThemeColorMode = SYSTEM
```

**功能：** 内容模糊效果使用的深浅色模式。

**类型：** [ThemeColorMode](./cj-common-types.md#enum-themecolormode)

**读写能力：** 可读写

**起始版本：** 12

#### var scale

```cangjie
public var scale: Float32 = 1.0
```

**功能：** 内容模糊效果程度。取值范围：[0.0, 1.0]。

**类型：** Float32

**读写能力：** 可读写

**起始版本：** 19

#### ForegroundBlurStyleOptions(ThemeColorMode, AdaptiveColor, BlurOptions, Float32)

```cangjie
public ForegroundBlurStyleOptions(public var adaptiveColor!: AdaptiveColor = DEFAULT, public var blurOptions!: BlurOptions = BlurOptions([0.0, 0.0]), public var colorMode!: ThemeColorMode = SYSTEM, public var scale!: Float32 = 1.0)
```

**功能：** 构造一个ForegroundBlurStyleOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :---- | :---- | :---- | :---- | :--- |
| adaptiveColor | [AdaptiveColor](./cj-common-types.md#enum-adaptivecolor) | 否 | AdaptiveColor.DEFAULT | **命名参数。**  内容模糊效果使用的取色模式。 |
| blurOptions | [BlurOptions](./cj-universal-attribute-foregroundblurstyle.md#class-bluroptions) | 否 | BlurOptions([0.0, 0.0]) | **命名参数。**  灰阶模糊参数。 |
| colorMode | [ThemeColorMode](./cj-common-types.md#enum-themecolormode) | 否 | ThemeColorMode.SYSTEM | **命名参数。**  内容模糊效果使用的深浅色模式。 |
| scale | Float32 | 否 | 1.0 | **命名参数。**  内容模糊效果程度。<br>取值范围：[0.0, 1.0]。 |

### enum AdaptiveColor

```cangjie
public enum AdaptiveColor {
    | DEFAULT
    | AVERAGE
}
```

**功能：** 取色模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### DEFAULT

```cangjie
DEFAULT
```

**功能：** 不使用取色模糊。使用默认的颜色作为蒙版颜色。采用非DEFAULT方式较耗时。

**起始版本：** 12

#### AVERAGE

```cangjie
AVERAGE
```

**功能：** 使用取色模糊。将取色区域的颜色平均值作为蒙版颜色。

**起始版本：** 12

## 示例代码

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
