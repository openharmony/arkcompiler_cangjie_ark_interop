# ohos.business_exception (Common Exception Information)

This module defines common exception information that occurs during interface calls.

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

## class BusinessError

```cangjie
public class BusinessError<T> <: BusinessException  {
    public var data: T
    public init (data: T, code: Int32, msg: String)
}
```

**Function:** Business error class, inherits from BusinessException.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parent Type:**

- BusinessException

### let data

```cangjie
public var data: T
```

**Function:** Defines the additional information for business.

**Type:** T

**Read-Write Permission:** Read-write

**Initial Version:** 21

### init(T, Int32, String)

```cangjie
public init(data: T, code: Int32, msg: String)
```

**Function:** Creates an instance of the business error class.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
 | data | T | Yes | addition information |
| code | Int32 | Yes | Error code. |
| msg | String | Yes | Error message. |

## type AsyncCallback

```cangjie
public type AsyncCallback<T>=(Option<AsyncError>, Option<T>) -> Unit
```

**Function:** Defined asynchronous callback function type.

**System Capability:** SystemCapability.Base

**Since:** 21
