# Component Transition (transition)

Component transition primarily configures transition parameters through the `transition` attribute, displaying transition animations when components are inserted or deleted. It is mainly used to enhance user experience during the insertion and deletion of child components within container components.

> **Note:**
>
> Currently, there are two ways to trigger component transition:
>
> - When a component is inserted or deleted (e.g., due to changes in `if` conditions or `ForEach` adding/removing components), the transition effect will recursively trigger for all newly inserted/deleted components.
> - When the [Visibility](./cj-universal-attribute-visibility.md) attribute of a component changes between visible and invisible, only the transition effect of that component will be triggered.

## Import Module

```cangjie
import kit.ArkUI.*
```

## class RotateOptions

```cangjie
public class RotateOptions {
    public var angle: Float32
    public var x: Float32
    public var y: Float32
    public var z: Float32
    public var centerX: Length
    public var centerY: Length
    public var centerZ: Length
    public var perspective: Float32
    public init(angle: Float32, x!: Float32 = 0.0, y!: Float32 = 0.0, z!: Float32 = 0.0, centerX!: Length = 50.percent,
        centerY!: Length = 50.percent, centerZ!: Length = 0, perspective!: Float32 = 0.0)
}
```

**Function:** Sets rotation parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var angle

```cangjie
public var angle: Float32
```

**Function:** Represents the rotation angle.

**Type:** Float32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var centerX

```cangjie
public var centerX: Length
```

**Function:** Represents the x-coordinate of the component's transformation center point (i.e., anchor point).

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var centerY

```cangjie
public var centerY: Length
```

**Function:** Represents the y-coordinate of the component's transformation center point (i.e., anchor point).

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var centerZ

```cangjie
public var centerZ: Length
```

**Function:** Represents the z-axis anchor point, i.e., the z-axis component of the 3D rotation center point.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var perspective

```cangjie
public var perspective: Float32
```

**Function:** Represents the perspective distance, i.e., the distance from the viewpoint to the z=0 plane.

**Type:** Float32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var x

```cangjie
public var x: Float32
```

**Function:** Represents the x-coordinate of the rotation axis vector.

**Type:** Float32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var y

```cangjie
public var y: Float32
```

**Function:** Represents the y-coordinate of the rotation axis vector.

**Type:** Float32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var z

```cangjie
public var z: Float32
```

**Function:** Represents the z-coordinate of the rotation axis vector.

**Type:** Float32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Float32, Float32, Float32, Float32, Length, Length, Length, Float32)

```cangjie
public init(angle: Float32, x!: Float32 = 0.0, y!: Float32 = 0.0, z!: Float32 = 0.0, centerX!: Length = 50.percent,
    centerY!: Length = 50.percent, centerZ!: Length = 0, perspective!: Float32 = 0.0)
```

**Function:** Constructor for RotateOptions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| angle | Float32 | Yes | - | Rotation angle. Positive values rotate clockwise relative to the rotation axis direction; negative values rotate counterclockwise. |
| x | Float32 | No | 0.0 | **Named parameter.** X-coordinate of the rotation axis vector. |
| y | Float32 | No | 0.0 | **Named parameter.** Y-coordinate of the rotation axis vector. |
| z | Float32 | No | 0.0 | **Named parameter.** Z-coordinate of the rotation axis vector. |
| centerX | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 50.percent | **Named parameter.** X-coordinate of the transformation center point. Represents the x-coordinate of the component's transformation center point (i.e., anchor point). |
| centerY | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 50.percent | **Named parameter.** Y-coordinate of the transformation center point. Represents the y-coordinate of the component's transformation center point (i.e., anchor point). |
| centerZ | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 0 | **Named parameter.** Z-axis anchor point, i.e., the z-axis component of the 3D rotation center point. |
| perspective | Float32 | No | 0.0 | **Named parameter.** Perspective distance, i.e., the distance from the viewpoint to the z=0 plane.<br>The rotation axis and center point are based on the coordinate system settings; the coordinate system does not move when the component is displaced. |

## class ScaleOptions

```cangjie
public class ScaleOptions {
    public var x: Float32
    public var y: Float32
    public var z: Float32
    public var centerX: Length
    public var centerY: Length
    public init(x!: Float32 = 1.0, y!: Float32 = 1.0, z!: Float32 = 1.0, centerX!: Length = 50.percent,
        centerY!: Length = 50.percent)
}
```

**Function:** Sets scaling parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var centerX

```cangjie
public var centerX: Length
```

**Function:** Represents the x-coordinate of the transformation center point.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var centerY

```cangjie
public var centerY: Length
```

**Function:** Represents the y-coordinate of the transformation center point.

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var x

```cangjie
public var x: Float32
```

