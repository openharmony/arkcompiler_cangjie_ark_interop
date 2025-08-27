# 前景色设置

设置组件的前景色。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func foregroundColor(ColoringStrategy)

```cangjie
public func foregroundColor(value: ColoringStrategy): This
```

**功能：** 设置前景颜色策略。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ColoringStrategy](#)|是|-|颜色策略。|

## func foregroundColor(ResourceColor)

```cangjie
public func foregroundColor(value: ResourceColor): This
```

**功能：** 设置组件的前景颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](./cj-common-types.md#interface-resourcecolor)|是|-|组件的前景颜色或者根据智能取色策略设置前景颜色。不支持属性动画。|

