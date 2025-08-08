# 组件内容填充方式

用于决定在组件的宽高动画过程中，如何将动画最终的组件内容绘制在组件上。

## func renderFit(RenderFit)

```cangjie
public func renderFit(fitMode: RenderFit): This
```

**功能：** 设置宽高动画过程中的组件内容填充方式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
| fitMode | [RenderFit](#enum-renderfit)  | 是  | - | 宽高动画过程中的组件内容填充方式。 <br/>初始值：RenderFit.TOP_LEFT。|

## 基础类型定义

### enum RenderFit

```cangjie
public enum RenderFit {
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
}
```

**功能：** 组件内容填充样式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### CENTER

```cangjie
CENTER
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持中心对齐。

![renderfit_center](figures/renderfit_center.png)

#### TOP

```cangjie
TOP
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持顶部中心对齐。

![renderfit_top](figures/renderfit_top.png)

#### BOTTOM

```cangjie
BOTTOM
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持底部中心对齐。

![renderfit_bottom](figures/renderfit_bottom.png)

#### LEFT

```cangjie
LEFT
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持左侧对齐。

![renderfit_left](figures/renderfit_left.png)

#### RIGHT

```cangjie
RIGHT
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持右侧对齐。

![renderfit_right](figures/renderfit_right.png)

#### TOP_LEFT

```cangjie
TOP_LEFT
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持左上角对齐。

![renderfit_top_left](figures/renderfit_top_left.png)

#### TOP_RIGHT

```cangjie
TOP_RIGHT
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持右上角对齐。

![renderfit_top_right](figures/renderfit_top_right.png)

#### BOTTOM_LEFT

```cangjie
BOTTOM_LEFT
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持左下角对齐。

![renderfit_bottom_left](figures/renderfit_bottom_left.png)

#### BOTTOM_RIGHT

```cangjie
BOTTOM_LEFT
```

**功能：** 保持动画终态的内容大小，并且内容始终与组件保持右下角对齐。

![renderfit_bottom_right](figures/renderfit_bottom_right.png)

#### RESIZE_FILL

```cangjie
RESIZE_FILL
```

**功能：** 不考虑动画终态内容的宽高比，并且内容始终缩放到组件的大小。

![renderfit_resize_fill](figures/renderfit_resize_fill.png)

#### RESIZE_CONTAIN

```cangjie
RESIZE_CONTAIN
```

**功能：** 保持动画终态内容的宽高比进行缩小或放大，使内容完整显示在组件内，且与组件保持中心对齐。

![renderfit_resize_contain](figures/renderfit_resize_contain.png)

#### RESIZE_CONTAIN_TOP_LEFT

```cangjie
RESIZE_CONTAIN_TOP_LEFT
```

**功能：** 持动画终态内容的宽高比进行缩小或放大，使内容完整显示在组件内。当组件宽方向有剩余时，内容与组件保持左侧对齐，当组件高方向有剩余时，内容与组件保持顶部对齐。

 ![renderfit_resize_contain_top_left](figures/renderfit_resize_contain_top_left.png)

#### RESIZE_CONTAIN_BOTTOM_RIGHT

```cangjie
RESIZE_CONTAIN_BOTTOM_RIGHT
```

**功能：** 保持动画终态内容的宽高比进行缩小或放大，使内容完整显示在组件内。当组件宽方向有剩余时，内容与组件保持右侧对齐，当组件高方向有剩余时，内容与组件保持底部对齐。

![renderfit_resize_contain_bottom_right](figures/renderfit_resize_contain_bottom_right.png)

#### RESIZE_COVER

```cangjie
RESIZE_COVER
```

**功能：** 保持动画终态内容的宽高比进行缩小或放大，使内容两边都大于或等于组件两边，且与组件保持中心对齐，显示内容的中间部分。

![renderfit_resize_cover](figures/renderfit_resize_cover.png)

#### RESIZE_COVER_TOP_LEFT

```cangjie
RESIZE_COVER_TOP_LEFT
```

**功能：** 保持动画终态内容的宽高比进行缩小或放大，使内容的两边都恰好大于或等于组件两边。当内容宽方向有剩余时，内容与组件保持左侧对齐，显示内容的左侧部分。当内容高方向有剩余时，内容与组件保持顶部对齐，显示内容的顶侧部分。

![renderfit_resize_cover_top_left](figures/renderfit_resize_cover_top_left.png)

#### RESIZE_COVER_BOTTOM_RIGHT

```cangjie
RESIZE_COVER_BOTTOM_RIGHT
```

**功能：** 保持动画终态内容的宽高比进行缩小或放大，使内容的两边都恰好大于或等于组件两边。当内容宽方向有剩余时，内容与组件保持右侧对齐，显示内容的右侧部分。当内容高方向有剩余时，内容与组件保持底部对齐，显示内容的底侧部分。

![renderfit_resize_cover_bottom_right](figures/renderfit_resize_cover_bottom_right.png)

> **说明：**
>
> - 示意图中，蓝色区域表示内容，橙黄色区域表示节点大小。
> - 不同的内容填充方式在宽高动画过程中效果不一致，开发者需要选择合适的内容填充方式以实现需要的动画效果。

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var width1 = 80
    @State var height1 = 50
    @State var flag: Bool = true
    func build() {
        Column {
        Text("Hello")
            .width(this.width1)
            .animationStart(AnimateParam(duration: 1200, curve: Curve.Ease))
            .height(this.height1)
            .borderWidth(1)
            .textAlign(TextAlign.Start)
            .renderFit(RenderFit.LEFT) // 设置LEFT的renderFit，动画过程中，动画的终态内容与组件保持左对齐
            .margin(20)
            .animationEnd()
        Text("Hello")
            .width(this.width1)
            .animationStart(AnimateParam(duration: 1200, curve: Curve.Ease))
            .height(this.height1)
            .textAlign(TextAlign.Center)
            .borderWidth(1)
            .renderFit(RenderFit.CENTER) // 设置CENTER的renderFit，动画过程中，动画的终态内容与组件保持中心对齐
            .margin(20)
            .animationEnd()
        Text("Hello")
            .width(this.width1)
            .animationStart(AnimateParam(duration: 1200, curve: Curve.Ease))
            .height(this.height1)
            .textAlign(TextAlign.End)
            .borderWidth(1)
            .renderFit(RenderFit.RIGHT) // 设置RIGHT的renderFit，动画过程中，动画的终态内容与组件保持右对齐
            .margin(20)
            .animationEnd()

        Button("change size")
            .onClick { e =>
                if (flag) {
                    this.width1 = 150
                    this.height1 = 50
                } else {
                    this.width1 = 80
                    this.height1 = 50
                }
                this.flag = !this.flag
            }
            .width(150)
            .height(100)
        }
    }
}
```

![uni_renderfit](figures/uni_renderfit.gif)
