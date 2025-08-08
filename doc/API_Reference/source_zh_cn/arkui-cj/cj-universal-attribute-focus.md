# 焦点控制

自定义组件的走焦效果，可设置组件是否走焦和具体的走焦顺序，tab键或者方向键切换焦点。

> **说明：**
>
> - 自定义组件无获焦能力，当设置[focusable](./cj-universal-attribute-focus.md#func-focusablebool)、[enabled](./cj-universal-attribute-enable.md#func-enabledbool)等属性为false，或者设置[visibility](./cj-universal-attribute-visibility.md#func-visibilityvisibility)属性为Hidden、None时，也不影响其子组件的获焦。
> - 组件主动获取焦点不受窗口焦点的控制。
> - 焦点开发参考[焦点开发指南](./cj-universal-event-focus.md)。

## func defaultFocus(Bool)

```cangjie
public func defaultFocus(isDefaultFocus: Bool): This
```

**功能：** 设置当前组件是否为当前页面上的默认焦点。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| isDefaultFocus | Bool | 是 | - | 设置当前组件是否为当前页面上的默认焦点，仅在初次创建的页面第一次进入时生效。<br>初始值:false。<br>**说明：**<br>值为true则表示为默认焦点，值为false无效。|

## func focusable(Bool)

```cangjie
public func focusable(isFocusable: Bool): This
```

**功能：** 设置当前组件是否可以获焦。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| isFocusable | Bool | 是 | \- | 当前组件是否可以获焦。true表示组件可以获焦，false表示组件不可获焦。<br>**说明：**<br>存在默认交互逻辑的组件例如[Button](./cj-button-picker-button.md)等，默认即为可获焦，其他组件则默认状态为不可获焦。不可获焦状态下，无法触发[焦点事件](./cj-universal-event-focus.md)。 |

## func focusOnTouch(Bool)

```cangjie
public func focusOnTouch(isFocusOnTouch: Bool): This
```

**功能：** 设置当前组件是否支持点击获焦能力。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| isFocusOnTouch | Bool | 是 | - | 当前组件是否支持点击获焦能力。true表示组件支持点击获焦，false表示不支持点击获焦。<br>初始值：false。<br>**说明：**<br>仅在组件可点击时才能正常获取焦点。|

## func focusBox(FocusBoxStyle)

```cangjie
public func focusBox(style: FocusBoxStyle): This
```

**功能：** 设置当前组件系统焦点框样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| style | [FocusBoxStyle](./cj-universal-attribute-focus.md#class-focusboxstyle) | 是 | \- | 当前组件系统焦点框样式。<br>**说明：**<br>该样式仅影响走焦状态下展示了系统焦点框的组件。|

## func focusScopePriority(String, FocusPriority)

```cangjie
public func focusScopePriority(scopeId: String, priority!: FocusPriority = FocusPriority.AUTO): This
```

**功能：** 设置当前组件在指定容器内获焦的优先级。需要配合focusScopeId一起使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| scopeId | String | 是 | \- | 当前组件设置的获焦优先级生效的容器组件的id标识。<br>**说明：**<br>1.当前组件必须在scopeId所标识的容器内或者当前组件所属容器在scopeId所标识的容器内。<br>2.组件不可重复设置多个优先级。<br>3.设置了focusScopeId的容器组件不可设置优先级。|
| priority | FocusPriority | 否 | FocusPriority.AUTO | **命名参数。**  获焦优先级。<br>**说明：**<br>priority不设置则组件为默认AUTO优先级。<br>优先级对走焦以及获焦组件的影响：<br>1.容器整体获焦（层级页面切换/焦点切换到焦点组/容器组件使用requestFocus申请焦点）时，若容器内存在优先级为PREVIOUS的组件，则优先级为PREVIOUS的组件获焦，否则，由容器内上次获焦的组件获焦。<br>2.容器非整体获焦（非焦点组场景下使用tab键/方向键走焦）时，若容器为首次获焦，则容器内优先级最高的组件获焦，若容器非首次获焦，不考虑优先级按照位置顺序走焦。|

## func focusScopeId(String, Bool, Bool)

```cangjie
public func focusScopeId(id: String, isGroup!: Bool = false, arrowStepOut!: Bool = true): This
```

**功能：** 设置当前容器组件的id标识，设置当前容器组件是否为焦点组。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| id | String | 是 | \- | 当前容器组件的id标识。<br>**说明：**<br>单个层级页面下，id标识全局唯一，不可重复。|
| isGroup | Bool | 否 | false | **命名参数。**  当前容器组件是否为焦点组。<br>**说明：**<br>焦点组不可嵌套，不可重复配置。<br>焦点组不能和tabIndex混用。<br>配置焦点组的目的时使得容器及容器内的元素可以按照焦点组规则走焦。焦点组走焦规则：<br>1.焦点组容器内只能通过方向键走焦，tab键会使焦点跳出焦点组容器。<br>2.通过方向键使焦点从焦点组容器外切换到焦点组容器内时，若焦点组容器内存在优先级为PREVIOUS的组件，则优先级为PREVIOUS的组件获焦，否则，由焦点组容器内上次获焦的组件获焦。|
| arrowStepOut | Bool | 否 | true | **命名参数。**  能否使用方向键走焦出当前焦点组。true表示可以使用方向键走焦出当前焦点组，false表示不能使用方向键走焦出当前焦点组。|

## func tabIndex(Int32)

```cangjie
public func tabIndex(index: Int32): This
```

**功能：** 自定义组件tab键走焦能力。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| index | Int32 | 是 | - | 自定义组件tab键走焦能力。若有配置了tabIndex大于0的组件，则tab键走焦只会在tabIndex大于0的组件内按照tabIndex的值从小到大并循环依次走焦。若没有配置tabIndex大于0的组件，则tabIndex等于0的组件按照组件预设的走焦规则走焦。<br>UiExtension组件未适配tabIndex，在含有UiExtension组件的页面使用tabIndex会导致走焦错乱。<br>\- tabIndex >= 0：表示元素是可聚焦的，并且可以通过tab键走焦来访问到该元素。<br>\- tabIndex < 0（通常是tabIndex = -1）：表示元素是可聚焦的，但是不能通过tab键走焦来访问到该元素。<br>初始值：0。<br>**说明：** <br>tabIndex与focusScopeId不能混用。|

## func groupDefaultFocus(Bool)

```cangjie
public func groupDefaultFocus(isGroupDefaultFocus: Bool): This
```

**功能：** 设置当前组件是否为当前组件所在容器获焦时的默认焦点。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| isGroupDefaultFocus | Bool | 是 | - | 当前组件是否为当前组件所在容器获焦时的默认焦点，仅在初次创建容器节点第一次获焦时生效。true表示当前组件为所在容器获焦时的默认焦点，false表示当前组件不是所在容器获焦时的默认焦点。<br>初始值：false <br>**说明：**<br>必须与tabIndex联合使用，当某个容器设置了[tabIndex](./cj-universal-attribute-focus.md#func-tabindexint32)，且容器内某子组件或容器自身设置了groupDefaultFocus(true)，当该容器首次TAB键获焦时，会自动将焦点转移至该指定的组件上。若容器内（包含容器本身）有多个组件设置了groupDefaultFocus(true)，则以组件树深度遍历找到的第一个组件为最终结果。|

## 基础类型定义

### class FocusControl

```cangjie
public class FocusControl {
}
```

**功能：** 焦点控制模块。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### static func requestFocus(String)

```cangjie
public static func requestFocus(keyValue: String): Bool
```

**功能：** 方法语句中可使用的全局接口，调用此接口可以主动让焦点转移至参数指定的组件上。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :--- | :--- | :--- | :--- | :--- |
| keyValue | String | 是 | \- | 目标组件使用接口key(value: string)或id(value: string)绑定的字符串。<br>返回是否成功给目标组件申请到焦点。若参数指向的目标组件存在，且目标组件可获焦，则返回true，否则返回false。 |

**返回值：**

|类型|说明|
| :-------   | :---------- |
| Bool | 返回是否成功给目标组件申请到焦点。若参数指向的目标组件存在，且目标组件可获焦，则返回true，否则返回false。|

### class FocusBoxStyle

```cangjie
public class FocusBoxStyle {
    public FocusBoxStyle (
        public var margin!: ?Length = None,
        public var strokeColor!: ?ColorMetrics = None,
        public var strokeWidth!: ?Length = None
    )
}
```

**功能：** 系统焦点框样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### var margin

```cangjie
public var margin: ?Length = None
```

**功能：** 焦点框相对组件边缘的距离。正数代表外侧，负数代表内侧。不支持百分比。

**类型：**  [Length](./cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 19

#### var strokeColor

```cangjie
public var strokeColor: ?ColorMetrics = None
```

**功能：** 焦点框颜色。

**类型：** [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics)

**读写能力：** 可读写

**起始版本：** 19

#### var strokeWidth

```cangjie
public var strokeWidth: ?Length = None
```

**功能：** 焦点框宽度。不支持负数与百分比。

**类型：** [Length](./cj-common-types.md#interface-length)

**读写能力：** 可读写

**起始版本：** 19

#### FocusBoxStyle (public var margin!: ?Length = None, public var strokeColor!: ?ColorMetrics = None, public var strokeWidth!: ?Length = None)

```cangjie
public FocusBoxStyle (public var margin!: ?Length = None, public var strokeColor!: ?ColorMetrics = None, public var strokeWidth!: ?Length = None)
```

**功能：** 构造一个FocusBoxStyle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :---- | :---- | :--- | :----- | :----------- |
| margin | [Length](./cj-common-types.md#interface-length) | 否   | None  | **命名参数。**  焦点框相对组件边缘的距离。<br>正数代表外侧，负数代表内侧。不支持百分比。 |
| strokeColor | [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | 否   | None | **命名参数。**  焦点框颜色。 |
| strokeWidth | [Length](./cj-common-types.md#interface-length) | 否   | None  | **命名参数。**  焦点框宽度。<br>不支持负数与百分比。 |

### class ColorMetrics

```cangjie
public class ColorMetrics {
    public prop color: String
    public prop red: UInt8
    public prop green: UInt8
    public prop blue: UInt8
    public prop alpha: UInt8
}
```

**功能：** 用于混合颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### prop color

```cangjie
public prop color: String
```

**功能：** 获取ColorMetrics的颜色，返回的是rgba字符串的格式。

**类型：** String

**读写能力：** 只读

**起始版本：** 19

#### prop red

```cangjie
public prop red: UInt8
```

**功能：** 获取ColorMetrics颜色的R分量（红色）。

**类型：** UInt8

**读写能力：** 只读

**起始版本：** 19

#### prop green

```cangjie
public prop green: UInt8
```

**功能：** 获取ColorMetrics颜色的G分量（绿色）。

**类型：** UInt8

**读写能力：** 只读

**起始版本：** 19

#### prop blue

```cangjie
public prop blue: UInt8
```

**功能：** 获取ColorMetrics颜色的B分量（蓝色）。

**类型：** UInt8

**读写能力：** 只读

**起始版本：** 19

#### prop alpha

```cangjie
public prop alpha: UInt8
```

**功能：** 获取ColorMetrics颜色的A分量（透明度）。

**类型：** UInt8

**读写能力：** 只读

**起始版本：** 19

#### static func numeric(UInt32)

```cangjie
public static func numeric(value: UInt32): ColorMetrics
```

**功能：** 使用HEX格式颜色实例化 ColorMetrics 类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :---- | :---- | :--- | :----- | :----------- |
| value | UInt32 | 是   | \-      | HEX格式颜色。 |

**返回值：**

|类型|说明|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | ColorMetrics 类的实例。|

#### static func rgba(UInt8, UInt8, UInt8, Float32)

```cangjie
public static func rgba(red: UInt8, green: UInt8, blue: UInt8, alpha!: Float32 = 1.0): ColorMetrics
```

**功能：** 使用rgb或者rgba格式颜色实例化 ColorMetrics 类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :---- | :---- | :--- | :----- | :----------- |
| red | UInt8 | 是 | \- | R分量（红色）。 |
| green | UInt8 | 是 | \- | G分量（绿色）。 |
| blue | UInt8 | 是 | \- | B分量（蓝色）。 |
| alpha | Float32 | 否  | 1.0 | **命名参数。**  A分量（透明度）。 |

**返回值：**

|类型|说明|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | ColorMetrics 类的实例。|

#### static func resourceColor(Color)

```cangjie
public static func resourceColor(color: Color): ColorMetrics
```

**功能：** 使用颜色枚举值实例化 ColorMetrics 类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :---- | :---- | :--- | :----- | :----------- |
| color | Color | 是   | \- | 颜色类型。 |

**返回值：**

|类型|说明|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | ColorMetrics 类的实例。|

#### static func resourceColor(UInt32)

```cangjie
public static func resourceColor(color: UInt32): ColorMetrics
```

**功能：** 使用HEX格式颜色实例化 ColorMetrics 类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :---- | :---- | :--- | :----- | :----------- |
| color | UInt32 | 是   | \-  | HEX格式颜色。 |

**返回值：**

|类型|说明|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | ColorMetrics 类的实例。|

#### static func resourceColor(String)

```cangjie
public static func resourceColor(color: String): ColorMetrics
```

**功能：** 使用rgb或者argb格式颜色实例化 ColorMetrics 类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :---- | :---- | :--- | :----- | :----------- |
| color | String | 是   | \- | rgb或者argb格式颜色。 |

**返回值：**

|类型|说明|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | ColorMetrics 类的实例。|

#### static func resourceColor(AppResource)

```cangjie
public static func resourceColor(color: AppResource): ColorMetrics
```

**功能：** 使用系统资源或者应用资源中的颜色实例化 ColorMetrics 类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :---- | :---- | :--- | :----- | :----------- |
| color | [AppResource](../apis/LocalizationKit/cj-apis-resource_manager.md#class-appresource) | 是   | \- | 系统资源或者应用资源中的颜色。 |

**返回值：**

|类型|说明|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | ColorMetrics 类的实例。|

#### func blendColor(ColorMetrics)

```cangjie
public func blendColor(overlayColor: ColorMetrics): ColorMetrics
```

**功能：** 混合颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
| :---- | :---- | :--- | :----- | :----------- |
| overlayColor | [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | 是   | \- | 叠加颜色的 ColorMetrics 类的实例。 |

**返回值：**

|类型|说明|
| :-------   | :---------- |
| [ColorMetrics](./cj-universal-attribute-focus.md#class-colormetrics) | ColorMetrics 类的实例。|

#### func toUInt32()

```cangjie
public func toUInt32(): UInt32
```

**功能：** 获取ColorMetrics的颜色的整数格式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**返回值：**

|类型|说明|
| :-------   | :---------- |
| UInt32 | ColorMetrics的颜色的整数格式。|

### enum FocusPriority

```cangjie
public enum FocusPriority {
    | AUTO
    | PRIOR
    | PREVIOUS
}
```

**功能：** 获焦优先级。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### AUTO

```cangjie
AUTO
```

**功能：** 默认的优先级，缺省时组件的获焦优先级。

**起始版本：** 19

#### PRIOR

```cangjie
PRIOR
```

**功能：** 容器内优先获焦的优先级。优先级高于AUTO。

**起始版本：** 19

#### PREVIOUS

```cangjie
PREVIOUS
```

**功能：** 上一次容器整体失焦时获焦节点的优先级。优先级高于PRIOR。

**起始版本：** 19

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State
    var oneButtonColor: UInt32 = 0xFFC0CB
    @State
    var twoButtonColor: UInt32 = 0x87CEFA
    @State
    var threeButtonColor: UInt32 = 0x90EE90
    @State
    var fourButtonColor: UInt32 = 0x5DD55D
    @State
    var fiveButtonColor: UInt32 = 0x1E90FF
    @State
    var rowBoxColor: UInt32 = 0xFFFFFF
    @State
    var idList: Array<String> = ["A", "B", "C", "D", "E", "F"]

    func build() {
        // button 组件默认可获焦
        Column(20) {
            Row() {
                // 默认焦点，并且点击可获焦
                Button("Hello Cangjie A")
                    .onClick {
                        evt => AppLog.info("Hello Cangjie A")
                    }
                    .backgroundColor(oneButtonColor)
                    .width(400.px)
                    .height(150.px)
                    .margin(5.px)
                    .fontColor(Color.BLACK)
                    .focusOnTouch(true)
                    .defaultFocus(true)
                    .onFocus({
                        => oneButtonColor = 0xFF0000
                    })
                    .onBlur({
                        => oneButtonColor = 0xFFC0CB
                    })
                    .tabIndex(1)
                    .id(this.idList[0])
                    .key(this.idList[0])
                // 不支持点击获焦，但是默认可获焦
                Button("Hello Cangjie B")
                    .onClick {
                        evt => AppLog.info("Hello Cangjie B")
                    }
                    .backgroundColor(twoButtonColor)
                    .width(400.px)
                    .height(150.px)
                    .fontColor(Color.BLACK)
                    .margin(5.px)
                    .focusOnTouch(false)
                    .onFocus({
                        => twoButtonColor = 0xFF0000
                    })
                    .onBlur({
                        => twoButtonColor = 0x87CEFA
                    })
                    .tabIndex(2)
                    .id(this.idList[1])
                    .key(this.idList[1])
            }
            Row() {
                // 不支持获焦
                Button("Hello Cangjie C")
                    .onClick {
                        evt => AppLog.info("Hello Cangjie C")
                    }
                    .backgroundColor(threeButtonColor)
                    .width(400.px)
                    .height(150.px)
                    .margin(5.px)
                    .fontColor(Color.BLACK)
                    .focusable(false)
                    .onFocus({
                        => threeButtonColor = 0xFF0000
                    })
                    .onBlur({
                        => threeButtonColor = 0x90EE90
                    })
                    .tabIndex(3)
                    .id(this.idList[2])
                    .key(this.idList[2])
                // 可获焦，并且支持点击获焦
                Button("Hello Cangjie D")
                    .onClick {
                        evt => AppLog.info("Hello Cangjie D")
                    }
                    .backgroundColor(fourButtonColor)
                    .width(400.px)
                    .height(150.px)
                    .margin(5.px)
                    .fontColor(Color.BLACK)
                    .focusable(true)
                    .focusOnTouch(true)
                    .onFocus({
                        => fourButtonColor = 0xFF0000
                    })
                    .onBlur({
                        => fourButtonColor = 0x5DD55D
                    })
                    .tabIndex(4)
                    .id(this.idList[3])
                    .key(this.idList[3])
            }
            Row() {
                // 父级组件获焦时的默认焦点
                Button("Hello Cangjie E")
                    .onClick {
                        evt => AppLog.info("Hello Cangjie E")
                    }
                    .backgroundColor(fiveButtonColor)
                    .width(400.px)
                    .height(150.px)
                    .margin(20.px)
                    .fontColor(Color.BLACK)
                    .onFocus({
                        => fiveButtonColor = 0xFF0000
                    })
                    .onBlur({
                        => fiveButtonColor = 0x1E90FF
                    })
                    .groupDefaultFocus(true)
                    .id(this.idList[4])
                    .key(this.idList[4])
            }
            .tabIndex(4)
            .focusable(true)
            .borderWidth(1.5)
            .borderColor(rowBoxColor)
            .borderStyle(BorderStyle.Solid)
            .onFocus({
                => rowBoxColor = 0x000000
            })
            .onBlur({
                => rowBoxColor = 0xFFFFFF
            })

            Row() {
                // 点击让D组件获焦
                Button("RequestFocus-D")
                    .width(400.px)
                    .height(150.px)
                    .margin(20.px)
                    .fontColor(Color.BLACK)
                    .focusable(true)
                    .onClick {
                        let selectId = this.idList[3]
                        let result = FocusControl.requestFocus(selectId)
                        if (result) {
                            AppLog.info("Request success")
                        } else {
                            AppLog.info("Request failed")
                        }
                    }
            }

            Row(20) {
                Column(20) {
                    Column(5) {
                        Button("Group1")
                            .width(165)
                            .height(40)
                            .fontColor(Color.WHITE)
                            .id("b1")
                            .key("b1")
                            .focusOnTouch(true)
                        Row(5) {
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b2").key("b2")
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b3").key("b3")
                        }
                        Row(5) {
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b4").key("b4")
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b5").key("b5")
                        }
                    }.borderWidth(2).borderColor(Color.RED).borderStyle(BorderStyle.Dashed)
                    Column(5) {
                        Button("Group2").width(165).height(40).fontColor(Color.WHITE).id("b6").key("b6")
                        Row(5) {
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b7").key("b7")
                            Button("PRIOR")
                                .width(80)
                                .height(40)
                                .fontColor(Color.WHITE)
                                .focusScopePriority("ColumnScope1", priority: FocusPriority.PRIOR)
                                .focusBox(
                                    FocusBoxStyle(
                                        margin: 20.px,
                                        strokeColor: ColorMetrics.resourceColor(Color.RED),
                                        strokeWidth: 20.px
                                    )
                                )
                                .id("b8")
                                .key("b8")
                        }
                        Row(5) {
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b9").key("b9")
                            Button().width(80).height(40).fontColor(Color.WHITE).id("b10").key("b10")
                        }
                    }.borderWidth(2).borderColor(Color.GREEN).borderStyle(BorderStyle.Dashed)
                }.focusScopeId("ColumnScope1")
                Column(5) {
                    Button("Group3")
                        .width(165)
                        .height(40)
                        .fontColor(Color.WHITE)
                        .id("b11")
                        .key("b11")
                        .focusOnTouch(true)
                    Row(5) {
                        Button().width(80).height(40).fontColor(Color.WHITE).id("b12").key("b12")
                        Button().width(80).height(40).fontColor(Color.WHITE).id("b13").key("b13")
                    }
                    Button("PREVIOUS")
                        .width(165)
                        .height(40)
                        .fontColor(Color.WHITE)
                        .focusScopePriority("ColumnScope2", priority: FocusPriority.PREVIOUS)
                        .id("b14")
                        .key("b14")
                    Row(5) {
                        Button().width(80).height(40).fontColor(Color.WHITE).id("b15").key("b15")
                        Button().width(80).height(40).fontColor(Color.WHITE).id("b16").key("b16")
                    }
                    Button().width(165).height(40).fontColor(Color.WHITE).id("b17").key("b17")
                    Row(5) {
                        Button().width(80).height(40).fontColor(Color.WHITE).id("b18").key("b18")
                        Button().width(80).height(40).fontColor(Color.WHITE).id("b19").key("b19")
                    }
                }
                    .borderWidth(2)
                    .borderColor(Color.GRAY)
                    .borderStyle(BorderStyle.Dashed)
                    .focusScopeId("ColumnScope2", isGroup: true) // Column2为焦点组
            }
        }.width(100.percent).margin(top: 20)
    }
}
```

![focus_control](figures/focus_control.jpeg)
