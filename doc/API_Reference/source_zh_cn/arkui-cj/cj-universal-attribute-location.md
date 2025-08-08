# 位置设置

设置组件的对齐方式、布局方向和显示位置。

## func align(Alignment)

```cangjie
public func align(value: Alignment): This
```

**功能：** 设置容器元素绘制区域内的子元素的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Alignment](./cj-common-types.md#enum-alignment)|是|-|容器元素绘制区域内的子元素的对齐方式。<br> 只在Stack、Button、Marquee、StepperItem、Text、TextArea、TextInput、FolderStack、Scroll中生效，其中和文本相关的组件Text、TextArea、TextInput的align结果参考[TextAlign](./cj-common-types.md#enum-textalign)。不支持textAlign属性的组件则无法设置水平方向的文字对齐。<br> 初始值：Alignment.Center。 <br> **说明：**<br>该属性不支持镜像能力。在Stack中该属性与alignContent效果一致，只能设置子组件在容器内的对齐方式。|

## func alignRules(AlignRuleOption)

```cangjie
public func alignRules(value: AlignRuleOption): This
```

**功能：** 指定设置在相对容器中子组件的对齐规则。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[AlignRuleOption](#class-alignruleoption)|是|-|指定设置在相对容器中子组件的对齐规则。|

## func alignRules(LocalizedAlignRuleOptions)

```cangjie
public func alignRules(value: LocalizedAlignRuleOptions): This
```

**功能：** 指定设置在相对容器中子组件的对齐规则。该方法水平方向上以start和end分别替代原方法的left和right，以便在RTL模式下能镜像显示，建议使用该方法指定设置在相对容器中子组件的对齐规则。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[LocalizedAlignRuleOptions](#class-localizedalignruleoptions)|是|-|指定设置在相对容器中子组件的对齐规则。|

## func chainMode(Axis, ChainStyle)

```cangjie
public func chainMode(direction: Axis, style: ChainStyle): This
```

**功能：** 指定以该组件为链头所构成的链的参数。链头指满足成链规则时链的第一个组件（水平方向从左边起始，镜像语言下从右边起始；竖直方向从上边起始）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|direction|[Axis](./cj-common-types.md#enum-axis)|是|-|链的方向。|
|style|[ChainStyle](#enum-chainstyle)|是|-|链的样式。|

## func direction(Direction)

```cangjie
public open func direction(value: Direction): This
```

**功能：** 设置容器元素内主轴方向上的布局。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Direction](./cj-common-types.md#enum-direction)|是|-|容器元素内主轴方向上的布局。<br> 属性配置为auto的时候，按照系统语言方向进行布局。该属性在Column组件上不生效。<br> 初始值：Direction.Auto。|

## func markAnchor(Length, Length)

```cangjie
public func markAnchor(x!: Length, y!: Length): This
```

**功能：** 设置元素在位置定位时的锚点。从position或offset的位置上，进一步偏移。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** x轴坐标。|
|y|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** y轴坐标。|

> - **说明：**
>
> - 设置.position(x: value1, y: value2).markAnchor(x: value3, y: value4)，效果等于设置.position(x: value1 - value3, y: value2 - value4)，offset同理。单独使用markAnchor，设置.markAnchor(x: value1, y: value2)，效果等于设置.offset(x: -value1, y: -value2)。

## func offset(Length, Length)

```cangjie
public open func offset(x!: Length, y!: Length): This
```

**功能：** 相对偏移，组件相对原本的布局位置进行偏移。offset属性不影响父容器布局，仅在绘制时调整位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** x轴坐标。|
|y|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** y轴坐标。|

> - **说明：**
>
> - Position类型基于组件自身左上角偏移，Edges类型基于组件自身四边偏移。 offset属性设置 (x: x, y: y) 与设置 (left: x, top: y) 以及 (right: -x, bottom: -y) 效果相同, 类型LocalizedEdges支持镜像模式：LTR模式下start 等同于x，RTL模式下等同于-x。

## func position(Length, Length)

```cangjie
public func position(x!: Length, y!: Length): This
```

**功能：** 绝对定位，确定子组件相对父组件的位置。当父容器为Row/Column/Flex时，设置position的子组件不占位。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** x轴坐标。|
|y|[Length](./cj-common-types.md#interface-length)|是|-| **命名参数。** y轴坐标。|

> - **说明：**
>
> - Position类型基于父组件左上角确定位置。
> - 适用于置顶显示、悬浮按钮等组件在父容器中位置固定的场景。
> - 不支持在宽高为零的布局容器上设置。

## 基础类型定义

### class AlignRuleOption

```cangjie
public class AlignRuleOption {
    public AlignRuleOption (
        public var left!: ?HorizontalAnchor = None,
        public var right!: ?HorizontalAnchor = None,
        public var middle!: ?HorizontalAnchor = None,
        public var top!: ?VerticalAnchor = None,
        public var bottom!: ?VerticalAnchor = None,
        public var center!: ?VerticalAnchor = None,
        public var bias!: ?Bias = None
    )
}
```

**功能：** 指定设置在相对容器中子组件的对齐规则。

**起始版本：** 12

#### var bias

```cangjie
public var bias:?Bias = None
```

**功能：** 设置组件在锚点约束下的偏移参数，其值为到左/上侧锚点的距离与锚点间总距离的比值。

**类型：** ?[Bias](#class-bias)

**读写能力：** 可读写

**起始版本：** 12

#### var bottom

```cangjie
public var bottom:?VerticalAnchor = None
```

**功能：** 设置底部对齐的参数。

**类型：** ?[VerticalAnchor](#class-verticalanchor)

**读写能力：** 可读写

**起始版本：** 12

#### var center

```cangjie
public var center:?VerticalAnchor = None
```

**功能：** 设置纵向居中对齐方式的参数。

**类型：** ?[VerticalAnchor](#class-verticalanchor)

**读写能力：** 可读写

**起始版本：** 12

#### var left

```cangjie
public var left:?HorizontalAnchor = None
```

**功能：** 设置左对齐参数。

**类型：** ?[HorizontalAnchor](#class-horizontalanchor)

**读写能力：** 可读写

**起始版本：** 12

#### var middle

```cangjie
public var middle:?HorizontalAnchor = None
```

**功能：** 设置横向居中对齐方式的参数。

**类型：** ?[HorizontalAnchor](#class-horizontalanchor)

**读写能力：** 可读写

**起始版本：** 12

#### var right

```cangjie
public var right:?HorizontalAnchor = None
```

**功能：** 设置右对齐参数。

**类型：** ?[HorizontalAnchor](#class-horizontalanchor)

**读写能力：** 可读写

**起始版本：** 12

#### var top

```cangjie
public var top:?VerticalAnchor = None
```

**功能：** 设置顶部对齐的参数。

**类型：** ?[VerticalAnchor](#class-verticalanchor)

**读写能力：** 可读写

**起始版本：** 12

#### AlignRuleOption(?HorizontalAnchor, ?HorizontalAnchor, ?HorizontalAnchor, ?VerticalAnchor, ?VerticalAnchor, ?VerticalAnchor, ?Bias)

```cangjie
public AlignRuleOption (
    public var left!: ?HorizontalAnchor = None,
    public var right!: ?HorizontalAnchor = None,
    public var middle!: ?HorizontalAnchor = None,
    public var top!: ?VerticalAnchor = None,
    public var bottom!: ?VerticalAnchor = None,
    public var center!: ?VerticalAnchor = None,
    public var bias!: ?Bias = None
)
```

**功能：** 创建一个 AlignRuleOption 类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|left|?[HorizontalAnchor](#class-horizontalanchor)|否|None| **命名参数。** 设置左对齐参数。|
|right|?[HorizontalAnchor](#class-horizontalanchor)|否|None| **命名参数。** 设置右对齐参数。|
|middle|?[HorizontalAnchor](#class-horizontalanchor)|否|None| **命名参数。** 设置横向居中对齐方式的参数。|
|top|?[VerticalAnchor](#class-verticalanchor)|否|None| **命名参数。** 设置顶部对齐的参数。|
|bottom|?[VerticalAnchor](#class-verticalanchor)|否|None| **命名参数。** 设置底部对齐的参数。|
|center|?[VerticalAnchor](#class-verticalanchor)|否|None| **命名参数。** 设置纵向居中对齐方式的参数。|
|bias|?[Bias](#class-bias)|否|None| **命名参数。** 设置组件在锚点约束下的偏移参数，其值为到左/上侧锚点的距离与锚点间总距离的比值。|

### class Bias

```cangjie
public class Bias {
    public Bias(
        public var horizontal!: ?Float32 = None,
        public var vertical!: ?Float32 = None
    )
}
```

**功能：** 设置组件在锚点约束下的偏移参数。其值为到左/上侧锚点的距离与锚点间总距离的比值。

**起始版本：** 12

#### var horizontal

```cangjie
public var horizontal:?Float32 = None
```

**功能：** 水平方向上的bias值。

**类型：** ?Float32

**读写能力：** 可读写

**起始版本：** 12

#### var vertical

```cangjie
public var vertical:?Float32 = None
```

**功能：** 垂直方向上的bias值。

**类型：** ?Float32

**读写能力：** 可读写

**起始版本：** 12

#### Bias(?Float32, ?Float32)

```cangjie
public Bias(
    public var horizontal!: ?Float32 = None,
    public var vertical!: ?Float32 = None
)
```

**功能：** 创建一个Bias对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|horizontal|?Float32|否|None| **命名参数。** 水平方向上的bias值。当子组件的width属性有正确值并且有2个水平方向的锚点时生效。<br> 初始值：0.5。|
|vertical|?Float32|否|None| **命名参数。** 垂直方向上的bias值。当子组件的height属性有正确值并且有2个垂直方向的锚点时生效。<br> 初始值：0.5。|

### class HorizontalAnchor

```cangjie
public class HorizontalAnchor {
    public HorizontalAnchor (
        public var anchor: String,
        public var align: HorizontalAlign
    )
}
```

**功能：** 设置水平对齐参数。

**起始版本：** 12

#### var align

```cangjie
public var align: HorizontalAlign
```

**功能：** 设置相对于锚点组件的对齐方式。

**类型：** [HorizontalAlign](./cj-common-types.md#enum-horizontalalign)

**读写能力：** 可读写

**起始版本：** 12

#### var anchor

```cangjie
public var anchor: String
```

**功能：** 设置作为锚点的组件的id值。

**类型：** String

**读写能力：** 可读写

**起始版本：** 12

#### HorizontalAnchor(String, HorizontalAlign)

```cangjie
public HorizontalAnchor (
    public var anchor: String,
    public var align: HorizontalAlign
)
```

**功能：** 创建HorizontalAnchor对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|anchor|String|是|-|作为锚点的组件的id值。|
|align|[HorizontalAlign](./cj-common-types.md#enum-horizontalalign)|是|-|相对于锚点组件的对齐方式。|

### class LocalizedAlignRuleOptions

```cangjie
public class LocalizedAlignRuleOptions {
    public LocalizedAlignRuleOptions (
        public var start!: ?LocalizedHorizontalAlignParam = None,
        public var end!: ?LocalizedHorizontalAlignParam = None,
        public var middle!: ?LocalizedHorizontalAlignParam = None,
        public var top!: ?LocalizedVerticalAlignParam = None,
        public var bottom!: ?LocalizedVerticalAlignParam = None,
        public var center!: ?LocalizedVerticalAlignParam = None,
        public var bias!: ?Bias = None
    )
}
```

**功能：** 指定设置在相对容器中子组件的对齐规则。

**起始版本：** 19

#### var bias

```cangjie
public var bias:?Bias = None
```

**功能：** 设置组件在锚点约束下的偏移参数，其值为到左/上侧锚点的距离与锚点间总距离的比值。

**类型：** ?[Bias](#class-bias)

**读写能力：** 可读写

**起始版本：** 19

#### var bottom

```cangjie
public var bottom:?LocalizedVerticalAlignParam = None
```

**功能：** 设置纵向底部对齐的参数。

**类型：** ?[LocalizedVerticalAlignParam](#class-localizedverticalalignparam)

**读写能力：** 可读写

**起始版本：** 19

#### var center

```cangjie
public var center:?LocalizedVerticalAlignParam = None
```

**功能：** 设置纵向居中对齐方式的参数。

**类型：** ?[LocalizedVerticalAlignParam](#class-localizedverticalalignparam)

**读写能力：** 可读写

**起始版本：** 19

#### var end

```cangjie
public var end:?LocalizedHorizontalAlignParam = None
```

**功能：** 设置横向对齐方式的参数，LTR模式时为右对齐，RTL模式时为左对齐。

**类型：** ?[LocalizedHorizontalAlignParam](#class-localizedhorizontalalignparam)

**读写能力：** 可读写

**起始版本：** 19

#### var middle

```cangjie
public var middle:?LocalizedHorizontalAlignParam = None
```

**功能：** 设置横向居中对齐方式的参数。

**类型：** ?[LocalizedHorizontalAlignParam](#class-localizedhorizontalalignparam)

**读写能力：** 可读写

**起始版本：** 19

#### var start

```cangjie
public var start:?LocalizedHorizontalAlignParam = None
```

**功能：** 设置横向对齐方式的参数，LTR模式时为左对齐，RTL模式时为右对齐。

**类型：** ?[LocalizedHorizontalAlignParam](#class-localizedhorizontalalignparam)

**读写能力：** 可读写

**起始版本：** 19

#### var top

```cangjie
public var top:?LocalizedVerticalAlignParam = None
```

**功能：** 设置纵向顶部对齐的参数。

**类型：** ?[LocalizedVerticalAlignParam](#class-localizedverticalalignparam)

**读写能力：** 可读写

**起始版本：** 19

#### LocalizedAlignRuleOptions(?LocalizedHorizontalAlignParam, ?LocalizedHorizontalAlignParam, ?LocalizedHorizontalAlignParam, ?LocalizedVerticalAlignParam, ?LocalizedVerticalAlignParam, ?LocalizedVerticalAlignParam, ?Bias)

```cangjie
public LocalizedAlignRuleOptions (
    public var start!: ?LocalizedHorizontalAlignParam = None,
    public var end!: ?LocalizedHorizontalAlignParam = None,
    public var middle!: ?LocalizedHorizontalAlignParam = None,
    public var top!: ?LocalizedVerticalAlignParam = None,
    public var bottom!: ?LocalizedVerticalAlignParam = None,
    public var center!: ?LocalizedVerticalAlignParam = None,
    public var bias!: ?Bias = None
)
```

**功能：** 创建一个LocalizedAlignRuleOptions对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|start|?[LocalizedHorizontalAlignParam](#class-localizedhorizontalalignparam)|否|None| **命名参数。** 横向对齐方式的参数，LTR模式时为左对齐，RTL模式时为右对齐。|
|end|?[LocalizedHorizontalAlignParam](#class-localizedhorizontalalignparam)|否|None| **命名参数。** 横向对齐方式的参数，LTR模式时为右对齐，RTL模式时为左对齐。|
|middle|?[LocalizedHorizontalAlignParam](#class-localizedhorizontalalignparam)|否|None| **命名参数。** 横向居中对齐方式的参数。|
|top|?[LocalizedVerticalAlignParam](#class-localizedverticalalignparam)|否|None| **命名参数。** 纵向顶部对齐的参数。|
|bottom|?[LocalizedVerticalAlignParam](#class-localizedverticalalignparam)|否|None| **命名参数。** 纵向底部对齐的参数。|
|center|?[LocalizedVerticalAlignParam](#class-localizedverticalalignparam)|否|None| **命名参数。** 纵向居中对齐方式的参数。|
|bias|?[Bias](#class-bias)|否|None| **命名参数。** 组件在锚点约束下的偏移参数，其值为到左/上侧锚点的距离与锚点间总距离的比值。|

### class LocalizedHorizontalAlignParam

```cangjie
public class LocalizedHorizontalAlignParam {
    public LocalizedHorizontalAlignParam (
        public var anchor!: String,
        public var align!: HorizontalAlign
    )
}
```

**功能：** 设置横向对齐方式的参数。

**起始版本：** 19

#### var align

```cangjie
public var align: HorizontalAlign
```

**功能：** 设置相对于锚点组件的横向对齐方式。

**类型：** [HorizontalAlign](./cj-common-types.md#enum-horizontalalign)

**读写能力：** 可读写

**起始版本：** 19

#### var anchor

```cangjie
public var anchor: String
```

**功能：** 设置作为锚点的组件的id值。

**类型：** String

**读写能力：** 可读写

**起始版本：** 19

### class LocalizedVerticalAlignParam

```cangjie
public class LocalizedVerticalAlignParam {
    public LocalizedVerticalAlignParam (
        public var anchor!: String,
        public var align!: VerticalAlign
    )
}
```

**功能：** 设置纵向对齐方式的参数。

**起始版本：** 19

#### var align

```cangjie
public var align: VerticalAlign
```

**功能：** 设置相对于锚点组件的纵向对齐方式。

**类型：** [VerticalAlign](./cj-common-types.md#enum-verticalalign)

**读写能力：** 可读写

**起始版本：** 19

#### var anchor

```cangjie
public var anchor: String
```

**功能：** 设置作为锚点的组件的id值。

**类型：** String

**读写能力：** 可读写

**起始版本：** 19

#### LocalizedVerticalAlignParam(String, VerticalAlign)

```cangjie
public LocalizedVerticalAlignParam (
    public var anchor!: String,
    public var align!: VerticalAlign
)
```

**功能：** 创建LocalizedVerticalAlignParam类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|anchor|String|是|-| **命名参数。** 作为锚点的组件的id值。|
|align|[VerticalAlign](./cj-common-types.md#enum-verticalalign)|是|-| **命名参数。** 相对于锚点组件的纵向对齐方式。|

### class VerticalAnchor

```cangjie
public class VerticalAnchor {
    public VerticalAnchor (
        public var anchor: String,
        public var align: VerticalAlign
    )
}
```

**功能：** 设置垂直对齐参数。

**起始版本：** 12

#### var align

```cangjie
public var align: VerticalAlign
```

**功能：** 设置相对于锚点组件的对齐方式。

**类型：** [VerticalAlign](./cj-common-types.md#enum-verticalalign)

**读写能力：** 可读写

**起始版本：** 12

#### var anchor

```cangjie
public var anchor: String
```

**功能：** 设置作为锚点的组件的id值。

**类型：** String

**读写能力：** 可读写

**起始版本：** 12

#### VerticalAnchor(String, VerticalAlign)

```cangjie
public VerticalAnchor (
    public var anchor: String,
    public var align: VerticalAlign
)
```

**功能：** 创建一个 VerticalAnchor 类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|anchor|String|是|-|作为锚点的组件的id值。|
|align|[VerticalAlign](./cj-common-types.md#enum-verticalalign)|是|-|相对于锚点组件的对齐方式。|

### enum ChainStyle

```cangjie
public enum ChainStyle {
    | SPREAD
    | SPREAD_INSIDE
    | PACKED
}
```

**功能：** 定义链的风格。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### PACKED

```cangjie
PACKED
```

**功能：** 链内子组件无间隙。

**起始版本：** 12

#### SPREAD

```cangjie
SPREAD
```

**功能：** 组件在约束锚点间均匀分布。

**起始版本：** 12

#### SPREAD_INSIDE

```cangjie
SPREAD_INSIDE
```

**功能：** 除首尾2个子组件的其他组件在约束锚点间均匀分布。

**起始版本：** 12
