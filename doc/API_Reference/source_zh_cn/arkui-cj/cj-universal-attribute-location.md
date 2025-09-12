# 位置设置

设置组件的对齐方式、布局方向和显示位置。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func align(Alignment)

```cangjie
public func align(value: Alignment): This
```

**功能：** 设置组件在容器中的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Alignment](./cj-common-types.md#enum-alignment)|是|-|对齐方式。|

## func alignRules(AlignRuleOption)

```cangjie
public func alignRules(value: AlignRuleOption): This
```

**功能：** 设置组件的对齐规则。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[AlignRuleOption](./cj-universal-attribute-location.md#class-alignruleoption)|是|-|对齐规则选项。|

## func direction(Direction)

```cangjie
public func direction(value: Direction): This
```

**功能：** 设置组件的布局方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Direction](./cj-common-types.md#enum-direction)|是|-|布局方向。|

## func markAnchor(Length, Length)

```cangjie
public func markAnchor(x!: Length, y!: Length): This
```

**功能：** 设置组件的锚点位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** x轴坐标。|
|y|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** y轴坐标。|

## func offset(Length, Length)

```cangjie
public func offset(x!: Length, y!: Length): This
```

**功能：** 设置组件的偏移量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** x轴坐标。|
|y|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** y轴坐标。|

## func position(Length, Length)

```cangjie
public func position(x!: Length, y!: Length): This
```

**功能：** 设置组件的位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** x轴坐标。|
|y|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-| **命名参数。** y轴坐标。|

## 基础类型定义

### class AlignRuleOption

```cangjie
public class AlignRuleOption {
    public var left:?HorizontalAlignment
    public var right:?HorizontalAlignment
    public var middle:?HorizontalAlignment
    public var top:?VerticalAlignment
    public var bottom:?VerticalAlignment
    public var center:?VerticalAlignment 
    public var bias: Bias
    public init(left!: ?HorizontalAlignment = None, right!: ?HorizontalAlignment = None,
        middle!: ?HorizontalAlignment = None, top!: ?VerticalAlignment = None,
        bottom!: ?VerticalAlignment = None, center!: ?VerticalAlignment = None,
        bias!: Bias = Bias()
    )
}
```

**功能：** 设置组件对齐规则选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var bias

```cangjie
public var bias: Bias = Bias()
```

**功能：** 设置组件对齐的偏移量。

**类型：** [Bias](#class-bias)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var bottom

```cangjie
public var bottom:?VerticalAlignment
```

**功能：** 设置组件底部对齐方式。

**类型：** ?[VerticalAlignment](./cj-common-types.md#class-verticalalignment)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var center

```cangjie
public var center:?VerticalAlignment
```

**功能：** 设置组件垂直居中对齐方式。

**类型：** ?[VerticalAlignment](./cj-common-types.md#class-verticalalignment)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var left

```cangjie
public var left:?HorizontalAlignment
```

**功能：** 设置组件左侧对齐方式。

**类型：** ?[HorizontalAlignment](./cj-common-types.md#class-horizontalalignment)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var middle

```cangjie
public var middle:?HorizontalAlignment
```

**功能：** 设置组件水平居中对齐方式。

**类型：** ?[HorizontalAlignment](./cj-common-types.md#class-horizontalalignment)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var right

```cangjie
public var right:?HorizontalAlignment
```

**功能：** 设置组件右侧对齐方式。

**类型：** ?[HorizontalAlignment](./cj-common-types.md#class-horizontalalignment)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var top

```cangjie
public var top:?VerticalAlignment
```

**功能：** 设置组件顶部对齐方式。

**类型：** ?[VerticalAlignment](./cj-common-types.md#class-verticalalignment)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(?HorizontalAlignment, ?HorizontalAlignment, ?HorizontalAlignment, ?VerticalAlignment, ?VerticalAlignment, ?VerticalAlignment, Bias)

```cangjie
public init(left!: ?HorizontalAlignment = None, right!: ?HorizontalAlignment = None,
    middle!: ?HorizontalAlignment = None, top!: ?VerticalAlignment = None,
    bottom!: ?VerticalAlignment = None, center!: ?VerticalAlignment = None,
    bias!: Bias = Bias()
)
```

**功能：** 构造一个AlignRuleOption对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|left|?[HorizontalAlignment](./cj-common-types.md#class-horizontalalignment)|否|None|设置组件左侧对齐方式。|
|right|?[HorizontalAlignment](./cj-common-types.md#class-horizontalalignment)|否|None|设置组件右侧对齐方式。|
|middle|?[HorizontalAlignment](./cj-common-types.md#class-horizontalalignment)|否|None|设置组件水平居中对齐方式。|
|top|?[VerticalAlignment](./cj-common-types.md#class-verticalalignment)|否|None|设置组件顶部对齐方式。|
|bottom|?[VerticalAlignment](./cj-common-types.md#class-verticalalignment)|否|None|设置组件底部对齐方式。|
|center|?[VerticalAlignment](./cj-common-types.md#class-verticalalignment)|否|None|设置组件垂直居中对齐方式。|
|bias|[Bias](#class-bias)|否|Bias()|设置组件对齐的偏移量。|

### class Bias

```cangjie
public class Bias {
    public var horizontal: Float32, 
    public var vertical: Float32, 
    public init(horizontal!: Float32, vertical!: Float32)
}
```

**功能：** 设置组件对齐的偏移量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var horizontal

```cangjie
public var horizontal: Float32
```

**功能：** 设置组件水平方向的偏移量。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var vertical

```cangjie
public var vertical: Float32
```

**功能：** 设置组件垂直方向的偏移量。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(Float32, Float32)

```cangjie
public init(horizontal!: Float32 = 0.5, vertical!: Float32 = 0.5)
```

**功能：** 构造一个Bias对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|horizontal|Float32|否|0.5|设置组件水平方向的偏移量。|
|vertical|Float32|否|0.5|设置组件垂直方向的偏移量。|
