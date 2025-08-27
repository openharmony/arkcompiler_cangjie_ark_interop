# 自定义手势判定

为组件提供自定义手势判定能力。开发者可根据需要，在手势识别期间，决定是否响应手势。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func !=(GestureTypes)

```cangjie
public operator func !=(other: GestureTypes): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GestureTypes](#enum-gesturetypes)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

## func ==(GestureTypes)

```cangjie
public operator func ==(other: GestureTypes): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[GestureTypes](#enum-gesturetypes)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时，返回true，否则返回false。|

## 基础类型定义

### enum GestureTypes

```cangjie
public enum GestureTypes <: Equatable<GestureTypes> {
    | TAP_GESTURE
    | LONG_PRESS_GESTURE
    | PAN_GESTURE
    | PINCH_GESTURE
    | SWIPE_GESTURE
    | ROTATION_GESTURE
    | DRAG
    | CLICK
    | ...
}
```

**功能：** 手势类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<GestureTypes>

#### CLICK

```cangjie
CLICK
```

**功能：** 点击手势。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### DRAG

```cangjie
DRAG
```

**功能：** 拖拽手势。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### LONG_PRESS_GESTURE

```cangjie
LONG_PRESS_GESTURE
```

**功能：** 长按手势。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### PAN_GESTURE

```cangjie
PAN_GESTURE
```

**功能：** 平移手势。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### PINCH_GESTURE

```cangjie
PINCH_GESTURE
```

**功能：** 捏合手势。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### ROTATION_GESTURE

```cangjie
ROTATION_GESTURE
```

**功能：** 旋转手势。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### SWIPE_GESTURE

```cangjie
SWIPE_GESTURE
```

**功能：** 滑动手势。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### TAP_GESTURE

```cangjie
TAP_GESTURE
```

**功能：** 轻触手势。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

