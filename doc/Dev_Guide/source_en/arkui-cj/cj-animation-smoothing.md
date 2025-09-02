# Animation Continuity

In addition to running animations, UI interfaces also carry the function of real-time interaction with users. When user behavior changes according to intent, the UI interface should respond immediately. For example, if a user swipes up to exit during the app launch process, the launch animation should immediately transition to the exit animation, rather than waiting for the launch animation to complete before exiting, thereby reducing user wait time. For scenarios like desktop page flipping where animations are triggered from touch-down to touch-up, the initial speed of the post-touch-up animation should inherit the gesture speed to avoid a sense of pause caused by discontinuous speed transitions. To address these scenarios, the system provides continuity capabilities between animations and between gestures and animations, ensuring smooth transitions in various scenarios while minimizing development complexity.

Assume there is an ongoing animation for a certain animatable property. When UI-side behavior changes the target value of this property, developers only need to modify the property value within the [animateTo](../../../API_Reference/source_zh_cn/arkui-cj/cj-animation-animateto.md#func-animatetoanimateparamunit) animation closure or change the property value affected by the [animationStart](../../../API_Reference/source_zh_cn/arkui-cj/cj-animation-animation.md#func-animationstartanimateparam) interface to generate a new animation. The system will automatically bridge the previous animation with the current one, allowing developers to focus solely on implementing the current single animation.

Example below. By clicking "Click," the scale property of the red square changes. When "Click" is rapidly clicked multiple times, the target value of the scale property continuously changes, and the current animation smoothly transitions toward the new target value.

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Observed
class SetSlt {
    @Publish var isAnimation: Bool = true
    public func set() {
        this.isAnimation = !this.isAnimation
    }

    public func getScale(): Float32 {
        if (this.isAnimation){
            return 2.0
        }
        return 1.0
    }
}

@Entry
@Component
class EntryView {
    @State var SetAnimation: SetSlt = SetSlt()

    func build() {
        Column() {
            Text('ArkUI')
                .fontWeight(FontWeight.Bold)
                .fontSize(12)
                .fontColor(Color.WHITE)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .backgroundColor(0xf56c6c)
                .width(100)
                .height(100)
                .animationStart(AnimateParam(curve: Curve.Ease))
                .scale(x: this.SetAnimation.getScale(), y: this.SetAnimation.getScale())
                .animationEnd()
            Button('Click')
                .margin(top: 200)
                .onClick({evt =>
                    this.SetAnimation.set()
                })
        }
        .width(100.percent)
        .height(100.percent)
        .justifyContent(FlexAlign.Center)
    }
}
```

![animation1](./figures/animation1.gif)

## Gesture-to-Animation Continuity

In scenarios involving gestures like swiping, pinching, or rotating, property changes are typically triggered during the touch-down phase. After touch-up, these properties often continue to change until they reach their target values.

The initial speed of property changes in the post-touch-up phase should match the speed of property changes just before touch-up. If the property change speed starts from zero after touch-up, it would resemble a moving car slamming on the brakes, creating an abrupt visual discontinuity that neither users nor developers desire.

For animations using the [springMotion](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-curves.md#static-func-springmotionfloat32float32float32) curve, the post-touch-up animation automatically inherits the speed of the touch-down animation, starting from the current position of the touch-down animation and moving toward the specified target value.

Example code below demonstrates a ball following touch movement.

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var positionX: Float64 = 100.0
    @State var positionY: Float64 = 100.0
    var diameter: Float64 = 50.0

    func build() {
        Column() {
            Row() {
                Circle(width: this.diameter, height: this.diameter)
                    .fill(Color.BLUE)
                    .animationStart(AnimateParam(curve: Curve.EaseInOut))
                    .position(x: this.positionX, y: this.positionY)
                    .animationEnd()
                    .onTouch({ event: TouchEvent =>
                    if (event.eventType.getValue() == TouchType.Move.getValue()) {
                        this.positionX = event.touches[0].screenX - this.diameter / 2.0
                        this.positionY = event.touches[0].screenY - this.diameter / 2.0
                    } else if (event.eventType.getValue() == TouchType.Up.getValue()) {
                        this.positionX = 100.0
                        this.positionY = 100.0
                    }
                })
            }
            .width(100.percent)
            .height(80.percent)
            .clip(true) // If the ball exceeds the parent component bounds, make it invisible
            .backgroundColor(Color.ORANGE)

            Flex(FlexParams(direction: FlexDirection.Row,justifyContent: FlexAlign.Center, alignItems: ItemAlign.Start)) {
                Text("Drag the ball").fontSize(16)
            }
            .width(100.percent)

            Row() {
                Text('Click position: [x: ${Int64(this.positionX)} y: ${Int64(this.positionY)}]').fontSize(16)
            }
            .padding(10)
            .width(100.percent)
        }
        .width(100.percent)
        .height(100.percent)
    }
}
```

![animation2](./figures/animation2.gif)