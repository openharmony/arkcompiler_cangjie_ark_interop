# Button

按钮组件，可快速创建不同样式的按钮。

## 子组件

可以包含单个子组件。

## 创建组件

### init(() -> Unit)

```cangjie
public init(child: () -> Unit)
```

**功能：** 创建包含子组件的按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|child|()->Unit|是|-|按钮包含的子组件。|

### init(ResourceStr)

```cangjie
public init(label: ResourceStr)
```

**功能：** 使用文本内容创建相应的按钮组件，此时Button无法包含子组件。
文本内容默认单行显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|label|[ResourceStr](./cj-common-types.md#interface-resourcestr)|是|-|按钮文本内容。当文本字符的长度超过按钮本身的宽度时，文本将会被截断。|

### init(ButtonOptions)

```cangjie
public init(options: ButtonOptions)
```

**功能：** 使用文本内容创建相应的按钮组件，此时Button无法包含子组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|[ButtonOptions](#class-buttonoptions)|是|-|配置按钮的显示样式。|

### init(ButtonOptions, () -> Unit)

```cangjie
public init(options: ButtonOptions, child: () -> Unit)
```

**功能：** 创建可以包含子组件且有显示样式的按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|[ButtonOptions](#class-buttonoptions)|是|-|配置按钮的显示样式。|
|child|()->Unit|是|-|按钮包含的子组件。|

### init(ResourceStr, ButtonOptions)

```cangjie
public init(label: ResourceStr, options: ButtonOptions)
```

**功能：** 使用文本内容创建相应的按钮组件，此时Button无法包含子组件。
文本内容默认单行显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|label|[ResourceStr](./cj-common-types.md#interface-resourcestr)|是|-|按钮文本内容。<br/>**说明**：<br/>当文本字符的长度超过按钮本身的宽度时，文本将会被截断。|
|options|[ButtonOptions](#class-buttonoptions)|是|-|配置按钮的显示样式。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func buttonStyle(ButtonStyleMode)

```cangjie
public func buttonStyle(value: ButtonStyleMode): This
```

**功能：** 设置Button组件的样式和重要程度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ButtonStyleMode](#enum-buttonstylemode)|是|-|Button组件的样式和重要程度。<br>初始值：ButtonStyleMode.Emphasized。|

### func fontColor(ResourceColor)

```cangjie
public func fontColor(color: ResourceColor): This
```

**功能：** 设置文本显示颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|color|[ResourceColor](./cj-common-types.md#interface-resourcecolor)|是|-|文本显示颜色。

默认值：@r(sys.color.font_on_primary)，显示为白色字体。|

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
|value|[ResourceStr](./cj-common-types.md#interface-resourcestr)|是|-|字体列表。默认字体'HarmonyOS Sans'，当前支持'HarmonyOS Sans'字体和注册自定义字体。|

### func fontSize(Length)

```cangjie
public func fontSize(value: Length): This
```

**功能：** 设置文本显示字号。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](./cj-common-types.md#interface-length)|是|-|文本显示字号。

默认值：当controlSize为ControlSize.NORMAL时，默认值为@r(sys.float.Body_L)。

当controlSize为ControlSize.SMALL时，默认值为@r(sys.float.Body_S)。

说明：不支持百分比。|

### func fontStyle(FontStyle)

```cangjie
public func fontStyle(value: FontStyle): This
```

**功能：** 设置文本的字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[FontStyle](./cj-common-types.md#enum-fontstyle)|是|-|文本的字体样式。

默认值：FontStyle.Normal|

### func fontWeight(FontWeight)

```cangjie
public func fontWeight(value: FontWeight): This
```

**功能：** 设置文本的字体粗细。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[FontWeight](./cj-common-types.md#enum-fontweight)|是|-|文本的字体粗细，取值越大，字体越粗。默认值：500|

### func shape(ButtonType)

```cangjie
public func shape(value: ButtonType): This
```

**功能：** 设置Button组件的形状。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ButtonType](#enum-buttontype)|是|-|按键形状类型。|

### func stateEffect(Bool)

```cangjie
public func stateEffect(value: Bool): This
```

**功能：** 设置是否开启按压态显示效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|按钮按下时是否开启按压态显示效果，当设置为false时，按压效果关闭。<br/>初始值：true|

## 基础类型定义

### class ButtonOptions

```cangjie
public class ButtonOptions {
    public var shape: ButtonType
    public var stateEffect: Bool
    public var buttonStyle: ButtonStyleMode
    public var controlSize: ControlSize
    public var role: ButtonRole
    public init(
        shape!: ButtonType = ButtonType.Capsule,
        stateEffect!: Bool = true,
        buttonStyle!: ButtonStyleMode = ButtonStyleMode.Emphasized,
        controlSize!: ControlSize = ControlSize.Normal,
        role!: ButtonRole = ButtonRole.Normal
    )
}
```

**功能：** 配置按钮的显示样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var buttonStyle

```cangjie
public var buttonStyle: ButtonStyleMode
```

**功能：** 描述按钮的样式和重要程度。

**类型：** [ButtonStyleMode](#enum-buttonstylemode)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var controlSize

```cangjie
public var controlSize: ControlSize
```

**功能：** 描述按钮的尺寸。

**类型：** [ControlSize](./cj-common-types.md#enum-controlsize)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var role

```cangjie
public var role: ButtonRole
```

**功能：** 描述按钮的角色。

**类型：** [ButtonRole](#enum-buttonrole)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var shape

```cangjie
public var shape: ButtonType
```

**功能：** 描述按钮的形状。

**类型：** [ButtonType](#enum-buttontype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var stateEffect

```cangjie
public var stateEffect: Bool
```

**功能：** 按钮按下时是否开启按压态显示效果。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(ButtonType, Bool, ButtonStyleMode, ControlSize, ButtonRole)

```cangjie
public init(
    shape!: ButtonType = ButtonType.Capsule,
    stateEffect!: Bool = true,
    buttonStyle!: ButtonStyleMode = ButtonStyleMode.Emphasized,
    controlSize!: ControlSize = ControlSize.Normal,
    role!: ButtonRole = ButtonRole.Normal
)
```

**功能：** 创建ButtonOptions类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|shape|[ButtonType](#enum-buttontype)|否|ButtonType.Capsule| **命名参数。** 按钮的形状。|
|stateEffect|Bool|否|true| **命名参数。**  按钮按下时是否开启按压态显示效果，当设置为false时，按压效果关闭。<br>**说明：**<br>当开启按压态显示效果，开发者设置状态样式时，会基于状态样式设置完成后的背景色再进行颜色叠加。|
|buttonStyle|[ButtonStyleMode](#enum-buttonstylemode)|否|ButtonStyleMode.EMPHASIZED| **命名参数。** 描述按钮的样式和重要程度。<br/>**说明：**<br/>按钮重要程度：强调按钮>普通按钮>文字按钮。|
|controlSize|[ControlSize](./cj-common-types.md#enum-controlsize)|否|ControlSize.NORMAL| **命名参数。**  描述按钮的尺寸。|
|role|[ButtonRole](#enum-buttonrole)|否|ButtonRole.NORMAL| **命名参数。** 描述按钮的角色。|

### enum ButtonRole

```cangjie
public enum ButtonRole {
    | Normal
    | Error
}
```

**功能：** 按钮的角色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Error

```cangjie
Error
```

**功能：** 警示按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Normal

```cangjie
Normal
```

**功能：** 正常按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### enum ButtonStyleMode

```cangjie
public enum ButtonStyleMode {
    | Normal
    | Emphasized
    | Textual
}
```

**功能：** 按钮的重要程度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Emphasized

```cangjie
Emphasized
```

**功能：** 强调按钮（用于强调当前操作）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Normal

```cangjie
Normal
```

**功能：** 普通按钮（一般界面操作）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Textual

```cangjie
Textual
```

**功能：** 文本按钮（纯文本，无背景颜色）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### enum ButtonType

```cangjie
public enum ButtonType {
    | Normal
    | Capsule
    | Circle
    | RoundRectangle
}
```

**功能：** 按键形状类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Capsule

```cangjie
Capsule
```

**功能：** 胶囊型按钮（圆角默认为高度的一半）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Circle

```cangjie
Circle
```

**功能：** 圆形按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Normal

```cangjie
Normal
```

**功能：** 普通按钮（默认不带圆角）。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### RoundRectangle

```cangjie
RoundRectangle
```

**功能：** 圆角矩形按钮。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

