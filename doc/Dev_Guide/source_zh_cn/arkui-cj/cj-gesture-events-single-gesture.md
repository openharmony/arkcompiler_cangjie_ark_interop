# 单一手势

## 点击手势（TapGesture）


```cangjie
TapGesture(count!: Int32 = 1, fingers!: Int32 = 1)
```

点击手势支持单次点击和多次点击，有两个可选参数：

- count：声明该点击手势识别的连续点击次数。默认值为1，若设置小于1的非法值会被转化为默认值。如果配置多次点击，上一次抬起和下一次按下的超时时间为300毫秒。

- fingers：用于声明触发点击的手指数量，最小值为1，最大值为10，默认值为1。当配置多指时，若第一根手指按下300毫秒内未有足够的手指数按下则手势识别失败。

以在Text组件上绑定双击手势（count值为2的点击手势）为例：

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class  EntryView {
       @State var value: String=" "
  func build() {
    Column() {
      Text('Click twice').fontSize(28)
        .gesture(
          // 绑定count为2的TapGesture
          TapGesture(count:2,fingers:1)
            .onAction({event:GestureEvent=> value="{"+"id:"+event.fingerList[0].id.toString()+","
                        +"globalX:"+event.fingerList[0].globalX.toString()+","
                        +"globalY:"+event.fingerList[0].globalY.toString()+","
                        +"localX:"+event.fingerList[0].localX.toString()+","
                        +"localY:"+event.fingerList[0].localY.toString()+"}"
                      })
              )
      Text(value)
    }
    .height(200)
    .width(250)
    .padding(20)
    .border(width:3)
    .margin(30)
  }
}
```

![TapGesture](figures/singleGestureTapGesture.gif)

## 长按手势（LongPressGesture）


```cangjie
LongPressGesture(fingers!: Int32 = 1, repeat!: Bool = false, duration!: Int32 = 500)
```

长按手势用于触发长按手势事件，有三个可选参数：

- fingers：用于声明触发长按手势所需要的最少手指数量，最小值为1，最大值为10，默认值为1。

- repeat：用于声明是否连续触发事件回调，默认值为false。

- duration：用于声明触发长按所需的最短时间，单位为毫秒，默认值为500。

以在Text组件上绑定可以重复触发的长按手势为例：

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
  @State var count: Int8 = 0

  func build() {
    Column() {
      Text('LongPress OnAction:' + count.toString()).fontSize(28)
        .gesture(
          // 绑定可以重复触发的LongPressGesture
          LongPressGesture( repeat: true )
           .onAction({event: GestureEvent => count++})
            .onActionEnd({event: GestureEvent=>
              count = 0
            })
        )
    }
    .height(200)
    .width(250)
    .padding(20)
    .border( width: 3 )
    .margin(30)
  }
}
```

![LongPressGesture](figures/singleGestureLongPressGesture.gif)

## 拖动手势（PanGesture）


```cangjie
PanGesture(fingers!: Int32 = 1, direction!: PanDirection = PanDirection.All, distance!: Float64 = 5.0)
```

拖动手势用于触发拖动手势事件，滑动达到最小滑动距离（默认值为5vp）时拖动手势识别成功，有三个可选参数：

- fingers：用于声明触发拖动手势所需要的最少手指数量，最小值为1，最大值为10，默认值为1。

- direction：用于声明触发拖动的手势方向，此枚举值支持逻辑与（&）和逻辑或（|）运算。默认值为Pandirection.All。

- distance：用于声明触发拖动的最小拖动识别距离，单位为px，默认值为5。

