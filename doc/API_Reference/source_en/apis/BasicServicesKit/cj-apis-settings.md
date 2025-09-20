# ohos.settings (Setting Data Item Names)

This module provides the capability to access setting data items.

## Importing the Module

```cangjie
import kit.BasicServicesKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-app-ability-ui_ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

## func getValue\<T>(UIAbilityContext, T, String) where T \<: ToString

```cangjie
public func getValue<T>(context: UIAbilityContext, name: T, defValue: String): String where T <: ToString
```

**Function:** Gets the value of a data item.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-app-ability-ui_ability.md#class-uiabilitycontext) | Yes | - | Application context. |
| name | T | Yes | - | Type T must implement the ToString interface. The name of the data item. Data item names fall into the following two categories: <br>- Any existing data item in the above databases. <br>- Data items added by developers themselves. |
| defValue | String | Yes | - | Default value. Set by the developer, returned when the data is not found in the database. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the value of the data item. |

**Exceptions:**

- IllegalArgumentException:

  | Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | The context is invalid. | Context initialization failed | Restart the application |

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

// Define context variable in Global class
public class Global {
    public static var _abilityContext: Option<UIAbilityContext> = None
    public static prop abilityContext: UIAbilityContext {
        get() {
            match (this._abilityContext) {
                case Some(context) => context
                case None => throw Exception("Global.abilityContext is not set")
            }
        }
    }
}

// Set context in UIAbility's onWindowStageCreate method
class MainAbility <: UIAbility {
    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        Global._abilityContext = Some(this.context)
        // ... other code ...
    }
    
    // Example usage
    func exampleGetValue(): Unit {
        try {
            let context = Global.abilityContext
            let value = getValue(context, Date.DateFormat, "MM/dd/yyyy")
            Hilog.info(0, "cangjie_ohos_test", "Succeeded in getting date format: ${value}")
        } catch (e: Exception) {
            Hilog.info(0, "cangjie_ohos_test", "Failed to get date format: ${e.toString()}")
        }
    }
}
```

## func getValue\<T, P>(UIAbilityContext, T, String, P) where T \<: ToStringP \<: ToString

```cangjie
public func getValue<T, P>(context: UIAbilityContext, name: T, defValue: String, domainName: P): String where T <: ToString,
    P <: ToString
```

**Function:** Gets the value of a data item.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-app-ability-ui_ability.md#class-uiabilitycontext) | Yes | - | Application context. |
| name | T | Yes | - | Type T must implement the ToString interface. The name of the data item. Data item names fall into the following two categories: <br>- Any existing data item in the above databases. <br>- Data items added by developers themselves. |
| defValue | String | Yes | - | Default value. Set by the developer, returned when the data is not found in the database. |
| domainName | P | Yes | - | Type P must implement the ToString interface. Specifies the domain name to set: <br> - domainName as DomainName.DEVICE_SHARED, <br>&nbsp;&nbsp;&nbsp;indicates the device property shared domain. <br>- domainName as DomainName.USER_PROPRERTY, <br>&nbsp;&nbsp;&nbsp;indicates the user property domain. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the value of the data item. |

**Exceptions:**

- IllegalArgumentException:

  | Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | The context is invalid. | Context initialization failed | Restart the application |

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleGetValueWithDomain(): Unit {
    try {
        let context = Global.abilityContext
        let value = getValue(context, Display.ScreenBrightnessStatus, "100", DomainName.DeviceShared)
        Hilog.info(0, "cangjie_ohos_test", "Succeeded in getting screen brightness: ${value}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get screen brightness: ${e.toString()}")
    }
}
```

## enum Date

```cangjie
public enum Date <: ToString {
    | DateFormat
    | TimeFormat
    | AutoGainTime
    | AutoGainTimeZone
    | ...
}
```

**Function:** Provides data items for setting time and date formats.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Parent Type:**

- ToString

### AutoGainTime

```cangjie
AutoGainTime
```

**Function:** Whether to automatically obtain the date, time, and time zone from the network. A value of true means automatic retrieval; false means no automatic retrieval.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleAutoGainTime(): Unit {
    try {
        let context = Global.abilityContext
        let autoGainTime = getValue(context, Date.AutoGainTime, "false")
        Hilog.info(0, "cangjie_ohos_test", "Auto gain time setting: ${autoGainTime}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get auto gain time setting: ${e.toString()}")
    }
}
```

