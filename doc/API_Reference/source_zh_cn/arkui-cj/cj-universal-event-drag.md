# 拖拽事件

拖拽事件指组件被长按后拖拽时触发的事件。

> **说明：**
>
> 应用本身预置的资源文件（即应用在安装前的HAP包中已经存在的资源文件）仅支持本地应用内拖拽。

开发者可以通过实现通用拖拽事件来自定义拖拽响应。

<!--RP1--><!--RP1End-->需要开发者将draggable属性设置为true，并在onDragStart等接口中实现数据传输相关内容，才能正确处理拖拽。

## func onDragStart((DragInfo) -> DragItemInfo)

```cangjie
public func onDragStart(callback: (DragInfo)-> DragItemInfo): This
```

**功能：** 第一次拖拽此事件绑定的组件时，长按时间 >= 500ms，然后手指移动距离 >= 10vp，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**事件优先级：** 长按触发时间 < 500ms，长按事件优先拖拽事件响应，长按触发时间 >= 500ms，拖拽事件优先长按事件响应。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragInfo](#class-draginfo))->[DragItemInfo](#struct-dragiteminfo)|是|-|回调函数，拖拽开始时触发。<br/>传入参数为拖拽事件信息，包括拖拽点坐标。<br/>返回参数为拖拽过程中显示的组件信息。|

## func onDragStart((DragInfo) -> (() -> Unit))

```cangjie
public func onDragStart(callback: (DragInfo)-> (() -> Unit)): This
```

**功能：** 重载拖拽事件，第一次拖拽此事件绑定的组件时，长按时间 >= 500ms，然后手指移动距离 >= 10vp，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragInfo](#class-draginfo))|是|-|回调函数，拖拽开始时触发。<br/>传入参数为拖拽事件信息，包括拖拽点坐标。<br/>返回参数为拖拽过程中显示的组件信息，使用时结合@Builder和bind方法使用。|

## func onDragStart((DragInfo) -> Unit)

```cangjie
public func onDragStart(callback: (DragInfo)-> Unit): This
```

**功能：** 重载拖拽事件，第一次拖拽此事件绑定的组件时，长按时间 >= 500ms，然后手指移动距离 >= 10vp，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragInfo](#class-draginfo))->Unit|是|-|回调函数，拖拽开始时触发。<br/>传入参数为拖拽事件信息，包括拖拽点坐标。<br/>返回参数为拖拽过程中显示的组件信息。|

## func onDragStart((DragEvent,?String) -> DragItemInfo)

```cangjie
public func onDragStart(callback: (DragEvent, ?String)->DragItemInfo): This
```

**功能：** 重载拖拽事件，第一次拖拽此事件绑定的组件时，长按时间 >= 500ms，然后手指移动距离 >= 10vp，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragEvent](#class-dragevent),?String)->[DragItemInfo](#struct-dragiteminfo)|是|-|回调函数。<br/>第一个参数为拖拽事件信息，包括拖拽点坐标。<br/> 第二个参数为拖拽事件额外信息，需要解析为Json格式，参考[extraParams说明](#extraparams说明)。<br/>返回参数为拖拽过程中显示的组件信息。|

## func onDragStart((DragEvent,?String) -> (() -> Unit))

```cangjie
public func onDragStart(callback: (DragEvent, ?String)->(()->Unit)): This
```

**功能：** 重载拖拽事件，第一次拖拽此事件绑定的组件时，长按时间 >= 500ms，然后手指移动距离 >= 10vp，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragEvent](#class-dragevent),?String)->(()->Unit)|是|-|回调函数。<br/>第一个参数为拖拽事件信息，包括拖拽点坐标。<br/> 第二个参数为拖拽事件额外信息，需要解析为Json格式，参考[extraParams说明](#extraparams说明)。|

## func onDragStart((DragEvent,?String) -> Unit)

```cangjie
public func onDragStart(callback: (DragEvent, ?String)->Unit): This
```

**功能：** 重载拖拽事件，第一次拖拽此事件绑定的组件时，长按时间 >= 500ms，然后手指移动距离 >= 10vp，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragEvent](#class-dragevent),?String)->Unit|是|-|回调函数。<br/>第一个参数为拖拽事件信息，包括拖拽点坐标。<br/> 第二个参数为拖拽事件额外信息，需要解析为Json格式，参考[extraParams说明](#extraparams说明)。|

## func onDragEnter((DragInfo) -> Unit)

```cangjie
public func onDragEnter(callback: (DragInfo)->Unit): This
```

**功能：** 拖拽进入组件范围内时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

> **说明：**
>
> 当监听了onDrop事件时，此事件才有效。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragInfo](#class-draginfo))->Unit|是|-|拖拽进入组件范围回调函数。|

## func onDragEnter((DragEvent,?String) -> Unit)

```cangjie
public func onDragEnter(callback: (DragEvent, ?String)->Unit): This
```

**功能：** 拖拽进入组件范围内时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragEvent](#class-dragevent),?String)->Unit|是|-| 回调函数。<br/>第一个参数为拖拽事件信息，包括拖拽点坐标。<br/> 第二个参数为拖拽事件额外信息，需要解析为Json格式，参考[extraParams说明](#extraparams说明)。|

## func onDragMove((DragEvent,?String) -> Unit)

```cangjie
public func onDragMove(callback: (DragEvent, ?String)->Unit): This
```

**功能：** 拖拽在组件范围内移动时，触发回调，当监听了onDrop事件时，此事件才有效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragEvent](#class-dragevent),?String)->Unit|是|-|回调函数，拖拽进入组件范围移动时触发。<br/>第一个参数为拖拽事件信息，包括拖拽点坐标。<br/> 第二个参数为拖拽事件额外信息，需要解析为Json格式，参考[extraParams说明](#extraparams说明)。|

## func onDragMove((DragInfo) -> Unit)

```cangjie
public func onDragMove(callback: (DragInfo)->Unit): This
```

**功能：** 拖拽在组件范围内移动时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

> **说明：**
>
> 当监听了onDrop事件时，此事件才有效。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragInfo](#class-draginfo))->Unit|是|-|回调函数，拖拽进入组件范围移动时触发。|

## func onDragLeave((DragEvent,?String) -> Unit)

```cangjie
public func onDragLeave(callback: (DragEvent, ?String)->Unit): This
```

**功能：** 拖拽离开组件范围内时，触发回调，当监听了onDrop事件时，此事件才有效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragEvent](#class-dragevent),?String)->Unit|是|-|回调函数，拖拽进入组件范围移动时触发。<br/>第一个参数为拖拽事件信息，包括拖拽点坐标。<br/> 第二个参数为拖拽事件额外信息，需要解析为Json格式，参考[extraParams说明](#extraparams说明)。|

## func onDragLeave((DragInfo) -> Unit)

```cangjie
public func onDragLeave(callback: (DragInfo)->Unit): This
```

**功能：** 拖拽离开组件范围内时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

> **说明：**
>
> 当监听了onDrop事件时，此事件才有效。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragInfo](#class-draginfo))->Unit|是|-|回调函数，拖拽离开组件范围时触发。<br/>传入参数为拖拽事件信息，包括拖拽点坐标。|

## func onDrop((DragEvent,?String) -> Unit)

```cangjie
public func onDrop(callback: (DragEvent, ?String)->Unit): This
```

**功能：** 绑定此事件的组件可作为拖拽释放目标，当在本组件范围内停止拖拽行为时，触发回调。如果开发者没有在onDrop中主动调用event.setResult()设置拖拽接收的结果，若拖拽组件为系统支持默认拖入的组件，以系统实际处理数据结果为准，其它组件则系统按照数据接收成功处理。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragEvent](#class-dragevent),?String)->Unit|是|-|回调函数，本组件范围内停止拖拽行为时触发。<br/>第一个参数为拖拽事件信息，包括拖拽点坐标。<br/> 第二个参数为拖拽事件额外信息，需要解析为Json格式，参考[extraParams说明](#extraparams说明)。|

## func onDrop((DragInfo) -> Unit)

```cangjie
public func onDrop(callback: (DragInfo)->Unit): This
```

**功能：** 绑定此事件的组件可作为拖拽释放目标，当在本组件范围内停止拖拽行为时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragInfo](#class-draginfo))->Unit|是|-|回调函数，本组件范围内停止拖拽行为时触发。<br/>传入参数为拖拽事件信息，包括拖拽点坐标。|

## func onDragEnd((DragEvent,?String) -> Unit)

```cangjie
public func onDragEnd(callback: (DragEvent, ?String)->Unit): This
```

**功能：** 绑定此事件的组件触发的拖拽结束后，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DragEvent](#class-dragevent),?String)->Unit|是|-|回调函数，拖拽结束后触发。<br/>第一个参数为拖拽事件信息，包括拖拽点坐标。<br/> 第二个参数为拖拽事件额外信息，需要解析为Json格式，参考[extraParams说明](#extraparams说明)。|

## func onPreDrag((PreDragStatus) -> Unit)

```cangjie
public func onPreDrag(callback: (PreDragStatus)->Unit): This
```

**功能：** 绑定此事件的组件，当触发拖拽发起前的不同阶段时，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([PreDragStatus](#enum-predragstatus))->Unit|是|-|回调函数，拖拽发起前触发。|

## extraParams说明

用于返回组件在拖拽中需要用到的额外信息。

extraParams是Json对象转换的String字符串。通过Json库转换后可以获取如下属性。

| 参数名      | 参数类型       | 描述              |
|:---------|:-----------|:----------------|
| selectedIndex | Int64 | 当拖拽事件设在父容器的子元素时，selectedIndex表示当前被拖拽子元素是父容器第selectedIndex个子元素，selectedIndex从0开始。<br/>仅在ListItem组件的拖拽事件中生效。|
| insertIndex | Int64 | 当前拖拽元素在List组件中放下时，insertIndex表示被拖拽元素插入该组件的第insertIndex个位置，insertIndex从0开始。<br/>仅在List组件的拖拽事件中生效。|

## 基础类型定义

### class DragEvent

```cangjie
public class DragEvent {
    public let useCustomDropAnimation: Bool
    public let dragBehavior: DragBehavior
}
```

**功能：** 拖拽事件类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### let dragBehavior

```cangjie
public let dragBehavior: DragBehavior
```

**功能：** 切换复制和剪贴模式的角标显示状态。

**类型：** [DragBehavior](#enum-dragbehavior)

**读写能力：** 只读

**起始版本：** 19

#### let useCustomDropAnimation

```cangjie
public let useCustomDropAnimation: Bool
```

**功能：** 当拖拽结束时，是否使能并使用系统默认落位动效。<br/>应用可将该值设定为true来禁用系统默认落位动效，并实现自己的自定义落位动效。<br/>当不配置或设置为false时，系统默认落位动效生效，当松手位置的控件可接收拖拽的数据时，落位为缩小消失动效，若不可接收数据，则为放大消失动效。<br/>当未禁用系统默认落位动效情况下，应用不应再实现自定义动效，以避免动效上的冲突。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 19

#### func getDisplayX()

```cangjie
public func getDisplayX(): Float64
```

**功能：** 当前拖拽点相对于屏幕左上角的x轴坐标，单位为vp。

**返回值：**

|类型|说明|
|:----|:----|
|Float64|x轴坐标值。|

#### func getDisplayY()

```cangjie
public func getDisplayY(): Float64
```

**功能：** 当前拖拽点相对于屏幕左上角的y轴坐标，单位为vp。

**返回值：**

|类型|说明|
|:----|:----|
|Float64|y轴坐标值。|

#### func getModifierKeyState(Array\<String>)

```cangjie
public func getModifierKeyState(keys: Array<String>): Bool
```

**功能：** 获取功能键按压状态。报错信息请参考以下错误码。支持功能键 "Ctrl"|"Alt"|"Shift"|"Fn"，设备外接带Fn键的键盘不支持Fn键查询。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|keys|Array\<String>|是|-|功能键字符串数组。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|按压状态。|

#### func getPreviewRect()

```cangjie
public func getPreviewRect(): Rectangle
```

**功能：** 获取拖拽跟手图相对于当前窗口的位置，以及跟手图尺寸信息，单位VP，其中x和y代表跟手图左上角的窗口坐标，width和height代表跟手图的尺寸。

**返回值：**

|类型|说明|
|:----|:----|
|[Rectangle](./cj-common-types.md#class-rectangle)|拖拽跟手图位置信息。|

#### func getResult()

```cangjie
public func getResult(): DragResult
```

**功能：** 从DragEvent中获取拖拽结果。

**返回值：**

|类型|说明|
|:----|:----|
|[DragResult](#enum-dragresult)|拖拽结果。|

#### func getVelocity()

```cangjie
public func getVelocity(): Float64
```

**功能：** 获取当前拖拽的主方向拖动速度。为xy轴方向速度的平方和的算术平方根。

**返回值：**

|类型|说明|
|:----|:----|
|Float64|主方向拖动速度。|

#### func getVelocityX()

```cangjie
public func getVelocityX(): Float64
```

**功能：** 获取当前拖拽的x轴方向拖动速度。坐标轴原点为屏幕左上角，单位为vp，分正负方向速度，从左往右为正，反之为负。

**返回值：**

|类型|说明|
|:----|:----|
|Float64|x轴方向拖动速度。|

#### func getVelocityY()

```cangjie
public func getVelocityY(): Float64
```

**功能：** 获取当前拖拽的y轴方向拖动速度。坐标轴原点为屏幕左上角，单位为vp，分正负方向速度，从上往下为正，反之为负。

**返回值：**

|类型|说明|
|:----|:----|
|Float64|y轴方向拖动速度。|

#### func getWindowX()

```cangjie
public func getWindowX(): Float64
```

**功能：** 当前拖拽点相对于窗口左上角的x轴坐标，单位为vp。

**返回值：**

|类型|说明|
|:----|:----|
|Float64|x轴坐标值。|

#### func getWindowY()

```cangjie
public func getWindowY(): Float64
```

**功能：** 当前拖拽点相对于窗口左上角的y轴坐标，单位为vp。

**返回值：**

|类型|说明|
|:----|:----|
|Float64|y轴坐标值。|

#### func setResult(DragResult)

```cangjie
public func setResult(dragRect: DragResult): Unit
```

**功能：** 向DragEvent中设置拖拽结果。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dragRect|[DragResult](#enum-dragresult)|是|-|拖拽结果。|

### class DragInfo

```cangjie
public class DragInfo {
    public DragInfo(
        public var extraParams: String,
        public var dragEvent: Position
    )
}
```

**功能：** 拖拽动作参数配置类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### var dragEvent

```cangjie
public var dragEvent: Position
```

**功能：** 存储拖拽点坐标信息。

**类型：** [Position](./cj-common-types.md#class-position)

**读写能力：** 可读写

**起始版本：** 12

#### var extraParams

```cangjie
public var extraParams: String
```

**功能：** 存储拖拽事件额外信息。

**类型：** String

**读写能力：** 可读写

**起始版本：** 12

#### DragInfo(String, Position)

```cangjie
public DragInfo(
    public var extraParams: String,
    public var dragEvent: Position
)
```

**功能：** 创建一个DragInfo类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|extraParams|String|是|-|拖拽事件额外信息。|
|dragEvent|[Position](./cj-common-types.md#class-position)|是|-| 拖拽事件信息，包括拖拽点坐标。|

> **说明：**
>
> - extraParams为拖拽事件额外信息，由拖拽组件设置。
> - extraParams的内容是Json转换的String字符串。
> - 当拖拽事件设在父容器的子元素时，selectedIndex表示当前被拖拽子元素是父容器第selectedIndex个子元素，selectedIndex从0开始。
> - 当前拖拽元素在List组件中放下时，insertIndex表示被拖拽元素插入该组件的第insertIndex个位置，insertIndex从0开始。

### struct DragItemInfo

```cangjie
public struct DragItemInfo {
    public DragItemInfo(
        public var pixelMap!: Option<PixelMap> = Option.None ,
        public var builder!: Option<() -> Unit> = Option.None,
        public var extraInfo!: String = ""
    )
}
```

**功能：** 拖拽过程中显示的组件信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

#### var builder

```cangjie
public var builder: Option <() -> Unit> = Option.None
```

**功能：** 使用自定义的生成器进行绘图，如果设置了pixelMap，则该值无效。

**类型：** Option\<()->Unit>

**读写能力：** 可读写

**起始版本：** 12

#### var extraInfo

```cangjie
public var extraInfo: String = ""
```

**功能：** 配置拖拽项的描述。

**类型：** String

**读写能力：** 可读写

**起始版本：** 12

#### var pixelMap

```cangjie
public var pixelMap: Option<PixelMap>= Option.None
```

**功能：** 设置拖拽过程中显示的图片。

**类型：** Option\<[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)>

**读写能力：** 可读写

**起始版本：** 12

#### DragItemInfo(Option\<PixelMap>, Option\<() -> Unit>, String)

```cangjie
public DragItemInfo(
    public var pixelMap!: Option<PixelMap> = Option.None ,
    public var builder!: Option<() -> Unit> = Option.None,
    public var extraInfo!: String = ""
)
```

**功能：** 创建一个DragItemInfo类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|pixelMap|Option\<[PixelMap](../apis/ImageKit/cj-apis-image.md#class-pixelmap)>|否|Option.None| **命名参数。** 设置拖拽过程中显示的图片。|
|builder|Option\<()->Unit>|否|Option.None| **命名参数。** 使用自定义生成器进行绘图，如果设置了pixelMap，则忽略此值。|
|extraInfo|String|否|""| **命名参数。** 拖拽项的描述。|

### enum DragBehavior

```cangjie
public enum DragBehavior {
    | COPY
    | MOVE
    | UNKNOWN
}
```

**功能：** 当设置[DragResult](#enum-dragresult)为DROP_ENABLED后，可设置DragBehavior为复制（copy）或剪切（move）。DragBehavior用来向开发者描述数据的处理方式是复制（copy）还是剪切（move），但无法最终决定对数据的实际处理方式。DragBehavior会通过onDragEnd带回给数据拖出方，发起拖拽的一方可通过DragBehavior来区分做出的是复制还是剪切数据的不同行为。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### COPY

```cangjie
COPY
```

**功能：** 指定对数据的处理方式为复制。

**起始版本：** 19

#### MOVE

```cangjie
MOVE
```

**功能：** 指定对数据的处理方式为剪切。

**起始版本：** 19

#### UNKNOWN

```cangjie
UNKNOWN
```

**功能：** 未知行为，可用于错误处理。

**起始版本：** 19

### enum DragResult

```cangjie
public enum DragResult {
    | DRAG_SUCCESSFUL
    | DRAG_FAILED
    | DRAG_CANCELED
    | DROP_ENABLED
    | DROP_DISABLED
    | DRAG_DEFAULT
}
```

**功能：** 拖拽结果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### DRAG_CANCELED

```cangjie
DRAG_CANCELED
```

**功能：** 拖拽取消，在onDrop中使用。

**起始版本：** 19

#### DRAG_DEFAULT

```cangjie
DRAG_DEFAULT
```

**功能：** 默认拖拽结果。

**起始版本：** 19

#### DRAG_FAILED

```cangjie
DRAG_FAILED
```

**功能：** 拖拽失败，在onDrop中使用。

**起始版本：** 19

#### DRAG_SUCCESSFUL

```cangjie
DRAG_SUCCESSFUL
```

**功能：** 拖拽成功，在onDrop中使用。

**起始版本：** 19

#### DROP_DISABLED

```cangjie
DROP_DISABLED
```

**功能：** 组件不允许落入，在onDragMove中使用。

**起始版本：** 19

#### DROP_ENABLED

```cangjie
DROP_ENABLED
```

**功能：** 组件允许落入，在onDragMove中使用。

**起始版本：** 19

### enum PreDragStatus

```cangjie
public enum PreDragStatus {
    | ACTION_DETECTING_STATUS
    | READY_TO_TRIGGER_DRAG_ACTION
    | PREVIEW_LIFT_STARTED
    | PREVIEW_LIFT_FINISHED
    | PREVIEW_LANDING_STARTED
    | PREVIEW_LANDING_FINISHED
    | ACTION_CANCELED_BEFORE_DRAG
}
```

**功能：** 拖拽启动状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### ACTION_CANCELED_BEFORE_DRAG

```cangjie
ACTION_CANCELED_BEFORE_DRAG
```

**功能：** 拖拽浮起落位动效中断。(已满足READY_TO_TRIGGER_DRAG_ACTION状态后，未达到动效阶段，手指抬手时触发)。

**起始版本：** 19

#### ACTION_DETECTING_STATUS

```cangjie
ACTION_DETECTING_STATUS
```

**功能：** 拖拽手势启动阶段。(按下50ms时触发)。

**起始版本：** 19

#### PREVIEW_LANDING_FINISHED

```cangjie
PREVIEW_LANDING_FINISHED
```

**功能：** 拖拽落回动效结束阶段。(落回动效结束时触发)。

**起始版本：** 19

#### PREVIEW_LANDING_STARTED

```cangjie
PREVIEW_LANDING_STARTED
```

**功能：** 拖拽落回动效发起阶段。(落回动效发起时触发)。

**起始版本：** 19

#### PREVIEW_LIFT_FINISHED

```cangjie
PREVIEW_LIFT_FINISHED
```

**功能：** 拖拽浮起动效结束阶段。(浮起动效完全结束时触发)。

**起始版本：** 19

#### PREVIEW_LIFT_STARTED

```cangjie
PREVIEW_LIFT_STARTED
```

**功能：** 拖拽浮起动效发起阶段。(按下800ms时触发)。

**起始版本：** 19

#### READY_TO_TRIGGER_DRAG_ACTION

```cangjie
READY_TO_TRIGGER_DRAG_ACTION
```

**功能：** 拖拽准备完成，可发起拖拽阶段。(按下500ms时触发)。

**起始版本：** 19
