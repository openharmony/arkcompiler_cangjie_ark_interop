# TextClock

TextClock 组件通过文本将当前系统时间显示在设备上。支持不同时区的时间显示，最高精度到秒级。

在组件不可见时时间变动将停止，组件的可见状态基于[onVisibleAreaChange](./cj-universal-event-visibleareachange.md#func-onvisibleareachangearrayfloat64-bool-float64-unit)处理，可见阈值raitos大于0即视为可见状态。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

无

## 创建组件

### init(?Float32, TextClockController)

```cangjie

public init(timeZoneOffset!: ?Float32 = None, controller!: TextClockController = TextClockController())
```

**功能：** 创建一个TextClock组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|timeZoneOffset|?Float32|否|None| **命名参数。** 设置时区偏移量。<br/>取值范围为[-14, 12]，表示东十二区到西十二区，其中负值表示东时区，正值表示西时区，比如东八区为-8。设置值为该取值范围内的浮点数时会进行取整，舍弃小数部分。<br/>设置值为{ 9.5, 3.5, -3.5, -4.5, -5.5, -5.75, -6.5, -9.5, -10.5, -12.75 }集合中的浮点数时不进行取整。<br/>对横跨国际日界线的国家或地区，用-13（UTC+13）和-14（UTC+14）来保证整个国家或者区域处在相同的时间，当设置的值不在取值范围内时，将使用当前系统的时区偏移量。|
|controller|[TextClockController](#class-textclockcontroller)|否|TextClockController()| **命名参数。** 绑定一个控制器，用来控制文本时钟的状态。|

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
|value|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|字体颜色。|

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
|value|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|字体列表。|

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
|value|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)|是|-|字体大小。fontSize为Int64、Float64类型时，使用fp单位。初始值：16.fp，不支持设置百分比。|

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
|value|[FontWeight](./cj-common-types.md#enum-fontweight)|是|-|文本的字体粗细。<br/>初始值：FontStyle.Normal|

### func format(ResourceStr)

```cangjie

public func format(value: ResourceStr): This
```

**功能：** 设置显示时间格式，如“yyyy/MM/dd”、“yyyy-MM-dd”。

y：年（yyyy表示完整年份，yy表示年份后两位）

M：月（若想使用01月则使用MM）

d：日（若想使用01日则使用dd）

E：星期（若想使用星期六则使用EEEE，若想使用周六则使用E、EE、EEE）H：小时（24小时制） h：小时（12小时制）

m：分钟

s：秒

SS：厘秒(format中S个数<3，全部按厘秒处理)

SSS：毫秒(format中S个数>=3，全部按毫秒处理)

a：上午/下午（当设置小时制式为H时，该参数不生效）

日期间隔符："年月日"、“/”、"-"、"."（可以自定义间隔符样式，间隔符不可以为字母，汉字则作为间隔符处理）

允许自行拼接组合显示格式，即：年、月、日、星期、时、分、秒、毫秒可拆分为子元素，可自行排布组合。时间更新频率最高为一秒一次，不建议单独设置厘秒和毫秒格式。

当设置无效字母时（非上述字母被认为是无效字母），该字母会被忽略。如果format全是无效字母时，显示格式跟随系统语言和系统小时制。例如系统语言为中文时，12小时制显示格式为yyyy/MM/dd aa hh:mm:ss.SSS，24小时制显示格式为yyyy/MM/dd HH:mm:ss.SSS。

若format为空，则使用初始值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|设置显示时间格式，如 `yyyy/MM/dd`、`yyyy-MM-dd`。|

### func textShadow(Array\<ShadowOptions>)

```cangjie

public func textShadow(values: Array<ShadowOptions>): This
```

**功能：** 设置文字阴影效果。该接口以数组形式入参，实现多重文字阴影。不支持fill字段, 不支持智能取色模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|values|Array\<[ShadowOptions](./cj-text-input-text.md#class-shadowoptions)>|是|-|文字阴影效果。|

### func textShadow(ShadowOptions)

```cangjie

public func textShadow(value: ShadowOptions): This
```

**功能：** 为组件添加阴影效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ShadowOptions](./cj-text-input-text.md#class-shadowoptions)|是|-|阴影选项。|

## 组件事件

### func onDateChange((Int64) -> Unit)

```cangjie

public func onDateChange(callback: (Int64) -> Unit): This
```

**功能：** 时间变化触发该事件。该事件回调间隔为秒。组件不可见时不触发。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(Int64)->Unit|是|-|Unix Time Stamp，即自1970年1月1日（UTC）起经过的秒数。|

## 基础类型定义

### class DateTimeOptions

```cangjie
public class DateTimeOptions {
    public var locale: String
    public var dateStyle: String
    public var timeStyle: String
    public var hourCycle: String
    public var timeZone: String
    public var numberingSystem: String
    public var hour12: Bool
    public var weekday: String
    public var era: String
    public var year: String
    public var month: String
    public var day: String
    public var hour: String
    public var minute: String
    public var second: String
    public var timeZoneName: String
    public var dayPeriod: String
    public var localeMatcher: String
    public var formatMatcher: String

    public init(locale!: String = "zh-Hans-CN", dateStyle!: String = "long", timeStyle!: String = "long",
        hourCycle!: String = "h11", timeZone!: String = "", numberingSystem!: String = "adlm", hour12!: Bool = false,
        weekday!: String = "long", era!: String = "long", year!: String = "numeric", month!: String = "numeric",
        day!: String = "numeric", hour!: String = "numeric", minute!: String = "numeric", second!: String = "numeric",
        timeZoneName!: String = "long", dayPeriod!: String = "long", localeMatcher!: String = "lookup",
        formatMatcher!: String = "basic")
}
```

**功能：** 日期、时间格式化时可设置的配置项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var dateStyle

```cangjie
public var dateStyle: String
```

**功能：** 日期显示格式，取值包括："long", "short", "medium", "full", "auto"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var day

```cangjie
public var day: String
```

**功能：** 日期的显示格式，取值包括："numeric", "2-digit"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var dayPeriod

```cangjie
public var dayPeriod: String
```

**功能：** 时段的显示格式，取值包括："long", "short", "narrow", "auto"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var era

```cangjie
public var era: String
```

**功能：** 时代的显示格式，取值包括："long", "short", "narrow", "auto"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var formatMatcher

```cangjie
public var formatMatcher: String
```

**功能：** 要使用的格式匹配算法，取值包括："basic", "best fit"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var hour

```cangjie
public var hour: String
```

**功能：** 小时的显示格式，取值包括："numeric", "2-digit"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var hour12

```cangjie
public var hour12: Bool
```

**功能：** 是否使用12小时制，若hour12和hourCycle未设置且系统24小时开关打开时，hour12属性的默认值为false。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var hourCycle

```cangjie
public var hourCycle: String
```

**功能：** 时制格式，取值包括："h11", "h12", "h23", "h24"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var locale

```cangjie
public var locale: String
```

**功能：** 区域参数， 如：zh-Hans-CN。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var localeMatcher

```cangjie
public var localeMatcher: String
```

**功能：** 要使用的区域匹配算法，取值包括："lookup", "best fit"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var minute

```cangjie
public var minute: String
```

**功能：** 分钟的显示格式，取值包括："numeric", "2-digit"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var month

```cangjie
public var month: String
```

**功能：** 月份的显示格式，取值包括："numeric", "2-digit", "long", "short", "narrow", "auto"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var numberingSystem

```cangjie
public var numberingSystem: String
```

**功能：** 数字系统，取值包括："adlm", "ahom", "arab", "arabext", "bali", "beng", "bhks", "brah", "cakm", "cham", "deva", "diak", "fullwide", "gong", "gonm", "gujr", "guru", "hanidec", "hmng", "hmnp", "java", "kali", "khmr", "knda", "lana", "lanatham", "laoo", "latn", "lepc", "limb", "mathbold", "mathdbl", "mathmono", "mathsanb", "mathsans", "mlym", "modi", "mong", "mroo", "mtei", "mymr", "mymrshan", "mymrtlng", "newa", "nkoo", "olck", "orya", "osma", "rohg", "saur", "segment", "shrd", "sind", "sinh", "sora", "sund", "takr", "talu", "tamldec", "telu", "thai", "tibt", "tirh", "vaii", "wara", "wcho"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var second

```cangjie
public var second: String
```

**功能：** 秒钟的显示格式，取值包括："numeric", "2-digit"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var timeStyle

```cangjie
public var timeStyle: String
```

**功能：** 时间显示格式，取值包括："long", "short", "medium", "full", "auto"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var timeZone

```cangjie
public var timeZone: String
```

**功能：** 使用的时区（合法的IANA时区ID）。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var timeZoneName

```cangjie
public var timeZoneName: String
```

**功能：** 时区名称的本地化表示, 取值包括："long", "short", "auto"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var weekday

```cangjie
public var weekday: String
```

**功能：** 工作日的显示格式，取值包括："long", "short", "narrow", "auto"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var year

```cangjie
public var year: String
```

**功能：** 年份的显示格式，取值包括："numeric", "2-digit"。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(String, String, String, String, String, String, Bool, String, String, String, String, String, String, String, String, String, String, String, String)

```cangjie

public init(locale!: String = "zh-Hans-CN", dateStyle!: String = "long", timeStyle!: String = "long",
    hourCycle!: String = "h11", timeZone!: String = "", numberingSystem!: String = "adlm", hour12!: Bool = false,
    weekday!: String = "long", era!: String = "long", year!: String = "numeric", month!: String = "numeric",
    day!: String = "numeric", hour!: String = "numeric", minute!: String = "numeric", second!: String = "numeric",
    timeZoneName!: String = "long", dayPeriod!: String = "long", localeMatcher!: String = "lookup",
    formatMatcher!: String = "basic")
```

**功能：** 构造一个DateTimeOptions对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|locale|String|否|"zh-Hans-CN"| **命名参数。** 区域参数， 如：zh-Hans-CN。|
|dateStyle|String|否|"long"| **命名参数。** 日期显示格式，取值包括："long", "short", "medium", "full", "auto"。|
|timeStyle|String|否|"long"| **命名参数。** 时间显示格式，取值包括："long", "short", "medium", "full", "auto"。|
|hourCycle|String|否|"h11"| **命名参数。** 时制格式，取值包括："h11", "h12", "h23", "h24"。|
|timeZone|String|否|""| **命名参数。** 使用的时区（合法的IANA时区ID）。|
|numberingSystem|String|否|"adlm"| **命名参数。** 数字系统，取值包括："adlm", "ahom", "arab", "arabext", "bali", "beng", "bhks", "brah", "cakm", "cham", "deva", "diak", "fullwide", "gong", "gonm", "gujr", "guru", "hanidec", "hmng", "hmnp", "java", "kali", "khmr", "knda", "lana", "lanatham", "laoo", "latn", "lepc", "limb", "mathbold", "mathdbl", "mathmono", "mathsanb", "mathsans", "mlym", "modi", "mong", "mroo", "mtei", "mymr", "mymrshan", "mymrtlng", "newa", "nkoo", "olck", "orya", "osma", "rohg", "saur", "segment", "shrd", "sind", "sinh", "sora", "sund", "takr", "talu", "tamldec", "telu", "thai", "tibt", "tirh", "vaii", "wara", "wcho"。|
|hour12|Bool|否|false| **命名参数。** 是否使用12小时制，若hour12和hourCycle未设置且系统24小时开关打开时，hour12属性的默认值为false。|
|weekday|String|否|"long"| **命名参数。** 工作日的显示格式，取值包括："long", "short", "narrow", "auto"。|
|era|String|否|"long"| **命名参数。** 时代的显示格式，取值包括："long", "short", "narrow", "auto"。|
|year|String|否|"numeric"| **命名参数。** 年份的显示格式，取值包括："numeric", "2-digit"。|
|month|String|否|"numeric"| **命名参数。** 月份的显示格式，取值包括："numeric", "2-digit", "long", "short", "narrow", "auto"。|
|day|String|否|"numeric"| **命名参数。** 日期的显示格式，取值包括："numeric", "2-digit"。|
|hour|String|否|"numeric"| **命名参数。** 小时的显示格式，取值包括："numeric", "2-digit"。|
|minute|String|否|"numeric"| **命名参数。** 分钟的显示格式，取值包括："numeric", "2-digit"。|
|second|String|否|"numeric"| **命名参数。** 秒钟的显示格式，取值包括："numeric", "2-digit"。|
|timeZoneName|String|否|"long"| **命名参数。** 时区名称的本地化表示, 取值包括："long", "short", "auto"。|
|dayPeriod|String|否|"long"| **命名参数。** 时段的显示格式，取值包括："long", "short", "narrow", "auto"。|
|localeMatcher|String|否|"lookup"| **命名参数。** 要使用的区域匹配算法，取值包括：<br/>"lookup"：精确匹配；<br/>"best fit"：最佳匹配。|
|formatMatcher|String|否|"basic"| **命名参数。** 要使用的格式匹配算法，取值包括：<br/>"basic"：精确匹配；<br/>"best fit"：最佳匹配。|

### class TextClockController

```cangjie
public class TextClockController {

    public init()
}
```

**功能：** 文本时钟定制类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init()

```cangjie

public init()
```

**功能：** 创建一个TextClockController对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func start()

```cangjie

public func start(): Unit
```

**功能：** 启动文本时钟。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func stop()

```cangjie

public func stop(): Unit
```

**功能：** 停止文本时钟。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## 示例代码

### 示例1（设定文本阴影样式）

该示例通过textShadow属性设置文本时钟的文本阴影样式。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State
    var shadowoptions: Array<ShadowOptions> = [
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Blur, offsetX: 10.0, offsetY: 0.0, color: 0xffff0000,
            fill: false),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Blur, offsetX: 20.0, offsetY: 0.0, color: 0xff000000,
            fill: false),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Blur, offsetX: 30.0, offsetY: 0.0, color: 0xffc0c0c0,
            fill: false),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Blur, offsetX: 40.0, offsetY: 0.0, color: 0xff00ff00,
            fill: false),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.Blur, offsetX: 100.0, offsetY: 0.0, color: 0xff0000ff,
            fill: false)
    ]
    public func build() {
        Column {
            TextClock().fontSize(50).textShadow(shadowoptions)
        }
    }
}
```

![text_clock1](figures/text_clock1.jpg)

### 示例2（支持启停的文本样式时钟）

该示例展示了TextClock组件的基本使用方法，通过format属性设置时钟文本的格式。

点击"start TextClock"按钮，按钮回调函数会调用TextClockController启动文本时钟。点击"stop TextClock"按钮，会调用TextClockController暂停文本时钟。

示例中的组件通过设置onDateChange回调函数，在文本时钟更新时，持续修改accumulateTime的内容。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State
    var accumulateTime: Int64 = 0
    let controller = TextClockController()
    public func build() {
        Column {
            Text('Current milliseconds is ${this.accumulateTime}').fontSize(20).margin(10)
            // 以12小时制显示东八区的系统时间，精确到秒。
            TextClock(timeZoneOffset: -8.0, controller: this.controller)
                .format('aa hh:mm:ss')
                .onDateChange({
                    value: Int64 => this.accumulateTime = value
                })
                .margin(20)
                .fontSize(30)
            Button("start TextClock").margin(bottom: 10).onClick {
                evt =>
                // 启动文本时钟
                this.controller.start()
            }
            Button("stop TextClock").onClick {
                evt =>
                // 停止文本时钟
                this.controller.stop()
            }
        }
    }
}
```

![text_clock2](figures/text_clock2.gif)
