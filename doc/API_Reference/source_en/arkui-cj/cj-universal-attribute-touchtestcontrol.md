# Touch Test Control

Sets the touch test type for a component. When processing touch events, the ArkUI development framework performs touch tests between the touch point and the component area before triggering the touch event to collect components that need to respond. It then dispatches corresponding touch events based on the touch test results. The `hitTestBehavior` property can configure different touch test response modes, which affect the component's touch test collection results and ultimately influence subsequent touch event dispatching. For specific impacts, refer to the [HitTestMode](./cj-common-types.md#enum-hittestmode) enumeration description.

> **Note:**
>
> When multiple nodes in a Stack component have overlapping touch areas (e.g., two nodes), by default, only the topmost node undergoes touch testing. If you want the underlying node to trigger touch testing, set the `hitTestBehavior` of the topmost node to `HitTestMode.Transparent`.

## func hitTestBehavior(HitTestMode)

```cangjie
public func hitTestBehavior(value: HitTestMode): This
```

**Function:** Sets the touch test type for the component.

**Parameters:**

| Name | Type | Required | Default | Description |
| :------- | :---------- | :------- | :-------- | :---------- |
| value | [HitTestMode](./cj-common-types.md#enum-hittestmode) | Yes | - | Sets the touch test type for the current component.<br/>Initial value: `HitTestMode.Default` |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*
import ohos.hilog.Hilog

@Entry
@Component
class EntryView {
    func build() {
        // Outer stack
        Stack() {
            Button('outer button')
                .backgroundColor(Color.RED)
                .width(100.percent)
                .onTouch({ event =>
                    Hilog.info(
                        0,"test",'outer button touched type: ' + event.eventType.getValue().toString())
                })
            // Inner stack
            Stack() {
                Button('inner button')
                    .width(50.percent)
                    .onTouch({ event =>
                        Hilog.info(
                            0,"test",'inner button touched type: ' + event.eventType.getValue().toString())
                    })
            }
            .width(70.percent)
            .height(70.percent)
            .backgroundColor(Color.GRAY)
            .hitTestBehavior(HitTestMode.Block)
            .onTouch({ event =>
                Hilog.info(0, "test", 'stack touched type: ' + event.eventType.getValue().toString())
            })
            Text('Transparent')
                .hitTestBehavior(HitTestMode.Transparent)
                .width(100.percent)
                .height(100.percent)
                .onTouch({ event =>
                    Hilog.info(0, "test", 'text touched type: ' + event.eventType.getValue().toString())
                })
        }
        .backgroundColor(Color.BLACK)
        .width(300.vp)
        .height(300.vp)
    }
}
```

![uni_response_region](figures/hittestmode.png)