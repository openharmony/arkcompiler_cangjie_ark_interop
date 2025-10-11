# 拖拽事件

拖拽事件指组件被长按后拖拽时触发的事件。

> **说明：**
>
> 应用本身预置的资源文件（即应用在安装前的HAP包中已经存在的资源文件）仅支持本地应用内拖拽。

ArkUI框架对以下组件实现了默认的拖拽能力，支持对数据的拖出或拖入响应。开发者也可以通过实现通用拖拽事件来自定义拖拽响应。

- 默认支持拖出能力的组件（可从组件上拖出数据）：[Search](./cj-text-input-search.md)、[TextInput](./cj-text-input-textinput.md)、[TextArea](./cj-text-input-textarea.md)、[RichEditor](./cj-text-input-richeditor.md)、[Text](./cj-text-input-text.md)、[Image](./cj-image-video-image.md)，开发者可通过设置这些组件的draggable属性来控制对默认拖拽能力的使用。

- 默认支持拖入能力的组件（目标组件可响应拖入数据）：[Search](./cj-text-input-search.md)、[TextInput](./cj-text-input-textinput.md)、[TextArea](./cj-text-input-textarea.md)、[RichEditor](./cj-text-input-richeditor.md)，开发者可通过设置这些组件的allowDrop属性为null来禁用对默认拖入能力的支持。

<!--RP1--><!--RP1End-->其他组件需要开发者将draggable属性设置为true，并在onDragStart等接口中实现数据传输相关内容，才能正确处理拖拽。

> **说明：**
>
> Text组件需配合[copyOption](./cj-text-input-search.md#func-copyoptioncopyoptions)一起使用，设置copyOptions为CopyOptions.InApp或者CopyOptions.LocalDevice。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## class DragInfo

```cangjie
public class DragInfo {
    public var extraParams: String
    public var touchPoint: Position
}
```

**功能：** 拖拽动作参数配置类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var extraParams

```cangjie
public var extraParams: String
```

**功能：** 存储拖拽事件额外信息。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var touchPoint

```cangjie
public var touchPoint: Position
```

**功能：** 存储拖拽点坐标信息。

**类型：** [Position](./cj-common-types.md#class-position)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## class DragItemInfo

```cangjie
public class DragItemInfo {
    public var pixelMap: PixelMap = PixelMap(0)
    public var builder: CustomBuilder = { => }
    public var extraInfo: String
    public init(pixelMap: PixelMap, builder: CustomBuilder, extraInfo: String)
}
```

**功能：** 拖拽过程中显示的组件信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var builder

```cangjie
public var builder: CustomBuilder = { => }
```

**功能：** 使用自定义的生成器进行绘图，如果设置了pixelMap，则该值无效。

**类型：** [CustomBuilder](./cj-common-types.md#type-custombuilder)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var extraInfo

```cangjie
public var extraInfo: String
```

**功能：** 配置拖拽项的描述。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var pixelMap

```cangjie
public var pixelMap: PixelMap = PixelMap(0)
```

**功能：** 设置拖拽过程中显示的图片。

**类型：** [PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(PixelMap, CustomBuilder, String)

```cangjie
public init(pixelMap: PixelMap, builder: CustomBuilder, extraInfo: String)
```

**功能：** 创建一个DragItemInfo类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|pixelMap|[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)|是|-|设置拖拽过程中显示的图片。|
|builder|[CustomBuilder](./cj-common-types.md#type-custombuilder)|是|-|使用自定义生成器进行绘图，如果设置了pixelMap，则忽略此值。|
|extraInfo|String|是|-|拖拽项的描述。|

## func onDragEnter((DragInfo) -> Unit)

```cangjie
public func onDragEnter(event: (DragInfo) -> Unit): This
```

**功能：** 拖拽进入组件范围内时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|([DragInfo](#class-draginfo))->Unit|是|-|拖拽进入组件范围回调函数。|

## func onDragLeave((DragInfo) -> Unit)

```cangjie
public func onDragLeave(event: (DragInfo) -> Unit): This
```

**功能：** 拖拽离开组件范围内时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|([DragInfo](#class-draginfo))->Unit|是|-|拖拽离开组件范围时触发的回调函数。|

## func onDragMove((DragInfo) -> Unit)

```cangjie
public func onDragMove(event: (DragInfo) -> Unit): This
```

**功能：** 拖拽在组件范围内移动时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|([DragInfo](#class-draginfo))->Unit|是|-|回调函数，拖拽进入组件范围移动时触发。|

## func onDragStart((DragInfo) -> DragItemInfo)

```cangjie
public func onDragStart(event: (DragInfo) -> DragItemInfo): This
```

**功能：** 第一次拖拽此事件绑定的组件时，长按时间 >= 500ms，然后手指移动距离 >= 10vp，触发回调。

针对默认支持拖出能力的组件，如果开发者设置了onDragStart，优先执行开发者的onDragStart，并根据执行情况决定是否使用系统默认的拖出能力，具体为：

- 如果开发者返回了自定义背板图，则不再使用系统默认的拖拽背板图。
- 如果开发者设置了拖拽数据，则不再使用系统默认填充的拖拽数据。

文本类组件[Search](./cj-text-input-search.md)、[TextInput](./cj-text-input-textinput.md)、[TextArea](./cj-text-input-textarea.md)、[RichEditor](./cj-text-input-richeditor.md)对选中的文本内容进行拖拽时，不支持背板图的自定义。当onDragStart与菜单预览一起使用或使用了默认支持拖出能力的组件时，预览及菜单项上的自定义内容不支持拖拽。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|([DragInfo](#class-draginfo))->[DragItemInfo](#class-dragiteminfo)|是|-|回调函数，拖拽开始时触发。传入参数为拖拽事件信息，包括拖拽点坐标。返回参数为拖拽过程中显示的组件信息。|

## func onDragStart((DragInfo) -> CustomBuilder)

```cangjie
public func onDragStart(event: (DragInfo) -> CustomBuilder): This
```

**功能：** 重载拖拽事件，第一次拖拽此事件绑定的组件时，长按时间 >= 500ms，然后手指移动距离 >= 10vp，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|([DragInfo](#class-draginfo))->[CustomBuilder](./cj-common-types.md#type-custombuilder)|是|-|回调函数，拖拽开始时触发。传入参数为拖拽事件信息，包括拖拽点坐标。返回参数为拖拽过程中显示的组件信息，使用时结合@Builder和bind方法使用。|

## func onDragStart((DragInfo) -> Unit)

```cangjie
public func onDragStart(event: (DragInfo) -> Unit): This
```

**功能：** 重载拖拽事件，第一次拖拽此事件绑定的组件时，长按时间 >= 500ms，然后手指移动距离 >= 10vp，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|([DragInfo](#class-draginfo))->Unit|是|-|回调函数，拖拽开始时触发。传入参数为拖拽事件信息，包括拖拽点坐标。返回参数为拖拽过程中显示的组件信息。|

## func onDrop((DragInfo) -> Unit)

```cangjie
public func onDrop(event: (DragInfo) -> Unit): This
```

**功能：** 绑定此事件的组件可作为拖拽释放目标，当在本组件范围内停止拖拽行为时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|([DragInfo](#class-draginfo))->Unit|是|-|回调函数，本组件范围内停止拖拽行为时触发。传入参数为拖拽事件信息，包括拖拽点坐标。|
