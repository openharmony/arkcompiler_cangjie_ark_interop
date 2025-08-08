# 单一手势

## 点击手势（TapGesture）

```cangjie
TapGesture(count!: Int32 = 1, fingers!: Int32 = 1)
```

点击手势支持单次点击和多次点击，有两个可选参数：

- count：声明该点击手势识别的连续点击次数。默认值为1，若设置小于1的非法值会被转化为默认值。如果配置多次点击，上一次抬起和下一次按下的超时时间为300毫秒。

- fingers：用于声明触发点击的手指数量，最小值为1，最大值为10，默认值为1。当配置多指时，若第一根手指按下300毫秒内未有足够的手指数按下则手势识别失败。

## 长按手势（LongPressGesture）

```cangjie
LongPressGesture(fingers!: Int32 = 1, repeat!: Bool = false, duration!: Int32 = 500)
```

长按手势用于触发长按手势事件，有三个可选参数：

- fingers：用于声明触发长按手势所需要的最少手指数量，最小值为1，最大值为10，默认值为1。

- repeat：用于声明是否连续触发事件回调，默认值为false。

- duration：用于声明触发长按所需的最短时间，单位为毫秒，默认值为500。

## 拖动手势（PanGesture）

```cangjie
PanGesture(fingers!: Int32 = 1, direction!: PanDirection = PanDirection.All, distance!: Float64 = 5.0)
```

拖动手势用于触发拖动手势事件，滑动达到最小滑动距离（默认值为5vp）时拖动手势识别成功，有三个可选参数：

- fingers：用于声明触发拖动手势所需要的最少手指数量，最小值为1，最大值为10，默认值为1。

- direction：用于声明触发拖动的手势方向，此枚举值支持逻辑与（&）和逻辑或（|）运算。默认值为Pandirection.All。

- distance：用于声明触发拖动的最小拖动识别距离，单位为px，默认值为5。

## 捏合手势（PinchGesture）

```cangjie
PinchGesture(fingers!: Int32 = 2, distance!: Float64 = 5.0)
```

捏合手势用于触发捏合手势事件，有两个可选参数：

- fingers：用于声明触发捏合手势所需要的最少手指数量，最小值为2，最大值为5，默认值为2。

- distance：用于声明触发捏合手势的最小距离，单位为vp，默认值为5。

## 旋转手势（RotationGesture）

```cangjie
RotationGesture(fingers!: Int32 = 2, angle!: Float64 = 1.0)
```

旋转手势用于触发旋转手势事件，有两个可选参数：

- fingers：用于声明触发旋转手势所需要的最少手指数量，最小值为2，最大值为5，默认值为2。

- angle：用于声明触发旋转手势的最小改变度数，单位为deg，默认值为1。

## 滑动手势（SwipeGesture）

```cangjie
SwipeGesture(fingers!: Int32 = 1, direction!: SwipeDirection = SwipeDirection.All, speed!: Float64 = 100.0)
```

滑动手势用于触发滑动事件，当滑动速度大于100vp/s时可以识别成功，有三个可选参数：

- fingers：用于声明触发滑动手势所需要的最少手指数量，最小值为1，最大值为10，默认值为1。

- direction：用于声明触发滑动手势的方向，此枚举值支持逻辑与（&）和逻辑或（|）运算。默认值为SwipeDirection.All。

- speed：用于声明触发滑动的最小滑动识别速度，单位为vp/s，默认值为100。

> **说明：**
>
> 当SwipeGesture和PanGesture同时绑定时，若二者是以默认方式或者互斥方式进行绑定时，会发生竞争。SwipeGesture的触发条件为滑动速度达到100vp/s，PanGesture的触发条件为滑动距离达到5vp，先达到触发条件的手势触发。可以通过修改SwipeGesture和PanGesture的参数以达到不同的效果。
