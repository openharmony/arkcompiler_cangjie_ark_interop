# ohos.telephony.call

This module provides call management functionalities, including making phone calls, redirecting to the dial interface, obtaining call states, formatting phone numbers, etc.

## Import Module

```cangjie
import kit.TelephonyKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the above example projects and configuration templates, refer to [Cangjie Example Code Guide](../../../guide/cj-example-code-guide.md).

## class Call

```cangjie
public class Call {}
```

**Functionality:** Call management class, providing functionalities such as making phone calls, redirecting to the dial interface, obtaining call states, formatting phone numbers, etc.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

### static func formatPhoneNumber(String, NumberFormatOptions)

```cangjie
public static func formatPhoneNumber(
    phoneNumber: String,
    options!: NumberFormatOptions = NumberFormatOptions()
): String
```

**Functionality:** Formats a phone number with optional formatting parameters.

The formatted phone number is a standard numeric string, e.g., "138 xxxx xxxx", "0755 xxxx xxxx".

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| phoneNumber | String | Yes | - | Phone number. |
| options | [NumberFormatOptions](#class-numberformatoptions) | No | NumberFormatOptions() | **Named parameter.** Formatting parameters, such as country code. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the formatted phone number result. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; |
  | 8300001 | Invalid parameter value. |
  | 8300002 | Operation failed. Cannot connect to service. |
  | 8300003 | System internal error. |
  | 8300999 | Unknown error code. |

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
| countryCode | String | Yes | - | Country code, supports all country codes, e.g., China (CN). |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the E.164 formatted phone number result. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; |
  | 8300001 | Invalid parameter value. |
  | 8300002 | Operation failed. Cannot connect to service. |
  | 8300003 | System internal error. |
  | 8300999 | Unknown error code. |

### static func getCallState()

```cangjie
public static func getCallState(): CallState
```

**Functionality:** Obtains the current call state.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [CallState](#enum-callstate) | Returns the obtained call state. |

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
| Bool | Returns the call existence status. true indicates an ongoing call; false indicates no ongoing call. |

### static func hasVoiceCapability()

```cangjie
public static func hasVoiceCapability(): Bool
```

**Functionality:** Checks whether the current device supports voice call capability.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns the voice call capability status. true indicates the device supports voice calls; false indicates it does not. |

### static func isEmergencyPhoneNumber(String, EmergencyNumberOptions)

```cangjie
public static func isEmergencyPhoneNumber(phoneNumber: String, options!: EmergencyNumberOptions = EmergencyNumberOptions(slotId: 0)): Bool
```

**Functionality:** Determines whether a phone number is an emergency number based on the provided parameters.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| phoneNumber | String | Yes | - | Phone number. |
| options | [EmergencyNumberOptions](#class-emergencynumberoptions) | No | EmergencyNumberOptions(slotId: 0) | Phone number parameters. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns the emergency number check result. true indicates an emergency number; false indicates otherwise. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; |
  | 8300001 | Invalid parameter value. |
  | 8300002 | Operation failed. Cannot connect to service. |
  | 8300003 | System internal error. |
  | 8300999 | Unknown error code. |

### static func makeCall(String)

```cangjie
public static func makeCall(phoneNumber: String): Unit
```

**Functionality:** Redirects to the dial interface and displays the phone number to be dialed. Background calls require the ohos.permission.START_ABILITIES_FROM_BACKGROUND permission.

**System Capability:** SystemCapability.Applications.Contacts

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| phoneNumber | String | Yes | - | Phone number. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; |
  | 8300001 | Invalid parameter value. |
  | 8300002 | Operation failed. Cannot connect to service. |
  | 8300003 | System internal error. |
  | 8300999 | Unknown error code. |

### static func makeCall(UIAbilityContext, String)

```cangjie
public static func makeCall(context: UIAbilityContext, phoneNumber: String): Unit
```

**Functionality:** Redirects to the dial interface and displays the phone number to be dialed. Background calls require the ohos.permission.START_ABILITIES_FROM_BACKGROUND permission.

**System Capability:** SystemCapability.Applications.Contacts

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | Application context Context. |
| phoneNumber | String | Yes | - | Phone number. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; |
  | 8300001 | Invalid parameter value. |
  | 8300002 | Operation failed. Cannot connect to service. |
  | 8300003 | System internal error. |
  | 8300999 | Unknown error code. |

## class EmergencyNumberOptions

```cangjie
public class EmergencyNumberOptions {
    public var slotId: Int32
    public init(slotId!: Int32 = 0)
}
```

**Functionality:** Optional parameters for determining whether a phone number is an emergency number.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

### var slotId

```cangjie
public var slotId: Int32
```

**Functionality:** Represents the SIM slot ID.

**Type:** Int32

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

### init(Int32)

```cangjie
public init(slotId!: Int32 = 0)
```

**Functionality:** Constructor for EmergencyNumberOptions.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| slotId | Int32 | No | 0 | SIM slot ID: Slot 1: 0; Slot 2: 1. |

## class NumberFormatOptions

```cangjie
public class NumberFormatOptions {
    public var countryCode: String
    public init(countryCode!: String = "CN")
}
```

**Functionality:** Optional parameters for formatting phone numbers.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

### var countryCode

```cangjie
public var countryCode: String
```

**Functionality:** Country code, supports all country codes, e.g., CN (China). Default: CN.

**Type:** String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

### init(String)

```cangjie
public init(countryCode!: String = "CN")
```

**Functionality:** Constructor for creating a NumberFormatOptions instance.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| countryCode | String | No | "CN" | Country code, supports all country codes, e.g., CN (China). Default: CN. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TelephonyKit.*

let op = NumberFormatOptions(countryCode: "CN")
```

## enum CallState

```cangjie
public enum CallState <: Equatable<CallState> & ToString {
    | CallStateUnknown
    | CallStateIdle
    | CallStateRinging
    | CallStateOffhook
    | CallStateAnswered
    | ...
}
```

**Functionality:** Call state codes.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21

**Parent Types:**

- Equatable\<CallState>
- ToString

### CallStateAnswered

```cangjie
CallStateAnswered
```

**Functionality:** Indicates that an incoming call has been answered.

**System Capability:** SystemCapability.Telephony.CallManager

**Since Version:** 21### CallStateIdle

```cangjie
CallStateIdle
```

**Function:** Indicates no ongoing call.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

### CallStateOffhook

```cangjie
CallStateOffhook
```

**Function:** Indicates at least one call is in dialing, active, or held state, with no new incoming call ringing or waiting.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

### CallStateRinging

```cangjie
CallStateRinging
```

**Function:** Indicates an incoming call is ringing or waiting.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

### CallStateUnknown

```cangjie
CallStateUnknown
```

**Function:** Invalid state, returned when call state retrieval fails.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

### func !=(CallState)

```cangjie
public operator func !=(other: CallState): Bool
```

**Function:** Determines whether two enum values are unequal.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [CallState](#enum-callstate) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(CallState)

```cangjie
public operator func ==(other: CallState): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [CallState](#enum-callstate) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Retrieves the description of the enum value.

**System Capability:** SystemCapability.Telephony.CallManager

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum value. |