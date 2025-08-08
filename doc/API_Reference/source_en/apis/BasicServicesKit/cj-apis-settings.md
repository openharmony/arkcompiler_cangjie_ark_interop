# ohos.settings (Setting Data Item Names)

This module provides the capability to access setting data items.

## Import Module

```cangjie
import kit.BasicServicesKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Example Code Description](../../cj-development-intro.md#Cangjie-Example-Code-Description).

## func getValue\<T>(StageContext, T, String) where T <: ToString

```cangjie
public func getValue<T>(context: StageContext, name: T, defValue: String): String where T <: ToString
```

**Function:** Gets the value of a data item.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application context. For how to obtain the context, see [getStageContext](../AbilityKit/cj-apis-ability.md#func-getstagecontextabilitycontext). |
| name | T | Yes | - | Type T must implement the ToString interface. Name of the data item. Data item names fall into the following two categories:<br>- Any existing data item in the databases mentioned above.<br>- Data items added by developers themselves. |
| defValue | String | Yes | - | Default value. Set by the developer. If the data is not found in the database, this default value is returned. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the value of the data item. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import ohos.ability.getStageContext

let ret = getValue(getStageContext(Global.getAbilityContext()), Display.SCREEN_BRIGHTNESS_STATUS, "50") // The Context application context needs to be obtained. For details, see the usage instructions in this document.
```

## func getValue\<T, P>(StageContext, T, String, P) where T <: ToString, P <: ToString

```cangjie
public func getValue<T, P>(context: StageContext, name: T, defValue: String, domainName: P): String where T <: ToString, P <: ToString
```

