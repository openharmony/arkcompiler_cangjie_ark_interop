# Component Content Filling Mode

Determines how the final animated component content is rendered on the component during width/height animations.

## func renderFit(RenderFit)

```cangjie
public func renderFit(fitMode: RenderFit): This
```

**Function:** Sets the content filling mode during width/height animations.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

|Name|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
| fitMode | [RenderFit](#enum-renderfit)  | Yes  | - | Content filling mode during width/height animations. <br/>Initial value: RenderFit.TOP_LEFT.|

## Basic Type Definitions

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

**Function:** Component content filling styles.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 19

#### CENTER

```cangjie
CENTER
```

**Function:** Maintains the final animated content size while keeping content center-aligned with the component.

![renderfit_center](figures/renderfit_center.png)

#### TOP

```cangjie
TOP
```

**Function:** Maintains the final animated content size while keeping content top-center aligned with the component.

![renderfit_top](figures/renderfit_top.png)

#### BOTTOM

```cangjie
BOTTOM
```

**Function:** Maintains the final animated content size while keeping content bottom-center aligned with the component.

![renderfit_bottom](figures/renderfit_bottom.png)

#### LEFT

```cangjie
LEFT
```

**Function:** Maintains the final animated content size while keeping content left-aligned with the component.

![renderfit_left](figures/renderfit_left.png)

#### RIGHT

```cangjie
RIGHT
```

**Function:** Maintains the final animated content size while keeping content right-aligned with the component.

![renderfit_right](figures/renderfit_right.png)

#### TOP_LEFT

```cangjie
TOP_LEFT
```

**Function:** Maintains the final animated content size while keeping content top-left aligned with the component.

![renderfit_top_left](figures/renderfit_top_left.png)

#### TOP_RIGHT

```cangjie
TOP_RIGHT
```

**Function:** Maintains the final animated content size while keeping content top-right aligned with the component.

![renderfit_top_right](figures/renderfit_top_right.png)

#### BOTTOM_LEFT

```cangjie
BOTTOM_LEFT
```

**Function:** Maintains the final animated content size while keeping content bottom-left aligned with the component.

![renderfit_bottom_left](figures/renderfit_bottom_left.png)

#### BOTTOM_RIGHT

```cangjie
BOTTOM_LEFT
```

**Function:** Maintains the final animated content size while keeping content bottom-right aligned with the component.

![renderfit_bottom_right](figures/renderfit_bottom_right.png)

#### RESIZE_FILL

```cangjie
RESIZE_FILL
```

**Function:** Ignores the aspect ratio of final animated content and always scales content to component size.

![renderfit_resize_fill](figures/renderfit_resize_fill.png)

#### RESIZE_CONTAIN

```cangjie
RESIZE_CONTAIN
```

**Function:** Scales final animated content while maintaining aspect ratio to fully display within component, keeping center alignment.

![renderfit_resize_contain](figures/renderfit_resize_contain.png)

#### RESIZE_CONTAIN_TOP_LEFT

```cangjie
RESIZE_CONTAIN_TOP_LEFT
```

**Function:** Scales final animated content while maintaining aspect ratio to fully display within component. When width has remaining space, content stays left-aligned; when height has remaining space, content stays top-aligned.

 ![renderfit_resize_contain_top_left](figures/renderfit_resize_contain_top_left.png)

#### RESIZE_CONTAIN_BOTTOM_RIGHT

```cangjie
RESIZE_CONTAIN_BOTTOM_RIGHT
```

**Function:** Scales final animated content while maintaining aspect ratio to fully display within component. When width has remaining space, content stays right-aligned; when height has remaining space, content stays bottom-aligned.

![renderfit_resize_contain_bottom_right](figures/renderfit_resize_contain_bottom_right.png)

#### RESIZE_COVER

```cangjie
RESIZE_COVER
```

**Function:** Scales final animated content while maintaining aspect ratio so content dimensions are ≥ component dimensions, keeping center alignment and displaying middle portion.

![renderfit_resize_cover](figures/renderfit_resize_cover.png)

#### RESIZE_COVER_TOP_LEFT

```cangjie
RESIZE_COVER_TOP_LEFT
```

**Function:** Scales final animated content while maintaining aspect ratio so content dimensions are ≥ component dimensions. When width has remaining space, content stays left-aligned showing left portion; when height has remaining space, content stays top-aligned showing top portion.

![renderfit_resize_cover_top_left](figures/renderfit_resize_cover_top_left.png)

#### RESIZE_COVER_BOTTOM_RIGHT

```cangjie
RESIZE_COVER_BOTTOM_RIGHT
```

**Function:** Scales final animated content while maintaining aspect ratio so content dimensions are ≥ component dimensions. When width has remaining space, content stays right-aligned showing right portion; when height has remaining space, content stays bottom-aligned showing bottom portion.

![renderfit_resize_cover_bottom_right](figures/renderfit_resize_cover_bottom_right.png)

> **Note:**
>
> - In diagrams, blue area represents content, orange-yellow area represents node size.
> - Different filling modes behave differently during width/height animations. Developers should choose appropriate modes to achieve desired animation effects.

## Example Code

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
            .renderFit(RenderFit.LEFT) // Sets LEFT renderFit - during animation, final content stays left-aligned
            .margin(20)
            .animationEnd()
        Text("Hello")
            .width(this.width1)
            .animationStart(AnimateParam(duration: 1200, curve: Curve.Ease))
            .height(this.height1)
            .textAlign(TextAlign.Center)
            .borderWidth(1)
            .renderFit(RenderFit.CENTER) // Sets CENTER renderFit - during animation, final content stays center-aligned
            .margin(20)
            .animationEnd()
        Text("Hello")
            .width(this.width1)
            .animationStart(AnimateParam(duration: 1200, curve: Curve.Ease))
            .height(this.height1)
            .textAlign(TextAlign.End)
            .borderWidth(1)
            .renderFit(RenderFit.RIGHT) // Sets RIGHT renderFit - during animation, final content stays right-aligned
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