# Text Input (TextInput/TextArea)

TextInput and TextArea are input field components, typically used to respond to user input operations such as comment section inputs, chat box inputs, form inputs, etc. They can also be combined with other components to build functional pages, such as login/registration pages. For specific usage, please refer to [TextInput](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-textinput.md) and [TextArea](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-textarea.md).

## Creating Input Fields

TextInput is a single-line input field, while TextArea is a multi-line input field. They can be created using the following interfaces:

```cangjie
init(placeholder!: String = "", text!: String = "", controller!: TextInputController = TextInputController())
```

```cangjie
init(placeholder!: String = "", text!: String = "", controller!: TextAreaController = TextAreaController())
```

- Single-line input field:

    ```cangjie
    TextInput()
    ```

    ![Text](figures/Text.png)

- Multi-line input field:

    ```cangjie
    TextArea()
    ```

    ![Text1](figures/Text1.png)

- Multi-line input field with automatic line wrapping when text exceeds one line:

    ```cangjie
    TextArea(text: "I am TextArea I am TextArea I am TextArea I am TextArea").width(300)
    ```

    ![Text2](figures/Text2.png)

## Setting Input Field Types

TextInput supports the following types: Normal (basic input mode), Password (password input mode), Email (email address input mode), Number (numeric-only input mode), PhoneNumber (phone number input mode), USER_NAME (username input mode), NEW_PASSWORD (new password input mode), NUMBER_PASSWORD (numeric password input mode), NUMBER_DECIMAL (decimal number input mode), and URL (URL input mode). These can be set via the setType property:

- Basic input mode (default type):

    ```cangjie
    TextInput()
    .setType(InputType.Normal)
    ```

    ![Text3](figures/Text3.png)

- Password input mode:

    ```cangjie
    TextInput()
    .setType(InputType.Password)
    ```

    ![Text4](figures/Text4.png)

- Email address input mode:

    ```cangjie
    TextInput()
    .setType(InputType.Email)
    ```

    ![Text5](figures/Text5.png)

- Numeric-only input mode:

    ```cangjie
    TextInput()
    .setType(InputType.Number)
    ```

    ![Text6](figures/Text6.png)

- Phone number input mode:

    ```cangjie
    TextInput()
    .setType(InputType.PhoneNumber)
    ```

    ![Text7](figures/Text7.png)

- Decimal number input mode:

    ```cangjie
    TextInput()
    .setType(InputType.NUMBER_DECIMAL)
    ```

    ![Text8](figures/Text8.png)

- URL input mode:

    ```cangjie
    TextInput()
    .setType(InputType.URL)
    ```

    ![Text9](figures/Text9.png)

## Customizing Styles

- Setting placeholder text when no input is present:

    ```cangjie
    TextInput(placeholder: 'I am placeholder text')
    ```

    ![Text10](figures/Text10.png)

- Setting the current text content of the input field:

    ```cangjie
    TextInput(placeholder: 'I am placeholder text', text: 'I am current text content')
    ```

    ![Text11](figures/Text11.png)

- Changing the background color of the input field using backgroundColor:

    ```cangjie
    TextInput(placeholder: 'I am placeholder text', text: 'I am current text content')
    .backgroundColor(Color.PINK)
    ```

    ![Text12](figures/Text12.png)

    More advanced styling can be achieved by combining with common properties.

## Adding Events

Text fields are primarily used to capture user input and process it into data for submission. Binding the onChange event allows capturing changes in the input field's text content, the onSubmit event captures text submitted via the Enter key, and the onTextSelectionChange event captures position information when text is selected or the cursor is moved during editing. Users can also use common events for corresponding interactive operations.

> **Note:**
>
> - In password mode, when setting the showPassword property, it is recommended to add state synchronization in the onSecurityStateChange callback, as shown in the example below.
> - The onWillInsert, onDidInsert, onWillDelete, and onDidDelete callbacks are only supported in system input method scenarios.

