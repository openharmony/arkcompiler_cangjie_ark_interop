# 背景设置

设置组件的背景样式。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func backgroundColor(?ResourceColor)

```cangjie
public func backgroundColor(value: ?ResourceColor): T
```

**功能：** 设置组件的背景颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?[ResourceColor](./cj-common-types.md#interface-resourcecolor)|是|-|背景颜色。初始值:  Color.Transparent|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|

## func backgroundImage(?ResourceStr)

```cangjie
public func backgroundImage(src: ?ResourceStr): T
```

**功能：** 设置组件的背景图片。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|?[ResourceStr](./cj-common-types.md#interface-resourcestr)|是|-|图片资源路径。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|

## func backgroundImage(?ResourceStr, ?ImageRepeat)

```cangjie
public func backgroundImage(src: ?ResourceStr, repeat: ?ImageRepeat): T
```

**功能：** 设置组件的背景图片和重复方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|?[ResourceStr](./cj-common-types.md#interface-resourcestr)|是|-|图片资源路径。|
|repeat|?[ImageRepeat](./cj-common-types.md#enum-imagerepeat)|是|-|图片重复方式。初始值:  ImageRepeat.NoRepeat|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|

## func backgroundImagePosition(?Alignment)

```cangjie
public func backgroundImagePosition(value: ?Alignment): T
```

**功能：** 设置背景图片的对齐方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?[Alignment](./cj-common-types.md#enum-alignment)|是|-|对齐方式。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|

## func backgroundImagePosition(?Length, ?Length)

```cangjie
public func backgroundImagePosition(x!: ?Length = None, y!: ?Length = None): T
```

**功能：** 设置背景图片的位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|?[Length](./cj-common-types.md#interface-length)|否|None|**命名参数。** X轴位置。初始值:  0.vp|
|y|?[Length](./cj-common-types.md#interface-length)|否|None|**命名参数。** Y轴位置。初始值:  0.vp|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|

## func backgroundImageSize(?ImageSize)

```cangjie
public func backgroundImageSize(value: ?ImageSize): T
```

**功能：** 设置背景图片的尺寸。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|?[ImageSize](./cj-common-types.md#enum-imagesize)|是|-|图片尺寸。|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|

## func backgroundImageSize(?Length, ?Length)

```cangjie
public func backgroundImageSize(width!: ?Length = None, height!: ?Length = None): T
```

**功能：** 设置背景图片的宽度和高度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 22

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|?[Length](./cj-common-types.md#interface-length)|否|None|**命名参数。** 图片宽度。初始值:  0.vp|
|height|?[Length](./cj-common-types.md#interface-length)|否|None|**命名参数。** 图片高度。初始值:  0.vp|

**返回值：**

|类型|说明|
|:---|:---|
|T|返回调用此接口的组件实例本身。|
