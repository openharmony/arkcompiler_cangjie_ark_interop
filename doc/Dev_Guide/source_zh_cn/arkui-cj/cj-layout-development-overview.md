# 布局概述

组件按照布局的要求依次排列，构成应用的页面。在声明式UI中，所有的页面都是由自定义组件构成，开发者可以根据自己的需求，选择合适的布局进行页面开发。

布局指用特定的组件或者属性来管理用户页面所放置UI组件的大小和位置。在实际的开发过程中，需要遵守以下流程保证整体的布局效果：

- 确定页面的布局结构。
- 分析页面中的元素构成。
- 选用适合的布局容器组件或属性控制页面中各个元素的位置和大小。

## 布局结构

布局通常为分层结构，一个常见的页面结构如下所示：

**图1** 常见页面结构图

![layout-overview-1](figures/layout-overview-1.png)

为实现上述效果，开发者需要在页面中声明对应的元素。其中，Page表示页面的根节点，Column/Row等元素为系统组件。针对不同的页面结构，ArkUI提供了不同的布局组件来帮助开发者实现对应布局的效果，例如Row用于实现线性布局。

## 布局元素的组成

布局相关的容器组件可形成对应的布局效果。例如，List组件可构成线性布局。

**图2** 布局元素组成图

![layout-overview-2](figures/layout-overview-2.png)

- 组件区域（蓝区方块）：组件区域表示组件的大小，[width](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-size.md#func-widthlength)、[height](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-size.md#func-heightlength)属性用于设置组件区域的大小。
- 组件内容区（黄色方块）：组件内容区大小为组件区域大小减去组件的[border](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-border.md)值，组件内容区大小会作为组件内容（或者子组件）进行大小测算时的布局测算限制。
- 组件内容（绿色方块）：组件内容本身占用的大小，比如文本内容占用的大小。组件内容和组件内容区不一定匹配，比如设置了固定的width和height，此时组件内容的大小就是设置的width和height减去padding和border值，但文本内容则是通过文本布局引擎测算后得到的大小，可能出现文本真实大小小于设置的组件内容区大小。当组件内容和组件内容区大小不一致时，[align](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-location.md#func-alignalignment)属性生效，定义组件内容在组件内容区的对齐方式，如居中对齐。
- 组件布局边界（虚线部分）：组件通过[margin](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-size.md#func-marginlength)属性设置外边距时，组件布局边界就是组件区域加上margin的大小。

## 如何选择布局

声明式UI提供了以下10种常见布局，开发者可根据实际应用场景选择合适的布局进行页面开发。

|布局|应用景|
|:---|:---|
| [线性布局](./cj-layout-development-linear.md)（Row、Column） | 如果布局内子元素超过1个时，且能够以某种方式线性排列时优先考虑此布局。 |

## 布局位置

position、offset等属性影响了布局容器相对于自身或其他组件的位置。

|定位能力|应用场景|实现方式|
|:---|:---|:---|
|绝对定位|  对于不同尺寸的设备，使用绝对定位的适应性会比较差，在屏幕的适配上有缺陷。| 使用[position](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-location.md#func-positionlength-length)实现绝对定位，设置元素左上角相对于父容器左上角偏移位置。在布局容器中，设置该属性不影响父容器布局，仅在绘制时进行位置调整。|
|相对定位|相对定位不脱离文档流，即原位置依然保留，不影响元素本身的特性，仅相对于原位置进行偏移。|使用[offset](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-location.md#func-offsetlength-length)可以实现相对定位，设置元素相对于自身的偏移量。设置该属性，不影响父容器布局，仅在绘制时进行位置调整。|

## 对子元素的约束

- 拉伸：容器组件尺寸发生变化时，增加或减小的空间全部分配给容器组件内指定区域。

  [flexGrow](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-flexlayout.md#func-flexgrowfloat64)和[flexShrink](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-flexlayout.md#func-flexshrinkfloat64)属性：

    - flexGrow基于父容器的剩余空间分配来控制组件拉伸。

    - flexShrink设置父容器的压缩尺寸来控制组件压缩。

- 缩放：子组件的宽高按照预设的比例，随容器组件发生变化，且变化过程中子组件的宽高比不变。

  [aspectRatio](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-layoutconstraints.md#func-aspectratiofloat64)属性指定当前组件的宽高比来控制缩放，公式为：aspectRatio=width/height。

- 占比：子组件的宽高按照预设的比例，随祖先容器组件发生变化。

  基于通用属性的两种实现方式：

    - 子组件的宽高设置为百分比。

      | 父组件与祖先组件宽高设置情况|   子组件百分比|
      |:---|:---|
      |父组件设置宽或高 & 祖先组件未指定父组件宽或高|参考父组件的宽高|
      |父组件设置宽或高 & 祖先组件指定父组件宽或高|参考祖先组件指定的父组件高|
      |父组件未设置宽或高 & 祖先组件指定父组件宽或高|参考祖先组件指定的父组宽高|
      |父组件未设置宽或高 & 祖先组件未指定父组件宽或高|  参考父组件的百分参照。由于父组件未指定宽高，该百分比参照传递自祖先组件|

    - [layoutWeight](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-size.md#func-layoutweightint32)属性，使得子元素自适应占满剩余空间。

- 隐藏：隐藏能力是指容器组件内的子组件，按照其预设的显示优先级，随容器组件尺寸变化显示或隐藏，其中相同显示优先级的子组件同时显示或隐藏。
  通过[displayPriority](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-layoutconstraints.md#func-displaypriorityint32)属性来控制组件的显示和隐藏。
