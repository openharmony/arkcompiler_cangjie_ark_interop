# ohos.ark_interop_helper

Provides some common utility functions.

## Import Module

```cangjie
import ohos.ark_interop_helper.*
```

## func arkTsValuetoNapiValue(napi_env, JSValue)

```cangjie
public func arkTsValuetoNapiValue(env: napi_env, ark_value: JSValue): napi_value
```

**Description:** Converts a JSValue type to an napi_value type.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| env | [napi_env](cj-apis-ark_interop.md#type-napi_env) | Yes | - | Environment context. |
| ark_value | [JSValue](cj-apis-ark_interop.md#struct-jsvalue) | Yes | - | The value to be converted. |

**Return Value:**

| Type | Description |
|:----|:----|
| [napi_value](cj-apis-ark_interop.md#type-napi_value) | The converted napi_value. |

## func getContextStageMode(napi_env, napi_value)

```cangjie
public func getContextStageMode(env: napi_env, object: napi_value): StageContext
```

**Description:** Retrieves the application context based on the napi environment and object information.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| env | [napi_env](cj-apis-ark_interop.md#type-napi_env) | Yes | - | Environment information. |
| object | [napi_value](cj-apis-ark_interop.md#type-napi_value) | Yes | - | napi value information. |

**Return Value:**

| Type | Description |
|:----|:----|
| [StageContext](#type-stagecontext) | The retrieved application context. |

## func getJSContext(JSRuntime, UIAbilityContext)

```cangjie
public func getJSContext(runtime: JSRuntime, abilityContext: UIAbilityContext): JSValue
```

**Description:** Retrieves the ArkTS interoperation context based on runtime information.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| runtime | [JSRuntime](cj-apis-ark_interop.md#class-jsruntime) | Yes | - | ArkTS runtime object. |
| abilityContext | UIAbilityContext | Yes | - | Cangjie context information. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](cj-apis-ark_interop.md#struct-jsvalue) | The retrieved ArkTS interoperation context. |

## func isStageMode(napi_env, napi_value)

```cangjie
public func isStageMode(env: napi_env, context: napi_value): Bool
```

**Description:** Determines whether the application is in stage mode.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| env | [napi_env](cj-apis-ark_interop.md#type-napi_env) | Yes | - | Environment information. |
| context | [napi_value](cj-apis-ark_interop.md#type-napi_value) | Yes | - | Context information. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the application is in stage mode. |

## func mapFromJSValue\<T>(JSContext, JSValue, (JSContext,JSValue) -> T)

```cangjie
public func mapFromJSValue<T>(
    context: JSContext,
    value: JSValue,
    convert: (JSContext, JSValue) -> T
): ?HashMap<String, T>
```

**Description:** Converts JSValue format data into a HashMap.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](cj-apis-ark_interop.md#class-jscontext) | Yes | - | Interoperation context. |
| value | [JSValue](cj-apis-ark_interop.md#struct-jsvalue) | Yes | - | The JSValue data to be converted. |
| convert | ([JSContext](cj-apis-ark_interop.md#class-jscontext), [JSValue](cj-apis-ark_interop.md#struct-jsvalue))->T | Yes | - | Converts the value corresponding to the key in the HashMap (treated as a JSValue) into type T. |

**Return Value:**

| Type | Description |
|:----|:----|
| ?HashMap\<String, T> | The converted HashMap data. |

## func mapToJSValue\<T>(JSContext, ?HashMap\<String,T>, (JSContext,T) -> JSValue)

```cangjie
public func mapToJSValue<T>(
    context: JSContext,
    parameter: ?HashMap<String, T>,
    convert: (JSContext, T) -> JSValue
): JSValue
```

**Description:** Converts HashMap format data into JSValue.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](cj-apis-ark_interop.md#class-jscontext) | Yes | - | Interoperation context. |
| parameter | ?HashMap\<String, T> | Yes | - | The HashMap data to be converted. |
| convert | ([JSContext](cj-apis-ark_interop.md#class-jscontext), T)->[JSValue](cj-apis-ark_interop.md#struct-jsvalue) | Yes | - | Converts type T in the HashMap into JSValue. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](cj-apis-ark_interop.md#struct-jsvalue) | The converted JSValue data. |

## type FAContext

```cangjie
public type FAContext = CPointer<Unit>
```

**Description:** FAContext is a type alias for CPointer\<Unit>.

## type StageContext

```cangjie
public type StageContext = CPointer<Unit>
```

**Description:** StageContext is a type alias for CPointer\<Unit>.