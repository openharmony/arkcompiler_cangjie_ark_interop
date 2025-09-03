# TextClock

The TextClock component displays the current system time on the device through text. It supports time display across different time zones with precision up to seconds.

Time updates will stop when the component is invisible. The visibility state of the component is determined by [onVisibleAreaChange] handling, where a visibility threshold ratio greater than 0 is considered visible.

## Import Module

```cangjie
import kit.ArkUI.*
```

## Subcomponents

None

## Creating the Component

### init(?Float32, TextClockController)

```cangjie
public init(timeZoneOffset!: ?Float32 = None, controller!: TextClockController = TextClockController())
```

**Function:** Creates a TextClock component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| timeZoneOffset | ?Float32 | No | None | **Named parameter.** Sets the time zone offset.<br/>Range: [-14, 12], representing UTC+12 to UTC-12, where negative values indicate east time zones and positive values indicate west time zones (e.g., UTC+8 is -8). Floating-point numbers within this range will be truncated (decimal part discarded).<br/>Floating-point numbers in the set { 9.5, 3.5, -3.5, -4.5, -5.5, -5.75, -6.5, -9.5, -10.5, -12.75 } will not be truncated.<br/>For countries or regions crossing the International Date Line, -13 (UTC+13) and -14 (UTC+14) ensure the entire country/region shares the same time. If the value is outside the valid range, the system's current time zone offset will be used. |
| controller | [TextClockController](#class-textclockcontroller) | No | TextClockController() | **Named parameter.** Binds a controller to manage the text clock's state. |

## Common Attributes/Common Events

Common Attributes: All supported.

Common Events: All supported.

## Component Attributes

### func fontColor(ResourceColor)

```cangjie
public func fontColor(value: ResourceColor): This
```

**Function:** Sets the font color.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceColor](./cj-common-types.md#interface-resourcecolor) | Yes | - | Font color. |

### func fontFamily(ResourceStr)

```cangjie
public func fontFamily(value: ResourceStr): This
```

**Function:** Sets the font list.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | Font list. |

### func fontSize(Length)

```cangjie
public func fontSize(value: Length): This
```

**Function:** Sets the font size.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [Length](../apis/BasicServicesKit/cj-apis-base.md#interface-length)(./cj-common-types.md#interface-length) | Yes | - | Font size. When fontSize is Int64 or Float64, the unit is fp. Initial value: 16.fp. Percentage values are not supported. |

### func fontStyle(FontStyle)

```cangjie
public func fontStyle(value: FontStyle): This
```

**Function:** Sets the font style.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [FontStyle](./cj-common-types.md#enum-fontstyle) | Yes | - | Font style.<br/>Initial value: FontStyle.Normal |

### func fontWeight(FontWeight)

```cangjie
public func fontWeight(value: FontWeight): This
```

**Function:** Sets the font weight of the text. Setting too large a value may cause truncation in some fonts.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [FontWeight](./cj-common-types.md#enum-fontweight) | Yes | - | Font weight of the text.<br/>Initial value: FontStyle.Normal |

### func format(ResourceStr)

```cangjie
public func format(value: ResourceStr): This
```

**Function:** Sets the time display format, such as "yyyy/MM/dd" or "yyyy-MM-dd".

y: Year (yyyy for full year, yy for last two digits)

M: Month (use MM for two-digit months)

d: Day (use dd for two-digit days)

E: Weekday (use EEEE for full weekday names like "Saturday," E/EE/EEE for short names like "Sat")

H: Hour (24-hour format)

h: Hour (12-hour format)

m: Minute

s: Second

SS: Centiseconds (if the number of S in format is <3, treated as centiseconds)

SSS: Milliseconds (if the number of S in format is >=3, treated as milliseconds)

a: AM/PM (does not take effect when hour format is H)

Date separators: "年月日", "/", "-", "." (custom separators are allowed; separators cannot be letters; Chinese characters are treated as separators)

You can freely combine display formats by arranging year, month, day, weekday, hour, minute, second, and millisecond sub-elements. The maximum update frequency is once per second; setting centisecond or millisecond formats alone is not recommended.

Invalid letters (non-listed above) will be ignored. If the format consists entirely of invalid letters, the display follows the system language and hour format. For example, in Chinese with 12-hour format: "yyyy/MM/dd aa hh:mm:ss.SSS"; in 24-hour format: "yyyy/MM/dd HH:mm:ss.SSS".

If format is empty, the initial value is used.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ResourceStr](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | Time display format, such as `yyyy/MM/dd` or `yyyy-MM-dd`. |

### func textShadow(Array\<ShadowOptions>)

```cangjie
public func textShadow(values: Array<ShadowOptions>): This
```

**Function:** Sets text shadow effects. This method accepts an array for multiple text shadows. Does not support the fill field or smart color mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| values | Array\<[ShadowOptions](./cj-text-input-text.md#class-shadowoptions)> | Yes | - | Text shadow effects. |

### func textShadow(ShadowOptions)

```cangjie
public func textShadow(value: ShadowOptions): This
```

**Function:** Adds shadow effects to the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | [ShadowOptions](./cj-common-types.md#interface-shadowoptions) | Yes | - | Shadow options. |

## Component Events

### func onDateChange((Int64) -> Unit)

```cangjie
public func onDateChange(callback: (Int64) -> Unit): This
```

**Function:** Triggered when the time changes. The callback interval is per second. Not triggered when the component is invisible.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | (Int64)->Unit | Yes | - | Unix Time Stamp, representing the number of seconds since January 1, 1970 (UTC). |

## Basic Type Definitions

### class DateTimeOptions

```cangjie
public class DateTimeOptions {
    public var locale: String
    public var dateStyle: String
    public var timeStyle: String
    public var hourCycle: String
    public var timeZone: String
    public var numberingSystem: String
    public var hour12: Bool
    public var weekday: String
    public var era: String
    public var year: String
    public var month: String
    public var day: String
    public var hour: String
    public var minute: String
    public var second: String
    public var timeZoneName: String
    public var dayPeriod: String
    public var localeMatcher: String
    public var formatMatcher: String


    public init(locale!: String = "zh-Hans-CN", dateStyle!: String = "long", timeStyle!: String = "long",
        hourCycle!: String = "h11", timeZone!: String = "", numberingSystem!: String = "adlm", hour12!: Bool = false,
        weekday!: String = "long", era!: String = "long", year!: String = "numeric", month!: String = "numeric",
        day!: String = "numeric", hour!: String = "numeric", minute!: String = "numeric", second!: String = "numeric",
        timeZoneName!: String = "long", dayPeriod!: String = "long", localeMatcher!: String = "lookup",
        formatMatcher!: String = "basic")
}
```

**Function:** Configurable options for date and time formatting.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var dateStyle

```cangjie
public var dateStyle: String
```

**Function:** Date display format. Options: "long", "short", "medium", "full", "auto".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var day

```cangjie
public var day: String
```

**Function:** Day display format. Options: "numeric", "2-digit".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var dayPeriod

```cangjie
public var dayPeriod: String
```

**Function:** Period display format. Options: "long", "short", "narrow", "auto".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var era

```cangjie
public var era: String
```

**Function:** Era display format. Options: "long", "short", "narrow", "auto".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var formatMatcher

```cangjie
public var formatMatcher: String
```

**Function:** Format matching algorithm. Options: "basic", "best fit".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var hour

```cangjie
public var hour: String
```

**Function:** Hour display format. Options: "numeric", "2-digit".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var hour12

```cangjie
public var hour12: Bool
```

**Function:** Whether to use 12-hour format. If hour12 and hourCycle are unset and the system's 24-hour switch is enabled, the default value is false.

**Type:** Bool

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var hourCycle

```cangjie
public var hourCycle: String
```

**Function:** Hour cycle format. Options: "h11", "h12", "h23", "h24".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var locale

```cangjie
public var locale: String
```

**Function:** Locale parameter, e.g., "zh-Hans-CN".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var localeMatcher

```cangjie
public var localeMatcher: String
```

**Function:** Locale matching algorithm. Options: "lookup", "best fit".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var minute

```cangjie
public var minute: String
```

**Function:** Minute display format. Options: "numeric", "2-digit".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var month

```cangjie
public var month: String
```

**Function:** Month display format. Options: "numeric", "2-digit", "long", "short", "narrow", "auto".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var numberingSystem

```cangjie
public var numberingSystem: String
```

**Function:** Numbering system. Options: "adlm", "ahom", "arab", "arabext", "bali", "beng", "bhks", "brah", "cakm", "cham", "deva", "diak", "fullwide", "gong", "gonm", "gujr", "guru", "hanidec", "hmng", "hmnp", "java", "kali", "khmr", "knda", "lana", "lanatham", "laoo", "latn", "lepc", "limb", "mathbold", "mathdbl", "mathmono", "mathsanb", "mathsans", "mlym", "modi", "mong", "mroo", "mtei", "mymr", "mymrshan", "mymrtlng", "newa", "nkoo", "olck", "orya", "osma", "rohg", "saur", "segment", "shrd", "sind", "sinh", "sora", "sund", "takr", "talu", "tamldec", "telu", "thai", "tibt", "tirh", "vaii", "wara", "wcho".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var second

```cangjie
public var second: String
```

**Function:** Second display format. Options: "numeric", "2-digit".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var timeStyle

```cangjie
public var timeStyle: String
```

**Function:** Time display format. Options: "long", "short", "medium", "full", "auto".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var timeZone

```cangjie
public var timeZone: String
```

**Function:** Time zone (valid IANA time zone ID).

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var timeZoneName

```cangjie
public var timeZoneName: String
```

**Function:** Localized representation of time zone names. Options: "long", "short", "auto".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var weekday

```cangjie
public var weekday: String
```

**Function:** Weekday display format. Options: "long", "short", "narrow", "auto".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### var year

```cangjie
public var year: String
```

**Function:** Year display format. Options: "numeric", "2-digit".

**Type:** String

**Read/Write:** Read-Write

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

#### init(String,## Sample Code

### Example 1 (Setting Text Shadow Style)

This example demonstrates how to set the text shadow style for a text clock using the textShadow property.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State
    var shadowoptions: Array<ShadowOptions> = [
        ShadowOptions(radius: 10.0, shadowType: ShadowType.BLUR, offsetX: 10.0, offsetY: 0.0, color: 0xffff0000,
            fill: false),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.BLUR, offsetX: 20.0, offsetY: 0.0, color: 0xff000000,
            fill: false),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.BLUR, offsetX: 30.0, offsetY: 0.0, color: 0xffc0c0c0,
            fill: false),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.BLUR, offsetX: 40.0, offsetY: 0.0, color: 0xff00ff00,
            fill: false),
        ShadowOptions(radius: 10.0, shadowType: ShadowType.BLUR, offsetX: 100.0, offsetY: 0.0, color: 0xff0000ff,
            fill: false)
    ]
    public func build() {
        Column {
            TextClock().fontSize(50).textShadow(shadowoptions)
        }
    }
}
```

![text_clock1](figures/text_clock1.jpg)

### Example 2 (Text Style Clock with Start/Stop Functionality)

This example shows the basic usage of the TextClock component by setting the clock text format through the format property.

Clicking the "start TextClock" button invokes the callback function to start the text clock using TextClockController. Clicking the "stop TextClock" button pauses the text clock via TextClockController.

The component in this example continuously updates the accumulateTime content when the text clock refreshes by setting the onDateChange callback function.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State
    var accumulateTime: Int64 = 0
    let controller = TextClockController()
    public func build() {
        Column {
            Text('Current milliseconds is ${this.accumulateTime}').fontSize(20).margin(10)
            // Displays system time in UTC+8 using 12-hour format with seconds precision
            TextClock(timeZoneOffset: -8.0, controller: this.controller)
                .format('aa hh:mm:ss')
                .onDateChange({
                    value: Int64 => this.accumulateTime = value
                })
                .margin(20)
                .fontSize(30)
            Button("start TextClock").margin(bottom: 10).onClick {
                evt =>
                // Start text clock
                this.controller.start()
            }
            Button("stop TextClock").onClick {
                evt =>
                // Stop text clock
                this.controller.stop()
            }
        }
    }
}
```

![text_clock2](figures/text_clock2.gif)

### Example 3 (Setting Leading Zero)

This example demonstrates the dateTimeOptions property's functionality for adding or removing leading zeros in the hour field. By default, the 24-hour format hour field includes a leading zero, which can be removed via dateTimeOptions. The 12-hour format hour field normally omits the leading zero, which can be added through dateTimeOptions.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    let numericOption = DateTimeOptions(hour: "numeric")
    let digitOption = DateTimeOptions(hour: "2-digit")
    public func build() {
        Column {
            Row() {
                Text("24-hour format without leading zero:").fontSize(20)
                TextClock().fontSize(20).format("HH:mm:ss").dateTimeOptions(numericOption)
            }
            Row() {
                Text("12-hour format with leading zero:").fontSize(20).margin(10)
                TextClock().fontSize(20).format("aa hh:mm:ss").dateTimeOptions(digitOption)
            }
        }
    }
}
```

![text_clock3](figures/text_clock3.jpg)