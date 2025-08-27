# 尺寸设置

设置组件的宽高、边距。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func constraintSize(Length, Length, Length, Length)

```cangjie
public func constraintSize(minWidth!: Length = 0.vp, maxWidth!: Length = (Float64.Inf).vp,
    minHeight!: Length = 0.vp, maxHeight!: Length = (Float64.Inf).vp): This
```

**功能：** 设置组件的尺寸约束。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|minWidth|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#)|否|0.vp|最小宽度。|
|maxWidth|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#)|否|(Float64.Inf).vp|最大宽度。|
|minHeight|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#)|否|0.vp|最小高度。|
|maxHeight|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(#)|否|(Float64.Inf).vp|最大高度。|

## func height(Option\<Length>)

```cangjie
public func height(value: Option<Length>): This
```

**功能：** 设置组件自身的高度，缺省时使用元素自身内容需要的高度。若子组件的高大于父组件的高，则会画出父组件的范围。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Option](<font color="red" face="bold">please add link</font>)\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)>|是|-|组件高度。</br>单位：vp。|

## func layoutWeight(Int32)

```cangjie
public func layoutWeight(value: Int32): This
```

**功能：** 设置组件的布局权重。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|父容器尺寸确定时，设置了layoutWeight属性的子元素与兄弟元素占主轴尺寸按照权重进行分配，忽略元素本身尺寸设置，表示自适应占满剩余空间。</br>**说明：** 仅在[Row](./cj-common-types.md#row)/[Column](./cj-common-types.md#column)/[Flex](./cj-row-column-stack-flex.md#flex)布局中生效。可选值为大于等于0的数字，或者可以转换为数字的字符串。如果容器中有子元素设置了layoutWeight属性，且设置的属性值大于0，则所有子元素不会再基于flexShrink和flexGrow布局。|

## func margin(Length)

```cangjie
public func margin(value: Length): This
```

**功能：** 设置组件的外边距。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|是|-|组件的外边距，四个方向内边距同时生效。<br/> 单位：vp|

## func margin(Length, Length, Length, Length)

```cangjie
public func margin(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This
```

**功能：** 设置组件的四个方向外边距。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|否|0.vp|**命名参数。**  上内边距，组件顶部距组件外元素的尺寸。|
|right|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|否|0.vp|**命名参数。**  右内边距，组件右边界距组件外元素的尺寸。|
|bottom|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|否|0.vp|**命名参数。**  下内边距，组件底部距组件外元素的尺寸。|
|left|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|否|0.vp|**命名参数。**  左内边距，组件左边界距组件外元素的尺寸。|

## func padding(Length)

```cangjie
public func padding(value: Length): This
```

**功能：** 设置组件的内边距。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|是|-|组件的内边距，四个方向内边距同时生效。<br/> 单位：vp。|

## func padding(Length, Length, Length, Length)

```cangjie
public func padding(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This
```

**功能：** 设置组件的四个方向内边距。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|否|0.vp|**命名参数。** 上内边距，组件内元素距组件顶部的尺寸。</br>初始值： 0.vp。|
|right|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|否|0.vp|**命名参数。** 右内边距，组件内元素距组件右边界的尺寸。</br>初始值： 0.vp。|
|bottom|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|否|0.vp|**命名参数。** 下内边距，组件内元素距组件底部的尺寸。</br>初始值： 0.vp。|
|left|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|否|0.vp|**命名参数。** 左内边距，组件内元素距组件左边界的尺寸。</br>初始值： 0.vp。|

> **说明：**
>
> padding设置百分比时，上下左右内边距均以父容器的width作为基础值。

## func size(Length, Length)

```cangjie
public func size(width!: Length, height!: Length): This
```

**功能：** 设置组件的尺寸。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|是|-|**命名参数。**  组件宽度。<br/> 单位：vp。|
|height|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|是|-|**命名参数。**  组件高度。<br/> 单位：vp。|

## func width(Option\<Length>)

```cangjie
public func width(value: Option<Length>): This
```

**功能：** 设置组件自身的宽度，缺省时使用元素自身内容需要的宽度。若子组件的宽大于父组件的宽，则会画出父组件的范围。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Option](<font color="red" face="bold">please add link</font>)\<[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)>|是|-|组件宽度。<br>默认单位：vp。|

