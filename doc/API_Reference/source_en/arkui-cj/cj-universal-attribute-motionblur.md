# Motion Blur

Sets the motion blur effect during component movement caused by scaling or displacement changes. Requires coordination with the `onFinish` parameter of the animation's `AnimateParam`.

## func motionBlur(MotionBlurOptions)

```cangjie
public func motionBlur(value: MotionBlurOptions): This
```

**Function:** Adds dynamic blur effects during component movement caused by scaling or displacement changes.

> **Notes:**
>
> - Not recommended for use in component transitions, shared element transitions, implicit element transitions within components, or particle animation scenarios, as it may produce unexpected effects.
> - The `radius` parameter of `motionBlur` must be set to 0 in the initial state; otherwise, unexpected effects may occur during cold start.
> - This property requires coordination with the `onFinish` parameter of the animation's `AnimateParam`. The `radius` parameter of `motionBlur` must be reset to 0 after the motion blur animation completes; otherwise, unexpected effects may occur.
> - Avoid frequently changing the blur radius of the same component during usage, as it may lead to unexpected effects. For example, in the sample animation, frequent clicks may occasionally cause the blur effect to fail.
> - The motion blur anchor coordinates must align with the animation scaling anchor; otherwise, unexpected effects may occur.
> - The blur radius is recommended to be set below 1; otherwise, unexpected effects may occur.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [MotionBlurOptions](#class-motionbluroptions) | Yes | - | Defines motion blur parameters. |

## Basic Type Definitions

### class MotionBlurOptions

```cangjie
public class MotionBlurOptions {
    public MotionBlurOptions (
        public let radius!: Float64,
        public let anchor!: MotionBlurAnchor
    )
}
```

**Function:** Motion blur parameters.

**Initial Version:** 19

#### let radius

```cangjie
public let radius: Float64
```

**Function:** Blur radius, range [0.0, ∞). Recommended to set below 1.0.

**Type:** Float64

**Read/Write:** Read-only

**Initial Version:** 19

#### let anchor

```cangjie
public let anchor: MotionBlurAnchor
```

**Function:** Motion blur anchor coordinates. Must align with the animation scaling anchor.

**Type:** [MotionBlurAnchor](#class-motionbluranchor)

**Read/Write:** Read-only

**Initial Version:** 19

#### MotionBlurOptions(Float64, MotionBlurAnchor)

**Function:** Constructs a `MotionBlurOptions` object.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| radius | Float64 | Yes | - | Blur radius, range [0.0, ∞). Recommended to set below 1.0. |
| anchor | [MotionBlurAnchor](#class-motionbluranchor) | Yes | - | Motion blur anchor coordinates. Must align with the animation scaling anchor. |

### class MotionBlurAnchor

```cangjie
public class MotionBlurAnchor {
    public MotionBlurAnchor (
        public let x!: Float64,
        public let y!: Float64
    )
}
```

**Function:** Motion blur anchor coordinates.

**Initial Version:** 19

#### let x

```cangjie
public let x: Float64
```

**Function:** Anchor coordinate x-value.

**Type:** Float64

**Read/Write:** Read-only

**Initial Version:** 19

#### let y

```cangjie
public let y: Float64
```

**Function:** Anchor coordinate y-value.

**Type:** Float64

**Read/Write:** Read-only

**Initial Version:** 19

#### MotionBlurAnchor(Float64, MotionBlurAnchor)

**Function:** Constructs a `MotionBlurAnchor` object.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | Float64 | Yes | - | Anchor coordinate x-value, range [0.0, 1.0]. |
| y | Float64 | Yes | - | Anchor coordinate y-value, range [0.0, 1.0]. |

## Sample Code (Adding Motion Blur Effect During Property Animation)

Adding motion blur effect during property animation.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    @State var widthSize: Int64 = 400
    @State var heightSize: Int64 = 320
    @State var flag: Bool = true
    @State var radius: Float64 = 0.0
    @State var x: Float64 = 0.0
    @State var y: Float64 = 0.0

    func build() {
        Column() {
            Column() {
                Image(@r(app.media.testImg))
                    .width(this.widthSize)
                    .height(this.heightSize)
                    .onClick(
                        {
                            event: ClickEvent =>
                            this.radius = 5.0
                            this.x = 0.5
                            this.y = 0.5
                            if (this.flag) {
                                this.widthSize = 100
                                this.heightSize = 80
                            } else {
                                this.widthSize = 400
                                this.heightSize = 320
                            }
                            this.flag = !this.flag
                        }
                    )
                    .animationStart(
                        AnimateParam(
                            duration: 2000,
                            curve: Curve.Rhythm,
                            onFinish: {=> this.radius = 0.0}
                        )
                    )
                    .motionBlur(MotionBlurOptions(radius: this.radius, anchor: MotionBlurAnchor(x: this.x, y: this.y)))
            }
        }
        .width(100.percent)
        .margin(top: 5)
    }
}
```

![uni_motionBlur](figures/uni_motionBlur.gif)