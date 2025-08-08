# ohos.labels（标签信息）

标签说明。标签包括atomicservice（是否支持元服务）、crossplatform（是否支持跨平台）、deprecated（废弃版本）、form（是否支持在form中使用）、permission（所需权限）、since（api等级）、stagemodelonly（是否仅支持Stage模型）、syscap（所需系统能力）等信息。

## 导入模块

```cangjie
import ohos.labels.*
```

## 使用说明

此包用于将标签以注解的形式打在api上，是对其中注解信息的说明。不推荐用户使用。

## interface PermissionValue

```cangjie
public interface PermissionValue {
    operator func &(rhs: PermissionValue): PermissionValue
    operator func |(rhs: PermissionValue): PermissionValue
}
```

**功能：** 用于处理权限的与或关系。

**起始版本：** 21

### func &(PermissionValue)

```cangjie
operator func &(rhs: PermissionValue): PermissionValue
```

**功能：** 和另一个权限集的与。返回与操作后的权限集。

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|是|-|与操作的另一个权限集。|

**返回值：**

|类型|说明|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|此权限集与另一个权限集与后的权限集。|

### func |(PermissionValue)

```cangjie
operator func |(rhs: PermissionValue): PermissionValue
```

**功能：** 和另一个权限或。返回或操作后的权限。

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|是|-|或操作的另一个权限集。|

**返回值：**

|类型|说明|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|此权限集与另一个权限集或后的权限集。|

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

**功能：** 标签的定义。标签以注解的形式打在api上。标签包括atomicservice（是否支持元服务）、crossplatform（是否支持跨平台）、deprecated（废弃版本）、form（是否支持在form中使用）、permission（所需权限）、since（api等级）、stagemodelonly（是否仅支持Stage模型）、syscap（所需系统能力）等信息。

**起始版本：** 21

### let atomicservice

```cangjie
public let atomicservice: Bool
```

**功能：** 当前api是否支持元服务。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 21

### let crossplatform

```cangjie
public let crossplatform: Bool
```

**功能：** 当前api是否支持跨平台。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 21

### let deprecated

```cangjie
public let deprecated: UInt8
```

**功能：** 当前api的废弃版本，默认为0表示未废弃。

**类型：** UInt8

**读写能力：** 只读

**起始版本：** 21

### let form

```cangjie
public let form: Bool
```

**功能：** 当前api是否支持在form中使用。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 21

### let level

```cangjie
public let level: UInt8
```

**功能：** 当前api的等级。

**类型：** UInt8

**读写能力：** 只读

**起始版本：** 21

### let permission

```cangjie
public let permission:?PermissionValue
```

**功能：** 当前api所需的权限信息。