以在Text组件上绑定拖动手势为例，可以通过在拖动手势的回调函数中修改组件的布局位置信息来实现组件的拖动：

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
  @State var offsetX: Length = 0;
  @State var offsetY: Length = 0;
  @State var positionX: Length = 0;
  @State var positionY: Length = 0;

  func build() {
    Column() {
      Text('PanGesture Offset:\nX: ' + offsetX.value.toString() + '\n' + 'Y: ' + offsetY.value.toString())
        .fontSize(28)
        .height(200)
        .width(300)
        .padding(20)
        .border( width: 3 )
          // 在组件上绑定布局位置信息
        .translate( x: offsetX, y: offsetY, z: 0 )
        .gesture(
          // 绑定拖动手势
          PanGesture()
           .onActionStart({event: GestureEvent =>})
              // 当触发拖动手势时，根据回调函数修改组件的布局位置信息
            .onActionUpdate({event: GestureEvent =>
                offsetX = positionX.value + event.offsetX
                offsetY = positionY.value + event.offsetY

            })
            .onActionEnd({ event: GestureEvent=>
              positionX = offsetX
              positionY = offsetY
            })
        )
    }
    .height(200)
    .width(250)
  }
}
```

![PanGesture](figures/singleGesturePanGesture.gif)

> **说明：**
>
> - 大部分可滑动组件，如List、Grid、Scroll、Tab等组件是通过PanGesture实现滑动，在组件内部的子组件绑定[拖动手势（PanGesture）](#拖动手势pangesture)或者[滑动手势（SwipeGesture）](#滑动手势swipegesture)会导致手势竞争。
>
> - 当在子组件绑定PanGesture时，在子组件区域进行滑动仅触发子组件的PanGesture。如果需要父组件响应，需要通过修改手势绑定方法或者子组件向父组件传递消息进行实现，或者通过修改父子组件的PanGesture参数distance使得拖动更灵敏。当子组件绑定SwipeGesture时，由于PanGesture和SwipeGesture触发条件不同，需要修改PanGesture和SwipeGesture的参数以达到所需效果。
>
> - 不合理的阈值设置会导致滑动不跟手（响应时延慢）的问题。

## 捏合手势（PinchGesture）


```cangjie
PinchGesture(fingers!: Int32 = 2, distance!: Float64 = 5.0)
```

捏合手势用于触发捏合手势事件，有两个可选参数：

- fingers：用于声明触发捏合手势所需要的最少手指数量，最小值为2，最大值为5，默认值为2。

- distance：用于声明触发捏合手势的最小距离，单位为vp，默认值为5。

以在Column组件上绑定三指捏合手势为例，可以通过在捏合手势的函数回调中获取缩放比例，实现对组件的缩小或放大：

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*
import ohos.hilog.*

@Entry
@Component
class  EntryView {
    @State var scaleValue: Float32 = 1.0;
    @State var pinchValue: Float32 = 1.0;
    @State var pinchX: Float64 = 0.0;
    @State var pinchY: Float64 = 0.0;

    func build() {
        Column() {
            Column() {
                Text('PinchGesture scale:\n' + scaleValue.toString())
                Text('PinchGesture center:\n(' + pinchX.toString() + ',' + pinchY.toString() + ')')
            }
            .height(200)
            .width(300)
            .border( width: 3 )
            .margin( top: 100 )
            // 在组件上绑定缩放比例，可以通过修改缩放比例来实现组件的缩小或者放大
            .scale( x: scaleValue, y: scaleValue, z: 1.0 )
            .gesture(
                // 在组件上绑定三指触发的捏合手势
                PinchGesture( fingers: 3 )
                .onActionStart({event: GestureEvent => Hilog.info(0, "Pinch", "Pinch start")})
                    // 当捏合手势触发时，可以通过回调函数获取缩放比例，从而修改组件的缩放比例
                .onActionUpdate({event: GestureEvent =>
                    scaleValue = pinchValue * Float32(event.scale)
                    pinchX = event.pinchCenterX
                    pinchY = event.pinchCenterY
                })
                .onActionEnd({ event: GestureEvent=>
                    pinchValue = scaleValue
                    Hilog.info(0, "Pinch", "Pinch end")
                })
            )
        }
    }
}
```

![PinchGesture](figures/singleGesturePinchGesture.png)

## 旋转手势（RotationGesture）


```cangjie
RotationGesture(fingers!: Int32 = 2, angle!: Float64 = 1.0)
```

旋转手势用于触发旋转手势事件，有两个可选参数：

- fingers：用于声明触发旋转手势所需要的最少手指数量，最小值为2，最大值为5，默认值为2。

