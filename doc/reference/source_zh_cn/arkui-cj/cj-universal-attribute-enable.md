# 禁用控制

组件是否可交互，可交互状态下响应[点击事件](./cj-universal-event-click.md#)、[触摸事件](./cj-universal-event-touch.md)、[拖拽事件](./cj-universal-event-drag.md)、[按键事件](./cj-universal-event-key.md)、[焦点事件](../../../application-dev/source_zh_cn/arkui-cj/cj-common-events-focus-event.md)、[鼠标事件](./cj-universal-event-mouse.md)和[手势事件](./cj-universal-gesture-bind.md)。

> **说明：**
>
> 禁用控制属性只能在按下时生效，已经在交互过程中，更改enabled属性不生效。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func enabled(Bool)

```cangjie
public func enabled(value: Bool): This
```

**功能：** 设置组件是否启用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否启用。|

