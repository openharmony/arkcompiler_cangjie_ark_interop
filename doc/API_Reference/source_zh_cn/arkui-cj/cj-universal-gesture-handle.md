# 设置组件绑定的手势

用于设置组件绑定的手势。可以通过UIGestureEvent对象调用其接口添加或删除手势。

## class UIGestureEvent

```cangjie
public class UIGestureEvent {}
```

**功能：** 用于设置组件绑定的手势。

**起始版本：** 19

### func addGesture(GestureHandler, GesturePriority, GestureMask)

```cangjie
public func addGesture(gesture: GestureHandler, priority!: GesturePriority = GesturePriority.Low, mask!: GestureMask = GestureMask.Normal): Unit
```

**功能：** 添加手势。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|gesture|[GestureHandler](#class-gesturehandler)|是|-|手势处理器对象。|
|priority|[GesturePriority](#enum-gesturepriority)|否|GesturePriority.Low| **命名参数。** 绑定手势的优先级。|
|mask|[GestureMask](./cj-universal-gesture-bind.md#enum-GestureMask)|否|GestureMask.Normal| **命名参数。** 事件响应设置。|

### func addParallelGesture(GestureHandler, GestureMask)

```cangjie
public func addParallelGesture(gesture: GestureHandler, mask!: GestureMask = GestureMask.Normal): Unit
```

**功能：** 绑定可与子组件手势同时触发的手势。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|gesture|[GestureHandler](#class-gesturehandler)|是|-|手势处理器对象。|
|mask|[GestureMask](./cj-universal-gesture-bind.md#enum-GestureMask)|否|GestureMask.Normal| **命名参数。** 事件响应设置。|

### func removeGestureByTag(String)

```cangjie
public func removeGestureByTag(tag: String): Unit
```

**功能：** 移除该组件上通过modifier绑定的设置为指定标志的手势。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|tag|String|是|-|手势处理器标志。|

### func clearGestures()

```cangjie
public func clearGestures(): Unit
```

**功能：** 清除该组件上通过modifier绑定的所有手势。

**起始版本：** 19

## class GestureHandler

```cangjie
public open class GestureHandler {}
```

**功能：** 手势对象的基型。

**起始版本：** 19

### func tag(String)

```cangjie
public func tag(tag: String): This
```

**功能：** 设置手势处理器的标志。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|tag|String|是|-|设置手势处理器标志。|

## class TapGestureHandler

```cangjie
public class TapGestureHandler <: GestureHandler {}
```

**功能：** 点击手势处理器对象类型。

**父类型：**

- [GestureHandler](#class-gesturehandler)

### init(Int32, Int32)

```cangjie
public init(count!: Int32 = 1, fingers!: Int32 = 1)
```

**功能：** 创建一个点击手势处理器。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|count|Int32|否|1| **命名参数。** 识别的连续点击次数。当设置的值小于1或不设置时，会被转化为默认值。<br/>**说明：** <br/> 1. 当配置多击时，上一次的最后一根手指抬起和下一次的第一根手指按下的超时时间为300毫秒。<br/> 2. 当上次点击的位置与当前点击的位置距离超过60vp时，手势识别失败。|
|fingers|Int32|否|1| **命名参数。** 触发点击的手指数，最小为1指， 最大为10指。当设置小于1的值或不设置时，会被转化为默认值。<br/>**说明：** <br/> 1. 当配置多指时，第一根手指按下后300毫秒内未有足够的手指数按下，手势识别失败；手指抬起时，抬起后剩余的手指数小于阈值时开始计时，如300ms内未全部抬起则手势识别失败。<br/>2. 实际点击手指数超过配置值，手势识别成功。|

### func onAction((GestureEvent) -> Unit)

```cangjie
public func onAction(callback: (GestureEvent) -> Unit): This
```

**功能：** Tap手势识别成功触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Tap手势识别成功触发该回调。|

## class LongPressGestureHandler

```cangjie
public class LongPressGestureHandler <: GestureHandler {}
```

**功能：** 长按手势处理器配置参数。

**父类型：**

- [GestureHandler](#class-gesturehandler)

### init(Int32, Bool, Int32)

```cangjie
public init(fingers!: Int32 = 1, repeat!: Bool = false, duration!: Int32 = 500)
```

**功能：** 创建一个长按手势。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fingers|Int32|否|1| **命名参数。** 触发长按的最少手指数，最小为1指， 最大取值为10指。<br/> **说明：** <br/> 手指按下后若发生超过15px的移动，则判定当前长按手势识别失败。|
|repeat|Bool|否|false| **命名参数。** 是否连续触发事件回调。|
|duration|Int32|否|500| **命名参数。** 触发长按的最短时间，单位为毫秒（ms）。<br/>**说明：** <br/>设置小于等于0时，按照默认值500处理。|

### func onAction((GestureEvent) -> Unit)

```cangjie
public func onAction(callback: (GestureEvent) -> Unit): This
```

**功能：** LongPress手势识别成功触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|LongPress手势识别成功触发该回调。|

### func onActionEnd((GestureEvent) -> Unit)

```cangjie
public func onActionEnd(callback: (GestureEvent) -> Unit): This
```

**功能：** LongPress手势识别成功，最后一根手指抬起后触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|LongPress手势识别成功，最后一根手指抬起后触发该回调。|

### func onActionCancel((GestureEvent) -> Unit)

```cangjie
public func onActionCancel(callback: (GestureEvent) -> Unit): This
```

**功能：** LongPress手势识别成功，接收到触摸取消事件触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|LongPress手势识别成功，接收到触摸取消事件触发该回调。|

## class PanGestureHandler

```cangjie
public class PanGestureHandler <: GestureHandler {}
```

**功能：** 拖动手势处理器对象类型。

**父类型：**

- [GestureHandler](#class-gesturehandler)

### init(Int32, Bool, Float64)

```cangjie
public init(fingers!: Int32 = 1, direction!: PanDirection = PanDirection.All, distance!: Float64 = 5.0)
```

**功能：** 创建一个拖动手势处理器。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fingers|Int32|否|1| **命名参数。** 触发长按的最少手指数，最小为1指，最大取值为10指。<br/>**说明：**<br/>手当设置的值小于1或不设置时，会被转化为默认值。|
|direction|[PanDirection](./cj-universal-gesture-pangesture.md#enum-pandirection)|否|PanDirection.All|用于指定触发拖动的手势方向，此枚举值支持逻辑与(&)和逻辑或(\| **命名参数。** )运算。|
|distance|Float64|否|5.0| **命名参数。** 用于指定触发拖动手势事件的最小拖动距离，单位为vp。<br/>**说明：**<br/>当设定的值小于0时，按默认值5处理。|

### func onActionStart((GestureEvent) -> Unit)

```cangjie
public func onActionStart(callback: (GestureEvent) -> Unit): This
```

**功能：** Pan手势识别成功触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Pan手势识别成功触发该回调。|

### func onActionUpdate((GestureEvent) -> Unit)

```cangjie
public func onActionUpdate(callback: (GestureEvent) -> Unit): This
```

**功能：** Pan手势移动过程中触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Pan手势移动过程中回调。|

### func onActionEnd((GestureEvent) -> Unit)

```cangjie
public func onActionEnd(callback: (GestureEvent) -> Unit): This
```

**功能：** Pan手势识别成功，手指抬起后触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Pan手势识别成功，手指抬起后触发该回调。|

### func onActionCancel((GestureEvent) -> Unit)

```cangjie
public func onActionCancel(callback: (GestureEvent) -> Unit): This
```

**功能：** Pan手势识别成功，接收到触摸取消事件触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Pan手势识别成功，接收到触摸取消事件触发该回调。|

## class SwipeGestureHandler

```cangjie
public class SwipeGestureHandler <: GestureHandler {}
```

**功能：** 滑动手势处理器对象类型。

**父类型：**

- [GestureHandler](#class-gesturehandler)

### init(Int32, SwipeDirection, Float64)

```cangjie
public init(fingers!: Int32 = 1, direction!: SwipeDirection = SwipeDirection.All, speed!: Float64 = 100.0)
```

**功能：** 创建一个滑动手势处理器。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fingers|Int32|否|1| **命名参数。** 触发滑动的最少手指数，默认为1，最小为1指，最大为10指。|
|direction|[SwipeDirection](./cj-universal-gesture-swipegesture.md#enum-SwipeDirection)|否|SwipeDirection.All| **命名参数。** 触发滑动手势的滑动方向。|
|speed|Float64|否|100.0| **命名参数。** 识别滑动的最小速度。<br/>**说明：** 当滑动速度的值小于等于0时，会被转化为默认值。|

### func onAction((GestureEvent) -> Unit)

```cangjie
public func onAction(callback: (GestureEvent) -> Unit): This
```

**功能：** Swipe手势识别成功触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Swipe手势识别成功触发该回调。|

## class PinchGestureHandler

```cangjie
public class PinchGestureHandler <: GestureHandler {}
```

**功能：** 捏合手势处理器对象类型。

**父类型：**

- [GestureHandler](#class-gesturehandler)

### init(Int32, Float64)

```cangjie
public init(fingers!: Int32 = 2, distance!: Float64 = 5.0)
```

**功能：** 创建一个捏合手势处理器。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fingers|Int32|否|2| **命名参数。** 触发捏合的最少手指数, 最小为2指，最大为5指。<br/> **说明：** <br/> 触发手势手指可以多于fingers数目，但只有先落下的与fingers相同数目的手指参与手势计算。|
|distance|Float64| 否|5.0| **命名参数。** 最小识别距离，单位为vp。<br/> **说明：** <br/> 当识别距离的值小于等于0时，会被转化为默认值。|

### func onActionStart((GestureEvent) -> Unit)

```cangjie
public func onActionStart(callback: (GestureEvent) -> Unit): This
```

**功能：** Pinch手势识别成功触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Pan手势识别成功触发该回调。|

### func onActionUpdate((GestureEvent) -> Unit)

```cangjie
public func onActionUpdate(callback: (GestureEvent) -> Unit): This
```

**功能：** Pinch手势移动过程中触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Pan手势移动过程中触发该回调。|

### func onActionEnd((GestureEvent) -> Unit)

```cangjie
public func onActionEnd(callback: (GestureEvent) -> Unit): This
```

**功能：** Pinch手势识别成功，手指抬起后触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Pan手势识别成功，手指抬起后触发该回调。|

### func onActionCancel((GestureEvent) -> Unit)

```cangjie
public func onActionCancel(callback: (GestureEvent) -> Unit): This
```

**功能：** Pinch手势识别成功，手指抬起后触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Pinch手势识别成功，接收到触摸取消事件触发该回调。|

## class RotationGestureHandler

```cangjie
public class RotationGestureHandler <: GestureHandler {}
```

**功能：** 旋转手势处理器对象类型。

**父类型：**

- [GestureHandler](#class-gesturehandler)

### init(Int32, Float64)

```cangjie
public init(fingers!: Int32 = 2, angle!: Float64 = 1.0)
```

**功能：** 创建一个捏合手势处理器。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fingers|Int32|否|2| **命名参数。** 触发旋转的最少手指数, 最小为2指，最大为5指。<br/> **说明：** <br/> 触发手势手指可以多于fingers数目，但只有先落下的两指参与手势计算。|
|angle|Float64|否|1.0| **命名参数。** 触发旋转手势的最小改变度数，单位为deg。 <br/> **说明：** <br/> 当改变度数的值小于等于0或大于360时，会被转化为默认值。|

### func onActionStart((GestureEvent) -> Unit)

```cangjie
public func onActionStart(callback: (GestureEvent) -> Unit): This
```

**功能：** Rotation手势识别成功触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Rotation手势识别成功触发该回调。|

### func onActionUpdate((GestureEvent) -> Unit)

```cangjie
public func onActionUpdate(callback: (GestureEvent) -> Unit): This
```

**功能：** Rotation手势移动过程中触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Rotation手势移动过程中触发该回调。|

### func onActionEnd((GestureEvent) -> Unit)

```cangjie
public func onActionEnd(callback: (GestureEvent) -> Unit): This
```

**功能：** Rotation手势识别成功，手指抬起后触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Rotation手势识别成功，手指抬起后触发该回调。|

### func onActionCancel((GestureEvent) -> Unit)

```cangjie
public func onActionCancel(callback: (GestureEvent) -> Unit): This
```

**功能：** Rotation手势识别成功，接收到触摸取消事件触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|Rotation手势识别成功，接收到触摸取消事件触发该回调。|

## class GestureGroupHandler

```cangjie
public class GestureGroupHandler <: GestureHandler {}
```

**功能：** 手势组处理器对象类型。

**父类型：**

- [GestureHandler](#class-gesturehandler)

### init(GestureMode, Array\<GestureType>)

```cangjie
public init(mode: GestureMode, gesture: Array<Gesture>)
```

**功能：** 创建一个手势组处理器。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|mode|[GestureMode](./cj-universal-gesture-groupgesture.md#enum-GestureMode)|是|-|设置组合手势识别模式。初始值：GestureMode.Sequence。|
|gesture|Array\<GestureType>|是|-|设置1个或者多个基础手势类型时，这些手势会被识别为组合手势。若此参数Array长度为0则组合手势识别功能不生效。|

### func onCancel(() -> Unit)

```cangjie
public func onCancel(callback: () -> Unit): This
```

**功能：** 顺序组合手势（GestureMode.Sequence）取消后触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|()->Unit|是|-|回调函数，顺序组合手势（GestureMode.Sequence）取消后触发该回调。|

## enum GesturePriority

```cangjie
public enum GesturePriority {
    | Low
    | High
}
```

**功能：** 组合手势识别模式。

**起始版本：** 19

### Low

```cangjie
Low
```

**功能：** 普通优先级手势。

**起始版本：** 19

### High

```cangjie
High
```

**功能：** 高优先级手势。

**起始版本：** 19

## 示例

见[动态手势设置](./cj-universal-attribute-gesturemodifier.md)。
