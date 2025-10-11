# 点击事件

点击事件指组件被点击时触发的事件。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func onClick((ClickEvent) -> Unit)

```cangjie
public func onClick(event: (ClickEvent) -> Unit): This
```

**功能：** 组件被点击时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|([ClickEvent](#class-clickevent))->Unit|是|-|回调函数，组件被点击时触发该回调。|


## class ClickEvent

```cangjie
public class ClickEvent {
    public var x: Float64
    public var y: Float64
    public var timestamp: Int64
    public var source: SourceType
    public var target: EventTarget
    public var windowX: Float64
    public var windowY: Float64
    public var displayX: Float64
    public var displayY: Float64
}
```

**功能：** 描述点击事件的类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var displayX

```cangjie
public var displayX: Float64
```

**功能：** 标记点击点在屏幕左上角的横向绝对坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var displayY

```cangjie
public var displayY: Float64
```

**功能：** 标记点击点在屏幕左上角的纵向绝对坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var source

```cangjie
public var source: SourceType
```

**功能：** 标识触发点击的设备类型。

**类型：** [SourceType](cj-common-types.md#enum-sourcetype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var target

```cangjie
public var target: EventTarget
```

**功能：** 触发事件的元素对象显示区域。

**类型：** [EventTarget](#class-eventtarget)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var timestamp

```cangjie
public var timestamp: Int64
```

**功能：** 记录事件发生与系统启动之间的时间间隔。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var windowX

```cangjie
public var windowX: Float64
```

**功能：** 定位点击点在应用窗口左上角的横向坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var windowY

```cangjie
public var windowY: Float64
```

**功能：** 定位点击点在应用窗口左上角的纵向坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var x

```cangjie
public var x: Float64
```

**功能：** 记录点击点在元素内部的横向位置坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var y

```cangjie
public var y: Float64
```

**功能：** 记录点击点在元素内部的纵向位置坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## class EventTarget

```cangjie
public class EventTarget {
    public var area: Area
    public init(area: Area)
}
```

**功能：** 事件目标对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var area

```cangjie
public var area: Area
```

**功能：** 事件目标区域。

**类型：** [Area](./cj-common-types.md#class-area)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Area)

```cangjie
public init(area: Area)
```

**功能：** 构造一个EventTarget对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|area|[Area](./cj-common-types.md#class-area)|是|-|事件目标区域。|

