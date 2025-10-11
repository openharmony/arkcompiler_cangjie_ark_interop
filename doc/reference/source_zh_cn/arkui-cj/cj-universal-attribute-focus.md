# 焦点控制

自定义组件的走焦效果，可设置组件是否走焦和具体的走焦顺序，tab键或者方向键切换焦点。

> **说明：**
>
> - 自定义组件无获焦能力，当设置[focusable](./cj-universal-attribute-focus.md#func-focusablebool)、[enabled](./cj-universal-attribute-enable.md#func-enabledbool)等属性为false，或者设置[visibility](./cj-universal-attribute-visibility.md#func-visibilityvisibility)属性为Hidden、None时，也不影响其子组件的获焦。
> - 组件主动获取焦点不受窗口焦点的控制。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func defaultFocus(Bool)

```cangjie
public func defaultFocus(value: Bool): This
```

**功能：** 设置组件是否为默认焦点。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否为默认焦点。|

## func focusOnTouch(Bool)

```cangjie
public func focusOnTouch(value: Bool): This
```

**功能：** 设置触摸时是否获得焦点。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|当前组件是否支持点击获焦能力。true表示组件支持点击获焦，false表示不支持点击获焦。<br>初始值：false。<br>**说明：**<br>仅在组件可点击时才能正常获取焦点。|

## func focusable(Bool)

```cangjie
public func focusable(value: Bool): This
```

**功能：** 设置组件是否可以获得焦点。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|当前组件是否可以获焦。true表示组件可以获焦，false表示组件不可获焦。<br>**说明：**<br>存在默认交互逻辑的组件例如[Button](./cj-button-picker-button.md)、[TextInput](./cj-text-input-textinput.md)等，默认即为可获焦，[Text](./cj-text-input-text.md)、[Image](./cj-image-video-image.md)等组件则默认状态为不可获焦。不可获焦状态下，无法触发焦点事件。|

## func groupDefaultFocus(Bool)

```cangjie
public func groupDefaultFocus(value: Bool): This
```

**功能：** 设置组是否为默认焦点。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|当前组件是否为当前组件所在容器获焦时的默认焦点，仅在初次创建容器节点第一次获焦时生效。true表示当前组件为所在容器获焦时的默认焦点，false表示当前组件不是所在容器获焦时的默认焦点。<br>初始值：false <br>**说明：**<br>必须与tabIndex联合使用，当某个容器设置了[tabIndex](./cj-universal-attribute-focus.md#func-tabindexint32)，且容器内某子组件或容器自身设置了groupDefaultFocus(true)，当该容器首次TAB键获焦时，会自动将焦点转移至该指定的组件上。若容器内（包含容器本身）有多个组件设置了groupDefaultFocus(true)，则以组件树深度遍历找到的第一个组件为最终结果。|

## func tabIndex(Int32)

```cangjie
public func tabIndex(index: Int32): This
```

**功能：** 设置组件的Tab索引。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int32|是|-|Tab索引值。|

## 基础类型定义

### class FocusControl

```cangjie
public class FocusControl {}
```

**功能：** 焦点控制模块。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### static func requestFocus(String)

```cangjie
public static func requestFocus(value: String): Bool
```

**功能：** 方法语句中可使用的全局接口，调用此接口可以主动让焦点转移至参数指定的组件上。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|目标组件使用接口key(value: string)或id(value: string)绑定的字符串。<br/>返回是否成功给目标组件申请到焦点。若参数指向的目标组件存在，且目标组件可获焦，则返回true，否则返回false。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回是否成功给目标组件申请到焦点。若参数指向的目标组件存在，且目标组件可获焦，则返回true，否则返回false。|
