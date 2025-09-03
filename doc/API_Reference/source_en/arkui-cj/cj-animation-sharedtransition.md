# Shared Element Transition (sharedTransition)

The `sharedTransition` property can be set on a component to mark it as a shared element and configure its corresponding transition animation. Shared transitions only occur during page routing (router) navigation.

## Import Module

```cangjie
import kit.ArkUI.*
```

## class SharedTransitionOptions

```cangjie
public class SharedTransitionOptions {
    public var duration: Int32 = 1000
    public var curve: Curve = Curve.Linear
    public var delay: Int32 = 0
    public var motionPath: MotionPathOptions = MotionPathOptions(path: "")
    public var zIndex: Int32 = 0
    public var effectType: SharedTransitionEffectType = SharedTransitionEffectType.Exchange
    public init(
        duration!: Int32 = 1000,
        curve!: Curve = Curve.Linear,
        delay!: Int32 = 0,
        motionPath!: MotionPathOptions = MotionPathOptions(path: ""),
        zIndex!: Int32 = 0,
        effectType!: SharedTransitionEffectType = SharedTransitionEffectType.Exchange
    )
}
```

**Function:** Shared transition configuration options.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var curve

```cangjie
public var curve: Curve = Curve.Linear
```

**Function:** Sets the animation curve for shared transitions.

**Type:** [Curve](./cj-common-types.md#enum-curve)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var delay

```cangjie
public var delay: Int32 = 0
```

**Function:** Sets the delay time for shared transitions.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var duration

```cangjie
public var duration: Int32 = 1000
```

**Function:** Sets the duration for shared transitions.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var effectType

```cangjie
public var effectType: SharedTransitionEffectType = SharedTransitionEffectType.Exchange
```

**Function:** Sets the effect type for shared transitions.

**Type:** [SharedTransitionEffectType](./cj-common-types.md#enum-sharedtransitioneffecttype)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var motionPath

```cangjie
public var motionPath: MotionPathOptions = MotionPathOptions(path: "")
```

**Function:** Sets the motion path for shared transitions.

**Type:** [MotionPathOptions](#class-motionpathoptions)

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### var zIndex

```cangjie
public var zIndex: Int32 = 0
```

**Function:** Sets the z-index for shared transitions.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### init(Int32, Curve, Int32, MotionPathOptions, Int32, SharedTransitionEffectType)

```cangjie
public init(
    duration!: Int32 = 1000,
    curve!: Curve = Curve.Linear,
    delay!: Int32 = 0,
    motionPath!: MotionPathOptions = MotionPathOptions(path: ""),
    zIndex!: Int32 = 0,
    effectType!: SharedTransitionEffectType = SharedTransitionEffectType.Exchange
)
```

**Function:** Constructs a SharedTransitionOptions object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| duration | Int32 | No | 1000 | Sets the duration for shared transitions. |
| curve | [Curve](./cj-common-types.md#enum-curve) | No | Curve.Linear | Sets the animation curve for shared transitions. |
| delay | Int32 | No | 0 | Sets the delay time for shared transitions. |
| motionPath | [MotionPathOptions](#class-motionpathoptions) | No | MotionPathOptions(path: "") | Sets the motion path for shared transitions. |
| zIndex | Int32 | No | 0 | Sets the z-index for shared transitions. |
| effectType | [SharedTransitionEffectType](./cj-common-types.md#enum-sharedtransitioneffecttype) | No | SharedTransitionEffectType.Exchange | Sets the effect type for shared transitions. |

## func sharedTransition(String, SharedTransitionOptions)

```cangjie
public func sharedTransition(id: String, options!: SharedTransitionOptions = SharedTransitionOptions()): This
```

**Function:** Configures shared transition animations.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| id | String | Yes | - | Components with identical non-empty id values across two pages are treated as shared elements, displaying transition effects during page navigation. |
| options | [SharedTransitionOptions](#) | No | SharedTransitionOptions() | Shared transition configuration options. |

## Example Code

This example demonstrates a custom shared element transition effect when clicking an image to navigate between pages.

<!-- run -->

```cangjie
// index.cj
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.__GenerateResource__

@Entry
@Component
class EntryView {
    @State var active: Bool = false
    func build() {
        Column() {
            Image(@r(app.media.startIcon))
                .width(50)
                .height(50)
                .onClick {
                    e => Router.push(url: "Page1")
                }
                .sharedTransition("sharedImage",
                    options: SharedTransitionOptions(duration: 800, curve: Curve.Linear, delay: 100))
        }
    }
}
```

<!-- run -->

```cangjie
// Page1.cj
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.__GenerateResource__

@Entry
@Component
class Page1 {
    func build() {
        Stack() {
            Image(@r(app.media.startIcon))
                .width(150)
                .height(150)
                .sharedTransition(
                    "sharedImage",
                    options: SharedTransitionOptions(duration: 800, curve: Curve.Linear, delay: 100)
                )
        }
        .width(100.percent)
        .height(100.percent)
    }
}
```

![shared_transition](figures/sharedtransition.gif)