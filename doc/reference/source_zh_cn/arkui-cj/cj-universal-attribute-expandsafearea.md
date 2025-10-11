# 安全区域

安全区域是指页面的显示区域，默认不与系统设置的非安全区域比如状态栏、导航栏区域重叠，默认情况下开发者开发的界面都被布局在安全区域内。提供属性方法允许开发者设置组件绘制内容突破安全区域的限制，通过[expandSafeArea](./cj-universal-attribute-expandsafearea.md#func-expandsafeareaarraysafeareatype-arraysafeareaedge)属性支持组件不改变布局情况下扩展其绘制区域至安全区外，通过设置[setKeyboardAvoidMode](./cj-universal-attribute-expandsafearea.md#func-setkeyboardavoidmodevalue-keyboardavoidmode)来配置虚拟键盘弹出时页面的避让模式。页面中有标题栏等文字不希望和非安全区重叠时，建议对组件设置expandSafeArea属性达到沉浸式效果，也可以直接通过窗口接口[setWindowLayoutFullScreen](./cj-apis-window.md#)设置沉浸式。

> **说明：**
>
> 默认摄像头挖孔区域不为非安全区域，页面不避让挖孔。

```json5
"metadata": [

{
"name": "avoid_cutout",
"value": "true",
}
],
```

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func expandSafeArea(?Array\<SafeAreaType>, ?Array\<SafeAreaEdge>)

```cangjie
public func expandSafeArea(types!: ?Array<SafeAreaType> = None, edges!: ?Array<SafeAreaEdge> = None): This
```

**功能：** 扩展安全区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|types|?Array\<[SafeAreaType](#enum-safeareatype)>|否|None|安全区域类型数组。|
|edges|?Array\<[SafeAreaEdge](#enum-safeareaedge)>|否|None|安全区域边缘数组。|

## func !=(SafeAreaEdge)

```cangjie
public operator func !=(other: SafeAreaEdge): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SafeAreaEdge](#enum-safeareaedge)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

## func ==(SafeAreaEdge)

```cangjie
public operator func ==(other: SafeAreaEdge): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SafeAreaEdge](#enum-safeareaedge)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## func !=(SafeAreaType)

```cangjie
public operator func !=(other: SafeAreaType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SafeAreaType](#enum-safeareatype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

## func ==(SafeAreaType)

```cangjie
public operator func ==(other: SafeAreaType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SafeAreaType](#enum-safeareatype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## 基础类型定义

### enum SafeAreaEdge

```cangjie
public enum SafeAreaEdge <: Equatable<SafeAreaEdge> {
    | TOP
    | BOTTOM
    | START
    | END
    | ...
}
```

**功能：** 扩展安全区域的方向。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SafeAreaEdge>

#### BOTTOM

```cangjie
BOTTOM
```

**功能：** 下方区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### END

```cangjie
END
```

**功能：** 尾部区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### START

```cangjie
START
```

**功能：** 前部区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### TOP

```cangjie
TOP
```

**功能：** 上方区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### enum SafeAreaType

```cangjie
public enum SafeAreaType <: Equatable<SafeAreaType> {
    | SYSTEM
    | CUTOUT
    | KEYBOARD
    | ...
}
```

**功能：** 扩展安全区域的枚举类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SafeAreaType>

#### CUTOUT

```cangjie
CUTOUT
```

**功能：** 设备的非安全区域，例如刘海屏或挖孔屏区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### KEYBOARD

```cangjie
KEYBOARD
```

**功能：** 软键盘区域。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### SYSTEM

```cangjie
SYSTEM
```

**功能：** 系统默认非安全区域，包括状态栏、导航栏。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21