- angle：用于声明触发旋转手势的最小改变度数，单位为deg，默认值为1。

以在Text组件上绑定旋转手势实现组件的旋转为例，可以通过在旋转手势的回调函数中获取旋转角度，从而实现组件的旋转：

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*
import ohos.hilog.*

@Entry
@Component
class  EntryView {
  @State var angle: Float32 = 0.0
  @State var rotateValue: Float32 = 0.0

  func build() {
    Column() {
      Text('RotationGesture angle:' + angle.toString()).fontSize(28)
        // 在组件上绑定旋转布局，可以通过修改旋转角度来实现组件的旋转
        .rotate( angle )
        .gesture(
          RotationGesture()
           .onActionStart({event: GestureEvent =>
              Hilog.info(0, "RotationGesture", "RotationGesture is onActionStart")
            })
              // 当旋转手势生效时，通过旋转手势的回调函数获取旋转角度，从而修改组件的旋转角度
            .onActionUpdate({event: GestureEvent =>
              angle = rotateValue + Float32(event.angle)
              Hilog.info(0, "RotationGesture", "RotationGesture is onActionEnd")
            })
              // 当旋转结束抬手时，固定组件在旋转结束时的角度
            .onActionEnd({event: GestureEvent =>
              this.rotateValue = this.angle
              Hilog.info(0, "RotationGesture", "RotationGesture is onActionEnd")
            })
            .onActionCancel({ =>
              Hilog.info(0, "RotationGesture", "RotationGesture is onActionCancel")
            })
        )
        .height(200)
        .width(300)
        .padding(20)
        .border( width: 3 )
        .margin(100)
    }
  }
}
```

![RotationGesture](figures/singleGestureRotationGesture.png)

## 滑动手势（SwipeGesture）


```cangjie
SwipeGesture(fingers!: Int32 = 1, direction!: SwipeDirection = SwipeDirection.All, speed!: Float64 = 100.0)
```

滑动手势用于触发滑动事件，当滑动速度大于100vp/s时可以识别成功，有三个可选参数：

- fingers：用于声明触发滑动手势所需要的最少手指数量，最小值为1，最大值为10，默认值为1。

- direction：用于声明触发滑动手势的方向，此枚举值支持逻辑与（&）和逻辑或（|）运算。默认值为SwipeDirection.All。

- speed：用于声明触发滑动的最小滑动识别速度，单位为vp/s，默认值为100。

以在Column组件上绑定滑动手势实现组件的旋转为例：

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import kit.LocationKit.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var rotateAngle: Float32 = 0.0
  @State var speed: Float32 = 1.0

  func build() {
    Column() {
      Column() {
        Text("SwipeGesture speed\n" + this.speed.toString())
        Text("SwipeGesture angle\n" + this.rotateAngle.toString())
      }
      .border( width: 3 )
      .width(300)
      .height(200)
      .margin(100)
      // 在Column组件上绑定旋转，通过滑动手势的滑动速度和角度修改旋转的角度
      .rotate(x: 0.0, y: 0.0, z: 1.0, angle: this.rotateAngle, centerX: 0, centerY: 0)
      .gesture(
        // 绑定滑动手势且限制仅在竖直方向滑动时触发
        SwipeGesture( direction: SwipeDirection.Vertical )
          // 当滑动手势触发时，获取滑动的速度和角度，实现对组件的布局参数的修改
          .onAction({event: GestureEvent =>
                this.speed = Float32(event.speed);
                this.rotateAngle = Float32(event.angle);
              }
          )
      )
    }
  }
}
```

![SwipeGesture](figures/singleGestureSwipeGesture.gif)

> **说明：**
>
> 当SwipeGesture和PanGesture同时绑定时，若二者是以默认方式或者互斥方式进行绑定时，会发生竞争。SwipeGesture的触发条件为滑动速度达到100vp/s，PanGesture的触发条件为滑动距离达到5vp，先达到触发条件的手势触发。可以通过修改SwipeGesture和PanGesture的参数以达到不同的效果。
