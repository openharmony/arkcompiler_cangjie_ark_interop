# 拖拽控制

设置组件是否可以响应拖拽事件。

> **说明：**
>
> ArkUI框架对以下组件实现了默认的拖拽能力，支持对数据的拖出或拖入响应。开发者也可以通过实现通用拖拽事件来自定义拖拽响应。
>
> - 默认支持拖出能力的组件（可从组件上拖出数据）：[Search](./cj-text-input-search.md)、[TextInput](./cj-text-input-textinput.md)、[TextArea](./cj-text-input-textarea.md)、[RichEditor](./cj-text-input-richeditor.md)、[Text](./cj-text-input-text.md)、[Image](./cj-image-video-image.md)，开发者可通过设置这些组件的draggable属性来控制对默认拖拽能力的使用。
>
> - 默认支持拖入能力的组件（目标组件可响应拖入数据）：[Search](./cj-text-input-search.md)、[TextInput](./cj-text-input-textinput.md)、[TextArea](./cj-text-input-textarea.md)、[RichEditor](./cj-text-input-richeditor.md)。
>
> <!--RP1--><!--RP1End-->其他组件需要开发者将draggable属性设置为true，并在onDragStart等接口中实现数据传输相关内容，才能正确处理拖拽。
>
> Text组件需配合[copyOption](./cj-text-input-text.md#func-copyoptioncopyoptions)一起使用，设置copyOptions为CopyOptions.InApp或者CopyOptions.LocalDevice。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func dragPreview(String)

```cangjie
public func dragPreview(value: String): This
```

**功能：** 设置拖拽预览。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|组件ID。|

