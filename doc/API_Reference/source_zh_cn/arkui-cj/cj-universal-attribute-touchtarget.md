# 触摸热区设置

适用于支持通用点击事件、通用触摸事件、通用手势处理的组件。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func responseRegion(Rectangle)

```cangjie
public func responseRegion(value: Rectangle): This
```

**功能：** 设置组件的响应区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Rectangle](#)|是|-|响应区域矩形。|

## func responseRegion(Array\<Rectangle>)

```cangjie
public func responseRegion(value: Array<Rectangle>): This
```

**功能：** 设置组件的响应区域数组。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Array\<[Rectangle](#)>|是|-|矩形数组。|

