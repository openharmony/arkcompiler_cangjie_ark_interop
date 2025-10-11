# Flex 布局

> **说明：**
>
> 仅当父组件是 [Flex](./cj-row-column-stack-flex.md)、[Column](./cj-row-column-stack-column.md)、[Row](./cj-row-column-stack-row.md)、[GridRow](./cj-grid-layout-gridrow.md)（仅针对[alignSelf](./cj-universal-attribute-flexlayout.md#func-alignselfitemalign)）时生效。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func alignSelf(ItemAlign)

```cangjie
public func alignSelf(value: ItemAlign): This
```

**功能：** 设置组件自身的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ItemAlign](./cj-common-types.md#enum-itemalign)|是|-|项目对齐方式。|

## func flexBasis(Length)

```cangjie
public func flexBasis(value: Length): This
```

**功能：** 设置组件的弹性基准尺寸。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|是|-|组件在父容器主轴方向上的基准尺寸。|

## func flexGrow(Float64)

```cangjie
public func flexGrow(value: Float64): This
```

**功能：** 设置组件的弹性增长因子。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|灰度值。|

## func flexGrow(Int64)

```cangjie
public func flexGrow(value: Int64): This
```

**功能：** 设置组件的弹性增长因子。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int64|是|-|父容器在主轴方向上的剩余空间分配给此属性所在组件的比例。<br>取值范围(0,+∞)，初始值：0。|

## func flexShrink(Float64)

```cangjie
public func flexShrink(value: Float64): This
```

**功能：** 设置组件的弹性收缩因子。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|色相旋转角度。|

## func flexShrink(Int64)

```cangjie
public func flexShrink(value: Int64): This
```

**功能：** 设置组件的弹性收缩因子。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int64|是|-|父容器压缩尺寸分配给此属性所在组件的比例。<br> 父容器为Column、Row时，初始值为0。 <br>父容器为Flex时，初始值为1。|

