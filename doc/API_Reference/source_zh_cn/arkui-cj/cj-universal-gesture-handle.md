# 设置组件绑定的手势

用于设置组件绑定的手势。可以通过UIGestureEvent对象调用其接口添加或删除手势。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func !=(GesturePriority)

```cangjie
public operator func !=(other: GesturePriority): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GesturePriority](#enum-gesturepriority)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

## func ==(GesturePriority)

```cangjie
public operator func ==(other: GesturePriority): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GesturePriority](#enum-gesturepriority)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时返回true，否则返回false。|

## 基础类型定义

### enum GesturePriority

```cangjie
public enum GesturePriority <: Equatable<GesturePriority> {
    | Low
    | High
    | ...
}
```

**功能：** 手势优先级。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<GesturePriority>

#### High

```cangjie
High
```

**功能：** 高手势优先级。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Low

```cangjie
Low
```

**功能：** 低手势优先级。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21