**Function:** Represents the scaling factor on the x-axis. Values >1 scale up along the x-axis; values between 0 and 1 scale down; values <0 reverse and scale along the x-axis.

**Type:** Float32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var y

```cangjie
public var y: Float32
```

**Function:** Represents the scaling factor on the y-axis. Values >1 scale up along the y-axis; values between 0 and 1 scale down; values <0 reverse and scale along the y-axis.

**Type:** Float32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var z

```cangjie
public var z: Float32
```

**Function:** Represents the scaling factor on the z-axis. Values >1 scale up along the z-axis; values between 0 and 1 scale down; values <0 reverse and scale along the z-axis.

**Type:** Float32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Float32, Float32, Float32, Length, Length)

```cangjie
public init(x!: Float32 = 1.0, y!: Float32 = 1.0, z!: Float32 = 1.0, centerX!: Length = 极客时间 50.percent,
    centerY!: Length = 50.percent)
```

**Function:** Constructor for ScaleOptions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| x | Float32 | No | 1.0 | **Named parameter.** Scaling factor on the x-axis. Values >1 scale up along the x-axis; values between 0 and 1 scale down; values <0 reverse and scale along the x-axis. |
| y | Float32 | No | 1.0 | **Named parameter.** Scaling factor on the y-axis. Values >1 scale up along the y-axis; values between 0 and 1 scale down; values <0 reverse and scale along the y-axis. |
| z | Float32 | No | 1.极客时间 0 | **Named parameter.** Scaling factor on the z-axis. Values >1 scale up along the z-axis; values between 0 and 1 scale down; values <0 reverse and scale along the z-axis. |
| centerX | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 50.percent | **Named parameter.** X-coordinate of the transformation center point. Represents the x-coordinate of the component's transformation center point (i.e., anchor point). |
| centerY | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(../apis/BasicServicesKit/cj-apis-base.md#interface-length) | No | 50.percent | **Named parameter.** Y-coordinate of the transformation center point. Represents the y-coordinate of the component's transformation center point (i.e., anchor point). |

## class TransitionEffect

```cangjie
public class TransitionEffect {
    public static let IDENTITY: TransitionEffect = unsafe {    TransitionEffect(FfiOHOSAceFrameworkTransitionEffectIdentity())}
    public static let OPACITY: TransitionEffect = TransitionEffect.opacity(0.0)
    public static let SLIDE: TransitionEffect = TransitionEffect.asymmetric(TransitionEffect.move(TransitionEdge.Start), TransitionEffect.move(TransitionEdge.End))
    public static let SLIDE_SWITCH: TransitionEffect = unsafe {    TransitionEffect(FfiOHOSAceFrameworkTransitionEffectSlideSwitch())}
}
```

**Function:** Specifies the type of transition effect in function form.

> **Note:**
>
> - TransitionEffect can combine multiple transition effects via the `combine` function. Each effect can specify its own `animation` parameters, and the `animation` parameters from the previous effect can also apply to subsequent effects. For example, `TransitionEffect.OPACITY.animation(AnimateParam(duration: 1000)).combine(TransitionEffect.translate(TranslateOptions(x:100)))` means the 1000ms duration applies to both `OPACITY` and `translate`.
> - The order of precedence for animation parameters is: animation parameters specified in this TransitionEffect > animation parameters specified in previous TransitionEffect > animation parameters in the `animateTo` that triggered the component's appearance/disappearance.
> - If `animateTo` is not used to trigger the transition animation and no animation parameters are specified in TransitionEffect, the component will appear or disappear directly.
> - If the attribute values specified in TransitionEffect are the same as the default values, no transition animation will be generated for that attribute. For example, `TransitionEffect.opacity(1.0).animation(AnimateParam(duration: 1000))` will not generate an opacity animation since the default opacity is also 1.0, causing the component to appear or disappear directly.
> - For more details on `scale` and `rotate` effects, refer to [Graphic Transformation](./cj-universal-attribute-transform.md).
> - If a component's tree attachment/detachment or visibility ([Visibility](./cj-universal-attribute-visibility.md)) changes within an animation scope ([animateTo](./cj-animation-animateto.md), [animation](./cj-animation-animation.md)) and the root component has no `transition` configured, a default opacity transition (`TransitionEffect.OPACITY`) will be added to the component, with animation parameters following the surrounding animation environment. To disable this, explicitly configure `TransitionEffect.IDENTITY` to make the component appear or disappear directly.
> - When triggering a disappearance transition by deleting an entire subtree, ensure the root component of the deleted subtree has sufficient disappearance transition time to see the complete process. See [Example 3](#示例代码3设置父子组件为transition).
> - The static functions provided below are used to construct TransitionEffect objects, while non-static functions operate on constructed TransitionEffect objects to specify combined effects and animation parameters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static let IDENTITY

```cangjie
public static let IDENTITY: TransitionEffect = unsafe {    TransitionEffect(FfiOHOSAceFrameworkTransitionEffectIdentity())}
```

**Function:** Disables transition effects.

**Type:** [TransitionEffect](#class-transitioneffect)

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static let OPACITY

```cangjie
public static let OPACITY: TransitionEffect = TransitionEffect.opacity(0.0)
```

**Function:** Adds an opacity transition effect to the component, fading in from 0 to 1 when appearing and fading out from 1 to 0 when disappearing. Equivalent to `TransitionEffect.opacity(0.0)`.

**Type:** [TransitionEffect](#class-transitioneffect)

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static let SLIDE

```cangjie
public static let SLIDE: TransitionEffect = TransitionEffect.asymmetric(TransitionEffect.move(TransitionEdge.Start), TransitionEffect.move(TransitionEdge.End))
```

**Function:** Sets sliding in from the START edge and sliding out from the END edge. In LTR mode, this means sliding in from the left and out from the right; in RTL mode, sliding in from the right and out from the left. Equivalent to `TransitionEffect.asymmetric(TransitionEffect.move(TransitionEdge.START), TransitionEffect.move(TransitionEdge.END))`.

**Type:** [TransitionEffect](#class-transitioneffect)

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static let SLIDE_SWITCH

```cangjie
public static let SLIDE_SWITCH: TransitionEffect = unsafe {    TransitionEffect(FfiOHOSAceFrameworkTransitionEffectSlideSwitch())}
```

**Function:** Specifies a transition effect where the component slides in from the right with scaling (first shrinking then expanding) when appearing and slides out to the left with scaling when disappearing. Comes with built-in animation parameters (duration: 600ms, curve: cubicBezierCurve(0.24, 0.0, 0.50, 1.0), minimum scale: 0.8), which can be overridden.

**Type:** [TransitionEffect](#class-transitioneffect)

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### static func asymmetric(TransitionEffect, TransitionEffect)

```cangjie
public static func asymmetric(appear: TransitionEffect, disappear: TransitionEffect): TransitionEffect
```

**Function:** Specifies asymmetric transition effects.

> **Note:**
>
> If TransitionEffect is not constructed via `asymmetric`, the effect applies to both appearance and disappearance.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| appear | [TransitionEffect](#class-transitioneffect) | Yes | - | Specifies the appearance transition effect. |
| disappear | [TransitionEffect](#class-trans```markdown
## class TranslateOptions

```cangjie
public class TranslateOptions {
    public var x: Length
    public var y: Length
    public var z: Length
    public init(x!: Length = 0.0.vp, y!: Length = 0.0.vp, z!: Length = 0.0.vp)
}
```

**Function:** Configure translation parameters

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var x

```cangjie
public var x: Length
```

**Function:** Translation distance along the x-axis

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var y

```cangjie
public var y: Length
```

**Function:** Translation distance along the y-axis

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var z

```cangjie
public var z: Length
```

**Function:** Translation distance along the z-axis

**Type:** [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Length, Length, Length)

```cangjie
public init(x!: Length = 0.0.vp, y!: Length = 0.0.vp, z!: Length = 0.0.vp)
```

**Function:** TranslateOptions constructor

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|x|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|No|0.0.vp| **Named parameter.** Translation distance along x-axis.<br>Unit: vp.<br>Value range: (-∞, +∞)|
|y|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|No|0.0.vp| **Named parameter.** Translation distance along y-axis.<br>Unit: vp.<br>Value range: (-∞, +∞)|
|z|[Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length)|No|0.0.vp| **Named parameter.** Translation distance along z-axis.<br>Unit: vp.<br>Value range: (-∞, +∞)|

## enum TransitionEdge

```cangjie
public enum TransitionEdge <: Equatable<TransitionEdge> {
    | Top
    | Bottom
    | Start
    | End
    | ...
}
```

**Function:** Window edge information.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<TransitionEdge>

### Bottom

```cangjie
Bottom
```

**Function:** Sets the bottom edge of the window.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### End

```cangjie
End
```

**Function:** Sets the end edge of the window (right edge in LTR mode, left edge in RTL mode).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Start

```cangjie
Start
```

**Function:** Sets the start edge of the window (left edge in LTR mode, right edge in RTL mode).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Top

```cangjie
Top
```

**Function:** Sets the top edge of the window.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(TransitionEdge)

```cangjie
public operator func !=(other: TransitionEdge): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|other|[TransitionEdge](#enum-transitionedge)|Yes|-|Another enum value for comparison.|

**Return Value:**

| Type | Description |
|:----|:----|
|Bool|Returns true if the enum values are unequal, otherwise returns false.|

### func ==(TransitionEdge)

```cangjie
public operator func ==(other: TransitionEdge): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|other|[TransitionEdge](#enum-transitionedge)|Yes|-|Another enum value for comparison.|

**Return Value:**

| Type | Description |
|:----|:----|
|Bool|Returns true if the enum values are equal, otherwise returns false.|

## func transition(TransitionEffect)

```cangjie
public func transition(value: TransitionEffect): This
```

**Function:** Sets the transition effect for a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|value|[TransitionEffect](<font color="yellow" face="bold">please add lnk</font>)|Yes|-|Specifies the transition effect in function form.|

## func transition(TransitionEffect, ?TransitionFinishCallback)

```cangjie
public func transition(value: TransitionEffect, onFinish: ?TransitionFinishCallback): This
```

**Function:** Sets the transition effect for component insertion/display and removal/hiding, along with a transition animation completion callback.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|value|[TransitionEffect](#class-transitioneffect)|Yes|-|Specifies the transition effect in function form.|
|onFinish|?[TransitionFinishCallback](#type-transitionfinishcallback)|Yes|-|Callback function triggered upon completion of component transition animation.|

## Example Code

### Example 1 (Using the same interface for appearance/disappearance)

This example demonstrates how to use the same TransitionEffect for both appearance and disappearance of an image, where the two processes are inverses of each other.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var flag = true
    @State var show = "show"
    func build() {
        Column {
            Button(this.show)
                .onClick {
                    evt =>
                    AppLog.info("Hello Cangjie")
                    if (this.flag) {
                        this.show = "hide"
                    } else {
                        this.show = "show"
                    }
                    this.flag = !this.flag
                }
                .width(800.px)
                .height(400.px)

            if (this.flag) {
                Button("abc")
                    .width(800.px)
                    .height(400.px)
                    .transition(
                        TransitionEffect
                            .OPACITY
                            .animation(AnimateParam(duration: 2000, curve: Curve.Ease))
                            .combine(TransitionEffect.rotate(RotateOptions(180.0, z: 1.0))))
            }
        }
    }
}
```

![transition](./../../比对/main/arkui-cj/figures/transition_api.gif)

### Example 2 (Using different interfaces for appearance/disappearance)

This example demonstrates using different TransitionEffects for image appearance and disappearance.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var flag = true
    @State var show = "show"
    func build() {
        Column {
            Button(this.show)
                .onClick {
                    evt =>
                    AppLog.info("Hello Cangjie")
                    if (this.flag) {
                        this.show = "hide"
                    } else {
                        this.show = "show"
                    }
                    this.flag = !this.flag
                }
                .width(800.px)
                .height(400.px)

            if (this.flag) {
                Button("abc")
                    .width(800.px)
                    .height(400.px)
                    .transition(
                        TransitionEffect
                            .OPACITY
                            .animation(AnimateParam(duration: 2000, curve: Curve.Ease))
                            .combine(TransitionEffect.rotate(RotateOptions(180.0, z: 1.0))))

                Button("abc")
                    .width(800.px)
                    .height(400.px)
                    .transition(
                        TransitionEffect
                            .asymmetric(
                                TransitionEffect.scale(ScaleOptions()),
                                TransitionEffect.IDENTITY
                            )
                            .animation(AnimateParam(duration: 2000, curve: Curve.Ease)))
            }
        }
    }
}
```

![transition2](./../../比对/main/arkui-cj/figures/transition2_api.gif)

### Example 3 (Setting parent-child components with transition)

This example demonstrates configuring transitions for both parent and child components to achieve image appearance and disappearance.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.__GenerateResource__

@Entry
@Component
class EntryView {
    @State var flag = true
    @State var show = "show"
    func build() {
        Column {
            Button(this.show)
                .onClick {
                    evt =>
                    AppLog.info("Hello Cangjie")
                    if (this.flag) {
                        this.show = "hide"
                    } else {
                        this.show = "show"
                    }
                    this.flag = !this.flag
                }
                .width(800.px)
                .height(400.px)

            if (this.flag) {
                Column() {
                    Row() {
                        Image(@r(app.media.startIcon))
                            .width(150)
                            .height(150)
                            .id("image1")
                            .transition(TransitionEffect
                                .OPACITY
                                .animation(AnimateParam(duration: 2000)))
                    }
                    Image(@r(app.media.startIcon))
                        .width(150)
                        .height(150)
                        .id("image2")
                        .transition(TransitionEffect
                            .OPACITY
                            .animation(AnimateParam(duration: 1000)))
                }.transition(TransitionEffect
                    .OPACITY
                    .animation(AnimateParam(duration: 1000)))
            }
        }
    }
}
``````

![transition3](figures/transition3.gif)
```