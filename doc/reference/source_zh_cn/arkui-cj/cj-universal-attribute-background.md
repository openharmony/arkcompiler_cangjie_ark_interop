# 背景设置

设置组件的背景样式。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func backdropBlur(Float64)

```cangjie
public func backdropBlur(value: Float64): This
```

**功能：** 设置背景模糊效果。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Float64|是|-|模糊半径。|

## func backgroundColor(ResourceColor)

```cangjie
public func backgroundColor(value: ResourceColor): This
```

**功能：** 设置组件的背景颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|背景颜色。|

## func backgroundImage(ResourceStr)

```cangjie
public func backgroundImage(src: ResourceStr): This
```

**功能：** 设置组件的背景图片。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|图片资源路径。|

## func backgroundImage(ResourceStr, ImageRepeat)

```cangjie
public func backgroundImage(src: ResourceStr, repeat: ImageRepeat): This
```

**功能：** 设置组件的背景图片和重复方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|图片资源路径。|
|repeat|[ImageRepeat](./cj-common-types.md#enum-imagerepeat)|是|-|图片重复方式。|

## func backgroundImagePosition(Alignment)

```cangjie
public func backgroundImagePosition(value: Alignment): This
```

**功能：** 设置背景图片的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Alignment](./cj-common-types.md#enum-alignment)|是|-|对齐方式。|

## func backgroundImagePosition(Length, Length)

```cangjie
public func backgroundImagePosition(x!: Length = 0.vp, y!: Length = 0.vp): This
```

**功能：** 设置背景图片的位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|X轴位置。|
|y|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|Y轴位置。|

## func backgroundImageSize(ImageSize)

```cangjie
public func backgroundImageSize(value: ImageSize): This
```

**功能：** 设置背景图片的尺寸。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ImageSize](./cj-common-types.md#enum-imagesize)|是|-|图片尺寸。|

## func backgroundImageSize(Length, Length)

```cangjie
public func backgroundImageSize(width!: Length = 0.vp, height!: Length = 0.vp): This
```

**功能：** 设置背景图片的宽度和高度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|图片宽度。|
|height|[Length](../BasicServicesKit/cj-apis-base.md#interface-length)|否|0.vp|图片高度。|

## 基础类型定义

### enum BlurStyle

```cangjie
public enum BlurStyle <: Equatable<BlurStyle> {
    | Thin
    | Regular
    | Thick
    | BackgroundThin
    | BackgroundRegular
    | BackgroundThick
    | BackgroundUltraThick
    | None
    | ComponentUltraThin
    | ComponentThin
    | ComponentRegular
    | ComponentThick
    | ComponentUltraThick
    | ...
}
```

**功能：** 模糊设置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<BlurStyle>

#### BackgroundRegular

```cangjie
BackgroundRegular
```

**功能：** 中距景深模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### BackgroundThick

```cangjie
BackgroundThick
```

**功能：** 远距景深模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### BackgroundThin

```cangjie
BackgroundThin
```

**功能：** 近距景深模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### BackgroundUltraThick

```cangjie
BackgroundUltraThick
```

**功能：** 超远距景深模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### ComponentRegular

```cangjie
ComponentRegular
```

**功能：** 组件普通材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### ComponentThick

```cangjie
ComponentThick
```

**功能：** 组件厚材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### ComponentThin

```cangjie
ComponentThin
```

**功能：** 组件普通材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### ComponentUltraThick

```cangjie
ComponentUltraThick
```

**功能：** 组件超厚材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### ComponentUltraThin

```cangjie
ComponentUltraThin
```

**功能：** 组件超轻薄材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### None

```cangjie
None
```

**功能：** 关闭模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Regular

```cangjie
Regular
```

**功能：** 普通厚度材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Thick

```cangjie
Thick
```

**功能：** 厚材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Thin

```cangjie
Thin
```

**功能：** 轻薄材质模糊。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func !=(BlurStyle)

```cangjie
public operator func !=(other: BlurStyle): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BlurStyle](#enum-blurstyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不相等，则返回true，否则返回false。|

#### func ==(BlurStyle)

```cangjie
public operator func ==(other: BlurStyle): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[BlurStyle](#enum-blurstyle)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，则返回true，否则返回false。|

