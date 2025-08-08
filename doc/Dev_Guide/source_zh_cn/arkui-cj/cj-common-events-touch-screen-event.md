# 触屏事件

触屏事件指当手指/手写笔在组件上按下、滑动、抬起时触发的回调事件。包括[点击事件](#点击事件)、[拖拽事件](./cj-common-events-drag-event.md)和[触摸事件](#触摸事件)。触屏事件的原理如下图所示：

**图1** 触摸事件原理

![touchEvent](./figures/touchEvent.png)

## 点击事件

点击事件是指通过手指或手写笔做出一次完整的按下和抬起动作。当发生点击事件时，会触发以下回调函数：

```cangjie
func onClick(callback: (ClickEvent)->Unit): This
```

event参数提供点击事件相对于窗口或组件的坐标位置，以及发生点击的事件源。

## 触摸事件

当手指或手写笔在组件上触碰时，会触发不同动作所对应的事件响应，包括按下（Down）、滑动（Move）、抬起（Up）事件：

```cangjie
public func onTouch(callback: (TouchEvent)->Unit): This
```

- event.type为TouchType.Down：表示手指按下。

- event.type为TouchType.Up：表示手指抬起。

- event.type为TouchType.Move：表示手指按住移动。

- event.type为TouchType.Cancel：表示打断取消当前手指操作。

触摸事件可以同时多指触发，通过event参数可获取触发的手指位置、手指唯一标志、当前发生变化的手指和输入的设备源等信息。
