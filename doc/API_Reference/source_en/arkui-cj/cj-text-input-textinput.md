# TextInput

A single-line text input component.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Child Components

None

## Creating the Component

### init(ResourceStr, ResourceStr, TextInputController)

```cangjie
public init(placeholder!: ResourceStr = "", text!: ResourceStr = "", controller!: TextInputController = TextInputController())
```

**Function:** Creates a TextInput component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| placeholder | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | No | "" | **Named parameter.** Hint text when there is no input. |
| text | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | No | "" | **Named parameter.** Current text content of the input box. It is recommended to bind the state variable with the text in real-time through the onChange event to avoid abnormal text content in TextInput when the component refreshes. |
| controller | [TextInputController](#class-textinputcontroller) | No | TextInputController() | **Named parameter.** TextInput controller. |

## Common Attributes/Common Events

Common Attributes: All supported.

Common Events: All supported.

## Component Attributes

### func caretColor(ResourceColor)

```cangjie
public func caretColor(value: ResourceColor): This
```

**Function:** Sets the cursor color of the input box.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | Cursor color of the input box.<br>Initial value: 0xFF0A59F7. |

### func customKeyboard(CustomBuilder, Bool)

```cangjie
public func customKeyboard(value: CustomBuilder, supportAvoidance!: Bool = false): This
```

**Function:** Sets a custom keyboard.

> **Note:**
>
> - When a custom keyboard is set, the system input method will not open when the input box is activated; instead, the specified custom component will be loaded.
> - The height of the custom keyboard can be set via the height attribute of the root node of the custom component. The width cannot be set and uses the system default value.
> - The custom keyboard is displayed by overlaying the original interface. When the avoidance mode is not enabled or the input box does not require avoidance, the original interface will not be compressed or lifted.
> - The custom keyboard cannot gain focus but will intercept gesture events.
> - By default, the custom keyboard closes when the input control loses focus. Developers can also control the keyboard closure via the [TextInputController](#class-textinputcontroller).[stopEditing](#func-stopediting) method.
> - If the device supports camera input, setting a custom keyboard will disable camera input for this input box.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [CustomBuilder](./cj-common-types.md#type-custombuilder) | Yes | - | Custom keyboard. Use in combination with [@Builder](../../../Dev_Guide/source_zh_cn/arkui-cj/paradigm/cj-macro-builder.md) and bind method. |
| supportAvoidance | Bool | No | false | **Named parameter.** Whether the custom keyboard supports avoidance functionality. |

### func enableKeyboardOnFocus(Bool)

```cangjie
public func enableKeyboardOnFocus(value: Bool): This
```

**Function:** Sets whether the TextInput actively pulls up the soft keyboard when gaining focus via methods other than clicking. Gaining focus by default binds to the input method.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether to actively pull up the soft keyboard when gaining focus via methods other than clicking.<br>Initial value: true. |

### func enterKeyType(EnterKeyType)

```cangjie
public func enterKeyType(value: EnterKeyType): This
```

**Function:** Sets the input method's enter key type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [EnterKeyType](#enum-enterkeytype) | Yes | - | Input method's enter key type.<br>Initial value: EnterKeyType.Done. |

### func fontColor(ResourceColor)

```cangjie
public func fontColor(value: ResourceColor): This
```

**Function:** Sets the font color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | Font color.<br/>Initial value: 0xE5000000. |

### func fontFamily(ResourceStr)

```cangjie
public func fontFamily(value: ResourceStr): This
```

**Function:** Sets the font list.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | Font list. Default font is 'HarmonyOS Sans'. Currently supports 'HarmonyOS Sans' font and [registered custom fonts](./cj-text-input-text.md#register-custom-fonts). |

### func fontSize(Length)

```cangjie
public func fontSize(value: Length): This
```

**Function:** Sets the font size.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | Font size. When Length is Int64 or Float64, uses fp unit. Percentage strings are not supported.<br/>Initial value: 16.fp. |

### func fontStyle(FontStyle)

```cangjie
public func fontStyle(value: FontStyle): This
```

**Function:** Sets the font style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [FontStyle](./cj-common-types.md#enum-fontstyle) | Yes | - | Font style. Initial value: FontStyle.Normal. |

### func fontWeight(FontWeight)

```cangjie
public func fontWeight(value: FontWeight): This
```

**Function:** Sets the font weight of the text. Setting too large a value may cause truncation in different fonts.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [FontWeight](./cj-common-types.md#enum-fontweight) | Yes | - | Font weight of the text.<br/>Initial value: FontWeight.Normal. |

### func inputFilter(ResourceStr, ?(String) -> Unit)

```cangjie
public func inputFilter(value: ResourceStr, error!: ?(String) -> Unit = None): This
```

**Function:** Sets an input filter via a regular expression.

> **Note:**
>
> Input matching the expression will be displayed; input not matching will be filtered. Only supports single-character matching, not string matching.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | **Named parameter.** Regular expression. |
| error | ?(String)->Unit | No | None | **Named parameter.** Returns the filtered content when the regular match fails. |

### func maxLength(UInt32)

```cangjie
public func maxLength(value: UInt32): This
```

**Function:** Sets the maximum number of input characters for the text.

> **Note:**
>
> By default, there is no limit on the maximum number of input characters. When the maximum character limit is reached, no more characters can be input, and the border turns red.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | UInt32 | Yes | - | Maximum number of input characters for the text. |

### func maxLines(Int32)

```cangjie
public func maxLines(value: Int32): This
```

**Function:** Sets the maximum number of lines of text that can be displayed in inline input style during editing.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int32 | Yes | - | Maximum number of lines of text that can be displayed in inline input style during editing.<br>Initial value: 3.<br>Range: (0, +∞). |

### func placeholderColor(ResourceColor)

```cangjie
public func placeholderColor(value: ResourceColor): This
```

**Function:** Sets the placeholder text color. Does not take effect when InputType is set to Password.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor) | Yes | - | Placeholder text color.<br>Initial value: Follows the theme. |

### func placeholderFont(Length, FontWeight, String, FontStyle)

```cangjie
public func placeholderFont(size!: Length, weight!: FontWeight = FontWeight.W400, family!: String = "",
    style!: FontStyle = FontStyle.Normal): This
```

**Function:** Sets the placeholder text style, including font size, font weight, font family, and font style. Currently supports 'HarmonyOS Sans' font and [registered custom fonts](./cj-text-input-text.md#register-custom-fonts).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| size | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length) | Yes | - | **Named parameter.** Text size. Unit: fp.<br>Initial value: 16.fp. |
| weight | [FontWeight](./cj-common-types.md#enum-fontweight) | No | FontWeight.W400 | **Named parameter.** Font weight of the text. |
| family | String | No | "" | **Named parameter.** Font family list of the text. |
| style | [FontStyle](./cj-common-types.md#enum-fontstyle) | No | FontStyle.Normal | **Named parameter.** Font style of the text. |

### func selectionMenuHidden(Bool)

```cangjie
public func selectionMenuHidden(value: Bool): This
```

**Function:** Sets whether to hide the system text selection menu.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether to hide the system text selection menu.<br/>When set to true, clicking the input box cursor, long-pressing the input box, double-clicking the input box, triple-clicking the input box, or right-clicking the input box will hide the system text selection menu.<br/>When set to false, the system text selection menu will be displayed.<br>Initial value: false. |

### func showUnderline(Bool)

```cangjie
public func showUnderline(value: Bool): This
```

**Function:** Sets whether to enable the underline.

> **Note:**
>
> The default underline color is 0x33182431, default thickness is 1.px, and the text box size is 48.vp. Underline is only supported for InputType.Normal type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether to enable the underline. true means enabled, false means disabled.<br>Initial value: false. |

### func style(TextInputStyle)

```cangjie
public func style(value: TextInputStyle): This
```

**Function:** Sets the input box to default style or inline input style. Inline input style is only supported for InputType.Normal type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [TextInputStyle](#enum-textinputstyle) | Yes | - | Input box style, either default or inline input style.<br>Initial value: TextInputStyle.Default. |

### func textAlign(TextAlign)

```cangjie
public func textAlign(value: TextAlign): This
```

**Function:** Sets the horizontal alignment of text in the input box.

> **Note:**
>
> - Only supports TextAlign.Start, TextAlign.Center, and TextAlign.End.
> - The vertical position of the text paragraph can be controlled via the [align](./cj-universal-attribute-location.md#func-alignalignment) attribute. In this component, the horizontal position of the text paragraph cannot be controlled via the align attribute. That is, Alignment.TopStart, Alignment.Top, and Alignment.TopEnd have the same effect (content at the top), Alignment.Start, Alignment.Center, and Alignment.End have the same effect (content vertically centered), and Alignment.BottomStart, Alignment.Bottom, and Alignment.BottomEnd have the same effect (content at the bottom).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [TextAlign](./cj-common-types.md#enum-textalign) | Yes | - | Horizontal alignment. Only supports TextAlign.Start, TextAlign.Center, and TextAlign.End.<br>Initial value: TextAlign.Start. |## Component Events

### func onChange((String) -> Unit)

```cangjie
public func onChange(callback: (String) -> Unit): This
```

**Function:** Triggers when input content changes.

> **Note:**
>
> In this event, if cursor operations are performed, developers need to adjust cursor logic based on the previewText parameter in pre-commit scenarios to accommodate pre-commit behavior.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | (String)->Unit | Yes | - | Callback function triggered when text content changes. Parameter: Returns current text content. |

### func onCopy((String) -> Unit)

```cangjie
public func onCopy(callback: (String) -> Unit): This
```

**Function:** Triggers when copy operation is performed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | (String)->Unit | Yes | - | Callback function triggered during copy. Parameter: Returns copied text content. |

### func onCut((String) -> Unit)

```cangjie
public func onCut(callback: (String) -> Unit): This
```

**Function:** Triggers when cut operation is performed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | (String)->Unit | Yes | - | Callback function triggered during cut. Parameter: Returns cut text content. |

### func onEditChange((Bool) -> Unit)

```cangjie
public func onEditChange(callback: (Bool) -> Unit): This
```

**Function:** Triggers when input state changes.

> **Note:**
>
> Presence of cursor indicates edit mode; absence indicates non-edit mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | (Bool)->Unit | Yes | - | Callback function triggered when edit state changes. Parameter: Returns current edit state. true indicates active input. |

### func onPaste((String) -> Unit)

```cangjie
public func onPaste(callback: (String) -> Unit): This
```

**Function:** Triggers when paste operation is performed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | (String)->Unit | Yes | - | Callback function triggered during paste. Parameter: Returns pasted text content. |

### func onSubmit((EnterKeyType) -> Unit)

```cangjie
public func onSubmit(callback: (EnterKeyType) -> Unit): This
```

**Function:** Triggers when the Enter key on the input method is pressed.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([EnterKeyType](#enum-enterkeytype))->Unit | Yes | - | Callback function triggered by Enter key or soft keyboard Enter key. Parameter: Current soft keyboard Enter key type. |

## Basic Type Definitions

### class TextInputController

```cangjie
public class TextInputController {
    public init()
}
```

**Function:** Controller for TextInput component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init()

```cangjie
public init()
```

**Function:** Creates a TextInputController object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### func caretPosition(Int32)

```cangjie
public func caretPosition(value: Int32): Unit
```

**Function:** Sets input cursor position. If value < 0, takes 0; if > text length, displays at text end.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Int32 | Yes | - | Character length from string start to cursor position. |

#### func setTextSelection(Int32, Int32, MenuPolicy)

```cangjie
public func setTextSelection(selectionStart: Int32, selectionEnd: Int32, options!: MenuPolicy = MenuPolicy.Default): Unit
```

**Function:** When component is focused, calls this interface to set text selection area with highlight. Text is only selected/highlighted when selectionStart < selectionEnd.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| selectionStart | Int32 | Yes | - | Text selection start position (0 = start of text).<br/>If <0, treated as 0; if > max length, treated as max length. |
| selectionEnd | Int32 | Yes | - | Text selection end position.<br/>If <0, treated as 0; if > max length, treated as max length. |
| options | [MenuPolicy](#enum-menupolicy) | No | MenuPolicy.Default | **Named parameter.** Configuration for text selection. |

#### func stopEditing()

```cangjie
public func stopEditing(): Unit
```

**Function:** Exits edit mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

## enum EnterKeyType

```cangjie
public enum EnterKeyType <: Equatable<EnterKeyType> {
    | Go
    | EntrySearch
    | Send
    | Next
    | Done
    | Previous
    | NewLine
    | ...
}
```

**Function:** Represents keyboard action button types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<EnterKeyType>

### Done

```cangjie
Done
```

**Function:** Displays as "Done" style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### EntrySearch

```cangjie
EntrySearch
```

**Function:** Displays as "Search" style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Go

```cangjie
Go
```

**Function:** Displays "Go" text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### NewLine

```cangjie
NewLine
```

**Function:** Displays as newline style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Next

```cangjie
Next
```

**Function:** Displays as "Next" style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Previous

```cangjie
Previous
```

**Function:** Displays as "Previous" style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Send

```cangjie
Send
```

**Function:** Displays as "Send" style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(EnterKeyType)

```cangjie
public operator func !=(other: EnterKeyType): Bool
```

**Function:** Determines if two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [EnterKeyType](#enum-enterkeytype) | Yes | - | Enum value to compare. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if unequal, false otherwise. |

### func ==(EnterKeyType)

```cangjie
public operator func ==(other: EnterKeyType): Bool
```

**Function:** Determines if two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [EnterKeyType](#enum-enterkeytype) | Yes | - | Enum value to compare. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if equal, false otherwise. |

## enum InputType

```cangjie
public enum InputType <: Equatable<InputType> {
    | Normal
    | Number
    | Email
    | Password
    | PhoneNumber
    | ...
}
```

**Function:** Represents input field types.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- Equatable\<InputType>

### Email

```cangjie
Email
```

**Function:** Email address input mode. Only allows characters supported by standard email format.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Normal

```cangjie
Normal
```

**Function:** Basic input mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Number

```cangjie
Number
```

**Function:** Pure number input mode. Only allows numeric characters.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Password

```cangjie
Password
```

**Function:** Password input mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### PhoneNumber

```cangjie
PhoneNumber
```

**Function:** Phone number input mode. Supports digits, spaces, +, -, *, #, (, ), with unlimited length.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func !=(InputType)

```cangjie
public operator func !=(other: InputType): Bool
```

**Function:** Determines if two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [InputType](#enum-inputtype) | Yes | - | Another enum value. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if unequal, false otherwise. |

### func ==(InputType)

```cangjie
public operator func ==(other: InputType): Bool
```

**Function:** Determines if two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [InputType](#enum-inputtype) | Yes | - | Another enum value. |

**Returns:**

| Type | Description |
|:----|:----|
| Bool | Returns true if equal, false otherwise. |## enum TextInputStyle

```cangjie
public enum TextInputStyle {
    | Default
    | Inline
    | ...
}
```

**Function:** Represents the input style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Default

```cangjie
Default
```

**Function:** Indicates the default style. The cursor width is 1.5vp, and the cursor height is related to the text selection background height and font size.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Inline

```cangjie
Inline
```

**Function:** Indicates the inline input style. The text selection background height matches the input field height. Inline input is suitable for scenarios requiring clear distinction between edit and non-edit states, such as renaming in file list views. Inline input does not support the `showError` attribute and does not allow text drag-and-drop functionality in inline mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

## Example Code

<!--run-->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var text: String = ''
    @State var passwordState: Bool = false
    var controller: TextInputController = TextInputController()

    func build() {
    Column() {
        TextInput(text: this.text, placeholder: 'input your word...', controller: this.controller)
            .placeholderColor(Color.Gray)
            .placeholderFont(size: 14, weight: FontWeight.W100)
            .caretColor(Color.Blue)
            .width(95.percent)
            .height(40)
            .margin(20)
            .fontSize(14)
            .fontColor(Color.Black)
            .inputFilter(value: '[a-z]', error: { info: String =>
              Hilog.error(0, "AppLogCj", "inputFilter error")
            })
            .onChange({ value: String =>
              this.text = value
            })
        Text(this.text)
        Button('Set caretPosition 1')
            .margin(15)
        Button('Get CaretOffset')
            .margin(15)
        // Password input field
        TextInput(placeholder: 'input your password...')
            .width(95.percent)
            .height(40)
            .margin(20)
            .setType(InputType.Password)
            .maxLength(9)
        // Email address autofill type
        TextInput(placeholder: 'input your email...' )
            .width(95.percent)
            .height(40)
            .margin(20)
            .maxLength(9)
            .contentType(ContentType.EMAIL_ADDRESS)
        // Inline style input field
        TextInput( text: 'inline style' )
            .width(95.percent)
            .height(50)
            .margin(20)
            .borderRadius(0)
            .style(TextInputStyle.Inline)
            }.
        width(100.percent)
    }
}
```

![textinput](figures/textinput.png)