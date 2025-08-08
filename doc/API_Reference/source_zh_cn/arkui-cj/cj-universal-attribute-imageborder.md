# 图片边框设置

设置组件的图片边框样式。

## func borderImage(BorderImageOption)

```cangjie
public func borderImage(value: BorderImageOption): This
```

**功能：** 设置组件的图片边框。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[BorderImageOption](#class-borderimageoption)|是|-|图片边框或者渐变色边框设置接口。|

## 基础类型定义

### interface BorderImageOptionSourceType

```cangjie
sealed interface BorderImageOptionSourceType {}
```

**功能：** 联合类型接口，可接受 String、[AppResource](../apis/LocalizationKit/cj-apis-resource_manager.md#class-appresource)、[LinearGradientOption](#class-lineargradientoption)类型。

**起始版本：** 19

### interface LengthEdgeWidthsType

```cangjie
sealed interface LengthEdgeWidthsType {}
```

**功能：** 联合类型接口，可接受 [LengthType](./cj-common-types.md#enum-lengthtype)、[EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths)类型。

**起始版本：** 19

### class BorderImageOption

```cangjie
public class BorderImageOption {
    public BorderImageOption (
        public let source!: BorderImageOptionSourceType,
        public let slice!: LengthEdgeWidthsType = LengthType.vp(0.0),
        public let width!: LengthEdgeWidthsType = LengthType.vp(0.0),
        public let outset!: LengthEdgeWidthsType = LengthType.vp(0.0),
        public let repeat!: RepeatMode = RepeatMode.STRETCH,
        public let fill!: Bool = false
    )
}
```

**功能：** 图片边框或者渐变色边框配置。

**起始版本：** 19

#### let source

```cangjie
public let source: BorderImageOptionSourceType
```

**功能：** 边框图源或者渐变色设置。参数类型为string类型时，用于设置边框图源。

**类型：** [BorderImageOptionSourceType](#interface-borderimageoptionsourcetype)

**读写能力：** 只读

**起始版本：** 19

#### let slice

```cangjie
public let slice: LengthEdgeWidthsType = LengthType.vp(0.0)
```

**功能：** 设置边框图片的切割宽度。

**类型：** [LengthEdgeWidthsType](#interface-lengthedgewidthstype)

**读写能力：** 只读

**起始版本：** 19

#### let width

```cangjie
public let width: LengthEdgeWidthsType = LengthType.vp(0.0)
```

**功能：** 设置图片边框宽度。

**类型：** [LengthEdgeWidthsType](#interface-lengthedgewidthstype)

**读写能力：** 只读

**起始版本：** 19

#### let outset

```cangjie
public let outset: LengthEdgeWidthsType = LengthType.vp(0.0)
```

**功能：** 设置边框图片向外延伸距离。

**类型：** [LengthEdgeWidthsType](#interface-lengthedgewidthstype)

**读写能力：** 只读

**起始版本：** 19

#### let repeat

```cangjie
public let repeat: RepeatMode = RepeatMode.STRETCH
```

**功能：** 设置被切割的图片在边框上的重复方式。

**类型：** [RepeatMode](#enum-repeatmode)

**读写能力：** 只读

**起始版本：** 19

#### let fill

```cangjie
public let fill: Bool = false
```

**功能：** 设置边框图片是否中心填充。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 19

#### BorderImageOption(BorderImageOptionSourceType, LengthEdgeWidthsType, LengthEdgeWidthsType, LengthEdgeWidthsType, RepeatMode, Bool)

```cangjie
public BorderImageOption (
    public let source!: BorderImageOptionSourceType,
    public let slice!: LengthEdgeWidthsType = LengthType.vp(0.0),
    public let width!: LengthEdgeWidthsType = LengthType.vp(0.0),
    public let outset!: LengthEdgeWidthsType = LengthType.vp(0.0),
    public let repeat!: RepeatMode = RepeatMode.STRETCH,
    public let fill!: Bool = false
)
```

**功能：** 构造一个图片边框设置类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|source|[BorderImageOptionSourceType](#interface-borderimageoptionsourcetype)|是| **命名参数。** -|边框图源或者渐变色设置。参数类型为string类型时，用于设置边框图源。<br/>**说明**：<br/>边框图源仅适用于容器组件，如[Row](./cj-row-column-stack-row.md)、[Column](./cj-row-column-stack-column.md)，在非容器组件上使用会失效。|
|slice|[LengthEdgeWidthsType](#interface-lengthedgewidthstype)|否|LengthType.vp(0.0)|设置边框图片左上角、右上角、左下角以及右下角的切割宽度。<br/>**说明**：<br/>设置负数时取默认值。<br/>参数类型为[Length](./cj-common-types.md#interface-length)时，统一设置四个角的宽高。<br/>参数类型为[EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths)时：<br/>- Top：设置图片左上角或者右上角被切割的高。<br/>- Bottom：设置图片左下角或者右下角被切割的高。<br/>- Left：设置图片左上角或者左下角被切割的宽。<br/>- Right：设置图片右上角或者右下角被切割的宽。|
|width|[LengthEdgeWidthsType](#interface-lengthedgewidthstype)|否|LengthType.vp(0.0)|设置图片边框宽度。<br/>**说明**：<br/>参数类型为[Length](./cj-common-types.md#interface-length)时，统一设置四个角的宽高，设置负数时取默认值。<br/>参数类型为[EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths)时：<br/>- Top：设置图片边框上边框的宽。<br/>- Bottom：设置图片边框下边框的宽。<br/>- Left：设置图片边框左边框的宽。<br/>- Right：设置图片边框右边框宽。|
|outset|[LengthEdgeWidthsType](#interface-lengthedgewidthstype)|否|LengthType.vp(0.0)|设置边框图片向外延伸距离。<br/>**说明**：<br/>设置负数时取默认值。<br/>参数类型为[Length](./cj-common-types.md#interface-length)时，统一设置四个角的宽高。<br/>参数类型为[EdgeWidths](./cj-universal-attribute-border.md#class-edgewidths)时：<br/>- Top：设置边框图片上边框向外延伸的距离。<br/>- Bottom：设置边框图片下边框向外延伸的距离。<br/>- Left：设置边框图片左边框向外延伸的距离。<br/>- Right：设置边框图片右边框向外延伸的距离。|
|repeat|[RepeatMode](#enum-repeatmode)|否|RepeatMode.STRETCH|设置被切割的图片在边框上的重复方式。|
|fill|Bool|否|false|设置边框图片是否中心填充。|

### class LinearGradientOption

```cangjie
public class LinearGradientOption {
    public LinearGradientOption (
        public let angle!: Float64 = 180.0,
        public let direction!: GradientDirection = GradientDirection.Bottom,
        public let colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
        public let repeating!: Bool = false
    )
}
```

**功能：** 线性渐变。

**起始版本：** 19

#### let angle

```cangjie
public let angle: Option<Float64> = 180.0
```

**功能：** 线性渐变的起始角度。

**类型：** Option\<Float64>

**读写能力：** 只读

**起始版本：** 19

#### let direction

```cangjie
public let direction: GradientDirection = GradientDirection.Bottom
```

**功能：** 线性渐变的方向。

**类型：** [GradientDirection](./cj-common-types.md#enum-gradientdirection)

**读写能力：** 只读

**起始版本：** 19

#### let colors

```cangjie
public let colors: Array <(Color, Float64)>=[(Color.TRANSPARENT, 0.0)]
```

**功能：** 指定某百分比位置处的渐变色颜色，设置非法颜色直接跳过。

**类型：** Array\<([Color](./cj-common-types.md#color), Float64)>

**读写能力：** 只读

**起始版本：** 19

#### let repeating

```cangjie
public let repeating: Bool = false
```

**功能：** 是否为渐变的颜色重复着色。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 19

#### LinearGradientOption(Float64, GradientDirection, Array\<(Color, Float64)>, Bool)

```cangjie
public LinearGradientOption (
    public let angle!: Float64 = 180.0,
    public let direction!: GradientDirection = GradientDirection.Bottom,
    public let colors!: Array<(Color, Float64)> = [(Color.TRANSPARENT, 0.0)],
    public let repeating!: Bool = false
)
```

**功能：** 构造一个线性渐变类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|angle|Float64|否|180.0| **命名参数。** 线性渐变的起始角度。0点方向顺时针旋转为正向角度。|
|direction|[GradientDirection](./cj-common-types.md#enum-gradientdirection)|否|GradientDirection.Bottom| **命名参数。** 线性渐变的方向，设置angle后不生效。|
|colors|Array\<([Color](./cj-common-types.md#color), Float64)>|否|[(Color.TRANSPARENT, 0.0)]| **命名参数。** 指定某百分比位置处的渐变色颜色,设置非法颜色直接跳过。|
|repeating|Bool|否|false| **命名参数。** 为渐变的颜色重复着色。|

### enum RepeatMode

```cangjie
public enum RepeatMode {
    | SPACE
    | STRETCH
    | REPEAT
    | ROUND
}
```

**功能：** 设置被切割的图片在边框上的重复方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### SPACE

```cangjie
SPACE
```

**功能：** 被切割图片以整数次平铺在图片边框上，无法以整数次平铺时以空白填充。

**起始版本：** 19

#### STRETCH

```cangjie
STRETCH
```

**功能：** 被切割图片以拉伸填充的方式铺满图片边框。

**起始版本：** 19

#### REPEAT

```cangjie
REPEAT
```

**功能：** 被切割图片重复铺平在图片边框上，超出的部分会被剪裁。

**起始版本：** 19

#### ROUND

```cangjie
ROUND
```

**功能：** 被切割图片以整数次平铺在图片边框上，无法以整数次平铺时压缩被切割图片。

**起始版本：** 19
