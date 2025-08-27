# 浮层

设置组件的遮罩文本。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func overlay(String, Alignment, OverlayOffset)

```cangjie
public func overlay(value!: String, align!: Alignment = Alignment.Center,
    offset!: OverlayOffset = OverlayOffset(x: 0.0, y: 0.0)): This
```

**功能：** 在当前组件上，增加遮罩文本作为该组件的浮层。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-| **命名参数。**  遮罩文本内容。|
|align|[Alignment](#)|否|Alignment.Center | **命名参数。**  浮层相对于组件的方位。|
|offset|[OverlayOffset](#)|否|OverlayOffset(x: 0.0, y: 0.0)|**命名参数。**  浮层基于自身左上角的偏移量。浮层默认处于组件左上角。|

> **说明：**
>
> align和offset都设置时，效果重叠，浮层相对于组件方位定位后，再基于当前位置的左上角进行偏移。

