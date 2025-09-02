# ohos.callback_invoke (Common Callback Information)

## class Callback0Argument

```cangjie
public abstract class Callback0Argument <: CallbackObject {}
```

**Function:** Abstract class for callback functions with no parameters.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parent Type:**

- [CallbackObject](#class-callbackobject)

### func invoke(?BusinessException)

```cangjie
public open func invoke(err: ?BusinessException): Unit
```

**Function:** Abstract class constraint requiring implementation of callback method.

**Parameters:**

| Parameter | Type | Required | Description         |
|:----------|:-----|:---|:--------------------|
| err       | ?BusinessException | Yes | Optional exception. |

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

### func invoke(?BusinessException, A)

```cangjie
public open func invoke(err: ?BusinessException, arg: A): Unit
```

**Function:** Abstract class constraint requiring implementation of single-parameter callback method.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:-----|:---|:---|
| err       | ?BusinessException | Yes | Optional exception. |
| arg | A    | Yes | Parameter required by the callback function. |

## class Callback1ArgumentWithReturn

```cangjie
public abstract class Callback1ArgumentWithReturn<A, B> <: CallbackObject {}
```

**Function:** Abstract class for callback functions with one parameter and a return value.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parent Type:**

- [CallbackObject](#class-callbackobject)

### func invoke(?BusinessException, A)

```cangjie
public open func invoke(err: ?BusinessException, arg1: A): B
```

**Function:** Abstract class constraint requiring implementation of single-parameter callback method.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| err       | ?BusinessException | Yes | Optional exception. |
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

### func invoke(?BusinessException, A, B)

```cangjie
public open func invoke(err: ?BusinessException, arg1: A, arg2: B): Unit
```

**Function:** Abstract class constraint requiring implementation of two-parameter callback method.

**System Capability:** SystemCapability.Base

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| err       | ?BusinessException | Yes | Optional exception. |
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

### func invoke(?BusinessException, A, B, C)

```cangjie
public open func invoke(err: ?BusinessException, arg1: A, arg2: B, arg3: C): D
```

**Function:** Abstract class constraint requiring implementation of a callback method with three parameters.

**System Capability:** SystemCapability.Base

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
| err       | ?BusinessException | Yes | Optional exception. |
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

### func invoke(?BusinessException)

```cangjie
public open func invoke(err: ?BusinessException): A
```

**Function:** Abstract class constraint requiring implementation of a callback method.

**System Capability:** SystemCapability.Base

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description         |
|:----------|:-----|:---|:--------------------|
| err       | ?BusinessException | Yes | Optional exception. |

**Return Value:**

|Type|Description|
|:----|:----|
| A | Return value of the callback function.|

## type Callback

```cangjie
public type Callback<T>=(T) -> Unit
```

**Function:** Callback function type.

**System Capability:** SystemCapability.Base

**Since:** 21