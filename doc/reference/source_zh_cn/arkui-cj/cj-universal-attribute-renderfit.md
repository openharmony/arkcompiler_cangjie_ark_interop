# 组件内容填充方式

用于决定在组件的宽高动画过程中，如何将动画最终的组件内容绘制在组件上。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func renderFit(RenderFit)

```cangjie
public func renderFit(fitMode: RenderFit): This
```

**功能：** 设置组件的渲染适配模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fitMode|[RenderFit](#enum-renderfit)|是|-|渲染适配模式。|

## func !=(RenderFit)

```cangjie
public operator func !=(other: RenderFit): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[RenderFit](#enum-renderfit)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

## func ==(RenderFit)

```cangjie
public operator func ==(other: RenderFit): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[RenderFit](#enum-renderfit)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## 基础类型定义

### enum RenderFit

```cangjie
public enum RenderFit <: Equatable<RenderFit> {
    | CENTER
    | TOP
    | BOTTOM
    | LEFT
    | RIGHT
    | TOP_LEFT
    | TOP_RIGHT
    | BOTTOM_LEFT
    | BOTTOM_RIGHT
    | RESIZE_FILL
    | RESIZE_CONTAIN
    | RESIZE_CONTAIN_TOP_LEFT
    | RESIZE_CONTAIN_BOTTOM_RIGHT
    | RESIZE_COVER
    | RESIZE_COVER_TOP_LEFT
    | RESIZE_COVER_BOTTOM_RIGHT
    | ...
}
```

**功能：** 组件内容填充样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<RenderFit>

#### BOTTOM

```cangjie
BOTTOM
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持底部中心对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### BOTTOM_LEFT

```cangjie
BOTTOM_LEFT
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持左下角对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### BOTTOM_RIGHT

```cangjie
BOTTOM_RIGHT
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持右下角对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### CENTER

```cangjie
CENTER
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持中心对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### LEFT

```cangjie
LEFT
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持左侧对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### RESIZE_CONTAIN

```cangjie
RESIZE_CONTAIN
```

**功能：** 保持动画终态内容的宽高比进行缩小或放大，使内容完整显示在组件内，且与组件保持中心对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### RESIZE_CONTAIN_BOTTOM_RIGHT

```cangjie
RESIZE_CONTAIN_BOTTOM_RIGHT
```

**功能：** 保持动画终态内容的宽高比进行缩小或放大，使内容完整显示在组件内。当组件宽方向有剩余时，内容与组件保持右侧对齐，当组件高方向有剩余时，内容与组件保持底部对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### RESIZE_CONTAIN_TOP_LEFT

```cangjie
RESIZE_CONTAIN_TOP_LEFT
```

**功能：** 持动画终态内容的宽高比进行缩小或放大，使内容完整显示在组件内。当组件宽方向有剩余时，内容与组件保持左侧对齐，当组件高方向有剩余时，内容与组件保持顶部对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### RESIZE_COVER

```cangjie
RESIZE_COVER
```

**功能：** 保持动画终态内容的宽高比进行缩小或放大，使内容两边都大于或等于组件两边，且与组件保持中心对齐，显示内容的中间部分。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### RESIZE_COVER_BOTTOM_RIGHT

```cangjie
RESIZE_COVER_BOTTOM_RIGHT
```

**功能：** 保持动画终态内容的宽高比进行缩小或放大，使内容的两边都恰好大于或等于组件两边。当内容宽方向有剩余时，内容与组件保持右侧对齐，显示内容的右侧部分。当内容高方向有剩余时，内容与组件保持底部对齐，显示内容的底侧部分。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### RESIZE_COVER_TOP_LEFT

```cangjie
RESIZE_COVER_TOP_LEFT
```

**功能：** 保持动画终态内容的宽高比进行缩小或放大，使内容的两边都恰好大于或等于组件两边。当内容宽方向有剩余时，内容与组件保持左侧对齐，显示内容的左侧部分。当内容高方向有剩余时，内容与组件保持顶部对齐，显示内容的顶侧部分。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### RESIZE_FILL

```cangjie
RESIZE_FILL
```

**功能：** 不考虑动画终态内容的宽高比，并且内容始终缩放到组件的大小。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### RIGHT

```cangjie
RIGHT
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持右侧对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### TOP

```cangjie
TOP
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持顶部中心对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### TOP_LEFT

```cangjie
TOP_LEFT
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持左上角对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### TOP_RIGHT

```cangjie
TOP_RIGHT
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持右上角对齐。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21
