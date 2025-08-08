# Row

沿水平方向布局的容器。

## 子组件

可以包含子组件。

## 创建组件

### init(Length, () -> Unit)

```cangjie
public init(space!: Length = 0.vp, child!: () -> Unit = {=>})
```

**功能：** 创建一个横向布局元素间距为space且可以包含子组件的Row容器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|space|[Length](cj-common-types.md#interface-length)|否|0.vp|横向布局元素间距。<br>space为负数或者justifyContent设置为FlexAlign.SpaceBetween、FlexAlign.SpaceAround、FlexAlign.SpaceEvenly时不生效。<br> 初始值：0，单位：vp <br> **说明：** 可选值为大于等于0的数字。|
|child|()->Unit|否|{ => }|容器内的子组件。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func alignItems(VerticalAlign)

```cangjie
public func alignItems(value: VerticalAlign): This
```

**功能：** 设置子组件在垂直方向上的对齐格式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[VerticalAlign](cj-common-types.md#enum-verticalalign)|是|-|在垂直方向上子组件的对齐格式。<br> 初始值：VerticalAlign.Center|

### func justifyContent(FlexAlign)

```cangjie
public func justifyContent(value: FlexAlign): This
```

**功能：** 设置子组件在水平方向上的对齐格式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[FlexAlign](cj-common-types.md#enum-flexalign)|是|-|子组件在水平方向上的对齐格式。<br> 初始值：FlexAlign.Start|

> **说明：**
>
> Row布局时若子组件不设置[flexShrink](cj-universal-attribute-flexlayout.md#func-flexshrinkfloat64)则默认不会压缩子组件，即所有子组件主轴大小累加可超过容器主轴。
