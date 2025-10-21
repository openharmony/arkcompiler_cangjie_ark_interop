# 拖拽事件

拖拽事件指组件被长按后拖拽时触发的事件。

> **说明：**
>
> 应用本身预置的资源文件（即应用在安装前的HAP包中已经存在的资源文件）仅支持本地应用内拖拽。

ArkUI框架对以下组件实现了默认的拖拽能力，支持对数据的拖出或拖入响应。开发者也可以通过实现通用拖拽事件来自定义拖拽响应。

- 默认支持拖出能力的组件（可从组件上拖出数据）：[Search](./cj-text-input-search.md)、[TextInput](./cj-text-input-textinput.md)、[TextArea](./cj-text-input-textarea.md)、[RichEditor](./cj-text-input-richeditor.md)、[Text](./cj-text-input-text.md)、[Image](./cj-image-video-image.md)、[Hyperlink](./cj-text-input-hyperlink.md)，开发者可通过设置这些组件的draggable属性来控制对默认拖拽能力的使用。

- 默认支持拖入能力的组件（目标组件可响应拖入数据）：[Search](./cj-text-input-search.md)、[TextInput](./cj-text-input-textinput.md)、[TextArea](./cj-text-input-textarea.md)、[RichEditor](./cj-text-input-richeditor.md)，开发者可通过设置这些组件的allowDrop属性为null来禁用对默认拖入能力的支持。

其他组件需要开发者将draggable属性设置为true，并在onDragStart等接口中实现数据传输相关内容，才能正确处理拖拽。

> **说明：**
>
> Text组件需配合[copyOption](./cj-text-input-text.md#func-copyoptioncopyoptions)一起使用，设置copyOptions为CopyOptions.InApp或者CopyOptions.LocalDevice。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func onDragStart(?(DragInfo) -> DragItemInfo)

```cangjie
func onDragStart(event: ?(DragInfo) -> DragItemInfo): T
```

**功能：** 第一次拖拽此事件绑定的组件时，长按时间 >= 500ms，然后手指移动距离 >= 10vp，触发回调。

针对默认支持拖出能力的组件，如果开发者设置了onDragStart，优先执行开发者的onDragStart，并根据执行情况决定是否使用系统默认的拖出能力，具体为：

- 如果开发者返回了自定义背板图，则不再使用系统默认的拖拽背板图。
- 如果开发者设置了拖拽数据，则不再使用系统默认填充的拖拽数据。

文本类组件[Search](./cj-text-input-search.md)、[TextInput](./cj-text-input-textinput.md)、[TextArea](./cj-text-input-textarea.md)、[RichEditor](./cj-text-input-richeditor.md)对选中的文本内容进行拖拽时，不支持背板图的自定义。当onDragStart与菜单预览一起使用或使用了默认支持拖出能力的组件时，预览及菜单项上的自定义内容不支持拖拽。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**事件优先级：** 长按触发时间 < 500ms，长按事件优先拖拽事件响应，长按触发时间 >= 500ms，拖拽事件优先长按事件响应。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|?([DragInfo](./cj-common-types.md#class-draginfo)) -> [DragItemInfo](./cj-common-types.md#class-dragiteminfo)|是|-|回调函数，拖拽开始时触发。<br/>传入参数为拖拽事件信息，包括拖拽点坐标。<br/>返回参数为拖拽过程中显示的组件信息。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回通用方法接口类型|


## func onDragStart(?(DragInfo) -> CustomBuilder)

```cangjie
func onDragStart(event: ?(DragInfo) -> CustomBuilder): T
```

**功能：** 重载拖拽事件，第一次拖拽此事件绑定的组件时，长按时间 >= 500ms，然后手指移动距离 >= 10vp，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|?([DragInfo](./cj-common-types.md#class-draginfo)) -> [CustomBuilder](./cj-common-types.md#type-custombuilder)|是|-|回调函数，拖拽开始时触发。<br/>传入参数为拖拽事件信息，包括拖拽点坐标。<br/>返回参数为拖拽过程中显示的组件信息，使用时结合[@Builder](../../../Dev_Guide/arkui-cj/paradigm/cj-macro-builder.md)和bind方法使用。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回通用方法接口类型|


## func onDragStart(?(DragInfo) -> Unit)

```cangjie
func onDragStart(event: ?(DragInfo) -> Unit): T
```

**功能：** 重载拖拽事件，第一次拖拽此事件绑定的组件时，长按时间 >= 500ms，然后手指移动距离 >= 10vp，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|?([DragInfo](./cj-common-types.md#class-draginfo)) -> Unit|是|-|回调函数，拖拽开始时触发。<br/>传入参数为拖拽事件信息，包括拖拽点坐标。<br/>返回参数为拖拽过程中显示的组件信息。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回通用方法接口类型|


## func onDragEnter(?(DragInfo) -> Unit)

```cangjie
func onDragEnter(event: ?(DragInfo) -> Unit): T
```

**功能：** 拖拽进入组件范围内时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

> **说明：**
>
> 当监听了onDrop事件时，此事件才有效。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|?([DragInfo](./cj-common-types.md#class-draginfo)) -> Unit|是|-|回调函数，拖拽进入组件范围时触发。<br/>传入参数为拖拽事件信息，包括拖拽点坐标。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回通用方法接口类型|


## func onDragMove(?(DragInfo) -> Unit)

```cangjie
func onDragMove(event: ?(DragInfo) -> Unit): T
```

**功能：** 拖拽在组件范围内移动时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

> **说明：**
>
> 当监听了onDrop事件时，此事件才有效。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|?([DragInfo](./cj-common-types.md#class-draginfo)) -> Unit|是|-|回调函数，拖拽进入组件范围移动时触发。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回通用方法接口类型|


## func onDragLeave(?(DragInfo) -> Unit)

```cangjie
func onDragLeave(event: ?(DragInfo) -> Unit): T
```

**功能：** 拖拽离开组件范围内时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

> **说明：**
>
> 当监听了onDrop事件时，此事件才有效。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|?([DragInfo](./cj-common-types.md#class-draginfo)) -> Unit|是|-|回调函数，拖拽离开组件范围时触发。<br/>传入参数为拖拽事件信息，包括拖拽点坐标。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回通用方法接口类型|


## func onDrop(?(DragInfo) -> Unit)

```cangjie
func onDrop(event: ?(DragInfo) -> Unit): T
```

**功能：** 绑定此事件的组件可作为拖拽释放目标，当在本组件范围内停止拖拽行为时，触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|?([DragInfo](./cj-common-types.md#class-draginfo)) -> Unit|是|-|回调函数，本组件范围内停止拖拽行为时触发。<br/>传入参数为拖拽事件信息，包括拖拽点坐标。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回通用方法接口类型|