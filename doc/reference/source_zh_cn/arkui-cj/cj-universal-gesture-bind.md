# 绑定手势方法

为组件绑定不同类型的手势事件，并设置事件的响应方法。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func !=(GestureMask)

```cangjie
public operator func !=(other: GestureMask): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GestureMask](#enum-gesturemask)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

## func ==(GestureMask)

```cangjie
public operator func ==(other: GestureMask): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GestureMask](#enum-gesturemask)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时返回true，否则返回false。|

## 基础类型定义

### enum GestureMask

```cangjie
public enum GestureMask <: Equatable<GestureMask> {
    | Normal
    | IgnoreInternal
    | ...
}
```

**功能：** 手势掩码。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<GestureMask>

#### IgnoreInternal

```cangjie
IgnoreInternal
```

**功能：** 屏蔽子组件的手势，包括子组件上系统内置的手势，如子组件为List组件时，内置的滑动手势同样会被屏蔽。若父子组件区域存在部分重叠，则只会屏蔽父子组件重叠的部分。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Normal

```cangjie
Normal
```

**功能：** 不屏蔽子组件的手势，按照默认手势识别顺序进行识别。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

