# Radio Button

The Radio button is a component typically used to provide interactive selection options for users, where only one option can be selected within a group of Radio buttons. For specific usage, please refer to [Radio](../../../API_Reference/source_zh_cn/arkui-cj/cj-button-picker-radio.md).

## Creating a Radio Button

Radio buttons are created by calling the following interface:

```cangjie
init(value!: String, group!: String, indicatorType!: RadioIndicatorType = RadioIndicatorType.TICK,
indicatorBuilder!: Option<() -> Unit> = Option.None)
```

Where:
- `value` is the name of the radio button
- `group` is the name of the radio button group
- `indicatorType` is the selection indicator style
- `indicatorBuilder` configures a custom component as the selection indicator

The `checked` property sets the radio button's state (`false` or `true`). When set to `true`, the radio button is selected.

Radio buttons support styling for both selected and unselected states.

```cangjie
Radio(value: 'Radio1', group: 'radioGroup')
    .checked(false)
Radio(value: 'Radio2', group: 'radioGroup')
    .checked(true)
```

![Radio](figures/Radio.png)

## Adding Events

In addition to supporting [Universal Events](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-event-click.md), Radio buttons can trigger certain operations upon selection. The `onChange` event can be bound to implement custom behaviors after selection.

```cangjie
Radio(value: 'Radio1', group: 'radioGroup')
    .onChange{ isChecked =>
        if(isChecked) {
        // Operations to perform
        }
    }
Radio(value: 'Radio2', group: 'radioGroup')
    .onChange{ isChecked =>
        if(isChecked) {
        // Operations to perform
        }
    }
```

## Usage Example

Switching sound modes by clicking Radio buttons.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            Column() {
                Radio(value: 'Radio1', group: 'radioGroup')
                    .checked(true)
                    .height(50)
                    .width(50)
                    .onChange {
                        isChecked => if (isChecked) {
                            // Switch to ringing mode
                            PromptAction.showToast(message: 'Ringing mode.')
                        }
                    }
                Text('Ringing')
            }
            Column() {
                Radio(value: 'Radio2', group: 'radioGroup')
                    .height(50)
                    .width(50)
                    .onChange {
                        isChecked => if (isChecked) {
                            // Switch to vibration mode
                            PromptAction.showToast(message: 'Vibration mode.')
                        }
                    }
                Text('Vibration')
            }
            Column() {
                Radio(value: 'Radio3', group: 'radioGroup')
                    .height(50)
                    .width(50)
                    .onChange {
                        isChecked => if (isChecked) {
                            // Switch to silent mode
                            PromptAction.showToast(message: 'Silent mode.')
                        }
                    }
                Text('Silent')
            }
        }
        .height(100.percent)
        .width(100.percent)
        .justifyContent(FlexAlign.Center)
    }
}
```

![Radio1](figures/Radio1.gif)