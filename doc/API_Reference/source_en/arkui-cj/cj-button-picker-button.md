# Button

A button component that can quickly create buttons with different styles.

## Child Components

Can contain a single child component.

## Creating the Component

### init(() -> Unit)

```cangjie
public init(child: () -> Unit)
```

**Function:** Creates a button containing child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| child | ()->Unit | Yes | - | The child component contained within the button. |

### init(ResourceStr)

```cangjie
public init(label: ResourceStr)
```

**Function:** Creates a corresponding button component using text content. In this case, the Button cannot contain child components.  
Text content is displayed in a single line by default.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| label | [ResourceStr](./cj-common-types.md#interface-resourcestr) | Yes | - | The text content of the button. When the length of the text exceeds the width of the button itself, the text will be truncated. |

### init(ButtonOptions)

```cangjie
public init(options: ButtonOptions)
```

**Function:** Creates a corresponding button component using text content. In this case, the Button cannot contain child components.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| options | [ButtonOptions](#class-buttonoptions) | Yes | - | Configures the display style of the button. |

### init(ButtonOptions, () -> Unit)

```cangjie
public init(options: ButtonOptions, child: () -> Unit)
```

**Function:** Creates a button that can contain child components and has a display style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| options | [ButtonOptions](#class-buttonoptions) | Yes | - | Configures the display style of the button. |
| child | ()->Unit | Yes | - | The child component contained within the button. |

### init(ResourceStr, ButtonOptions)

```cangjie
public init(label: ResourceStr, options: ButtonOptions)
```

**Function:** Creates a corresponding button component using text content. In this case, the Button cannot contain child components.  
Text content is displayed in a single line by default.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| label | [ResourceStr](./cj-common-types.md#interface-resourcestr) | Yes | - | The text content of the button. <br/>**Note:** <br/>When the length of the text exceeds the width of the button itself, the text will be truncated. |
| options | [ButtonOptions](#class-buttonoptions) | Yes | - | Configures the display style of the button. |

## Common Attributes/Common Events

Common Attributes: All supported.

Common Events: All supported.

## Component Attributes

### func buttonStyle(ButtonStyleMode)

```cangjie
public func buttonStyle(value: ButtonStyleMode): This
```

**Function:** Sets the style and importance level of the Button component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ButtonStyleMode](#enum-buttonstylemode) | Yes | - | The style and importance level of the Button component. <br>Initial value: ButtonStyleMode.Emphasized. |

### func fontColor(ResourceColor)

```cangjie
public func fontColor(color: ResourceColor): This
```

**Function:** Sets the text display color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| color | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | Yes | - | The text display color.

Default value: @r(sys.color.font_on_primary), displayed as white text. |

### func fontFamily(ResourceStr)

```cangjie
public func fontFamily(value: ResourceStr): This
```

**Function:** Sets the font list.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceStr](./cj-common-types.md#interface-resourcestr) | Yes | - | The font list. Default font is 'HarmonyOS Sans'. Currently supports 'HarmonyOS Sans' font and registered custom fonts. |

### func fontSize(Length)

```cangjie
public func fontSize(value: Length): This
```

**Function:** Sets the text display font size.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](./cj-common-types.md#interface-length) | Yes | - | The text display font size.

Default value: When controlSize is ControlSize.NORMAL, the default value is @r(sys.float.Body_L).

When controlSize is ControlSize.SMALL, the default value is @r(sys.float.Body_S).

Note: Percentage values are not supported. |

### func fontStyle(FontStyle)

```cangjie
public func fontStyle(value: FontStyle): This
```

**Function:** Sets the font style of the text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [FontStyle](./cj-common-types.md#enum-fontstyle) | Yes | - | The font style of the text.

Default value: FontStyle.Normal |

### func fontWeight(FontWeight)

```cangjie
public func fontWeight(value: FontWeight): This
```

**Function:** Sets the font weight of the text.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [FontWeight](./cj-common-types.md#enum-fontweight) | Yes | - | The font weight of the text. The larger the value, the bolder the font. Default value: 500 |

### func shape(ButtonType)

```cangjie
public func shape(value: ButtonType): This
```

**Function:** Sets the shape of the Button component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ButtonType](#enum-buttontype) | Yes | - | The shape type of the button. |

### func stateEffect(Bool)

```cangjie
public func stateEffect(value: Bool): This
```

**Function:** Sets whether to enable the pressed state display effect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Whether to enable the pressed state display effect when the button is pressed. When set to false, the pressed effect is disabled. <br/>Initial value: true |

## Basic Type Definitions

### class ButtonOptions

```cangjie
public class ButtonOptions {
    public var shape: ButtonType
    public var stateEffect: Bool
    public var buttonStyle: ButtonStyleMode
    public var controlSize: ControlSize
    public var role: ButtonRole
    public init(
        shape!: ButtonType = ButtonType.Capsule,
        stateEffect!: Bool = true,
        buttonStyle!: ButtonStyleMode = ButtonStyleMode.Emphasized,
        controlSize!: ControlSize = ControlSize.Normal,
        role!: ButtonRole = ButtonRole.Normal
    )
}
```

**Function:** Configures the display style of the button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var buttonStyle

```cangjie
public var buttonStyle: ButtonStyleMode
```

**Function:** Describes the style and importance level of the button.**Type:** [ButtonStyleMode](#enum-buttonstylemode)

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var controlSize

```cangjie
public var controlSize: ControlSize
```

**Description:** Describes the size of the button.

**Type:** [ControlSize](./cj-common-types.md#enum-controlsize)

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var role

```cangjie
public var role: ButtonRole
```

**Description:** Describes the role of the button.

**Type:** [ButtonRole](#enum-buttonrole)

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var shape

```cangjie
public var shape: ButtonType
```

**Description:** Describes the shape of the button.

**Type:** [ButtonType](#enum-buttontype)

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### var stateEffect

```cangjie
public var stateEffect: Bool
```

**Description:** Whether to enable the press state display effect when the button is pressed.

**Type:** Bool

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### init(ButtonType, Bool, ButtonStyleMode, ControlSize, ButtonRole)

```cangjie
public init(
    shape!: ButtonType = ButtonType.Capsule,
    stateEffect!: Bool = true,
    buttonStyle!: ButtonStyleMode = ButtonStyleMode.Emphasized,
    controlSize!: ControlSize = ControlSize.Normal,
    role!: ButtonRole = ButtonRole.Normal
)
```

**Description:** Creates an object of type ButtonOptions.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| shape | [ButtonType](#enum-buttontype) | No | ButtonType.Capsule | **Named parameter.** The shape of the button. |
| stateEffect | Bool | No | true | **Named parameter.** Whether to enable the press state display effect when the button is pressed. When set to false, the press effect is disabled.<br>**Note:**<br>When the press state display effect is enabled, the developer's state style settings will be applied on top of the background color after the state style is set. |
| buttonStyle | [ButtonStyleMode](#enum-buttonstylemode) | No | ButtonStyleMode.EMPHASIZED | **Named parameter.** Describes the style and importance level of the button.<br/>**Note:**<br/>Button importance levels: Emphasized button > Normal button > Textual button. |
| controlSize | [ControlSize](./cj-common-types.md#enum-controlsize) | No | ControlSize.NORMAL | **Named parameter.** Describes the size of the button. |
| role | [ButtonRole](#enum-buttonrole) | No | ButtonRole.NORMAL | **Named parameter.** Describes the role of the button. |

### enum ButtonRole

```cangjie
public enum ButtonRole {
    | Normal
    | Error
}
```

**Description:** The role of the button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Error

```cangjie
Error
```

**Description:** Warning button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Normal

```cangjie
Normal
```

**Description:** Normal button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### enum ButtonStyleMode

```cangjie
public enum ButtonStyleMode {
    | Normal
    | Emphasized
    | Textual
}
```

**Description:** The importance level of the button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Emphasized

```cangjie
Emphasized
```

**Description:** Emphasized button (used to highlight the current operation).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Normal

```cangjie
Normal
```

**Description:** Normal button (for general interface operations).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Textual

```cangjie
Textual
```

**Description:** Textual button (plain text with no background color).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### enum ButtonType

```cangjie
public enum ButtonType {
    | Normal
    | Capsule
    | Circle
    | RoundRectangle
}
```

**Description:** The shape type of the button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Capsule

```cangjie
Capsule
```

**Description:** Capsule-shaped button (rounded corners default to half the height).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Circle

```cangjie
Circle
```

**Description:** Circular button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### Normal

```cangjie
Normal
```

**Description:** Normal button (default with no rounded corners).

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

#### RoundRectangle

```cangjie
RoundRectangle
```

**Description:** Rounded rectangle button.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21