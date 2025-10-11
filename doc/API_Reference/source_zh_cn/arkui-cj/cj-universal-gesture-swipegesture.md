# SwipeGesture

用于触发滑动事件，滑动速度大于100vp/s时可识别成功。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func !=(SwipeDirection)

```cangjie
public operator func !=(other: SwipeDirection): Bool
```

**功能：** 判断两个枚举值是否不相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SwipeDirection](#enum-swipedirection)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

## func ==(SwipeDirection)

```cangjie
public operator func ==(other: SwipeDirection): Bool
```

**功能：** 判断两个枚举值是否相等

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SwipeDirection](#enum-swipedirection)|是|-|比较的枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## 基础类型定义

### enum SwipeDirection

```cangjie
public enum SwipeDirection <: Equatable<SwipeDirection> {
    | Horizontal
    | Vertical
    | All
    | ...
}
```

**功能：** 触发滑动手势的滑动方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SwipeDirection>

#### All

```cangjie
All
```

**功能：** 所有方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Horizontal

```cangjie
Horizontal
```

**功能：** 水平方向，手指滑动方向与x轴夹角小于45度时触发。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Vertical

```cangjie
Vertical
```

**功能：** 竖直方向，手指滑动方向与y轴夹角小于45度时触发。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

