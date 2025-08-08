# ohos.telephony_call（拨打电话）

该模块提供呼叫管理功能，包括拨打电话、跳转到拨号界面、获取通话状态、格式化电话号码等。

## 导入模块

```cangjie
import kit.TelephonyKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## class TelephonyCall

```cangjie
public class TelephonyCall {}
```

**功能：** 拨打电话类，提供呼叫管理功能，包括拨打电话、跳转到拨号界面、获取通话状态、格式化电话号码等接口。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

### static func formatPhoneNumber(String, NumberFormatOptions)

```cangjie
public static func formatPhoneNumber(phoneNumber: String,
    options!: NumberFormatOptions = NumberFormatOptions("CN")): String
```

**功能：** 格式化电话号码，可设置格式化参数。

电话号码格式化后为标准数字字串，例如：“138 xxxx xxxx”、“0755 xxxx xxxx”。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|phoneNumber|String|是|-|电话号码。|
|options|[NumberFormatOptions](#class-numberformatoptions)|否|NumberFormatOptions("CN")| **命名参数。** 格式化参数，如国家码。|

**返回值：**

|类型|说明|
|:----|:----|
|String|返回格式化电话号码的结果。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[电话子系统错误码](../../errorcodes/cj-errorcode-telephony.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |8300001|Invalid parameter value.|
  |8300002|Operation failed. Cannot connect to service.|
  |8300003|System internal error.|
  |8300999|Unknown error code.|

**示例：**

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

**功能：** 将电话号码格式化为E.164表示形式。

待格式化的电话号码需要与传入的国家码相匹配，如中国电话号码需要传入国家码CN，否则格式化后的电话号码为null。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|phoneNumber|String|是|-|电话号码。|
|countryCode|String|是|-|国家码，支持所有国家码，如：中国（CN）。|

**返回值：**

|类型|说明|
|:----|:----|
|String|返回将电话号码格式化为E.164表示形式的结果。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[电话子系统错误码](../../errorcodes/cj-errorcode-telephony.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |8300001|Invalid parameter value.|
  |8300002|Operation failed. Cannot connect to service.|
  |8300003|System internal error.|
  |8300999|Unknown error code.|

**示例：**

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

**功能：** 获取当前通话状态。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[CallState](#enum-callstate)|返回获取到的通话状态。|

**示例：**

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

**功能：** 判断是否存在通话。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回判断是否存在通话。返回true表示当前存在通话，false表示当前不存在通话。|

**示例：**

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

**功能：** 检查当前设备是否具备语音通话能力。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回判断是否具备语音通话能力。返回true表示设备具备语音通话能力，返回false表示设备不具备语音通话能力。|

**示例：**

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

**功能：** 根据电话号码参数，判断是否是紧急电话号码。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|phoneNumber|String|是|-|电话号码。|
|options|[EmergencyNumberOptions](#enum-emergencynumberoptions)|是|-|电话号码参数。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回判断是否是紧急电话号码的结果。返回true表示是紧急电话号码，返回false表示不是紧急电话号码。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[电话子系统错误码](../../errorcodes/cj-errorcode-telephony.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |8300001|Invalid parameter value.|
  |8300002|Operation failed. Cannot connect to service.|
  |8300003|System internal error.|
  |8300999|Unknown error code.|

**示例：**

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

**功能：** 判断是否是紧急电话号码。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|phoneNumber|String|是|-|电话号码。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回判断是否是紧急电话号码的结果。返回true表示是紧急电话号码，返回false表示不是紧急电话号码。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[电话子系统错误码](../../errorcodes/cj-errorcode-telephony.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |8300001|Invalid parameter value.|
  |8300002|Operation failed. Cannot connect to service.|
  |8300003|System internal error.|
  |8300999|Unknown error code.|

**示例：**

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

**功能：** 跳转到拨号界面，并显示待拨出的号码。后台调用需要申请ohos.permission.START_ABILITIES_FROM_BACKGROUND权限。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|phoneNumber|String|是|-|电话号码。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[电话子系统错误码](../../errorcodes/cj-errorcode-telephony.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |8300001|Invalid parameter value.|
  |8300002|Operation failed. Cannot connect to service.|
  |8300003|System internal error.|
  |8300999|Unknown error code.|

**示例：**

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

**功能：** 跳转到拨号界面，并显示待拨出的号码。后台调用需要申请ohos.permission.START_ABILITIES_FROM_BACKGROUND权限。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext)|是|-|应用上下文Context。|
|phoneNumber|String|是|-|电话号码。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[电话子系统错误码](../../errorcodes/cj-errorcode-telephony.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |8300001|Invalid parameter value.|
  |8300002|Operation failed. Cannot connect to service.|
  |8300003|System internal error.|
  |8300999|Unknown error code.|

**示例：**

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

**功能：** 格式化号码的可选参数。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

### let countryCode

```cangjie
public let countryCode: String
```

**功能：** 国家码，支持所有国家的国家码，如：CN（中国）。默认为：CN。

**系统能力：** SystemCapability.Telephony.CallManager

**类型：** String

**读写能力：** 只读

**起始版本：** 21

### init(String)

```cangjie
public init(countryCode: String)
```

**功能：** 用于创建NumberFormatOptions实例的构造函数。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|countryCode|String|是|-|国家码，支持所有国家的国家码，如：CN（中国）。默认为：CN。|

**示例：**

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

**功能：** 通话状态码。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

### CALL_STATE_IDLE

```cangjie
CALL_STATE_IDLE
```

**功能：** 表示没有正在进行的呼叫。

**起始版本：** 21

### CALL_STATE_OFFHOOK

```cangjie
CALL_STATE_OFFHOOK
```

**功能：** 表示至少有一个呼叫处于拨号、通话中或呼叫保持状态，并且没有新的来电振铃或等待。

**起始版本：** 21

### CALL_STATE_RINGING

```cangjie
CALL_STATE_RINGING
```

**功能：** 表示来电正在振铃或等待。

**起始版本：** 21

### CALL_STATE_UNKNOWN

```cangjie
CALL_STATE_UNKNOWN
```

**功能：** 无效状态，当获取呼叫状态失败时返回。

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取枚举类型对应的数值。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|枚举类型对应的数值。|

**示例：**

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

**功能：** 函数isEmergencyPhoneNumber的可选参数。

**系统能力：** SystemCapability.Telephony.CallManager

**起始版本：** 21

### SLOT_ID_ONE

```cangjie
SLOT_ID_ONE
```

**功能：** 卡槽1。

**起始版本：** 21

### SLOT_ID_TWO

```cangjie
SLOT_ID_TWO
```

**功能：** 卡槽2。

**起始版本：** 21