### AutoGainTimeZone

```cangjie
AutoGainTimeZone
```

**Function:** Whether to automatically obtain the time zone from NITZ. A value of true means automatic retrieval; false means no automatic retrieval.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleAutoGainTimeZone(): Unit {
    try {
        let context = Global.abilityContext
        let autoGainTimeZone = getValue(context, Date.AutoGainTimeZone, "false")
        Hilog.info(0, "cangjie_ohos_test", "Auto gain time zone setting: ${autoGainTimeZone}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get auto gain time zone setting: ${e.toString()}")
    }
}
```

### DateFormat

```cangjie
DateFormat
```

**Function:** Date format. Date formats include MM/dd/yyyy, dd/MM/yyyy, and yyyy/MM/dd, where MM, dd, and yyyy represent month, day, and year, respectively.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleDateFormat(): Unit {
    try {
        let context = Global.abilityContext
        let dateFormat = getValue(context, Date.DateFormat, "MM/dd/yyyy")
        Hilog.info(0, "cangjie_ohos_test", "Date format setting: ${dateFormat}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get date format setting: ${e.toString()}")
    }
}
```

### TimeFormat

```cangjie
TimeFormat
```

**Function:** Whether time is displayed in 12-hour or 24-hour format. A value of "12" indicates 12-hour format; "24" indicates 24-hour format.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleTimeFormat(): Unit {
    try {
        let context = Global.abilityContext
        let timeFormat = getValue(context, Date.TimeFormat, "24")
        Hilog.info(0, "cangjie_ohos_test", "Time format setting: ${timeFormat}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get time format setting: ${e.toString()}")
    }
}
```

### func toString()

```cangjie
public override func toString(): String
```

**Function:** Returns the data item for setting time and date formats.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The data item for setting time and date formats. |

## enum Display

```cangjie
public enum Display <: ToString {
    | FontScale
    | ScreenBrightnessStatus
    | AutoScreenBrightness
    | ScreenOffTimeout
    | DefaultScreenRotation
    | AnimatorDurationScale
    | TransitionAnimationScale
    | WindowAnimationScale
    | DisplayInversionStatus
    | ...
}
```

**Function:** Provides data items for setting display effects.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Parent Type:**

- ToString

### AnimatorDurationScale

```cangjie
AnimatorDurationScale
```

**Function:** The scaling factor for animation duration. This affects the start delay and duration of all such animations. A value of 0 means the animation ends immediately; the default value is 1.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleAnimatorDuration(): Unit {
    try {
        let context = Global.abilityContext
        let durationScale = getValue(context, Display.AnimatorDurationScale, "1.0")
        Hilog.info(0, "cangjie_ohos_test", "Animator duration scale: ${durationScale}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get animator duration scale: ${e.toString()}")
    }
}
```

### AutoScreenBrightness

```cangjie
AutoScreenBrightness
```

**Function:** When auto-rotation is enabled, this property is invalid. When auto-rotation is disabled, the following values are available: 0 means screen rotation of 0 degrees; 1 means 90 degrees; 2 means 180 degrees; 3 means 270 degrees.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleAutoScreenBrightness(): Unit {
    try {
        let context = Global.abilityContext
        let autoBrightness = getValue(context, Display.AutoScreenBrightness, "0")
        Hilog.info(0, "cangjie_ohos_test", "Auto screen brightness setting: ${autoBrightness}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get auto screen brightness setting: ${e.toString()}")
    }
}
```

### DefaultScreenRotation

```cangjie
DefaultScreenRotation
```

**Function:** When auto-rotation is enabled, this property is invalid. When auto-rotation is disabled, the following values are available: 0 means screen rotation of 0 degrees; 1 means 90 degrees; 2 means 180 degrees; 3 means 270 degrees.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleDefaultScreenRotation(): Unit {
    try {
        let context = Global.abilityContext
        let rotation = getValue(context, Display.DefaultScreenRotation, "0")
        Hilog.info(0, "cangjie_ohos_test", "Default screen rotation setting: ${rotation}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get default screen rotation setting: ${e.toString()}")
    }
}
```

### DisplayInversionStatus

```cangjie
DisplayInversionStatus
```

