# ohos.labels (Label Information)

Label descriptions. Labels include atomicservice (whether atomic service is supported), crossplatform (whether cross-platform is supported), deprecated (deprecated version), form (whether supported in forms), permission (required permissions), since (API level), stagemodelonly (whether only Stage model is supported), syscap (required system capabilities), etc.

## Import Module

```cangjie
import ohos.labels.*
```

## Usage Instructions

This package is used to annotate APIs with labels in the form of annotations, providing explanations for the annotation information. Not recommended for user usage.

## interface PermissionValue

```cangjie
public interface PermissionValue {
    operator func &(rhs: PermissionValue): PermissionValue
    operator func |(rhs: PermissionValue): PermissionValue
}
```

**Function:** Used to handle AND/OR relationships between permissions.

**Since:** 21

### func &(PermissionValue)

```cangjie
operator func &(rhs: PermissionValue): PermissionValue
```

**Function:** AND operation with another permission set. Returns the permission set after AND operation.

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|Yes|-|Another permission set for AND operation.|

**Return Value:**

|Type|Description|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|Permission set after AND operation with another permission set.|

### func |(PermissionValue)

```cangjie
operator func |(rhs: PermissionValue): PermissionValue
```

**Function:** OR operation with another permission set. Returns the permission set after OR operation.

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|Yes|-|Another permission set for OR operation.|

**Return Value:**

|Type|Description|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|Permission set after OR operation with another permission set.|

## class APILevel

```cangjie
public class APILevel {
    public let level: UInt8
    public let atomicservice: Bool
    public let crossplatform: Bool
    public let deprecated: UInt8
    public let form: Bool
    public let permission:?PermissionValue
    public let stagemodelonly: Bool
    public let syscap: String
    public const init(level_val: UInt8, atomicservice!: Bool = false, crossplatform!: Bool = false,
        deprecated!: UInt8 = 0, form!: Bool = false, permission!: ?PermissionValue= None,
        stagemodelonly!: Bool = true, syscap!: String = "")
}
```

**Function:** Definition of labels. Labels are annotated on APIs. Labels include atomicservice (whether atomic service is supported), crossplatform (whether cross-platform is supported), deprecated (deprecated version), form (whether supported in forms), permission (required permissions), since (API level), stagemodelonly (whether only Stage model is supported), syscap (required system capabilities), etc.

**Since:** 21

### let atomicservice

```cangjie
public let atomicservice: Bool
```

**Function:** Whether the current API supports atomic service.

**Type:** Bool

**Access:** Read-only

**Since:** 21

### let crossplatform

```cangjie
public let crossplatform: Bool
```

**Function:** Whether the current API supports cross-platform.

**Type:** Bool

**Access:** Read-only

**Since:** 21

### let deprecated

```cangjie
public let deprecated: UInt8
```

**Function:** Deprecated version of the current API, default is 0 indicating not deprecated.

**Type:** UInt8

**Access:** Read-only

**Since:** 21

### let form

```cangjie
public let form: Bool
```

**Function:** Whether the current API is supported in forms.

**Type:** Bool

**Access:** Read-only

**Since:** 21

### let level

```cangjie
public let level: UInt8
```

**Function:** Level of the current API.

**Type:** UInt8

**Access:** Read-only

**Since:** 21

### let permission

```cangjie
public let permission:?PermissionValue
```

**Function:** Permission information required by the current API.

