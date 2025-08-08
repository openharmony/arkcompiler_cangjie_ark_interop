# ohos.telephony_call (Phone Calls)

This module provides call management functionalities, including making phone calls, redirecting to the dialer interface, obtaining call status, formatting phone numbers, etc.

## Import Module

```cangjie
import kit.TelephonyKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the above example projects and configuration templates, refer to [Cangjie Example Code Instructions](../../cj-development-intro.md#仓颉示例代码说明).

## class TelephonyCall

```cangjie
public class TelephonyCall {}
```

**Functionality:** Phone call class, providing call management functionalities including making phone calls, redirecting to the dialer interface, obtaining call status, formatting phone numbers, and other interfaces.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

### static func formatPhoneNumber(String, NumberFormatOptions)

```cangjie
public static func formatPhoneNumber(phoneNumber: String,
    options!: NumberFormatOptions = NumberFormatOptions("CN")): String
```

**Functionality:** Formats a phone number with configurable parameters.

The formatted phone number will be a standardized numeric string, e.g., "138 xxxx xxxx", "0755 xxxx xxxx".

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| phoneNumber | String | Yes | - | Phone number. |
| options | [NumberFormatOptions](#class-numberformatoptions) | No | NumberFormatOptions("CN") | **Named parameter.** Formatting parameters, such as country code. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the formatted phone number result. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Telephony Subsystem Error Codes](../../errorcodes/cj-errorcode-telephony.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 8300001 | Invalid parameter value. |
  | 8300002 | Operation failed. Cannot connect to service. |
  | 8300003 | System internal error. |
  | 8300999 | Unknown error code. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TelephonyKit.*

let result = TelephonyCall.formatPhoneNumber("138xxxxxxxx", options: NumberFormatOptions("CN"))
```

### static func formatPhoneNumberToE164(String, String)

```cangjie
public static func formatPhoneNumberToE164(phoneNumber: String, countryCode: String): String
```

**Functionality:** Formats a phone number into E.164 representation.

