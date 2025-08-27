# 显式动画 (animateTo)

提供全局animateTo显式动画接口来指定由于闭包代码导致的状态变化插入过渡动效。同[属性动画](./cj-animation-animation.md)，布局类改变宽高的动画，内容都是直接到终点状态。例如文字、[Canvas](./cj-canvas-drawing-canvas.md)的内容等。如果期望内容跟随宽高变化，可以使用[renderFit](./cj-universal-attribute-renderfit.md)属性配置。

## 导入模块

```cangjie
import kit.ArkUI.*
```
## func animateTo(AnimateParam, VoidCallback)

```cangjie
public func animateTo(value: AnimateParam, event: VoidCallback): Unit
```

**功能：** 提供全局animateTo显式动画接口来指定由于闭包代码导致的状态变化插入过渡动效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|animation|[AnimateParam](./cj-common-types.md#class-animateparam)|是|-|设置动画效果相关参数。|
|callback|[VoidCallback](<font color="red" face="bold">please add link</font>)|是|-|指定动效的闭包函数，在闭包函数中导致的状态变化系统会自动插入过渡动画。|

## class ExpectedFrameRateRange

```cangjie
public class ExpectedFrameRateRange {
    public var min: Int32
    public var max: Int32
    public var expected: Int32
    public init(
        min!: Int32,
        max!: Int32,
        expected!: Int32
    )
}
```

**功能：** 设置动画的期望帧率范围。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var expected

```cangjie
public var expected: Int32
```

**功能：** 期望的帧率值。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var max

```cangjie
public var max: Int32
```

**功能：** 最大帧率值。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var min

```cangjie
public var min: Int32
```

**功能：** 最小帧率值。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Int32, Int32, Int32)

```cangjie
public init(
    min!: Int32,
    max!: Int32,
    expected!: Int32
)
```

**功能：** 构造一个ExpectedFrameRateRange对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|min|Int32|是|-|最小帧率值。|
|max|Int32|是|-|最大帧率值。|
|expected|Int32|是|-|期望的帧率值。|

## 示例代码

### 示例代码1（在组件出现时创建动画）

该示例通过在onAppear方法中创建组件出现时的动画效果。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var isShow: Bool = true
    @State var widthSize: Length = 250.vp
    @State var heightSize: Length = 100.vp
    @State var rotateAngle: Float32 = 0.0

    func build() {
        Column() {
            Button("change size")
                .width(this.widthSize)
                .height(this.heightSize)
                .margin(30)
                .onClick(
                    {
                        =>
                        if (this.isShow) {
                            animateTo(
                                AnimateParam(
                                    duration: 2000,
                                    curve: Curve.EaseOut,
                                    iterations: 3,
                                    playMode: PlayMode.Normal,
                                    onFinish: {=> AppLog.info("play end")}
                                ),
                                {
                                    =>
                                    this.widthSize = 150.vp
                                    this.heightSize = 60.vp
                                }
                            )
                        } else {
                            animateTo(
                                AnimateParam(),
                                {
                                    =>
                                    this.widthSize = 250.vp
                                    this.heightSize = 100.vp
                                }
                            )
                        }
                        this.isShow = !this.isShow
                    }
                )
            Button("change rotate angle")
                .margin(50)
                .rotate(x: 0.0, y: 0.0, z: 1.0, angle: this.rotateAngle)
                .onClick(
                    {
                        => animateTo(
                            AnimateParam(
                                duration: 1200,
                                curve: Curve.Friction,
                                delay: 500,
                                iterations: -1, // 设置-1表示动画无限循环
                                playMode: PlayMode.Alternate,
                                onFinish: {=> AppLog.info("play end")},
                                expectedFrameRateRange: ExpectedFrameRateRange(
                                    min: 10,
                                    max: 120,
                                    expected: 60,
                                )
                            ),
                            {=> this.rotateAngle = 90.0}
                        )
                    })
        }
        .width(100.percent)
        .margin(top: 5)
    }
}
```

![animate](figures/animate.gif)

### 示例代码2（动画执行结束后组件消失）

该示例主要演示如何实现在动画执行结束后组件消失。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var isShow: Bool = true
    @State var heightSize: Length = 100.vp
    @State var count: Int = 0
    @State var isToBottom: Bool = true

    func build() {
        Column() {
            if (this.isShow) {
                Column()
                    .margin(50)
                    .width(200)
                    .height(this.heightSize)
                    .backgroundColor(Color.BLUE)
                    .onClick(
                        {
                            evt => animateTo(
                                AnimateParam(
                                    duration: 2000,
                                    curve: Curve.EaseOut,
                                    iterations: 1,
                                    playMode: PlayMode.Normal,
                                    onFinish: {
                                        =>
                                        this.count--
                                        if (this.count == 0 && !this.isToBottom) {
                                            this.isShow = false
                                        }
                                    },
                                ),
                                {
                                    =>
                                    this.count++
                                    if (this.isToBottom) {
                                        this.heightSize = 60
                                    } else {
                                        this.heightSize = 100
                                    }
                                    this.isToBottom = !this.isToBottom
                                }
                            )
                        })
            }
        }
        .width(100.percent)
        .margin(top: 5)
        .justifyContent(FlexAlign.End)
    }
}
```

![animate2](figures/animate2.gif)
