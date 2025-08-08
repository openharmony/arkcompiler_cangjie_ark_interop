# 尺寸设置

设置组件的宽高、边距。

## func width(Length)

```cangjie
public func width(value: Length): This
```

**功能：** 设置组件自身的宽度，缺省时使用元素自身内容需要的宽度。若子组件的宽大于父组件的宽，则会画出父组件的范围。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|   value   | [Length](cj-common-types.md#interface-length) | 是  | \-  | 组件宽度。<br/> 单位：vp。|

## func width\<T>(Option\<T>)

```cangjie
public func width<T>(value: Option<T>): This
```

**功能：** 设置组件自身的宽度，参数值为None时使用元素自身内容需要的宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|   value   | Option\<T> | 是  | \-  | 组件宽度。<br/>T为Int64、Float64、Length、AppResource类型。|

## func height(Length)

```cangjie
public func height(value: Length): This
```

**功能：** 设置组件自身的高度，缺省时使用元素自身内容需要的高度。若子组件的高大于父组件的高，则会画出父组件的范围。

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|   value   | [Length](cj-common-types.md#interface-length) | 是  | -  | 组件高度。<br/> 单位：vp。|

## func height\<T>(Option\<T>)

```cangjie
public func height<T>(value: Option<T>): This
```

**功能：** 设置组件自身的高度，参数值为None时使用元素自身内容需要的宽度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|   value   | Option\<T> | 是  | \-  | 组件高度。<br/>T为Int64、Float64、Length、AppResource类型。|

## func size(Length, Length)

```cangjie
public func size(width!: Length, height!: Length): This
```

**功能：** 设置组件的高宽。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

| 名称|类型|必填|默认值|说明|
|:---|:---|:--- |:---|:---|
| width       | [Length](./cj-common-types.md#interface-length)      | 是  | \-  | **命名参数。**  组件宽度。<br/> 单位：vp。|
| height      | [Length](./cj-common-types.md#interface-length)      | 是  | \-  | **命名参数。**  组件高度。<br/> 单位：vp。|

## func padding(Length)

```cangjie
public func padding(value: Length): This
```

**功能：** 设置内边距属性。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| value     | [Length](./cj-common-types.md#interface-length)  | 是  | - | 组件的内边距，四个方向内边距同时生效。<br/> 单位：vp。|

## func padding(Length, Length, Length, Length)

```cangjie
public func padding(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This
```

**功能：** 设置内边距属性。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| top       | [Length](./cj-common-types.md#interface-length)  | 否  |0.vp| **命名参数。**  上内边距，组件内元素距组件顶部的尺寸。</br>初始值： 0.vp。|
| right     | [Length](./cj-common-types.md#interface-length)  | 否  |0.vp| **命名参数。**  右内边距，组件内元素距组件右边界的尺寸。</br>初始值： 0.vp。|
| bottom    | [Length](./cj-common-types.md#interface-length)  | 否  |0.vp| **命名参数。**  下内边距，组件内元素距组件底部的尺寸。</br>初始值： 0.vp。|
| left      | [Length](./cj-common-types.md#interface-length)  | 否  |0.vp| **命名参数。**  左内边距，组件内元素距组件左边界的尺寸。</br>初始值： 0.vp。|

> **说明：**
>
> padding设置百分比时，上下左右内边距均以父容器的width作为基础值。

## func margin(Length)

```cangjie
public func margin(value: Length): This
```

**功能：** 设置外边距属性。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| value| [Length](./cj-common-types.md#interface-length) | 是  | - | 组件的外边距，四个方向内边距同时生效。<br/> 单位：vp|

## func margin(Length, Length, Length, Length)

```cangjie
public func margin(top!: Length = 0.vp, right!: Length = 0.vp, bottom!: Length = 0.vp, left!: Length = 0.vp): This
```

**功能：** 设置外边距属性。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| top       | [Length](./cj-common-types.md#interface-length)  | 否  | 0.vp | **命名参数。**  上内边距，组件顶部距组件外元素的尺寸。|
| right     | [Length](./cj-common-types.md#interface-length)  | 否  | 0.vp | **命名参数。**  右内边距，组件右边界距组件外元素的尺寸。|
| bottom    | [Length](./cj-common-types.md#interface-length)  | 否  | 0.vp | **命名参数。**  下内边距，组件底部距组件外元素的尺寸。|
| left      | [Length](./cj-common-types.md#interface-length)  | 否  | 0.vp | **命名参数。**  左内边距，组件左边界距组件外元素的尺寸。|

## func layoutWeight(Int32)

```cangjie
public func layoutWeight(value: Int32): This
```

**功能：** 设置组件的布局权重，使用该属性的组件在父容器（[Row](./cj-common-types.md#row)/[Column](./cj-common-types.md#column)的主轴方向按照权重分配尺寸。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| value     | Int32  | 是  | - | 父容器尺寸确定时，设置了layoutWeight属性的子元素与兄弟元素占主轴尺寸按照权重进行分配，忽略元素本身尺寸设置，表示自适应占满剩余空间。</br>**说明：** 仅在[Row](./cj-common-types.md#row)/[Column](./cj-common-types.md#column)布局中生效。可选值为大于等于0的数字，或者可以转换为数字的字符串。如果容器中有子元素设置了layoutWeight属性，且设置的属性值大于0，则所有子元素不会再基于flexShrink和flexGrow布局。|

## func constraintSize(Length, Length, Length, Length)

```cangjie
public func constraintSize(minWidth!: Length = 0.vp, maxWidth!: Length = (Float64.Inf).vp, minHeight!: Length = 0.vp, maxHeight!: Length = (Float64.Inf).vp): This
```

**功能：** 设置约束尺寸，组件布局时，进行尺寸范围限制。

> **说明：**
>
> Width和Height。取值结果参考constraintSize取值对width/height影响。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| minWidth | [Length](./cj-common-types.md#interface-length)  | 否  | 0.vp | **命名参数。**  元素最小宽度。</br>初始值：0.vp。|
| maxWidth | [Length](./cj-common-types.md#interface-length)  | 否  | (Float64.Inf).vp| **命名参数。**  元素最大宽度。</br>初始值：(Float64.Inf).vp。|
| minHeight | [Length](./cj-common-types.md#interface-length)  | 否  |0.vp | **命名参数。**  元素最小高度。</br>初始值：0.vp。|
| maxHeight | [Length](./cj-common-types.md#interface-length)  | 否  | (Float64.Inf).vp| **命名参数。**  元素最大高度。</br>初始值：(Float64.Inf).vp。|

**constraintSize(minWidth/maxWidth/minHeight/maxHeight)取值对width/height影响**

| 缺省值 | 结果  |
| :------ | :------ |
| \ | width=MAX(minWidth,MIN(maxWidth,width))<br/>height=MAX(minHeight,MIN(maxHeight,height)) |
| maxWidth、maxHeight | **命名参数。**  width=MAX(minWidth,width)<br/>height=MAX(minHeight,height) |
| minWidth、minHeight | **命名参数。**  width=MIN(maxWidth,width)<br/>height=MIN(maxHeight,height) |
| width、height | 若minWidth<maxWidth，组件自身布局逻辑生效，width取值范围为[minWidth,maxWidth]；否则，width=MAX(minWidth,maxWidth)。<br/>若minHeight<maxHeight，组件自身布局逻辑生效，height取值范围为[minHeight,maxHeight]；否则，height=MAX(minHeight,maxHeight)。 |
| width与maxWidth、height与maxHeight | width=minWidth<br/>height=minHeight |
| width与minWidth、height与minHeight | 组件自身布局逻辑生效，width取值约束为不大于maxWidth。<br/>组件自身布局逻辑生效，height取值约束为不大于maxHeight。 |
| minWidth与maxWidth、minHeight与maxHeight | **命名参数。**  width以所设值为基础，根据其他布局属性发生可能的拉伸或者压缩。<br/>height以所设值为基础，根据其他布局属性发生可能的拉伸或者压缩。|
| width与minWidth与maxWidth | 使用父容器传递的布局限制进行布局。 |
| height与minHeight与maxHeight | 使用父容器传递的布局限制进行布局。 |
