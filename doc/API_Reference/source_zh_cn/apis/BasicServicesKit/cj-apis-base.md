# ohos.base（公共回调信息）

本模块定义了接口调用时出现的公共异常信息。

## 导入模块

```cangjie
import ohos.base.*
```

## let AppLog

```cangjie
public let AppLog: HilogChannel
```

**功能：** 提供应用日志实例，供开发者导入使用。

**类型：** [HilogChannel](../PerformanceAnalysisKit/cj-apis-hilog.md#class-hilogchannel)

**读写能力：** 只读

**起始版本：** 21

## let BaseLog

```cangjie
public let BaseLog: HilogChannel
```

**功能：** 提供基础日志实例，供开发者导入使用。

**类型：** [HilogChannel](../PerformanceAnalysisKit/cj-apis-hilog.md#class-hilogchannel)

**读写能力：** 只读

**起始版本：** 21

## class AsyncError

```cangjie
public class AsyncError {
    public AsyncError(
        public let code: Int32
    )
}
```

**功能：** 异步操作中的错误码。

**系统能力：** SystemCapability.Base

**起始版本：** 21

### let code

```cangjie
public let code: Int32
```

**功能：** 错误码。

**类型：** Int32

**读写能力：** 只读

**起始版本：** 21

### AsyncError(Int32)

```cangjie
public AsyncError(
    public let code: Int32
)
```

**功能：** AsyncError的主构造函数。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|code|Int32|是|错误码。|

## class BusinessException

```cangjie
public open class BusinessException <: Exception {
    public let code: Int32
    public init(code: Int32, msg: String)
}
```

**功能：** 业务异常类，继承了Exception。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**父类型：**

- Exception

### let code

```cangjie
public let code: Int32
```

**功能：** 错误码。

**类型：** Int32

**读写能力：** 只读

**起始版本：** 21

### init(Int32, String)

```cangjie
public init(code: Int32, msg: String)
```

**功能：** 创建业务异常类实例。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|code|Int32|是|错误码。|
|msg|String|是|错误信息。|

### func toString()

```cangjie
public open func toString(): String
```

**功能：** 获取错误信息。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|错误信息。|

## class Callback0Argument

```cangjie
public abstract class Callback0Argument <: CallbackObject {}
```

**功能：** 无参数的回调函数抽象类。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**父类型：**

- [CallbackObject](#class-callbackobject)

### func invoke()

```cangjie
public open func invoke(): Unit
```

**功能：** 抽象类约束需要实现回调方法。

**系统能力：** SystemCapability.Base

**起始版本：** 21

## class Callback1Argument

```cangjie
public abstract class Callback1Argument<A> <: CallbackObject {}
```

**功能：** 单参数的回调函数抽象类。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**父类型：**

- [CallbackObject](#class-callbackobject)

### func invoke(A)

```cangjie
public open func invoke(arg: A): Unit
```

**功能：** 抽象类约束需要实现单参数回调方法。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|arg| T |是|回调函数需要的参数。|

## class Callback1ArgumentWithReturn

```cangjie
public abstract class Callback1ArgumentWithReturn<A, B> <: CallbackObject {}
```

**功能：** 单参数且有返回值的回调函数抽象类。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**父类型：**

- [CallbackObject](#class-callbackobject)

### func invoke(A)

```cangjie
public open func invoke(arg1: A): B
```

**功能：** 抽象类约束需要实现单参数回调方法。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg1| A |是|-| 回调函数需要的参数。|

**返回值：**

|类型|说明|
|:----|:----|
| B | 回调函数的返回值。|

## class Callback2Argument

```cangjie
public abstract class Callback2Argument<A, B> <: CallbackObject {}
```

**功能：** 两个参数的回调函数抽象类。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**父类型：**

- [CallbackObject](#class-callbackobject)

### func invoke(A, B)

```cangjie
public open func invoke(arg1: A, arg2: B): Unit
```

**功能：** 抽象类约束需要实现两个参数的回调方法。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg1| A |是|-| 回调函数所需的第一个参数。|
|arg2| B |是|-| 回调函数所需的第二个参数。|

## class Callback3ArgumentWithReturn

```cangjie
public abstract class Callback3ArgumentWithReturn<A, B, C, D> <: CallbackObject {}
```

**功能：** 三个参数且有返回值的回调函数抽象类。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**父类型：**

- [CallbackObject](#class-callbackobject)

### func invoke(A, B, C)

```cangjie
public open func invoke(arg1: A, arg2: B, arg3: C): D
```

**功能：** 抽象类约束需要实现三个参数的回调方法。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg1| A |是|-|回调函数所需的第一个参数。|
|arg2| B |是|-|回调函数所需的第二个参数。|
|arg3| B |是|-|回调函数所需的第三个参数。|

**返回值：**

|类型|说明|
|:----|:----|
| D | 回调函数的返回值。|

## class CallbackObject

```cangjie
public abstract class CallbackObject {}
```

**功能：** 回调函数抽象基类。

**系统能力：** SystemCapability.Base

**起始版本：** 21

## class CallbackWithReturn

```cangjie
public abstract class CallbackWithReturn<A> <: CallbackObject {}
```

**功能：** 有返回值的回调函数抽象类。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**父类型：**

- [CallbackObject](#class-callbackobject)

### func invoke()

```cangjie
public open func invoke(): A
```

**功能：** 抽象类约束需要实现回调方法。

**系统能力：** SystemCapability.Base

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
| A | 回调函数的返回值。|

## type AsyncCallback

```cangjie
public type AsyncCallback<T>=(Option<AsyncError>, Option<T>) -> Unit
```

**功能：** 定义的异步回调函数类型。

**系统能力：** SystemCapability.Base

**起始版本：** 21

## type Callback

```cangjie
public type Callback<T>=(T) -> Unit
```

**功能：** 回调函数类型。

**系统能力：** SystemCapability.Base

**起始版本：** 21
