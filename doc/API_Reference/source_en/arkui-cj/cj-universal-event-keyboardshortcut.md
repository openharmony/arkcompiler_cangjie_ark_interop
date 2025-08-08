# Component Keyboard Shortcut Events

Developers can set custom key combinations for components, with each component capable of having multiple key combinations.

Even when a component is not focused or not displayed on its current page, it will respond to custom key combinations as long as it is mounted on the component tree of the focused window.

When setting key combinations, developers can also define custom events. Pressing the key combination triggers the custom event. If no custom event is set, the key combination behavior defaults to being equivalent to a click event.

## func keyboardShortcut(String, Array\<ModifierKey>, () -> Unit)

```cangjie
public func keyboardShortcut(value: String, keys: Array<ModifierKey>, action: () -> Unit): This
```

**Function:** Sets custom key combinations for a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | A single character for the hotkey (must be a typable character). |
| keys | Array\<[ModifierKey](./cj-common-types.md#enum-modifierkey)> | Yes | - | Key combination. Can only be empty when value is FunctionKey. |
| action | () -> Unit | Yes | - | Callback for the custom event triggered upon successful key combination activation. |

## func keyboardShortcut(FunctionKey, Array\<ModifierKey>, () -> Unit)

```cangjie
public func keyboardShortcut(value: FunctionKey, keys: Array<ModifierKey>, action: () -> Unit): This
```

**Function:** Sets custom key combinations for a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [FunctionKey](./cj-common-types.md#enum-functionkey) | Yes | - | The FunctionKey for the hotkey. |
| keys | Array\<[ModifierKey](./cj-common-types.md#enum-modifierkey)> | Yes | - | Key combination. Can only be empty when value is FunctionKey. |
| action | () -> Unit | Yes | - | Callback for the custom event triggered upon successful key combination activation. |

## func keyboardShortcut(String, Array\<ModifierKey>)

```cangjie
public func keyboardShortcut(value: String, keys: Array<ModifierKey>): This
```

**Function:** Sets custom key combinations for a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | A single character for the hotkey (must be a typable character). |
| keys | Array\<[ModifierKey](./cj-common-types.md#enum-modifierkey)> | Yes | - | Key combination. Can only be empty when value is FunctionKey. |

## func keyboardShortcut(FunctionKey, Array\<ModifierKey>)

```cangjie
public func keyboardShortcut(value: FunctionKey, keys: Array<ModifierKey>): This
```

**Function:** Sets custom key combinations for a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [FunctionKey](./cj-common-types.md#enum-functionkey) | Yes | - | A single character for the hotkey (must be a typable character). |
| keys | Array\<[ModifierKey](./cj-common-types.md#enum-modifierkey)> | Yes | - | Key combination. |

## Keyboard Shortcut Usage Notes

Keyboard shortcuts respond to system key presses and take precedence over regular OnKeyEvent key events. For details on key event triggering logic, see [Key Events](../../../Dev_Guide/source_en/arkui-cj/cj-common-events-device-input-event.md#mouse-events).

| Scenario | Shortcut Handling Logic | Example |
|:---|:---|:---|
| All components supporting onClick events | Support custom key combinations | N/A |
| Custom key combination requirements | Control keys Ctrl, Shift, Alt, or their combinations plus other typable character keys | `Button("button1").keyboardShortcut("a",[ModifierKey.CTRL])` |
| Multiple components with the same key combination | Only the first component in the node tree responds; others ignore the shortcut | `Button("button1").keyboardShortcut("a",[ModifierKey.CTRL])`<br>`Button("button2").keyboardShortcut("a",[ModifierKey.CTRL])` |
| Regardless of component focus state | Shortcuts respond as long as the window is focused | N/A |
| When binding a single shortcut: if the keyboardShortcut interface's value or keys parameter (or both) is empty.<br>When binding multiple shortcuts: shortcuts cannot be canceled. | Canceling shortcut settings | `Button("button1").keyboardShortcut("",[ModifierKey.CTRL])`<br>`Button("button2").keyboardShortcut("a",[])`<br>`Button("button3").keyboardShortcut("",[])` |
| When independent pipeline sub-windows and main windows coexist | The focused window responds to shortcuts | N/A |
| Ctrl, Shift, Alt in keyboardShortcut's keys parameter | Responds regardless of left/right key distinction | `Button("button1").keyboardShortcut("a",[ModifierKey.CTRL, ModifierKey.ALT])` |
| Single-character value in keyboardShortcut interface | Case-insensitive response | `Button("button1").keyboardShortcut("a",[ModifierKey.CTRL])`<br>`Button("button2").keyboardShortcut("A",[ModifierKey.CTRL])` |
| Shortcut response | Responds when all shortcut keys are in down state, with continuous triggering | N/A |
| Hidden components | Respond to shortcuts | N/A |
| Disabled components | Do not respond to shortcuts | N/A |
| 1. When component key combinations (including system predefined shortcuts) conflict.<br>2. When the interface's value parameter contains multiple characters.<br>3. When the interface's keys parameter contains duplicate modifier keys. | These cases prevent key combination binding; previously bound combinations remain valid | `Button("button1").keyboardShortcut("c",[ModifierKey.CTRL])`<br>`Button("button2").keyboardShortcut("ab",[ModifierKey.CTRL])`<br>`Button("button3").keyboardShortcut("ab",[ModifierKey.CTRL,ModifierKey.CTRL])` |

## Prohibited System Shortcut Bindings

The following key combinations cannot be bound as shortcuts:

- Alt + F4
- Alt + Shift + F4
- Alt + TAB
- Alt + Shift + TAB
- Ctrl + Shift + ESC

## Predefined System Key Events

The system already responds to the following key events with specifications as shown below.

These key events have priority relationships with custom key events, where higher-priority events intercept lower-priority ones. For focus event response priorities, see [Key Events](../../../Dev_Guide/source_en/arkui-cj/cj-common-events-device-input-event.md#mouse-events).

| Shortcut | Focused Component | Purpose | Event Handling Category |
|:---|:---|:---|:---|
| Arrow keys, Shift + Arrow keys | Input components | Move cursor | Input method |
| Arrow keys, Shift + Arrow keys | Generic components | Navigate focus when system is in focus traversal mode | System keys |
| TAB, Shift + TAB | Generic components | Trigger focus traversal/switch focus | System keys |

## Example Code

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
  @State var message: String = 'disable'
  @State var shortCutEnable: Bool = false
  @State var keyValue: String = ''

  func build() {
    Row() {
      Column(5) {
        Text('Ctrl+A is ' + this.message)
        Button("Test short cut").onClick({event =>
          this.message = "I clicked Button"
          AppLog.info("I clicked")
        }).keyboardShortcut(this.keyValue, [ModifierKey.CTRL])
        Button(this.message + 'shortCut').onClick({event =>
          this.shortCutEnable = !this.shortCutEnable
          this.message = if(this.shortCutEnable)  {'enable'} else {'disable'}
          this.keyValue = if(this.shortCutEnable)  {'a'} else {''}
        })
        Button('multi-shortcut').onClick({event =>
          AppLog.info('Trigger keyboard shortcut success.')

        }).keyboardShortcut('q', [ModifierKey.CTRL])
          .keyboardShortcut('w', [ModifierKey.CTRL])
          .keyboardShortcut('', []) // Ineffective: components with multiple shortcuts cannot cancel shortcuts
      }
      .width(100.percent)
    }
    .height(100.percent)
  }
}
```

![uni_events_keyboardshortcut](figures/uni_events_keyboardshortcut.png)