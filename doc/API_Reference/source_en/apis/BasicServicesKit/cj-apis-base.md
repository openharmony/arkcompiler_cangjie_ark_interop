# ohos.base (Common Callback Information)

This module defines common exception information that occurs during interface calls.

## Import Module

```cangjie
import ohos.base.*
```

## let AppLog

```cangjie
public let AppLog: HilogChannel
```

**Function:** Provides an application log instance for developers to import and use.

**Type:** [HilogChannel](../PerformanceAnalysisKit/cj-apis-hilog.md#class-hilogchannel)

**Read-Write Permission:** Read-only

**Initial Version:** 21

## let BaseLog

```cangjie
public let BaseLog: HilogChannel
```

**Function:** Provides a basic log instance for developers to import and use.

**Type:** [HilogChannel](../PerformanceAnalysisKit/cj-apis-hilog.md#class-hilogchannel)

**Read-Write Permission:** Read-only

**Initial Version:** 21

## class AsyncError

```cangjie
public class AsyncError {
    public AsyncError(
        public let code: Int32
    )
}
```

**Function:** Error codes in asynchronous operations.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

### let code

```cangjie
public let code: Int32
```

**Function:** Error code.

**Type:** Int32

**Read-Write Permission:** Read-only

**Initial Version:** 21

### AsyncError(Int32)

```cangjie
public AsyncError(
    public let code: Int32
)
```

**Function:** Main constructor of AsyncError.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| code | Int32 | Yes | Error code. |

## class BusinessException

```cangjie
public open class BusinessException <: Exception {
    public let code: Int32
    public init(code: Int32, msg: String)
}
```

**Function:** Business exception class, inherits from Exception.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parent Type:**

- Exception

### let code

```cangjie
public let code: Int32
```

**Function:** Error code.

**Type:** Int32

**Read-Write Permission:** Read-only

**Initial Version:** 21

### init(Int32, String)

```cangjie
public init(code: Int32, msg: String)
```

**Function:** Creates an instance of the business exception class.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| code | Int32 | Yes | Error code. |
| msg | String | Yes | Error message. |

### func toString()

```cangjie
public open func toString(): String
```

**Function:** Gets the error message.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Error message. |

## class Callback0Argument

```cangjie
public abstract class Callback0Argument <: CallbackObject {}
```

**Function:** Abstract class for callback functions with no parameters.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parent Type:**

- [CallbackObject](#class-callbackobject)

### func invoke()

```cangjie
public open func invoke(): Unit
```

**Function:** Abstract class constraint requiring implementation of callback method.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

## class Callback1Argument

```cangjie
public abstract class Callback1Argument<A> <: CallbackObject {}
```

**Function:** Abstract class for callback functions with one parameter.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parent Type:**

- [CallbackObject](#class-callbackobject)

### func invoke(A)

```cangjie
public open func invoke(arg: A): Unit
```

**Function:** Abstract class constraint requiring implementation of single-parameter callback method.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| arg | T | Yes | Parameter required by the callback function. |

## class Callback1ArgumentWithReturn

```cangjie
public abstract class Callback1ArgumentWithReturn<A, B> <: CallbackObject {}
```

**Function:** Abstract class for callback functions with one parameter and a return value.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parent Type:**

- [CallbackObject](#class-callbackobject)

### func invoke(A)

```cangjie
public open func invoke(arg1: A): B
```

**Function:** Abstract class constraint requiring implementation of single-parameter callback method.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| arg1 | A | Yes | - | Parameter required by the callback function. |

**Return Value:**

| Type | Description |
|:----|:----|
| B | Return value of the callback function. |

## class Callback2Argument

```cangjie
public abstract class Callback2Argument<A, B> <: CallbackObject {}
```

**Function:** Abstract class for callback functions with two parameters.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parent Type:**

- [CallbackObject](#class-callbackobject)

### func invoke(A, B)

```cangjie
public open func invoke(arg1: A, arg2: B): Unit
```

**Function:** Abstract class constraint requiring implementation of two-parameter callback method.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| arg1 | A | Yes | - | First parameter required by the callback function. |
| arg2 | B | Yes | - | Second parameter required by the callback function. |

## class Callback3ArgumentWithReturn

```cangjie
public abstract class Callback3ArgumentWithReturn<A, B, C, D> <: CallbackObject {}
```
**Function:** Abstract class for a callback function with three parameters and a return value.

**System Capability:** SystemCapability.Base

**Since:** 21

**Parent Type:**

- [CallbackObject](#class-callbackobject)

### func invoke(A, B, C)

```cangjie
public open func invoke(arg1: A, arg2: B, arg3: C): D
```

**Function:** Abstract class constraint requiring implementation of a callback method with three parameters.

**System Capability:** SystemCapability.Base

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|arg1| A |Yes|-|First parameter required by the callback function.|
|arg2| B |Yes|-|Second parameter required by the callback function.|
|arg3| B |Yes|-|Third parameter required by the callback function.|

**Return Value:**

|Type|Description|
|:----|:----|
| D | Return value of the callback function.|

## class CallbackObject

```cangjie
public abstract class CallbackObject {}
```

**Function:** Abstract base class for callback functions.

**System Capability:** SystemCapability.Base

**Since:** 21

## class CallbackWithReturn

```cangjie
public abstract class CallbackWithReturn<A> <: CallbackObject {}
```

**Function:** Abstract class for callback functions with a return value.

**System Capability:** SystemCapability.Base

**Since:** 21

**Parent Type:**

- [CallbackObject](#class-callbackobject)

### func invoke()

```cangjie
public open func invoke(): A
```

**Function:** Abstract class constraint requiring implementation of a callback method.

**System Capability:** SystemCapability.Base

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
| A | Return value of the callback function.|

## type AsyncCallback

```cangjie
public type AsyncCallback<T>=(Option<AsyncError>, Option<T>) -> Unit
```

**Function:** Defined asynchronous callback function type.

**System Capability:** SystemCapability.Base

**Since:** 21

## type Callback

```cangjie
public type Callback<T>=(T) -> Unit
```

**Function:** Callback function type.

**System Capability:** SystemCapability.Base

**Since:** 21