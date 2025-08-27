# 页面间转场（pageTransition）

当路由进行切换时，可以通过在pageTransition函数中自定义页面入场和页面退场的转场动效。

> **说明：**
>
> 为了实现更好的转场效果，推荐使用Navigation组件和[模态转场](../../../Dev_Guide/source_zh_cn/arkui-cj/cj-modal-transition.md)。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## class CommonTransition

```cangjie
sealed abstract class CommonTransition {}
```

**功能：** 页面转场通用动效基类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func opacity(Float64)

```cangjie
public func opacity(value: Float64): This
```

**功能：** 设置入场的起点透明度值或者退场的终点透明度值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

| 参数名   | 类型      | 必填  | 默认值 | 说明                                        |
|:----- |:------- |:--- |:--- |:----------------------------------------- |
| value | Float64 | 是   | -   | 入场的起点透明度值或者退场的终点透明度值。<br>取值范围：[0.0, 1.0]。 |

### func scale(Float32, Float32, Float32, Length, Length)

```cangjie
public func scale(
    x!: Float32 = 1.0,
    y!: Float32 = 1.0,
    z!: Float32 = 1.0,
    centerX!: Length = 50.percent,
    centerY!: Length = 50.percent
): This
```

**功能：** 设置页面转场时的缩放效果。

> **说明：**
>
> 参数为为入场时起点和退场时终点的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

| 参数名     | 类型                                              | 必填  | 默认值        | 说明                                                        |
|:------- |:----------------------------------------------- |:--- |:---------- |:--------------------------------------------------------- |
| x       | Float32                                         | 否   | 1.0        | **命名参数。** 横向放大倍数（或缩小比例）。                                  |
| y       | Float32                                         | 否   | 1.0        | **命名参数。** 纵向放大倍数（或缩小比例）。                                  |
| z       | Float32                                         | 否   | 1.0        | **命名参数。** 竖向放大倍数（或缩小比例）。                                  |
| centerX | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | 否   | 50.percent | **命名参数。** X轴缩放中心点。默认以页面的中心点为旋转中心点。<br>中心点为(0, 0)代表页面的左上角。 |
| centerY | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | 否   | 50.percent | **命名参数。** Y轴缩放中心点。默认以页面的中心点为旋转中心点。<br>中心点为(0, 0)代表页面的左上角。 |

### func slide(SlideEffect)

```cangjie
public func slide(value: SlideEffect): This
```

**功能：** 设置页面转场时的滑入滑出效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

