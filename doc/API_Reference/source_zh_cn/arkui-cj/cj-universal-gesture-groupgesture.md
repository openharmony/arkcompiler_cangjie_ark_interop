# 组合手势

手势识别组合，即多种手势组合为复合手势，支持连续识别、并行识别和互斥识别。

## 导入模块

```cangjie
import kit.UIkit.*
```

## 权限列表

无

## func !=(GestureMode)

```cangjie
public operator func !=(other: GestureMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GestureMode](#enum-gesturemode)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

## func ==(GestureMode)

```cangjie
public operator func ==(other: GestureMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GestureMode](#enum-gesturemode)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时返回true，否则返回false。|

## 基础类型定义

### enum GestureMode

```cangjie
public enum GestureMode <: Equatable<GestureMode> {
    | Sequence
    | Parallel
    | Exclusive
    | ...
}
```

**功能：** 组合手势的识别模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<GestureMode>

#### Exclusive

```cangjie
Exclusive
```

**功能：** 互斥识别，注册的手势同时识别，若有一个手势识别成功，则结束手势识别。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Parallel

```cangjie
Parallel
```

**功能：** 并发识别，注册的手势同时识别，直到所有手势识别结束，手势识别互相不影响。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Sequence

```cangjie
Sequence
```

**功能：** 顺序识别，按照手势的注册顺序识别手势，直到所有手势识别成功。若有一个手势识别失败，后续手势识别均失败。顺序识别手势组仅有最后一个手势可以响应onActionEnd。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21
