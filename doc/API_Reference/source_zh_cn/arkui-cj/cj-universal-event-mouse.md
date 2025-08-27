# 鼠标事件

在单个动作触发多个事件时，事件的顺序是固定的，鼠标事件默认透传。

> 说明：
>
> 目前仅支持通过外接鼠标触发。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 权限列表

无

## class MouseEvent

```cangjie
public class MouseEvent {
    public var timestamp: Int64
    public var screenX: Float64
    public var screenY: Float64
    public var x: Float64
    public var y: Float64
    public var button: MouseButton
    public var action: MouseAction
    public init(timestamp: Int64, screenX: Float64, screenY: Float64, x: Float64, y: Float64, button: MouseButton,
        action: MouseAction)
}
```

**功能：** 用于描述鼠标事件的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var action

```cangjie
public var action: MouseAction
```

**功能：** 事件动作。

**类型：** [MouseAction](./cj-common-types.md#enum-mouseaction)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var button

```cangjie
public var button: MouseButton
```

**功能：** 鼠标按键。

**类型：** [MouseButton](./cj-common-types.md#enum-mousebutton)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var screenX

```cangjie
public var screenX: Float64
```

**功能：** 点击触点相对于屏幕左上角的x轴坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var screenY

```cangjie
public var screenY: Float64
```

**功能：** 点击触点相对于屏幕左上角的y轴坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var timestamp

```cangjie
public var timestamp: Int64
```

**功能：** 触发事件时的时间戳。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var x

```cangjie
public var x: Float64
```

**功能：** 点击触点相对于当前组件左上角的x轴坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var y

```cangjie
public var y: Float64
```

**功能：** 点击触点相对于当前组件左上角的y轴坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Int64, Float64, Float64, Float64, Float64, MouseButton, MouseAction)

```cangjie
public init(timestamp: Int64, screenX: Float64, screenY: Float64, x: Float64, y: Float64, button: MouseButton,
    action: MouseAction)
```

**功能：** 构造鼠标事件类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|timestamp|Int64|是|-|触发事件时的时间戳。|
|screenX|Float64|是|-|点击触点相对于屏幕左上角的x轴坐标。|
|screenY|Float64|是|-|点击触点相对于屏幕左上角的y轴坐标。|
|x|Float64|是|-|点击触点相对于当前组件左上角的x轴坐标。|
|y|Float64|是|-|点击触点相对于当前组件左上角的y轴坐标。|
|button|[MouseButton](./cj-common-types.md#enum-mousebutton)|是|-|鼠标按键。|
|action|[MouseAction](./cj-common-types.md#enum-mouseaction)|是|-|事件动作。|