| 参数名   | 类型                               | 必填  | 默认值 | 说明            |
|:----- |:-------------------------------- |:--- |:--- |:------------- |
| value | [SlideEffect](#enum-slideeffect) | 是   | -   | 页面转场时的滑入滑出效果。 |

### func translate(Length, Length, Length)

```cangjie
public func translate(x!: Length = 0.vp, y!: Length = 0.vp, z!: Length = 0.vp): This
```

**功能：** 设置页面转场时的平移效果。

> **说明：**
>
> 参数为为入场时起点和退场时终点的值，和slide同时设置时默认生效slide。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

| 参数名 | 类型                                              | 必填  | 默认值  | 说明                 |
|:--- |:----------------------------------------------- |:--- |:---- |:------------------ |
| x   | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | 否   | 0.vp | **命名参数。** x轴的平移距离。 |
| y   | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | 否   | 0.vp | **命名参数。** y轴的平移距离。 |
| z   | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | 否   | 0.vp | **命名参数。** z轴的平移距离。 |

## class PageTransitionEnter

```cangjie
public class PageTransitionEnter <: CommonTransition {
    public init(
        routeType!: RouteType = RouteType.None,
        duration!: Int32 = 1000,
        curve!: Curve = Curve.Linear,
        delay!: Int32 = 0
    )
}
```

**功能：** 当前页面的自定义入场动效类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [CommonTransition](#class-commontransition)

### init(RouteType, Int32, Curve, Int32)

```cangjie
public init(
    routeType!: RouteType = RouteType.None,
    duration!: Int32 = 1000,
    curve!: Curve = Curve.Linear,
    delay!: Int32 = 0
)
```

**功能：** 创建当前页面的自定义入场动效对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

| 参数名       | 类型                                       | 必填  | 默认值            | 说明                                                                                                      |
|:--------- |:---------------------------------------- |:--- |:-------------- |:------------------------------------------------------------------------------------------------------- |
| routeType | [RouteType](#enum-routetype)             | 否   | RouteType.None | **命名参数。** 页面转场效果生效的路由类型。                                                                                |
| duration  | Int32                                    | 否   | 1000           | **命名参数。** 动画的时长。<br>单位：毫秒。<br>取值范围：[0, +∞)。                                                             |
| curve     | [Curve](./cj-common-types.md#enum-curve) | 否   | Curve.Linear   | **命名参数。** 动画曲线。                                                                                         |
| delay     | Int32                                    | 否   | 0              | **命名参数。** 动画延迟时长。<br>单位：毫秒。<br>**说明：**<br>没有匹配时使用系统默认的页面转场效果(根据设备可能会有差异)，如需禁用系统默认页面转场效果，可以指定duration为0。 |

### func onEnter(PageTransitionCallback)

```cangjie
public func onEnter(event: PageTransitionCallback)
```

**功能：** 逐帧回调，直到入场动画结束，progress从0变化到1。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

| 参数名   | 类型                                                          | 必填  | 默认值 | 说明                                |
|:----- |:----------------------------------------------------------- |:--- |:--- |:--------------------------------- |
| event | [PageTransitionCallback](#interface-pagetransitioncallback) | 是   | -   | 入场动画的逐帧回调直到入场动画结束，progress从0变化到1。 |

## class PageTransitionExit

```cangjie
public class PageTransitionExit <: CommonTransition {
    public init(
        routeType!: RouteType = RouteType.None,
        duration!: Int32 = 1000,
        curve!: Curve = Curve.Linear,
        delay!: Int32 = 0
    )
}
```

**功能：** 当前页面的自定义退场动效类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [CommonTransition](#class-commontransition)

### init(RouteType, Int32, Curve, Int32)

```cangjie
public init(
    routeType!: RouteType = RouteType.None,
    duration!: Int32 = 1000,
    curve!: Curve = Curve.Linear,
    delay!: Int32 = 0
)
```

**功能：** 创建当前页面的自定义退场动效对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

| 参数名       | 类型                                       | 必填  | 默认值            | 说明                                                                                                      |
|:--------- |:---------------------------------------- |:--- |:-------------- |:------------------------------------------------------------------------------------------------------- |
| routeType | [RouteType](#enum-routetype)             | 否   | RouteType.None | **命名参数。** 页面转场效果生效的路由类型。                                                                                |
| duration  | Int32                                    | 否   | 1000           | **命名参数。** 动画的时长。<br>单位：毫秒。<br>取值范围：[0, +∞)。                                                             |
| curve     | [Curve](./cj-common-types.md#enum-curve) | 否   | Curve.Linear   | **命名参数。** 动画曲线。                                                                                         |
| delay     | Int32                                    | 否   | 0              | **命名参数。** 动画延迟时长。<br>单位：毫秒。<br>**说明：**<br>没有匹配时使用系统默认的页面转场效果(根据设备可能会有差异)，如需禁用系统默认页面转场效果，可以指定duration为0。 |

### func onExit(PageTransitionCallback)

```cangjie
public func onExit(event: PageTransitionCallback)
```

**功能：** 逐帧回调，直到出场动画结束，progress从0变化到1。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

| 参数名   | 类型                                                          | 必填  | 默认值 | 说明                                |
|:----- |:----------------------------------------------------------- |:--- |:--- |:--------------------------------- |
| event | [PageTransitionCallback](#interface-pagetransitioncallback) | 是   | -   | 入场动画的逐帧回调直到入场动画结束，progress从0变化到1。 |

## enum RouteType

```cangjie
public enum RouteType {
    | None
    | Push
    | Pop
}
```

**功能：** 页面路由类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### None

```cangjie
None
```

**功能：** 设置页面未重定向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Pop

```cangjie
Pop
```

**功能：** 设置重定向指定页面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Push

```cangjie
Push
```

**功能：** 设置跳转到下一页面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## enum SlideEffect

```cangjie
public enum SlideEffect {
    | Left
    | Right
    | Top
    | Bottom
}
```

**功能：** 页面滑动效果类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Bottom

```cangjie
Bottom
```

**功能：** 设置到入场时表示从下边滑入，出场时表示滑出到下边。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Left

```cangjie
Left
```

**功能：** 设置到入场时表示从左边滑入，出场时表示滑出到左边。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Right

```cangjie
Right
```

**功能：** 设置到入场时表示从右边滑入，出场时表示滑出到右边。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Top

```cangjie
Top
```

**功能：** 设置到入场时表示从上边滑入，出场时表示滑出到上边。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## type PageTransitionCallback

```cangjie
public type PageTransitionCallback =(RouteType, Float64) -> Unit
```

**功能：** [PageTransitionCallback](#type-pagetransitioncallback)是[(RouteType, Float64) -> Unit](#type-pagetransitioncallback)类型的别名。

## 示例代码

### 示例代码1(设置退入场动画)

通过不同的退入场类型配置不同的退场，入场动画。

<!-- run -->

```cangjie
//index.cj
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
import ohos.arkui.ui_context.*

@Entry
@Component
class EntryView {
    @State var scale2: Float32 = 1.0
    @State var opacity2: Float64 = 1.0

    func build() {
        Column() {
            Image(@r(app.media.background))
                .width(100.percent)
                .height(100.percent)
        }
        .width(100.percent)
        .height(100.percent)
        .scale(x: scale2, y: 1.0)
        .opacity(this.opacity2)
        .onClick {
                e => getUIContext().getRouter().pushUrl(url: "Page1")
            }
    }

    protected func onTransition(): Unit {
        PageTransitionEnter(PageTransitionOptions(duration: 1200, curve: Curve.Linear)).onEnter {
            ty: RouteType, progress: Float64 => match (ty) {
                case RouteType.Push | RouteType.Pop =>
                    scale2 = Float32(progress)
                    opacity2 = progress
                case _ => ()
            }
        }
        PageTransitionExit(PageTransitionOptions(duration: 1200, curve: Curve.Ease)).onExit {
            ty: RouteType, progress: Float64 => match (ty) {
                case RouteType.Push =>
                    this.scale2 = Float32(1.0 - progress)
                    this.opacity2 = 1.0 - progress
                case _ => ()
            }
        }
    }
}
```

<!-- run -->

```cangjie
//page1.cj
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
import ohos.arkui.ui_context.*

@Entry
@Component
class Page1 {
    @State var scale1: Float32 = 1.0
    @State var opacity1: Float64 = 1.0

    func build() {
        Column() {
            Image(@r(app.media.background))
                .width(50.percent)
                .height(50.percent)
        }
        .width(100.percent)
        .height(100.percent)
        .scale(x: scale1, y: 1.0)
        .opacity(opacity1)
        .onClick {
                e => getUIContext().getRouter().pushUrl(url: "EntryView")
            }
    }

    protected func onTransition(): Unit {
        PageTransitionEnter(PageTransitionOptions(duration: 1200, curve: Curve.Linear)).onEnter {
            ty: RouteType, progress: Float64 => match (ty) {
                case RouteType.Push | RouteType.Pop =>
                    scale1 = Float32(progress)
                    opacity1 = progress
                case _ => ()
            }
        }
        PageTransitionExit(PageTransitionOptions(duration: 1200, curve: Curve.Ease)).onExit {
            ty: RouteType, progress: Float64 => match (ty) {
                case RouteType.Push =>
                    this.scale1 = Float32(1.0 - progress)
                    this.opacity1 = 1.0 - progress
                case _ => ()
            }
        }
    }
}
```

![page_transition](figures/pagetransition.gif)

### 示例代码2（设置退入场平移效果）

配置提供的不同退入场平移效果，将系统语言排版模式改为RTL。

<!-- run -->

```cangjie
//index.cj
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
import ohos.arkui.ui_context.*

@Entry
@Component
class EntryView {
    @State var scale2: Float32 = 1.0
    @State var opacity2: Float64 = 1.0

    func build() {
        Column() {
            Button("Page1").onClick {
                e => getUIContext().getRouter().pushUrl(url: "Page1")
            }
                .width(200)
                .height(60)
                .fontSize(36)
            Text("START")
                .fontSize(36)
                .textAlign(TextAlign.Center)
        }
        .width(100.percent)
        .height(100.percent)
        .scale(x: scale2, y: 1.0)
        .opacity(this.opacity2)
        .justifyContent(FlexAlign.Center)
    }

    protected func onTransition(): Unit {
        PageTransitionEnter(PageTransitionOptions(duration: 1200, curve: Curve.Linear)).slide(SlideEffect.START)
        PageTransitionExit(PageTransitionOptions(duration: 1200, curve: Curve.Ease)).slide(SlideEffect.START)
    }
}
```

<!-- run -->

```cangjie

//page1.cj
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
import ohos.arkui.ui_context.*

@Entry
@Component
class Page1 {
    @State var scale1: Float32 = 1.0
    @State var opacity1: Float64 = 1.0

    func build() {
        Column() {
            Button("Page2").onClick {
                e => getUIContext().getRouter().pushUrl(url: "EntryView")
            }
                .width(200)
                .height(60)
                .fontSize(36)
            Text("END")
                .fontSize(36)
                .textAlign(TextAlign.Center)
        }
        .width(100.percent)
        .height(100.percent)
        .scale(x: scale1, y: 1.0)
        .opacity(this.opacity1)
        .justifyContent(FlexAlign.Center)
    }

    protected func onTransition(): Unit {
        PageTransitionEnter(PageTransitionOptions(duration: 1200)).slide(SlideEffect.END)
        PageTransitionExit(PageTransitionOptions(duration: 1200)).slide(SlideEffect.END)
    }
}
```

![page_transition2](figures/pagetransition2.gif)
