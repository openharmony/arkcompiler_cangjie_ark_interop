# MenuItem

用来展示菜单Menu中具体的item菜单项。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

无

## 创建组件

### init(() -> Unit)

```cangjie
public init(child!: () -> Unit = {=>}) 
```

**功能：** 构造一个有二级菜单的 item 菜单项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|child|()->Unit|否|{ => }|**命名参数。** 自定义UI描述。使用时结合[@Builder](../../../Dev_Guide/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md)和bind方法使用。|

### init(ResourceStr, ResourceStr, ResourceStr, ResourceStr, Option\<() -> Unit>)

```cangjie
public init(startIcon!: ResourceStr, content!: ResourceStr, endIcon!: ResourceStr, labelInfo!: ResourceStr,
    builder!: Option<() -> Unit> = None)
```

**功能：**构造一个有二级菜单的 item 菜单项。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|startIcon|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|**命名参数。** item中显示在左侧的图标信息路径。|
|content|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|**命名参数。** item的内容信息。|
|endIcon|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-| **命名参数。** item中显示在右侧的图标信息路径。              |
|labelInfo|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|**命名参数。** 定义结束标签信息，如快捷方式Ctrl+C等。|
|builder|Option\<()->Unit>|否|None|**命名参数。** 自定义UI描述。使用时结合[@Builder](../../../Dev_Guide/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md)和bind方法使用。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func contentFont(Length, FontWeight, String, FontStyle)

```cangjie
public func contentFont(
    size!: Length = 16.vp,
    weight!: FontWeight = FontWeight.Normal,
    family!: String = "HarmonyOS Sans",
    style!: FontStyle = FontStyle.Normal
): This
```

**功能：**设置菜单项中内容信息的字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|16.vp|**命名参数。** 设置文本尺寸，Length为Int64、Float64类型时，使用fp单位。不支持百分比设置。|
|weight|FontWeight|否|FontWeight.Normal|**命名参数。** 设置文本的字体粗细。|
|family|String|否|"HarmonyOS Sans"|**命名参数。** 设置文本的字体列表。使用多个字体，使用','进行分割，优先级按顺序生效。例如：'Arial, HarmonyOS Sans'。当前支持'HarmonyOS Sans'字体和[注册自定义字体](cj-apis-font.md)。|
|style|FontStyle|否|FontStyle.Normal|**命名参数。** 设置文本的字体样式。|

### func contentFont(Length, FontWeight, ResourceColor, FontStyle)

```cangjie
public func contentFont(
    size!: Length = 16.vp,
    weight!: FontWeight = FontWeight.Normal,
    family!: ResourceColor = "HarmonyOS Sans",
    style!: FontStyle = FontStyle.Normal
): This
```

**功能：**  设置菜单项中内容信息的字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|16.vp|**命名参数。** 设置文本尺寸，Length为Int64、Float64类型时，使用fp单位。不支持百分比设置。|
|weight|FontWeight|否|FontWeight.Normal|**命名参数。** 设置文本的字体粗细。|
|family|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|"HarmonyOS Sans"|**命名参数。** 设置文本的字体列表。使用多个字体，使用','进行分割，优先级按顺序生效。例如：'Arial, HarmonyOS Sans'。当前支持'HarmonyOS Sans'字体和[注册自定义字体](cj-apis-font.md)。|
|style|FontStyle|否|FontStyle.Normal|**命名参数。**  设置文本的字体样式。|

### func contentFontColor(ResourceColor)

```cangjie
public func contentFontColor(value: ResourceColor): This
```

**功能：** 设置菜单项中内容信息的字体颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|菜单项中内容信息的字体颜色。<br/>初始值：0xE5000000|

### func labelFont(Length, FontWeight, String, FontStyle)

```cangjie
public func labelFont(
    size!: Length = 16.vp,
    weight!: FontWeight = FontWeight.Normal,
    family!: String = "HarmonyOS Sans",
    style!: FontStyle = FontStyle.Normal
): This
```

**功能：**设置菜单项中标签信息的字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|16.vp|**命名参数。** 设置文本尺寸，Length为Int64、Float64类型时，使用fp单位。不支持百分比设置。|
|weight|FontWeight|否|FontWeight.Normal|**命名参数。** 设置文本的字体粗细。|
|family|String|否|"HarmonyOS Sans"|**命名参数。** 设置文本的字体列表。使用多个字体，使用','进行分割，优先级按顺序生效。例如：'Arial, HarmonyOS Sans'。|
|style|FontStyle|否|FontStyle.Normal|**命名参数。**  设置文本的字体样式。|

### func labelFont(Length, FontWeight, ResourceStr, FontStyle)

```cangjie
public func labelFont(
    size!: Length = 16.vp,
    weight!: FontWeight = FontWeight.Normal,
    family!: ResourceStr = "HarmonyOS Sans",
    style!: FontStyle = FontStyle.Normal
): This
```

**功能：** 设置菜单项中标签信息的字体样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|16.vp|**命名参数。** 设置文本尺寸，Length为Int64、Float64类型时，使用fp单位。不支持百分比设置。|
|weight|FontWeight|否|FontWeight.Normal|**命名参数。** 设置文本的字体粗细。|
|family|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|"HarmonyOS Sans"|**命名参数。** 设置文本的字体列表。使用多个字体，使用','进行分割，优先级按顺序生效。例如：'Arial, HarmonyOS Sans'。|
|style|FontStyle|否|FontStyle.Normal|**命名参数。**  设置文本的字体样式。|

### func labelFontColor(ResourceColor)

```cangjie
public func labelFontColor(value: ResourceColor): This
```

**功能：** 设置菜单项中标签信息的字体颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|菜单项中标签信息的字体颜色。<br/>初始值：'0x99000000'|

### func selectIcon(Bool)

```cangjie
public func selectIcon(value: Bool): This
```

**功能：**设置当菜单项被选中时，是否显示被选中的图标。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|菜单项被选中时，是否显示被选中的图标。<br/>初始值：false<br/>true：菜单项被选中时，显示默认的对勾图标。<br/>false：即使菜单项被选中也不显示图标。|

### func selectIcon(ResourceStr)

```cangjie
public func selectIcon(value: ResourceStr): This
```

**功能：** 设置当菜单项被选中时，是否显示被选中的图标。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|菜单项被选中时，显示指定的图标。|

### func selected(Bool)

```cangjie
public func selected(value: Bool): This
```

**功能：** 设置菜单项是否选中。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|菜单项是否选中。<br/>初始值：false。<br/>值为true时，菜单项被选中。值为false时，菜单项不被选中。|

## 组件事件

### func onChange((Bool) -> Unit)

```cangjie
public func onChange(callback: (Bool) -> Unit): This
```

**功能：** 当选中状态发生变化时，触发该事件。只有手动触发且MenuItem状态改变时才会触发onChange事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(Bool)->Unit|是|-|选中状态发生变化时，触发该回调。<br/>返回值为true时，表示已选中，为false时，表示未选中。|

## 示例代码

详见[Menu](cj-menu-menu.md#示例代码)组件示例。