**Type:** ?[PermissionValue](#interface-permissionvalue)

**Access:** Read-only

**Since:** 21

### let stagemodelonly

```cangjie
public let stagemodelonly: Bool
```

**Function:** Whether the current API only supports Stage model.

**Type:** Bool

**Access:** Read-only

**Since:** 21

### let syscap

```cangjie
public let syscap: String
```

**Function:** System capabilities required by the current API.

**Type:** String

**Access:** Read-only

**Since:** 21

### init(UInt8, Bool, Bool, UInt8, Bool, ?PermissionValue, Bool, String)

```cangjie
public const init(level_val: UInt8, atomicservice!: Bool = false, crossplatform!: Bool = false, deprecated!: UInt8 = 0, form!: Bool = false, permission!: ?PermissionValue= None,
    stagemodelonly!: Bool = true, syscap!: String = "")
```
**Function:** APILevel constructor.

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|level_val|UInt8|Yes|-|API level.|
|atomicservice|Bool|No|false| **Named parameter.** Whether atomic service is supported.|
|crossplatform|Bool|No|false| **Named parameter.** Whether cross-platform is supported.|
|deprecated|UInt8|No|0| **Named parameter.** Deprecated version.|
|form|Bool|No|false| **Named parameter.** Whether supported in forms.|
|permission|?[PermissionValue](#interface-permissionvalue)|No|None| **Named parameter.** Required permissions.|
|stagemodelonly|Bool|No|true| **Named parameter.** Whether only Stage model is supported.|
|syscap|String|No|""| **Named parameter.** Required system capabilities.|

## class PermissionAnd

```cangjie
public class PermissionAnd <: PermissionValue {
    public let lhs: PermissionValue
    public let rhs: PermissionValue
    public const init(lhs: PermissionValue, rhs: PermissionValue)
}
```

**Function:** Represents the AND operation of multiple permissions.

**Since:** 21

**Parent Type:**

- [PermissionValue](#interface-permissionvalue)

### let lhs

```cangjie
public let lhs: PermissionValue
```

**Function:** left expression.

**Type:** PermissionValue

**Read-Write Permission:** Read-only

**Initial Version:** 21

### let lhs

```cangjie
public let rhs: PermissionValue
```

**Function:** right expression.

**Type:** PermissionValue

**Read-Write Permission:** Read-only

**Initial Version:** 21

### init(PermissionValue, PermissionValue)

```cangjie
public const init(lhs: PermissionValue, rhs: PermissionValue)
```

**Function:** Constructs a PermissionAnd permission set, representing the AND operation of two permission sets.

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|lhs|[PermissionValue](#interface-permissionvalue)|Yes|-|One permission set for constructing the AND permission set.|
|rhs|[PermissionValue](#interface-permissionvalue)|Yes|-|Another permission set for constructing the AND permission set.|

### func &(PermissionValue)

```cangjie
public const override operator func &(rhs: PermissionValue): PermissionValue
```

**Function:** AND operation with another permission set. Returns the permission set after AND operation.

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|Yes|-|Another permission set for AND operation.|

**Return Value:**

|Type|Description|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|Permission set after AND operation with another permission set.|

### func |(PermissionValue)

```cangjie
public const override operator func |(rhs: PermissionValue): PermissionValue
```

**Function:** OR operation with another permission set. Returns the permission set after OR operation.

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|Yes|-|Another permission set for OR operation.|

**Return Value:**

|Type|Description|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|Permission set after OR operation with another permission set.|**Return Value:**

|Type|Description|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|The permission set after performing a logical OR operation with another permission set.|

## class PermissionOr

```cangjie
public class PermissionOr <: PermissionValue {
    public let lhs: PermissionValue
    public let rhs: PermissionValue
    public const init(lhs: PermissionValue, rhs: PermissionValue)
}
```

**Function:** Represents the logical OR of multiple permissions.

**Initial Version:** 21

**Parent Type:**

- [PermissionValue](#interface-permissionvalue)


### let lhs

```cangjie
public let lhs: PermissionValue
```

**Function:** left expression.

**Type:** PermissionValue

**Read-Write Permission:** Read-only

**Initial Version:** 21

### let lhs

```cangjie
public let rhs: PermissionValue
```

**Function:** right expression.

**Type:** PermissionValue

**Read-Write Permission:** Read-only

**Initial Version:** 21

### init(PermissionValue, PermissionValue)

```cangjie
public const init(lhs: PermissionValue, rhs: PermissionValue)
```

**Function:** Constructs a PermissionOr permission set, representing the logical OR of two permission sets.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|lhs|[PermissionValue](#interface-permissionvalue)|Yes|-|One permission set for constructing the OR permission set.|
|rhs|[PermissionValue](#interface-permissionvalue)|Yes|-|Another permission set for constructing the OR permission set.|

### func &(PermissionValue)

```cangjie
public const override operator func &(rhs: PermissionValue): PermissionValue
```

**Function:** Performs a logical AND with another permission set. Returns the resulting permission set after the AND operation.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|Yes|-|Another permission set for the AND operation.|

**Return Value:**

|Type|Description|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|The permission set after performing a logical AND operation with another permission set.|

### func |(PermissionValue)

```cangjie
public const override operator func |(rhs: PermissionValue): PermissionValue
```

**Function:** Performs a logical OR with another permission set. Returns the resulting permission set after the OR operation.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|Yes|-|Another permission set for the OR operation.|

**Return Value:**

|Type|Description|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|The permission set after performing a logical OR operation with another permission set.|

## struct String

```cangjie
extend String <: PermissionValue {}
```

**Function:** Extends the PermissionValue interface, using a string to represent a single permission.

**Initial Version:** 21

**Parent Type:**

- [PermissionValue](#interface-permissionvalue)

### func &(PermissionValue)

```cangjie
public const operator func &(rhs: PermissionValue): PermissionValue
```

**Function:** Performs a logical AND with another permission set. Returns the resulting permission set after the AND operation.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|Yes|-|Another permission set for the AND operation.|

**Return Value:**

|Type|Description|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|The permission set after performing a logical AND operation with another permission set.|

### func |(PermissionValue)

```cangjie
public const operator func |(rhs: PermissionValue): PermissionValue
```

**Function:** Performs a logical OR with another permission set. Returns the resulting permission set after the OR operation.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|Yes|-|Another permission set for the OR operation.|

**Return Value:**

|Type|Description|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|The permission set after performing a logical OR operation with another permission set.|