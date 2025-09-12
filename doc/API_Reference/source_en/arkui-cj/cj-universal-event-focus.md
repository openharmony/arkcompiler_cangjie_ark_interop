# Focus Events

Focus events are triggered when the page focus moves between focusable components. Components can use focus events to handle related logic.

> **Note:**
>
> - Currently, only triggering via the Tab key or arrow keys on an external keyboard is supported. Key-based focus navigation is not supported in nested scrolling component scenarios.
> - Components with default interaction logic, such as [Button](./cj-button-picker-button.md), are focusable by default. Other components are non-focusable by default and cannot trigger focus events in this state. The `focusable` attribute must be set to `true` to enable focus events.
> - For container components with focus capability, such as [Row](./cj-row-column-stack-row.md), if they contain no focusable child components, the container itself cannot receive focus. Configuring `onClick` or a single-finger tap gesture will implicitly make the component focusable.
> - For focus development and component focus capability, refer to the [Focus Development Guide](../../../Dev_Guide/source_en/arkui-cj/cj-common-events-focus-event.md).

## func onFocus(() -> Unit)

```cangjie
public func onFocus(callback: ()->Unit): This
```

**Function:** Triggered when the current component receives focus.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name     | Type      | Required | Default | Description                              |
|:---------|:----------|:---------|:--------|:-----------------------------------------|
| callback | ()->Unit  | Yes      | -       | Callback function triggered when the component receives focus. |

## func onBlur(() -> Unit)

```cangjie
public func onBlur(callback: ()->Unit): This
```

**Function:** Triggered when the current component loses focus.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Name     | Type      | Required | Default | Description                              |
|:---------|:----------|:---------|:--------|:-----------------------------------------|
| callback | ()->Unit  | Yes      | -       | Callback function triggered when the component loses focus. |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
  @State var oneButtonColor: ResourceColor = Color.PINK
  @State var twoButtonColor: ResourceColor = Color.RED
  @State var threeButtonColor: ResourceColor = Color.GREEN

  func build() {
    Column(space: 20) {
      // Using the up/down keys on an external keyboard moves focus between the three buttons. The button color changes when focused and reverts when blurred.
      Button('First Button')
        .backgroundColor(this.oneButtonColor)
        .width(260)
        .height(70)
        .fontColor(Color.BLACK)
        .focusable(true)
        .onFocus({ =>
          this.oneButtonColor = Color.BLUE
        })
        .onBlur({ =>
          this.oneButtonColor = Color.GRAY
        })
      Button('Second Button')
        .backgroundColor(this.twoButtonColor)
        .width(260)
        .height(70)
        .fontColor(Color.BLACK)
        .focusable(true)
        .onFocus({ =>
          this.twoButtonColor = Color.BLUE
        })
        .onBlur({ =>
          this.twoButtonColor = Color.GRAY
        })
      Button('Third Button')
        .backgroundColor(this.threeButtonColor)
        .width(260)
        .height(70)
        .fontColor(Color.BLACK)
        .focusable(true)
        .onFocus({ =>
          this.threeButtonColor = Color.BLUE
        })
        .onBlur({ =>
          this.threeButtonColor = Color.GRAY
        })
    }.width(100.percent).margin( top: 20 )
  }
}
```

![focus_event](figures/focus_event.png)