# TextTimer

通过文本显示计时信息并控制其计时器状态的组件。

在组件不可见时时间变动将停止，组件的可见状态基于[onVisibleAreaChange](./cj-universal-event-visibleareachange.md#func-onvisibleareachangearrayfloat64-bool-float64-unit)处理，可见阈值ratios大于0即视为可见状态。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

无

## 创建组件

### init(Bool, Int64, TextTimerController)

```cangjie
public init(isCountDown!: Bool = false, count!: Int64 = 60000,
    controller!: TextTimerController = TextTimerController())
```

**功能：** 创建一个TextTimer组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isCountDown|Bool|否|false| **命名参数。**  是否倒计时。值为true时，计时器开启倒计时，例如从30秒 ~ 0秒。值为false时，计时器开始计时，例如从0秒 ~ 30秒。 |
|count|Int64|否|60000| **命名参数。**  计时器时间（isCountDown为true时生效），单位为毫秒。最长不超过86400000毫秒（24小时）。 0<count<86400000时，count值为计时器初始值。否则，使用默认值为计时器初始值。 |
|controller|[TextTimerController](#class-texttimercontroller)|否|TextTimerController()| **命名参数。** TextTimer控制器。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func fontColor(ResourceColor)

```cangjie
public func fontColor(value: ResourceColor): This
```

**功能：** 设置字体颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](./cj-common-types.md#interface-resourcecolor)|是|-|字体颜色。|

### func fontFamily(ResourceStr)

```cangjie
public func fontFamily(value: ResourceStr): This
```

**功能：** 设置字体列表。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceStr](./cj-common-types.md#interface-resourcestr)|是|-|字体列表。<br/>初始字体：'HarmonyOS Sans'。<br/>应用当前支持'HarmonyOS Sans'字体和[注册自定义字体](./cj-text-input-text.md#注册自定义字体)。|

### func fontSize(Length)

```cangjie
public func fontSize(value: Length): This
```

**功能：** 设置字体大小。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|字体大小。fontSize为Int64、Float64类型时，使用fp单位。字体初始大小16.fp。不支持设置百分比。|

### func fontStyle(FontStyle)

```cangjie
public func fontStyle(value: FontStyle): This
```

**功能：** 设置字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[FontStyle](./cj-common-types.md#enum-fontstyle)|是|-|字体样式。<br/>初始值：FontStyle.Normal|

### func fontWeight(FontWeight)

```cangjie
public func fontWeight(value: FontWeight): This
```

**功能：** 设置文本的字体粗细，设置过大可能会在不同字体下有截断。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[FontWeight](./cj-common-types.md#enum-fontweight)|是|-|文本的字体粗细。<br/>初始值：FontWeight.Normal|

### func format(String)

```cangjie
public func format(value: String): This
```

**功能：** 设置自定义格式，需至少包含一个HH、mm、ss、SS中的关键字。如使用yy、MM、dd等日期格式，则使用默认值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|自定义格式。<br/>初始值：'HH:mm:ss.SS'|

### func textShadow(Array\<ShadowOptions>)

```cangjie
public func textShadow(value: Array<ShadowOptions>): This
```

**功能：** 设置文字阴影效果。该接口支持以数组形式入参，实现多重文字阴影。不支持fill字段, 不支持智能取色模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Array\<[ShadowOptions](./cj-common-types.md#interface-shadowoptions)>|是|-|文字阴影效果。|

### func textShadow(ShadowOptions)

```cangjie
public func textShadow(value: ShadowOptions): This
```

**功能：** 设置文字阴影效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ShadowOptions](./cj-common-types.md#interface-shadowoptions)|是|-|文字阴影效果。|

## 组件事件

### func onTimer((Int64,Int64) -> Unit)

```cangjie
public func onTimer(event: (Int64, Int64) -> Unit): This
```

**功能：** 时间文本发生变化时触发。锁屏状态和应用后台状态下不会触发该事件。设置高精度的format（SSS、SS）时，回调间隔可能会出现波动。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|(Int64,Int64)->Unit|是|-|第一个Int64类型的参数为Linux时间戳，即自1970年1月1日起经过的时间，单位为设置格式的最小单位。<br/>第二个Int64类型的参数为计时器经过的时间，单位为设置格式的最小单位。 |

## 基础类型定义

### class TextTimerController

```cangjie
public class TextTimerController {
    public init()
}
```

**功能：** TextTimer组件的控制器，用于控制文本计时器。一个TextTimer组件仅支持绑定一个控制器，组件创建完成后相关指令才能被调用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init()

```cangjie
public init()
```

**功能：** 创建一个TextTimerController对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func pause()

```cangjie
public func pause(): Unit
```

**功能：** 计时暂停。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func reset()

```cangjie
public func reset(): Unit
```

**功能：** 重置计时器。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func start()

```cangjie
public func start(): Unit
```

**功能：** 计时开始。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## 示例代码

### 示例1 （支持手动启停的文本计时器）

该示例展示了TextTimer组件的基本使用方法，通过format属性设置计时器的文本显示格式。

用户可以通过点击"start"、"pause"、"reset"按钮，开启、暂停、重置计时器。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    var textTimerController: TextTimerController = TextTimerController()
    @State var format: String = 'mm:ss.SS'
    func build() {
        Column {
            TextTimer(isCountDown: true, count: 30000, controller: this.textTimerController)
                .format(this.format)
                .fontColor(Color.Black)
                .fontSize(50)
                .onTimer({utc, elapsedTime =>
                    Hilog.info(0, "AppLogCj", "time has been changed")
                })
            Row() {
                Button("start").onClick({=>
                  this.textTimerController.start()
                })
                Button("pause").onClick({=>
                  this.textTimerController.pause()
                })
                Button("reset").onClick({=>
                    this.textTimerController.reset()
                })
            }
        }
    }
}

```

![texttimer](figures/texttimer.gif)

### 示例2（设定文本阴影样式）

该示例通过textShadow属性设置计时器的文本阴影样式。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var textShadows: Array<ShadowOptions> = [
        ShadowOptions(
            radius: 10.0,
            color: Color.Red,
            offsetX: 10.0,
            offsetY: 0.0
        ),
        ShadowOptions(
            radius: 10.0,
            color: Color.Black,
            offsetX: 20.0,
            offsetY: 0.0
        ),
        ShadowOptions(
            radius: 10.0,
            color: Color.BROWN,
            offsetX: 30.0,
            offsetY: 0.0
        ),
        ShadowOptions(
        radius: 10.0,
        color: Color.Green,
        offsetX: 40.0,
        offsetY: 0.0
        ),
        ShadowOptions(
        radius: 10.0,
        color: Color.YELLOW,
        offsetX: 100.0,
        offsetY: 0.0
        )]
    func build() {
        Column(8) {
            TextTimer().fontSize(50).textShadow(this.textShadows)
        }
    }
}
```

![texttimer](figures/texttimer2.png)

### 示例3（创建之后立即执行计时）

该示例展示了TextTimer计时器如何在创建完成之后立即开始计时。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    var textTimerController: TextTimerController = TextTimerController()
    @State var format: String = 'mm:ss.SS'

    func build() {
        Column(8) {
            Scroll().height(20.percent)
            Button("openTextTimer").onClick({
                =>

            })
            TextTimer( isCountDown: true, count: 30000, controller: this.textTimerController )
                .format(this.format)
                .fontColor(Color.Black)
                .fontSize(50)
                .onTimer({
                    utc: Int64, elapsedTime: Int64 =>
                        Hilog.info(0, "AppLogCj", 'textTimer notCountDown utc is：${utc.toString()}, elapsedTime: ${elapsedTime.toString()}')
                })
                .onAppear({ =>
                    this.textTimerController.start()
                })
        }
    }
}
```

![texttimer](figures/texttimer3.gif)