**类型：** ?[PermissionValue](#interface-permissionvalue)

**读写能力：** 只读

**起始版本：** 21

### let stagemodelonly

```cangjie
public let stagemodelonly: Bool
```

**功能：** 当前api是否仅支持Stage模型。

**类型：** Bool

**读写能力：** 只读

**起始版本：** 21

### let syscap

```cangjie
public let syscap: String
```

**功能：** 当前api所需的系统能力。

**类型：** String

**读写能力：** 只读

**起始版本：** 21

### init(UInt8, Bool, Bool, UInt8, Bool, ?PermissionValue, Bool, String)

```cangjie
public const init(level_val: UInt8, atomicservice!: Bool = false, crossplatform!: Bool = false, deprecated!: UInt8 = 0, form!: Bool = false, permission!: ?PermissionValue= None,
    stagemodelonly!: Bool = true, syscap!: String = "")
```

**功能：** APILevel构造器。

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|level_val|UInt8|是|-|api等级。|
|atomicservice|Bool|否|false| **命名参数。** 是否支持元服务。|
|crossplatform|Bool|否|false| **命名参数。** 是否支持跨平台。|
|deprecated|UInt8|否|0| **命名参数。** 废弃版本。|
|form|Bool|否|false| **命名参数。** 是否支持在form中使用。|
|permission|?[PermissionValue](#interface-permissionvalue)|否|None| **命名参数。** 所需权限。|
|stagemodelonly|Bool|否|true| **命名参数。** 是否仅支持Stage模型。|
|syscap|String|否|""| **命名参数。** 所需系统能力。|

## class PermissionAnd

```cangjie
public class PermissionAnd <: PermissionValue {
    public const init(lhs: PermissionValue, rhs: PermissionValue)
}
```

**功能：** 表示若干个权限的与。

**起始版本：** 21

**父类型：**

- [PermissionValue](#interface-permissionvalue)

### init(PermissionValue, PermissionValue)

```cangjie
public const init(lhs: PermissionValue, rhs: PermissionValue)
```

**功能：** 构造PermissionAnd与权限集，表示两个权限集的与。

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|lhs|[PermissionValue](#interface-permissionvalue)|是|-|构造与权限集的一个权限集。|
|rhs|[PermissionValue](#interface-permissionvalue)|是|-|构造与权限集的另一个权限集。|

### func &(PermissionValue)

```cangjie
public const override operator func &(rhs: PermissionValue): PermissionValue
```

**功能：** 和另一个权限集与。返回与操作后的权限集。

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|是|-|与操作的另一个权限集。|

**返回值：**

|类型|说明|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|此权限集与另一个权限集与后的权限集。|

### func |(PermissionValue)

```cangjie
public const override operator func |(rhs: PermissionValue): PermissionValue
```

**功能：** 和另一个权限集或。返回或操作后的权限集。

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|是|-|或操作的另一个权限集。|

**返回值：**

|类型|说明|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|此权限集与另一个权限集或后的权限集。|

## class PermissionOr

```cangjie
public class PermissionOr <: PermissionValue {
    public const init(lhs: PermissionValue, rhs: PermissionValue)
}
```

**功能：** 表示若干个权限的或。

**起始版本：** 21

**父类型：**

- [PermissionValue](#interface-permissionvalue)

### init(PermissionValue, PermissionValue)

```cangjie
public const init(lhs: PermissionValue, rhs: PermissionValue)
```

**功能：** 构造PermissionOr或权限集，表示两个权限集的或。

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|lhs|[PermissionValue](#interface-permissionvalue)|是|-|构造或权限集的一个权限集。|
|rhs|[PermissionValue](#interface-permissionvalue)|是|-|构造或权限集的另一个权限集。|

### func &(PermissionValue)

```cangjie
public const override operator func &(rhs: PermissionValue): PermissionValue
```

**功能：** 和另一个权限集与。返回与操作后的权限集。

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|是|-|与操作的另一个权限集。|

**返回值：**

|类型|说明|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|此权限集与另一个权限集与后的权限集。|

### func |(PermissionValue)

```cangjie
public const override operator func |(rhs: PermissionValue): PermissionValue
```

**功能：** 和另一个权限集或。返回或操作后的权限集。

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|是|-|或操作的另一个权限集。|

**返回值：**

|类型|说明|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|此权限集与另一个权限集或后的权限集。|

## struct String

```cangjie
extend String <: PermissionValue {}
```

**功能：** 扩展PermissionValue接口，使用字符串表示单个权限。

**起始版本：** 21

**父类型：**

- [PermissionValue](#interface-permissionvalue)

### func &(PermissionValue)

```cangjie
public const operator func &(rhs: PermissionValue): PermissionValue
```

**功能：** 和另一个权限集与。返回与操作后的权限集。

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|是|-|与操作的另一个权限集。|

**返回值：**

|类型|说明|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|此权限与另一个权限集与后的权限集。|

### func |(PermissionValue)

```cangjie
public const operator func |(rhs: PermissionValue): PermissionValue
```

**功能：** 和另一个权限集或。返回或操作后的权限集。

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rhs|[PermissionValue](#interface-permissionvalue)|是|-|或操作的另一个权限集。|

**返回值：**

|类型|说明|
|:----|:----|
|[PermissionValue](#interface-permissionvalue)|此权限与另一个权限集或操作后的权限集。|
