# 触摸事件

当手指在组件上按下、滑动、抬起时触发。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func stopPropagation()

```cangjie
public func stopPropagation(): Unit
```

**功能：** 阻止事件继续传播。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## 权限列表

无

## func onTouch((TouchEvent) -> Unit)

```cangjie
public func onTouch(event: (TouchEvent) -> Unit): This
```

**功能：** 手指触摸动作触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|([TouchEvent](#class-touchevent))->Unit|是|-|回调函数，手指触摸动作触发该回调。|

## 基础类型定义

### class TouchEvent

```cangjie
public class TouchEvent {
    public var eventType: TouchType
    public var touches: Array<TouchObject>
    public var changedTouches: Array<TouchObject>
    public var timestamp: Int64
    public var target: EventTarget
    public var source: SourceType
}
```

**功能：** 非事件注入场景下，changedTouches是按屏幕显示刷新率重采样的点，touches是按器件刷新率报上来的点，changedTouches的数据可能会和touches里面的不相同。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var changedTouches

```cangjie
public var changedTouches: Array<TouchObject>
```

**功能：** 当前发生变化的手指信息。

**类型：** Array\<[TouchObject](#class-touchobject)>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var eventType

```cangjie
public var eventType: TouchType
```

**功能：** 触摸事件的类型。

**类型：** [TouchType](cj-common-types.md#enum-touchtype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var source

```cangjie
public var source: SourceType
```

**功能：** 事件输入设备。

**类型：** [SourceType](cj-common-types.md#enum-sourcetype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var target

```cangjie
public var target: EventTarget
```

**功能：** 被触摸元素对象。

**类型：** [EventTarget](cj-universal-event-click.md#class-eventtarget)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var timestamp

```cangjie
public var timestamp: Int64
```

**功能：** 距离开机时间的时间戳，单位为毫秒。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var touches

```cangjie
public var touches: Array<TouchObject>
```

**功能：** 全部手指信息。

**类型：** Array\<[TouchObject](#class-touchobject)>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### class TouchObject

```cangjie
public class TouchObject {
    public var touchType: TouchType
    public var id: Int32
    public var screenX: Float64
    public var screenY: Float64
    public var x: Float64
    public var y: Float64
    public init(touchType: TouchType, id: Int32, screenX: Float64, screenY: Float64, x: Float64, y: Float64)
}
```

**功能：** 表示当前发生变化的手指信息类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var id

```cangjie
public var id: Int32
```

**功能：** 手指唯一标识符。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var screenX

```cangjie
public var screenX: Float64
```

**功能：** 触摸点相对于设备屏幕左边沿的X坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var screenY

```cangjie
public var screenY: Float64
```

**功能：** 触摸点相对于设备屏幕上边沿的Y坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var touchType

```cangjie
public var touchType: TouchType
```

**功能：** 触摸事件的类型。

**类型：** [TouchType](cj-common-types.md#enum-touchtype)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var x

```cangjie
public var x: Float64
```

**功能：** 触摸点相对于被触摸元素左边沿的X坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var y

```cangjie
public var y: Float64
```

**功能：** 触摸点相对于被触摸元素上边沿的Y坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(TouchType, Int32, Float64, Float64, Float64, Float64)

```cangjie
public init(touchType: TouchType, id: Int32, screenX: Float64, screenY: Float64, x: Float64, y: Float64)
```

**功能：** 构造触摸事件类型对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|touchType|[TouchType](cj-common-types.md#enum-touchtype)|是|-|触摸事件的类型。|
|id|Int32|是|-|手指唯一标识符。|
|screenX|Float64|是|-|触摸点相对于设备屏幕左边沿的X坐标。|
|screenY|Float64|是|-|触摸点相对于设备屏幕上边沿的Y坐标。|
|x|Float64|是|-|触摸点相对于被触摸元素左边沿的X坐标。|
|y|Float64|是|-|触摸点相对于被触摸元素上边沿的Y坐标。|
