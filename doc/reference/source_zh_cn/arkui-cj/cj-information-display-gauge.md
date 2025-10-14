# ohos.arkui.component.gauge

## class Gauge

```cangjie
public class Gauge <: ContainerBase {

    public init(value!: Float64, min!: Float64 = 0.0, max!: Float64 = 100.0, child!: () -> Unit = { => })
}
```

**功能：** 数据量规图表组件，将数据展示为环形图表。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [ContainerBase](./cj-ui-framework.md#class-containerbase)

### init(Float64, Float64, Float64, () -> Unit)

```cangjie

public init(value!: Float64, min!: Float64 = 0.0, max!: Float64 = 100.0, child!: () -> Unit = { => })
```

**功能：** 创建一个数据量规图表组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-| **命名参数。** 量规图的当前数据值，即图中指针指向位置。用于组件创建时量规图初始值的预置。<br>**说明：**<br>value不在min和max范围内时使用min作为默认值。|
|min|Float64|否|0.0| **命名参数。** 当前数据段最小值。|
|max|Float64|否|100.0| **命名参数。** 当前数据段最大值。<br>**说明：**<br>max小于min时使用默认值0.0和100.0。<br>max和min支持负数。|
|child|()->Unit|否|{ => }| **命名参数。** 声明当前组件的子组件。|

### func colors(Array\<(ResourceColor,Float32)>)

```cangjie

public func colors(value: Array<(ResourceColor, Float32)>): This
```

**功能：** 设置量规图的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Array\<([ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor),Float32)>|是|-|量规图的颜色，支持分段颜色设置。|

### func colors(Array\<(LinearGradient,Float32)>)

```cangjie

public func colors(value: Array<(LinearGradient, Float32)>): This
```

**功能：** 设置量规图的分段渐变颜色组。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Array\<([LinearGradient](cj-information-display-datapanel.md),Float32)>|是|-|量规图的渐变色，支持分段颜色设置，最多9组。LinearGradient类型见datapanel组件，Float32为该段颜色的宽度范围。|

### func colors(ResourceColor)

```cangjie

public func colors(value: ResourceColor): This
```

**功能：** 设置量规图的颜色。

从API version 11开始，该接口使用以下规则：

参数类型为ResourceColor，则圆环类型为单色环。

参数类型为LinearGradient，则圆环类型为渐变环。

参数类型为数组，则圆环类型为分段渐变环，第一个参数为颜色值，若设置为非颜色类型，则置为"0xFFE84026"。第二个参数为颜色所占比重，若设置为负数或是非数值类型，则将比重置为0。

分段渐变环最大显示段数为9段，若多于9段，则多于部分不显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|量规图的颜色，支持分段颜色设置。|

API version 9 默认值：Color.Black

API version 11默认值：

若不传颜色，或者数组为空，无法确定圆环类型及颜色，则圆环颜色为"0xFF64BB5C"、"0xFFF7CE00"、"0xFFE84026"的渐变环。

若传入颜色，但颜色值有误，则该颜色为"0xFFE84026"。

若对应颜色的比重为0，则该颜色在圆环中不显示。若所有颜色比重均为0，圆环不显示。|

### func colors(LinearGradient)

```cangjie

public func colors(value: LinearGradient): This
```

**功能：** 设置量规图的分段渐变颜色组。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[LinearGradient](./cj-information-display-datapanel.md#class-lineargradient)|是|-|量规图的渐变色，支持分段颜色设置，最多9组。|

### func description(() -> Unit)

```cangjie

public func description(builder: () -> Unit): This
```

**功能：** 设置量规图的说明内容。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|builder|()->Unit|是|-|说明内容，@Builder中的内容由开发者自定义，建议使用文本。|

### func endAngle(Float64)

```cangjie

public func endAngle(angle: Float64): This
```

**功能：** 设置终止角度位置。

> **说明：**
>
> 当起始角度位置和终止角度位置差过小时，会绘制出异常图像，请取合理的起始角度位置和终止角度位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|angle|Float64|是|-|终止角度位置，时钟0点为0度，顺时针方向为正角度。<br>初始值：360.0。|

### func indicator(ResourceStr, Length)

```cangjie

public func indicator(icon!: ResourceStr = "default", space!: Length = 8.0.vp): This
```

**功能：** 设置指针样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|icon|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|"default"| **命名参数。** 指针样式："default"为三角箭头，"null"为无指针。|
|space|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|8.0.vp| **命名参数。** 指针距离圆环外边的间距(不支持百分比)。<br>单位：vp。|

### func startAngle(Float64)

```cangjie

public func startAngle(angle: Float64): This
```

**功能：** 设置量规图起始角度位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|angle|Float64|是|-|起始角度位置，时钟0点为0度，顺时针方向为正角度。|

### func strokeWidth(Length)

```cangjie

public func strokeWidth(length: Length): This
```

**功能：** 设置环形量规图的环形厚度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|length|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|环形量规图的环形厚度。<br>初始值：4.vp。<br>单位：vp。<br>**说明：**<br>设置小于0的值时，按默认值显示。<br>环形厚度的最大值为圆环的半径，超过最大值按最大值处理。<br>不支持百分比。|

### func trackShadow(Float64, Float64, Float64)

```cangjie

public func trackShadow(radius!: Float64 = 20.0, offsetX!: Float64 = 5.0, offsetY!: Float64 = 5.0): This
```

**功能：** 设置阴影样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|radius|Float64|否|20.0| **命名参数。** 投影模糊半径。<br>单位：vp。|
|offsetX|Float64|否|5.0| **命名参数。** X轴的偏移量。|
|offsetY|Float64|否|5.0| **命名参数。** Y轴的偏移量 。|

### func value(Float32)

```cangjie

public func value(value: Float32): This
```

**功能：** 设置量规图的数据值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float32|是|-|量规图的数据值，可用于动态修改量规图的数据值。<br>初始值：0.0。|