**Function:** Gets the value of a data item.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application context. For how to obtain the context, see [getStageContext](../AbilityKit/cj-apis-ability.md#func-getstagecontextabilitycontext). |
| name | T | Yes | - | Type T must implement the ToString interface. Name of the data item. Data item names fall into the following two categories:<br>- Any existing data item in the databases mentioned above.<br>- Data items added by developers themselves. |
| defValue | String | Yes | - | Default value. Set by the developer. If the data is not found in the database, this default value is returned. |
| domainName | P | Yes | - | Type P must implement the ToString interface. Specifies the domain to set.<br> - If domainName is DomainName.DEVICE_SHARED,<br>&nbsp;&nbsp;&nbsp;it indicates the device property shared domain.<br>- If domainName is DomainName.USER_PROPRERTY,<br>&nbsp;&nbsp;&nbsp;it indicates the user property domain. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the value of the data item. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import ohos.ability.*

let ret = getValue(getStageContext(Global.getAbilityContext()), Display.SCREEN_BRIGHTNESS_STATUS, "50", DomainName.USER_PROPERTY) // The Context application context needs to be obtained. For details, see the usage instructions in this document.
```

## enum Date

```cangjie
public enum Date <: ToString {
    | DATE_FORMAT
    | TIME_FORMAT
    | AUTO_GAIN_TIME
    | AUTO_GAIN_TIME_ZONE
    | ...
}
```

**Function:** Provides data items for setting the time and date format.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

**Parent Type:**

- ToString

### AUTO_GAIN_TIME

```cangjie
AUTO_GAIN_TIME
```

**Function:** Whether to automatically obtain the date, time, and time zone from the network. A value of true means to automatically obtain the information from the network; a value of false means not to obtain it automatically.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### AUTO_GAIN_TIME_ZONE

```cangjie
AUTO_GAIN_TIME_ZONE
```

**Function:** Whether to automatically obtain the time zone from NITZ. A value of true means to obtain it automatically; a value of false means not to obtain it automatically.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### DATE_FORMAT

```cangjie
DATE_FORMAT
```

**Function:** Date format. Date formats include MM/dd/yyyy, dd/MM/yyyy, and yyyy/MM/dd, where MM, dd, and yyyy represent the month, day, and year, respectively.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### TIME_FORMAT

```cangjie
TIME_FORMAT
```

**Function:** Whether the time is displayed in 12-hour or 24-hour format. A value of "12" means 12-hour format; a value of "24" means 24-hour format.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### func toString()

```cangjie
public override func toString(): String
```

**Function:** Returns the data item for setting the time and date format.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:------|:------|
| String | Data item for setting the time and date format. |

## enum Display

```cangjie
public enum Display <: ToString {
    | FONT_SCALE
    | SCREEN_BRIGHTNESS_STATUS
    | AUTO_SCREEN_BRIGHTNESS
    | SCREEN_OFF_TIMEOUT
    | DEFAULT_SCREEN_ROTATION
    | ANIMATOR_DURATION_SCALE
    | TRANSITION_ANIMATION_SCALE
    | WINDOW_ANIMATION_SCALE
    | DISPLAY_INVERSION_STATUS
    | ...
}
```

**Function:** Provides data items for setting display effects.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

**Parent Type:**

- ToString

### ANIMATOR_DURATION_SCALE

```cangjie
ANIMATOR_DURATION_SCALE
```

**Function:** Scale factor for animation duration. This affects the start delay and duration of all such animations. A value of 0 means the animation ends immediately. The default value is 1.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### AUTO_SCREEN_BRIGHTNESS

```cangjie
AUTO_SCREEN_BRIGHTNESS
```

**Function:** When automatic screen rotation is enabled, this property is invalid. When automatic rotation is disabled, the following values are available: A value of 0 means the screen is rotated by 0 degrees; a value of 1 means the screen is rotated by 90 degrees; a value of 2 means the screen is rotated by 180 degrees; a value of 3 means the screen is rotated by 270 degrees.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### DEFAULT_SCREEN_ROTATION

```cangjie
DEFAULT_SCREEN_ROTATION
```

**Function:** When automatic screen rotation is enabled, this property is invalid. When automatic rotation is disabled, the following values are available: A value of 0 means the screen is rotated by 0 degrees; a value of 1 means the screen is rotated by 90 degrees; a value of 2 means the screen is rotated by 180 degrees; a value of 3 means the screen is rotated by 270 degrees.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### DISPLAY_INVERSION_STATUS

```cangjie
DISPLAY_INVERSION_STATUS
```

**Function:** Whether to enable display color inversion. A value of 1 means to enable display color inversion; a value of 0 means not to enable it.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### FONT_SCALE

```cangjie
FONT_SCALE
```

**Function:** Scale factor for fonts. The value is a floating-point number.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### SCREEN_BRIGHTNESS_STATUS

```cangjie
SCREEN_BRIGHTNESS_STATUS
```

**Function:** Screen brightness. The value ranges from 0 to 255.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### SCREEN_OFF_TIMEOUT

```cangjie
SCREEN_OFF_TIMEOUT
```

**Function:** Time (in milliseconds) that the device waits before entering sleep mode after being inactive for a period of time.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### TRANSITION_ANIMATION_SCALE

```cangjie
TRANSITION_ANIMATION_SCALE
```

**Function:** Scale factor for transition animations. A value of 0 disables transition animations.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### WINDOW_ANIMATION_SCALE

```cangjie
WINDOW_ANIMATION_SCALE
```

**Function:** Scale factor for window animations. A value of 0 disables window animations.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### func toString()

```cangjie
public override func toString(): String
```

**Function:** Returns the data item for display effect settings.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

**Return Value:**

| Type    | Description |
| :------ | :---------- |
| String  | Data item for display effect settings. |

## enum DomainName

```cangjie
public enum DomainName <: ToString {
    | DEVICE_SHARED
    | USER_PROPERTY
    | ...
}
```

**Function:** Provides query domains.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

**Parent Type:**

- ToString

### DEVICE_SHARED

```cangjie
DEVICE_SHARED
```

**Function:** Device property shared domain.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### USER_PROPERTY

```cangjie
USER_PROPERTY
```

**Function:** User property domain.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

### func toString()

```cangjie
public override func toString(): String
```

**Function:** Returns the string corresponding to the query domain name.

**System Capability:** SystemCapability.Applications.Settings.Core

**Since:** 21

**Return Value:**

| Type    | Description |
| :------ | :---------- |
| String  | String corresponding to the query domain name. |