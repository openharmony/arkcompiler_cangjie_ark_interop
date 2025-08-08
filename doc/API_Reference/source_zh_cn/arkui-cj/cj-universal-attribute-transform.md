# 图形变换

用于对组件进行旋转、平移、缩放、矩阵变换等操作。

## func rotate(Float32, Float32, Float32, Float64, Length, Length)

```cangjie
public func rotate(
    x!: Float32 = 0.0,
    y!: Float32 = 0.0,
    z!: Float32 = 0.0,
    angle!: Float32 = 0.0,
    centerX!: Length = 50.percent,
    centerY!: Length = 50.percent
): This
```

**功能：** 设置组件旋转。

> **说明：**
>
> - 可使组件在以组件左上角为坐标原点的坐标系中进行旋转（坐标系如下图所示）。其中，(x, y, z)指定一个矢量，作为旋转轴。
> - 旋转轴和旋转中心点都基于坐标系设定，组件发生位移时，坐标系不会随之移动。
> - 默认值: 在x、y、z都不指定时，x、y、z的默认值分别为0、0、1。指定了x、y、z任何一个值时，x、y、z中未指定的值默认为0。
> ![coordinates](figures/coordinates.png)

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|否|0.0| **命名参数。** 旋转轴向量x坐标。|
|y|Float32|否|0.0| **命名参数。** 旋转轴向量y坐标。|
|z|Float32|否|0.0| **命名参数。** 旋转轴向量z坐标。|
|angel|Float64|否|0.0|旋转角度。取值为正时相对于旋转轴方向顺时针转动，取值为负时相对于旋转轴方向逆时针转动。|
|centerX|[Length](cj-common-types.md#interface-length)|否|50.percent| **命名参数。** 变换中心点x轴坐标。表示组件变换中心点（即锚点）的x方向坐标。|
|centerY|[Length](cj-common-types.md#interface-length)|否|50.percent| **命名参数。** 变换中心点y轴坐标。表示组件变换中心点（即锚点）的y方向坐标。|

## func rotateX(Float32)

```cangjie
public func rotateX(rotateVal: Float32): This
```

**功能：** 以X轴旋转指定角度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rotateVal|Float32|是|-|旋转轴向量x坐标。|

## func rotateX(Int32)

```cangjie
public func rotateX(rotateVal: Int32): This
```

**功能：** 以X轴旋转指定角度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rotateVal|Int32|是|-|旋转轴向量x坐标。|

## func rotateY(Float32)

```cangjie
public func rotateY(rotateVal: Float32): This
```

**功能：** 以Y轴旋转指定角度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rotateVal|Float32|是|-|旋转轴向量y坐标。|

## func rotateY(Int32)

```cangjie
public func rotateY(rotateVal: Int32): This
```

**功能：** 以Y轴旋转指定角度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rotateVal|Int32|是|-|旋转轴向量y坐标。|

## func rotate(Float32)

```cangjie
public func rotate(rotateZ: Float32): This
```

**功能：** 设置组件旋转。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rotateZ|Float32|是|-|z轴锚点，即3D旋转中心点的z轴分量。|

## func rotate(Int32)

```cangjie
public func rotate(rotateZ: Int32): This
```

**功能：** 设置组件旋转。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rotateZ|Int32|是|-|z轴锚点，即3D旋转中心点的z轴分量。|

## func scale(Float32)

```cangjie
public func scale(scaleValue: Float32): This
```

**功能：** 设置组件缩放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scaleValue|Float32|是|-|缩放倍数。|

## func scale(Int32)

```cangjie
public func scale(scaleValue: Int32): This
```

**功能：** 设置组件缩放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scaleValue|Int32|是|-|缩放倍数。|

## func scale(Float32, Float32, Float32, Length, Length)

```cangjie
public func scale(
    x!: Float32 = 1.0,
    y!: Float32 = 1.0,
    z!: Float32 = 1.0,
    centerX!: Length = 50.percent,
    centerY!: Length = 50.percent
): This
```

**功能：** 设置组件缩放。

> **说明：**
>
> 可以分别设置X轴、Y轴、Z轴的缩放比例，默认值为1.0；同时可以通过centerX和centerY设置缩放的中心点。单独传Int32或者Float32时，同时在X轴、Y轴缩放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|否|1.0| **命名参数。** X轴缩放比例。|
|y|Float32|否|1.0| **命名参数。** Y轴缩放比例。|
|z|Float32|否|1.0| **命名参数。** Z轴缩放比例。|
|centerX|[Length](cj-common-types.md#interface-length)|否|50.percent| **命名参数。** 变换中心点x轴坐标。表示组件变换中心点（即锚点）的x方向坐标。|
|centerY|[Length](cj-common-types.md#interface-length)|否|50.percent| **命名参数。** 变换中心点y轴坐标。表示组件变换中心点（即锚点）的y方向坐标。|

## func scaleX(Float32)

```cangjie
public func scaleX(scale: Float32): This
```

**功能：** 设置X轴的缩放比例。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scale|Float32|是|-|X轴的缩放比例。|

## func scaleX(Int32)

```cangjie
public func scaleX(scale: Int32): This
```

**功能：** 设置X轴的缩放比例。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scale|Int32|是| - |X轴的缩放比例。|

## func scaleY(Float32)

```cangjie
public func scaleY(scale: Float32): This
```

**功能：** 设置Y轴的缩放比例。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scale|Float32|是|-|Y轴的缩放比例。|

## func scaleY(Int32)

```cangjie
public func scaleY(scale: Int32): This
```

**功能：** 设置Y轴的缩放比例。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|scale|Int32|是|-|Y轴的缩放比例。|

## func transform(Matrix4Transit)

```cangjie
public func transform(matrix: Matrix4Transit): This
```

**功能：** 设置当前组件的变换矩阵。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|matrix|Matrix4Transit|是|-|当前组件的变换矩阵。|

## func translate(Length)

```cangjie
public func translate(value: Length): This
```

**功能：** 设置组件平移距离。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Length](./cj-common-types.md#interface-length)|是|-|平移距离。|

## func translate(Length, Length, Length)

```cangjie
public func translate(x!: Length = 0.vp, y!: Length = 0.vp, z!: Length = 0.vp): This
```

**功能：** 设置组件平移距离。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

> **说明：**
>
> 可使组件在以组件左上角为坐标原点的坐标系中进行移动（坐标系如下图所示）。其中，x，y，z的值分别表示在对应轴移动的距离，值为正时表示向对应轴的正向移动，值为负时表示向对应轴的反向移动。<br/>默认值:<br/>{x:&nbsp;0,y:&nbsp;0,z:&nbsp;0}<br/>单位：vp。<br/>![coordinates](figures/coordinates.png) <br>**说明：** z轴方向移动时由于观察点位置不变，z的值接近观察点组件会有放大效果，远离则缩小。<br/>![coordinateNode](figures/coordinateNote.png)|

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](cj-common-types.md#interface-length)|否|0.vp| **命名参数。** X轴平移距离。|
|y|[Length](cj-common-types.md#interface-length)|否|0.vp| **命名参数。** Y轴平移距离。|
|z|[Length](cj-common-types.md#interface-length)|否|0.vp| **命名参数。** Z轴平移距离。|

## func translateX(Int64)

```cangjie
public func translateX(value: Int64): This
```

**功能：** 设置组件X轴平移距离,距离的正负控制平移的方向(单位为vp)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| value |Int64 |是|-|X轴平移距离。|

## func translateX(Length)

```cangjie
public func translateX(value: Length): This
```

**功能：** 设置组件X轴平移距离,距离的正负控制平移的方向(单位为vp)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| value |[Length](cj-common-types.md#interface-length)|是|-|X轴平移距离。|

## func translateY(Int64)

```cangjie
public func translateY(value: Int64): This
```

**功能：** 设置组件Y轴平移距离,距离的正负控制平移的方向(单位为vp)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| value |Int64|是|-|Y轴平移距离。|

## func translateY(Length)

```cangjie
public func translateY(value: Length): This
```

**功能：** 设置组件Y轴平移距离,距离的正负控制平移的方向(单位为vp)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| value |[Length](cj-common-types.md#interface-length)|是|-|Y轴平移距离。|
