# PanGesture

滑动手势事件，当滑动的最小距离达到设定的最小值时触发滑动手势事件

## 创建组件

### init(Int32, PanDirection, Float64)

```cangjie
public init(fingers!: Int32 = 1, direction!: PanDirection = PanDirection.All, distance!: Float64 = 5.0)
```

**功能：** 创建一个滑动手势。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fingers|Int32|否|1| **命名参数。** 触发滑动的最少手指数，最小为1指， 最大取值为10指。<br/> **说明：** <br/> 手当设置的值小于1或不设置时，会被转化为默认值。|
|direction|[PanDirection](#enum-pandirection)|否|PanDirection.All|用于指定触发滑动的手势方向，此枚举值支持逻辑与(&)和逻辑或(\| **命名参数。** )运算。|
|distance|Float64|否|5.0| **命名参数。** 用于指定触发滑动手势事件的最小滑动距离，单位为px。 <br/> **说明：** <br/> 当设定的值小于0时，按默认值5处理。|

### init(PanGestureOptions)

```cangjie
public init(panGestureOptions: PanGestureOptions)
```

**功能：** 创建一个滑动手势。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|panGestureOptions|[PanGestureOptions](#enum-pandirection)|是|-|通过PanGestureOptions对象接口可以动态修改平移手势识别器的属性，从而避免通过状态变量修改属性（状态变量修改会导致UI刷新）。|

## 组件事件

### func onActionCancel(() -> Unit)

```cangjie
public func onActionCancel(callback: () -> Unit): This
```

**功能：** Pan手势识别成功，接收到触摸取消事件触发回调。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|()->Unit|是|-|回调函数，Pan手势识别成功，接收到触摸取消事件触发。|

### func onActionEnd((GestureEvent) -> Unit)

```cangjie
public func onActionEnd(callback: (GestureEvent) -> Unit): This
```

**功能：** Pan手势识别成功，手指抬起后触发回调。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|回调函数，Pan手势识别成功，手指抬起后触发。|

### func onActionStart((GestureEvent) -> Unit)

```cangjie
public func onActionStart(callback: (GestureEvent) -> Unit): This
```

**功能：** Pan手势识别成功回调。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|回调函数，Pan手势识别成功触发。|

### func onActionUpdate((GestureEvent) -> Unit)

```cangjie
public func onActionUpdate(callback: (GestureEvent) -> Unit): This
```

**功能：** Pan手势移动过程中回调。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureEvent](./cj-universal-gesture-bind.md#class-gestureevent))->Unit|是|-|回调函数，Pan手势移动过程中触发。|

## 基础类型定义

### class PanGestureOptions

```cangjie
public class PanGestureOptions {
    public init(fingers!: Int32 = 1, direction!: PanDirection = PanDirection.All, distance!: Float64 = 5.0)
}
```

**功能：** 通过PanGestureOptions对象接口可以动态修改平移手势识别器的属性，从而避免通过状态变量修改属性（状态变量修改会导致UI刷新）。

**起始版本：** 19

#### init(Int32, PanDirection, Float64)

```cangjie
public init(fingers!: Int32 = 1, direction!: PanDirection = PanDirection.All, distance!: Float64 = 5.0)
```

**功能：** 创建一个PanGestureOptions对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fingers|Int32|否|1| **命名参数。** 用于指定触发滑动的最少手指数，最小为1指，最大取值为10指。<br/> 取值范围：[1,10]。<br/> **说明：** <br/> 当设置的值小于1或不设置时，会被转化为1。|
|direction|[PanDirection](#enum-pandirection)|否|PanDirection.All|用于指定触发滑动的手势方向，此枚举值支持逻辑与（&）和逻辑或（\| **命名参数。** ）运算。|
|distance|Float64|否|5.0| **命名参数。** 用于指定触发滑动手势事件的最小拖动距离，单位为px。 <br/> **说明：** <br/> Tabs组件滑动与该滑动手势事件同时存在时，可将distance的值设为1，使滑动更灵敏，避免造成事件错乱。<br/> 当设定的值小于0时，按5.0处理。|

#### func setDirection(PanDirection)

```cangjie
public func setDirection(value: PanDirection): Unit
```

**功能：** 设置滑动方向。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[PanDirection](#enum-pandirection)|是|-|用于指定触发滑动的手势方向，此枚举值支持逻辑与和逻辑或运算。|

#### func setDistance(Float64)

```cangjie
public func setDistance(value: Float64): Unit
```

**功能：** 设置触发滑动手势事件的最小滑动距离，单位为px。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|用于指定触发滑动手势事件的最小拖动距离，单位为px。**说明：** <br/> Tabs组件滑动与该滑动手势事件同时存在时，可将distance的值设为1，使滑动更灵敏，避免造成事件错乱。<br/> 当设定的值小于0时，按5.0处理。|

#### func setFingers(Int32)

```cangjie
public func setFingers(value: Int32): Unit
```

**功能：** 设置触发滑动的最少手指数。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|用于指定触发滑动的最少手指数，最小为1指，最大取值为10指。 <br/> 取值范围：[1,10]。<br/> **说明：** <br/> 当设置的值小于1或不设置时，会被转化为1。|

### enum PanDirection

```cangjie
public enum PanDirection {
    | None
    | Left
    | Right
    | Horizontal
    | Up
    | Down
    | Vertical
    | All
    | Computed(UInt32)
}
```

**功能：** 拖动手势方向。

**起始版本：** 19

#### All

```cangjie
All
```

**功能：** 所有方向。

**起始版本：** 19

#### Computed(UInt32)

```cangjie
Computed(UInt32)
```

**功能：** 支持逻辑与(&)和逻辑或(|)运算。

**起始版本：** 19

#### Down

```cangjie
Down
```

**功能：** 向下拖动。

**起始版本：** 19

#### Horizontal

```cangjie
Horizontal
```

**功能：** 水平方向。

**起始版本：** 19

#### Left

```cangjie
Left
```

**功能：** 向左拖动。

**起始版本：** 19

#### None

```cangjie
None
```

**功能：** 所有方向。

**起始版本：** 19

#### Right

```cangjie
Right
```

**功能：** 向右拖动。

**起始版本：** 19

#### Up

```cangjie
Up
```

**功能：** 向上拖动。

**起始版本：** 19

#### Vertical

```cangjie
Vertical
```

**功能：** 竖直方向。

**起始版本：** 19

#### func &(PanDirection)

```cangjie
public operator func &(right: PanDirection): PanDirection
```

**功能：** 对PanDirection进行逻辑与(&)运算。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|right|[PanDirection](#enum-pandirection)|是|-|滑动方向|

**返回值：**

|类型|说明|
|:----|:----|
|[PanDirection](#enum-pandirection)|滑动方向|

#### func |(PanDirection)

```cangjie
public operator func |(right: PanDirection): PanDirection
```

**功能：** 对PanDirection进行逻辑或(|)运算。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|right|[PanDirection](#enum-pandirection)|是|-|滑动方向|

**返回值：**

|类型|说明|
|:----|:----|
|[PanDirection](#enum-pandirection)|滑动方向|

## 示例代码

该示例通过PanGesture实现了单指滑动手势的识别。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var offsetX: Float64 = 0.0
    @State var offsetY: Float64 = 0.0
    @State var positionX: Float64 = 0.0
    @State var positionY: Float64 = 0.0

    func build() {
        Column() {
            Column() {
                Text('PanGesture offset:\nX: ' + this.offsetX.toString() + '\n' + 'Y: ' + this.offsetY.toString())
            }
            .height(200)
            .width(300)
            .padding(20)
            .border(width: 3.vp)
            .margin(50)
            .translate(x: this.offsetX, y: this.offsetY, z: 0.0) // 以组件左上角为坐标原点进行移动
            .gesture(
                PanGesture()
                .onActionUpdate({ event: GestureEvent =>
                    this.offsetX = this.positionX + event.offsetX
                    this.offsetY = this.positionY + event.offsetY
                })
                .onActionEnd({ event: GestureEvent =>
                    this.positionX = this.offsetX
                    this.positionY = this.offsetY
                })
            )
        }
    }
}
```

![pan](figures/pan_gesture.gif)
