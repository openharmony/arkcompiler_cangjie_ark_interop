# Toggle Button (Toggle)

The Toggle component provides state button styles, checkbox styles, and switch styles, typically used for switching between two states. For specific usage, please refer to [Toggle](../../../API_Reference/source_zh_cn/arkui-cj/cj-button-picker-toggle.md).

## Creating a Toggle Button

Toggle is created by calling an interface with the following syntax:

```cangjie
Toggle(toggleType: ToggleType, isOn!: Bool = false)
```

Where `ToggleType` specifies the switch type, including `ButtonType`, `CheckboxType`, and `SwitchType`, and `isOn` represents the state of the toggle button.

There are two forms of interface calls:

- Creating a Toggle without child components.
  When `ToggleType` is `CheckboxType` or `SwitchType`, it creates a Toggle without child components:

  ```cangjie
  Toggle(ToggleType.CheckboxType, isOn: false)
  Toggle(ToggleType.CheckboxType, isOn: true)
  ```

  ![Toggle](figures/Toggle.png)

  ```cangjie
  Toggle(ToggleType.SwitchType, isOn: false)
  Toggle(ToggleType.SwitchType, isOn: true)
  ```

  ![Toggle1](figures/Toggle1.png)

- Creating a Toggle with child components.

  When `ToggleType` is `ButtonType`, it can only contain one child component. If the child component has text settings, the corresponding text content will be displayed on the button.

  ```cangjie
  Toggle(ToggleType.ButtonType, false) {
      Text('status button')
          .fontColor(0x182431)
          .fontSize(12)
  }.width(100)
  Toggle(ToggleType.ButtonType, true) {
      Text('status button')
          .fontColor(0x182431)
          .fontSize(12)
  }.width(100)
  ```

  ![Toggle2](figures/Toggle2.png)

## Customizing Styles

- Use the `selectedColor` property to set the background color when the Toggle is in the "on" state.

  ```cangjie
  Toggle(ToggleType.ButtonType, true) {
      Text('status button')
          .fontColor(0x182431)
          .fontSize(12)
  }
      .width(100)
      .selectedColor(Color.PINK)
  Toggle(ToggleType.CheckboxType, isOn: true).selectedColor(Color.PINK)
  Toggle(ToggleType.SwitchType, isOn: true).selectedColor(Color.PINK)
  ```

  ![Toggle3](figures/Toggle3.png)

- Use the `switchPointColor` property to set the color of the circular slider for `SwitchType`. This only applies when `toggleType` is `ToggleType.SwitchType`.

  ```cangjie
  Toggle(ToggleType.SwitchType, isOn: false).switchPointColor(Color.PINK)
  Toggle(ToggleType.SwitchType, isOn: true).switchPointColor(Color.PINK)
  ```

  ![Toggle4](figures/Toggle4.png)

## Adding Events

In addition to supporting [Universal Events](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-event-click.md), Toggle can also trigger certain actions when selected or deselected. You can bind the `onChange` event to respond with custom behavior after the operation.

```cangjie
Toggle(ToggleType.SwitchType, isOn: false)
    .onChange {
        isOn => if (isOn) {
            // Actions to be performed
        }
    }
```

## Usage Example

Toggle is used to switch the Bluetooth state.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Row() {
                Text("Bluetooth Mode")
                    .height(50)
                    .fontSize(16)
            }
            Row() {
                Text("Bluetooth")
                    .height(50)
                    .padding(left: 10)
                    .fontSize(16)
                    .textAlign(TextAlign.Start)
                    .backgroundColor(0xFFFFFF)
                Toggle(ToggleType.SwitchType)
                    .margin(left: 200, right: 10)
                    .onChange {
                        isOn => if (isOn) {
                            PromptAction.showToast(message: 'Bluetooth is on.')
                        } else {
                            PromptAction.showToast(message: 'Bluetooth is off.')
                        }
                    }
            }.backgroundColor(0xFFFFFF)
        }
            .padding(10)
            .backgroundColor(0xDCDCDC)
            .width(100.percent)
            .height(100.percent)
    }
}
```

![Toggle5](figures/Toggle5.gif)