**Function:** Whether to enable display color inversion. A value of 1 means enabled; 0 means disabled.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleDisplayInversion(): Unit {
    try {
        let context = Global.abilityContext
        let inversion = getValue(context, Display.DisplayInversionStatus, "0")
        Hilog.info(0, "cangjie_ohos_test", "Display inversion status: ${inversion}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get display inversion status: ${e.toString()}")
    }
}
```

### FontScale

```cangjie
FontScale
```

**Function:** The scaling factor for fonts, a floating-point value.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleFontScale(): Unit {
    try {
        let context = Global.abilityContext
        let fontScale = getValue(context, Display.FontScale, "1.0")
        Hilog.info(0, "cangjie_ohos_test", "Font scale setting: ${fontScale}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get font scale setting: ${e.toString()}")
    }
}
```

### ScreenBrightnessStatus

```cangjie
ScreenBrightnessStatus
```

**Function:** Screen brightness. The value ranges from 0 to 255.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleScreenBrightness(): Unit {
    try {
        let context = Global.abilityContext
        let brightness = getValue(context, Display.ScreenBrightnessStatus, "128")
        Hilog.info(0, "cangjie_ohos_test", "Screen brightness setting: ${brightness}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get screen brightness setting: ${e.toString()}")
    }
}
```

### ScreenOffTimeout

```cangjie
ScreenOffTimeout
```

**Function:** The waiting time (in milliseconds) for the device to enter sleep mode after inactivity.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleScreenOffTimeout(): Unit {
    try {
        let context = Global.abilityContext
        let timeout = getValue(context, Display.ScreenOffTimeout, "30000")
        Hilog.info(0, "cangjie_ohos_test", "Screen off timeout setting: ${timeout} ms")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get screen off timeout setting: ${e.toString()}")
    }
}
```

### TransitionAnimationScale

```cangjie
TransitionAnimationScale
```

**Function:** The scaling factor for transition animations. A value of 0 disables transition animations.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleTransitionAnimation(): Unit {
    try {
        let context = Global.abilityContext
        let transitionScale = getValue(context, Display.TransitionAnimationScale, "1.0")
        Hilog.info(0, "cangjie_ohos_test", "Transition animation scale: ${transitionScale}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get transition animation scale: ${e.toString()}")
    }
}
```

### WindowAnimationScale

```cangjie
WindowAnimationScale
```

**Function:** The scaling factor for window animations. A value of 0 disables window animations.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleWindowAnimation(): Unit {
    try {
        let context = Global.abilityContext
        let windowScale = getValue(context, Display.WindowAnimationScale, "1.0")
        Hilog.info(0, "cangjie_ohos_test", "Window animation scale: ${windowScale}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get window animation scale: ${e.toString()}")
    }
}
```

### func toString()

```cangjie
public override func toString(): String
```

**Function:** Returns the data item for setting display effects.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The data item for setting display effects. |

## enum DomainName

```cangjie
public enum DomainName <: ToString {
    | DeviceShared
    | UserProperty
    | ...
}
```

**Function:** Provides domain names for queries.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Parent Type:**

- ToString

### DeviceShared

```cangjie
DeviceShared
```

**Function:** Device property shared domain.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleDeviceShared(): Unit {
    try {
        let context = Global.abilityContext
        let value = getValue(context, Display.ScreenBrightnessStatus, "100", DomainName.DeviceShared)
        Hilog.info(0, "cangjie_ohos_test", "Device shared screen brightness: ${value}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get device shared screen brightness: ${e.toString()}")
    }
}
```

### UserProperty

```cangjie
UserProperty
```

**Function:** User property domain.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

``cangjie
// main_ability.cj

import kit.BasicServicesKit.*
import kit.AbilityKit.*
import kit.PerformanceAnalysisKit.Hilog

func exampleUserProperty(): Unit {
    try {
        let context = Global.abilityContext
        let value = getValue(context, Display.ScreenBrightnessStatus, "100", DomainName.UserProperty)
        Hilog.info(0, "cangjie_ohos_test", "User property screen brightness: ${value}")
    } catch (e: Exception) {
        Hilog.info(0, "cangjie_ohos_test", "Failed to get user property screen brightness: ${e.toString()}")
    }
}
```

### func toString()

```cangjie
public override func toString(): String
```

**Function:** Returns the string corresponding to the query domain name.

**System Capability:** SystemCapability.Applications.Settings.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string corresponding to the query domain name. |