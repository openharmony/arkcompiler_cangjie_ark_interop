# 共享元素转场 (sharedTransition)

可以通过设置组件的 sharedTransition 属性将该元素标记为共享元素并设置对应的共享元素转场动效。sharedTransition仅发生在页面路由（router）跳转时。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## class SharedTransitionOptions

```cangjie
public class SharedTransitionOptions {
    public var duration: Int32 = 1000
    public var curve: Curve = Curve.Linear
    public var delay: Int32 = 0
    public var motionPath: MotionPathOptions = MotionPathOptions(path: "")
    public var zIndex: Int32 = 0
    public var effectType: SharedTransitionEffectType = SharedTransitionEffectType.Exchange
    public init(
        duration!: Int32 = 1000,
        curve!: Curve = Curve.Linear,
        delay!: Int32 = 0,
        motionPath!: MotionPathOptions = MotionPathOptions(path: ""),
        zIndex!: Int32 = 0,
        effectType!: SharedTransitionEffectType = SharedTransitionEffectType.Exchange
    )
}
```

**功能：** 共享转场选项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var curve

```cangjie
public var curve: Curve = Curve.Linear
```

**功能：** 设置共享转场的动画曲线。

**类型：** [Curve](./cj-common-types.md#enum-curve)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var delay

```cangjie
public var delay: Int32 = 0
```

**功能：** 设置共享转场的延迟时间。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var duration

```cangjie
public var duration: Int32 = 1000
```

**功能：** 设置共享转场的持续时间。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var effectType

```cangjie
public var effectType: SharedTransitionEffectType = SharedTransitionEffectType.Exchange
```

**功能：** 设置共享转场的效果类型。

**类型：** [SharedTransitionEffectType](./cj-common-types.md#enum-sharedtransitioneffecttype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var motionPath

```cangjie
public var motionPath: MotionPathOptions = MotionPathOptions(path: "")
```

**功能：** 设置共享转场的运动路径。

**类型：** [MotionPathOptions](./cj-animation-motionpath.md#class-motionpathoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var zIndex

```cangjie
public var zIndex: Int32 = 0
```

**功能：** 设置共享转场的层级。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Int32, Curve, Int32, MotionPathOptions, Int32, SharedTransitionEffectType)

```cangjie
public init(
    duration!: Int32 = 1000,
    curve!: Curve = Curve.Linear,
    delay!: Int32 = 0,
    motionPath!: MotionPathOptions = MotionPathOptions(path: ""),
    zIndex!: Int32 = 0,
    effectType!: SharedTransitionEffectType = SharedTransitionEffectType.Exchange
)
```

**功能：** 构造一个SharedTransitionOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|duration|Int32|否|1000|设置共享转场的持续时间。|
|curve|[Curve](./cj-common-types.md#enum-curve)|否|Curve.Linear|设置共享转场的动画曲线。|
|delay|Int32|否|0|设置共享转场的延迟时间。|
|motionPath|[MotionPathOptions](./cj-animation-motionpath.md#class-motionpathoptions)|否|MotionPathOptions(path: "")|设置共享转场的运动路径。|
|zIndex|Int32|否|0|设置共享转场的层级。|
|effectType|[SharedTransitionEffectType](./cj-common-types.md#enum-sharedtransitioneffecttype)|否|SharedTransitionEffectType.Exchange|设置共享转场的效果类型。|

## func sharedTransition(String, SharedTransitionOptions)

```cangjie
public func sharedTransition(id: String, options!: SharedTransitionOptions = SharedTransitionOptions()): This
```

**功能：** 设置共享过渡动画。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|String|是|-|两个页面中id值相同且不为空字符串的组件即为共享元素，在页面转场时可显示共享元素转场动效。|
|options|[SharedTransitionOptions](#class-sharedtransitionoptions)|否|SharedTransitionOptions()|共享过渡选项。|

## 示例代码

示例代码为点击图片跳转页面时，显示共享元素图片的自定义转场动效。

<!-- run -->

```cangjie
// index.cj
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.AppResource

@Entry
@Component
class EntryView {
    @State var active: Bool = false
    func build() {
        Column() {
            Image(@r(app.media.startIcon))
                .width(50)
                .height(50)
                .onClick {
                    e => getUIContext().getRouter()
                }
                .sharedTransition("sharedImage",
                    options: SharedTransitionOptions(duration: 800, curve: Curve.Linear, delay: 100))
        }
    }
}
```

<!-- run -->

```cangjie
// Page1.cj
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.AppResource

@Entry
@Component
class Page1 {
    func build() {
        Stack() {
            Image(@r(app.media.startIcon))
                .width(150)
                .height(150)
                .sharedTransition(
                    "sharedImage",
                    options: SharedTransitionOptions(duration: 800, curve: Curve.Linear, delay: 100)
                )
        }
        .width(100.percent)
        .height(100.percent)
    }
}
```

![shared_transition](figures/sharedtransition.gif)