```cangjie
TextInput(text: "", placeholder: "input your word...", controller: TextInputController())
    .setType(InputType.Password)
    .showPassword(this.passwordState)
    .onChange {
        value: String =>
        // Triggered when text content changes
        Hilog.info(0, "onChange", "onChange is triggering: ${value}")
    }
    .onSubmit {
        enterKey: EnterKeyType, event: SubmitEvent =>
        // Triggered when the Enter key is pressed in the input method
        Hilog.info(0, "AppLogCj", "onSubmit is triggering: ")
    }
    .onTextSelectionChange {
        selectionStart: Int32, selectionEnd: Int32 =>
        // Triggered when text selection position changes or cursor position changes during editing
        Hilog.info(0, "onTextSelectionChange", "onTextSelectionChange is triggering: ${selectionStart}, ${selectionEnd}")
    }
    .onSecurityStateChange {
        isShowPassword: Bool =>
        // Triggered when password visibility state changes
        Hilog.info(0, "onSecurityStateChange", "onSecurityStateChange is triggering: ${isShowPassword}")
        this.passwordState = isShowPassword
    }
    .onWillInsert {
        insertValue: Float64, insertOffset: String =>
        // Triggered before input
        Hilog.info(0, "AppLogCj", 'onWillInsert is triggering: ${insertValue}, ${insertOffset}')
        return true
    }
    .onDidInsert {
        insertValue: Float64, insertOffset: String =>
        // Triggered after input is completed
        Hilog.info(0, "AppLogCj", 'onDidInsert is triggering: ${insertValue}, ${insertOffset}')
    }
    .onWillDelete {
        insertValue: Float64, id: Int32, insertOffset: String =>
        // Triggered before deletion
        Hilog.info(0, "onWillDelete", 'onWillDelete is triggering: ${insertValue}, ${id}, ${insertOffset}')
        return true
    }
    .onDidDelete {
        insertValue: Float64, id: Int32, insertOffset: String =>
        // Triggered after deletion is completed
        Hilog.info(0, "onDidDelete", 'onDidDelete is triggering: ${insertValue}, ${id}, ${insertOffset}')
    }
    .onFocus {
        =>
        // Triggered when the input field gains focus (common event)
        Hilog.info(0, "onFocus", 'onFocus is triggering')
    }
```

## Selection Menu

When text in the input field is selected, a menu containing options like Cut, Copy, and Translate will appear.

TextInput:

```cangjie
TextInput(text: 'This is a text used to demonstrate the selection menu')
```

![Text13](figures/Text13.png)

TextArea:

```cangjie
TextArea(text: 'This is a text used to demonstrate the selection menu')
```

![Text13](figures/Text13.png)

## Auto-Fill

Input fields can be configured for auto-fill using the [contentType](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-textinput.md#func-contenttypecontenttype) property.

Supported types can be found in [ContentType](../../../API_Reference/source_zh_cn/arkui-cj/cj-common-types.md#enum-contenttype).

```cangjie
TextInput(placeholder: 'Enter your email...')
    .width(95.percent)
    .height(40)
    .margin(20)
    .contentType(ContentType.EMAIL_ADDRESS)
```

## Keyboard Avoidance

After the keyboard is raised, container components with scrolling capabilities will enable keyboard avoidance during screen orientation changes. For container components without scrolling capabilities, it is recommended to nest them within a scrollable container component such as [Scroll](../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-scroll.md), [List](../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-list.md), or [Grid](../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-grid.md) to enable keyboard avoidance.

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    var placeHolderArr: Array<String> = ["1", "2", "3", "4", "5", "6", "7"];
    func build() {
        Scroll() {
            Column {
                ForEach(this.placeHolderArr, itemGeneratorFunc: {placeholder: String, _: Int64 =>
                TextInput(placeholder: 'TextInput ' + placeholder)
                .margin(30)}
                )
            }
        }
        .height(100.percent)
        .width(100.percent)
    }
}
```

![textinputkeyboardavoid](figures/TextInputKeyboardAvoid.gif)