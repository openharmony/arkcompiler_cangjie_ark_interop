# 图形变换

用于对组件进行旋转、平移、缩放、矩阵变换等操作。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func rotate(Float32, Float32, Float32, Float32, Length, Length)

```cangjie
public func rotate(x!: Float32 = 0.0, y!: Float32 = 0.0, z!: Float32 = 1.0, angle!: Float32 = 0.0,
    centerX!: Length = 50.percent, centerY!: Length = 50.percent): This
```

**功能：** 设置组件旋转。

> **说明：**
>
> - 可使组件在以组件左上角为坐标原点的坐标系中进行旋转（坐标系如下图所示）。其中，(x, y, z)指定一个矢量，作为旋转轴。
> - 旋转轴和旋转中心点都基于坐标系设定，组件发生位移时，坐标系不会随之移动。
> - 默认值: 在x、y、z都不指定时，x、y、z的默认值分别为0、0、1。指定了x、y、z任何一个值时，x、y、z中未指定的值默认为0。
> ![coordinates](figures/coordinates.png)

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|否|0.0|**命名参数。** 旋转轴向量x坐标。|
|y|Float32|否|0.0|**命名参数。** 旋转轴向量y坐标。|
|z|Float32|否|1.0|**命名参数。** 旋转轴向量z坐标。|
|angle|Float32|否|0.0|**命名参数。** 旋转角度。取值为正时相对于旋转轴方向顺时针转动，取值为负时相对于旋转轴方向逆时针转动。|
|centerX|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|50.percent|**命名参数。** 变换中心点x轴坐标。表示组件变换中心点（即锚点）的x方向坐标。|
|centerY|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|50.percent|**命名参数。** 变换中心点y轴坐标。表示组件变换中心点（即锚点）的y方向坐标。|

## func scale(Float32, Float32, Float32, Length, Length)

```cangjie
public func scale(x!: Float32 = 1.0, y!: Float32 = 1.0, z!: Float32 = 1.0, centerX!: Length = 50.percent,
    centerY!: Length = 50.percent): This
```

**功能：** 设置组件的缩放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|否|1.0|X轴缩放分量。|
|y|Float32|否|1.0|Y轴缩放分量。|
|z|Float32|否|1.0|Z轴缩放分量。|
|centerX|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|50.percent|变换中心点x轴坐标。表示组件变换中心点（即锚点）的x方向坐标。|
|centerY|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|50.percent|变换中心点y轴坐标。表示组件变换中心点（即锚点）的y方向坐标。|

## func translate(Length, Length, Length)

```cangjie
public func translate(x!: Length = 0.vp, y!: Length = 0.vp, z!: Length = 0.vp): This
```

**功能：** 设置组件的平移。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|X轴平移距离。|
|y|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|Y轴平移距离。|
|z|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|Z轴平移距离。|

