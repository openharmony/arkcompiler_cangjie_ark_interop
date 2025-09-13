# Button

Button is a component used to respond to user click actions, with types including capsule button, circular button, and regular button. When used as a container, Button can incorporate child components to create buttons containing elements such as text and images. For specific usage, refer to [Button](../../../API_Reference/source_en/arkui-cj/cj-button-picker-button.md).

## Creating a Button

Buttons are created by calling interfaces, which can be done in two ways:

- Creating a button without child components using label and [ButtonOptions](../../../API_Reference/source_en/arkui-cj/cj-button-picker-button.md#class-buttonoptions). Examples include the `shape` and `stateEffect` properties in ButtonOptions.

  ```cangjie
  init(label: String, options: ButtonOptions)
  ```

  Here, `label` sets the button text, `type` defines the Button type, and the `stateEffect` property determines whether the Button has a click effect.

  ```cangjie
  Button('Ok', ButtonOptions(shape: ButtonType.Normal, stateEffect: true))
      .borderRadius(8)
      .backgroundColor(0x317aff)
      .width(90)
      .height(40)
  ```

  ![Button](figures/Button.png)

- Creating a button with child components using [ButtonOptions](../../../API_Reference/source_en/arkui-cj/cj-button-picker-button.md#class-buttonoptions). Examples include the `shape` and `stateEffect` properties in ButtonOptions.

  ```cangjie
  init(options: ButtonOptions, content: () -> Unit)
  ```

  Only one child component is supported, which can be either a basic component or a container component.

## Setting Button Types

Button has four optional types: Capsule, Circle, Normal, and ROUNDED_RECTANGLE, configured via the `shape` property.

- Capsule Button (default type).

  The corners of this button type are automatically set to half the height and cannot be reconfigured using the `borderRadius` property.

  ```cangjie
  Button('Disable', ButtonOptions(shape: ButtonType.Capsule, stateEffect: false))
      .backgroundColor(0x317aff)
      .width(90)
      .height(40)
  ```

  ![Button3](figures/Button3.png)

- Circular Button.

  This button type is circular and does not support corner reconfiguration via the `borderRadius` property.

  ```cangjie
  Button('Circle', ButtonOptions(shape: ButtonType.Circle, stateEffect: false))
      .backgroundColor(0x317aff)
      .width(90)
      .height(90)
  ```

  ![Button4](figures/Button4.png)

- Normal Button.

  This button type has a default corner radius of 0 and supports reconfiguration via the `borderRadius` property.

  ```cangjie
  Button('Ok', ButtonOptions(shape: ButtonType.Normal, stateEffect: true))
      .borderRadius(8)
      .backgroundColor(0x317aff)
      .width(90)
      .height(40)
  ```

  ![Button5](figures/Button5.png)

- Rounded Rectangle Button.

  When [controlSize](../../../API_Reference/source_en/arkui-cj/cj-button-picker-button.md#func-controlsizecontrolsize) is NORMAL, the default corner radius is 20.vp; when [controlSize](../../../API_Reference/source_en/arkui-cj/cj-button-picker-button.md#func-controlsizecontrolsize) is SMALL, the radius is 14.vp. The `borderRadius` property can reconfigure the corners.

  ```cangjie
  Button('Disable', ButtonOptions(shape: ButtonType.ROUNDED_RECTANGLE, stateEffect: true))
      .backgroundColor(0x317aff)
      .width(90)
      .height(40)
  ```

  ![Button11](figures/Button11.png)

## Customizing Styles

- Setting Border Radius.

  Use common properties to customize button styles. For example, configure the border radius via the `borderRadius` property.

  ```cangjie
  Button('circle border', ButtonOptions(shape: ButtonType.Normal))
      .borderRadius(20)
      .height(40)
  ```

  ![Button6](figures/Button6.png)

- Setting Text Style.

  Apply text styles to customize the display of button text.

  ```cangjie
  Button('font style', ButtonOptions(shape: ButtonType.Normal))
      .fontSize(20)
      .fontColor(0xFEC0CD)
      .fontWeight(W800)
  ```

  ![Button7](figures/Button7.png)

- Setting Background Color.

  Use the `backgroundColor` property to define the button's background color.

  ```cangjie
  Button('background color').backgroundColor(0xF55A42)
  ```

  ![Button8](figures/Button8.png)

- Creating Functional Buttons.

  Create a button for delete operations.

  ```cangjie
  Button(ButtonOptions(shape: ButtonType.Circle, stateEffect: true)) {
      Image(@r(app.media.ic_public_delete_filled))
        .width(30)
        .height(30)
  }
  .width(55)
  .height(55)
  .margin(left:20)
  .backgroundColor(0xF55A42)
  ```

  ![Button9](figures/Button9.png)

## Adding Events

Button components are typically used to trigger actions. Bind the `onClick` event to define custom behaviors in response to clicks.

```cangjie
  Button('Ok', ButtonOptions(shape: ButtonType.Normal, stateEffect: true))
      .onClick{ evt =>
      AppLog.info('Button onClick')
  }
```