The phone number to be formatted must match the provided country code. For example, a Chinese phone number requires the country code "CN"; otherwise, the formatted result will be null.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| phoneNumber | String | Yes | - | Phone number. |
| countryCode | String | Yes | - | Country code, supports all country codes, e.g., China ("CN"). |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the E.164 formatted phone number result. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Telephony Subsystem Error Codes](../../errorcodes/cj-errorcode-telephony.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 8300001 | Invalid parameter value. |
  | 8300002 | Operation failed. Cannot connect to service. |
  | 8300003 | System internal error. |
  | 8300999 | Unknown error code. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TelephonyKit.*

let result = TelephonyCall.formatPhoneNumberToE164("138xxxxxxxx", "CN")
```

### static func getCallState()

```cangjie
public static func getCallState(): CallState
```

**Functionality:** Retrieves the current call status.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [CallState](#enum-callstate) | Returns the obtained call status. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TelephonyKit.*

let result: CallState = TelephonyCall.getCallState()
```

### static func hasCall()

```cangjie
public static func hasCall(): Bool
```

**Functionality:** Checks whether there is an ongoing call.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns the call existence status. `true` indicates an ongoing call, `false` indicates no call. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TelephonyKit.*

let result: Bool = TelephonyCall.hasCall()
```

### static func hasVoiceCapability()

```cangjie
public static func hasVoiceCapability(): Bool
```

**Functionality:** Checks whether the current device supports voice calls.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns the voice call capability status. `true` indicates support, `false` indicates no support. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TelephonyKit.*

let result: Bool = TelephonyCall.hasVoiceCapability()
```

### static func isEmergencyPhoneNumber(String, EmergencyNumberOptions)

```cangjie
public static func isEmergencyPhoneNumber(phoneNumber: String, options: EmergencyNumberOptions): Bool
```

**Functionality:** Determines whether a phone number is an emergency number based on the provided parameters.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| phoneNumber | String | Yes | - | Phone number. |
| options | [EmergencyNumberOptions](#enum-emergencynumberoptions) | Yes | - | Phone number parameters. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns the emergency number check result. `true` indicates an emergency number, `false` indicates otherwise. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Telephony Subsystem Error Codes](../../errorcodes/cj-errorcode-telephony.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 8300001 | Invalid parameter value. |
  | 8300002 | Operation failed. Cannot connect to service. |
  | 8300003 | System internal error. |
  | 8300999 | Unknown error code. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TelephonyKit.*

let result = TelephonyCall.isEmergencyPhoneNumber("138xxxxxxxx", EmergencyNumberOptions.SLOT_ID_ONE)
```

### static func isEmergencyPhoneNumber(String)

```cangjie
public static func isEmergencyPhoneNumber(phoneNumber: String): Bool
```

**Functionality:** Determines whether a phone number is an emergency number.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| phoneNumber | String | Yes | - | Phone number. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns the emergency number check result. `true` indicates an emergency number, `false` indicates otherwise. ||:----|:----|
|Bool|Returns the result of determining whether it is an emergency phone number. Returns true if it is an emergency phone number, false otherwise.|

**Exceptions:**

- BusinessException: For detailed error codes, please refer to [Telephony Subsystem Error Codes](../../errorcodes/cj-errorcode-telephony.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error.|
  |8300001|Invalid parameter value.|
  |8300002|Operation failed. Cannot connect to service.|
  |8300003|System internal error.|
  |8300999|Unknown error code.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TelephonyKit.*

let result: Bool = TelephonyCall.isEmergencyPhoneNumber("138xxxxxxxx")
```

### static func makeCall(String)

```cangjie
public static func makeCall(phoneNumber: String): Unit
```

**Function:** Jumps to the dial screen and displays the number to be dialed. Background calls require the ohos.permission.START_ABILITIES_FROM_BACKGROUND permission.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|phoneNumber|String|Yes|-|Phone number.|

**Exceptions:**

- BusinessException: For detailed error codes, please refer to [Telephony Subsystem Error Codes](../../errorcodes/cj-errorcode-telephony.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error.|
  |8300001|Invalid parameter value.|
  |8300002|Operation failed. Cannot connect to service.|
  |8300003|System internal error.|
  |8300999|Unknown error code.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TelephonyKit.*
import ohos.ability.UIAbilityContext

TelephonyCall.makeCall("138xxxxxxxx")
```

### static func makeCall(UIAbilityContext, String)

```cangjie
public static func makeCall(context: UIAbilityContext, phoneNumber: String): Unit
```

**Function:** Jumps to the dial screen and displays the number to be dialed. Background calls require the ohos.permission.START_ABILITIES_FROM_BACKGROUND permission.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|context|[UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext)|Yes|-|Application context Context.|
|phoneNumber|String|Yes|-|Phone number.|

**Exceptions:**

- BusinessException: For detailed error codes, please refer to [Telephony Subsystem Error Codes](../../errorcodes/cj-errorcode-telephony.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error.|
  |8300001|Invalid parameter value.|
  |8300002|Operation failed. Cannot connect to service.|
  |8300003|System internal error.|
  |8300999|Unknown error code.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TelephonyKit.*
import ohos.ability.UIAbilityContext

var ctx = Option<UIAbilityContext>.None

TelephonyCall.makeCall(ctx.getOrThrow(), "138xxxxxxxx")
```

## class NumberFormatOptions

```cangjie
public class NumberFormatOptions {
    public let countryCode: String
    public init(countryCode: String)
}
```

**Function:** Optional parameters for formatting phone numbers.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

### let countryCode

```cangjie
public let countryCode: String
```

**Function:** Country code, supports all country codes, e.g., CN (China). Default: CN.

**System Capability:** SystemCapability.Telephony.CallManager

**Type:** String

**Read-Write Capability:** Read-only

**Since:** 21

### init(String)

```cangjie
public init(countryCode: String)
```

**Function:** Constructor for creating a NumberFormatOptions instance.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|countryCode|String|Yes|-|Country code, supports all country codes, e.g., CN (China). Default: CN.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TelephonyKit.*

let op = NumberFormatOptions("CN")
```

## enum CallState

```cangjie
public enum CallState {
    | CALL_STATE_UNKNOWN
    | CALL_STATE_IDLE
    | CALL_STATE_RINGING
    | CALL_STATE_OFFHOOK
    | ...
}
```

**Function:** Call state codes.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

### CALL_STATE_IDLE

```cangjie
CALL_STATE_IDLE
```

**Function:** Indicates no ongoing call.

**Since:** 21

### CALL_STATE_OFFHOOK

```cangjie
CALL_STATE_OFFHOOK
```

**Function:** Indicates at least one call is in dialing, active, or hold state, with no new incoming call ringing or waiting.

**Since:** 21

### CALL_STATE_RINGING

```cangjie
CALL_STATE_RINGING
```

**Function:** Indicates an incoming call is ringing or waiting.

**Since:** 21

### CALL_STATE_UNKNOWN

```cangjie
CALL_STATE_UNKNOWN
```

**Function:** Invalid state, returned when call state retrieval fails.

**Since:** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Gets the numerical value corresponding to the enumeration type.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Int32|Numerical value corresponding to the enumeration type.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TelephonyKit.*

let i = CallState.CALL_STATE_IDLE.getValue()
```

## enum EmergencyNumberOptions

```cangjie
public enum EmergencyNumberOptions {
    | SLOT_ID_ONE
    | SLOT_ID_TWO
    | ...
}
```

**Function:** Optional parameters for the isEmergencyPhoneNumber function.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

### SLOT_ID_ONE

```cangjie
SLOT_ID_ONE
```

**Function:** Slot 1.

**Since:** 21

### SLOT_ID_TWO

```cangjie
SLOT_ID_TWO
```
**Feature:** Slot 2.

**Initial Version:** 21