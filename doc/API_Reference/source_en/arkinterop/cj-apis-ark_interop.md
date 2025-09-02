# ohos.ark_interop

The development languages for ArkTS applications include ArkTS, TypeScript, and JavaScript. The ArkTS Interoperability Library provides interoperability capabilities between the Cangjie language and ArkTS language.

## Import Module

```cangjie
import ohos.ark_interop.*
```

## interface JSInteropType

```cangjie
public interface JSInteropType<T> {
    static func fromJSValue(context: JSContext, input: JSValue): T
    func toJSValue(context: JSContext): JSValue
    static func toArkTsType(): String
}
```

**Description:** This interface is used to implement extension methods for types that can be used with declarative interoperability macros. Used by the declarative interoperability macro framework; developers do not need to use this API.

**Since:** 21

The following types extend this interface:

* User-defined classes annotated with @Interop[ArkTS]

* User-defined interfaces annotated with @Interop[ArkTS]

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): T
```

**Description:** Converts JSValue type data to the corresponding Cangjie type.

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| T | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Description:** Gets the ArkTS type name corresponding to the Cangjie type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Description:** Converts Cangjie type data to JSValue.

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## interface JSKeyable

```cangjie
sealed interface JSKeyable <: ToString & ToJSValue {
}
```

**Description:** Interface for types that can be used as keys in JSObject. This interface implements extension methods for the String type. Used by the declarative interoperability macro framework; developers do not need to use this API.

**Since:** 21

**Parent Types:**

* ToString

## interface ToJSValue

```cangjie
interface ToJSValue {
    func toJSValue(context: JSContext): JSValue
}
```

**Description:** Interface for implementing ToJSValue functionality.

**Since:** 21

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Description:** Converts Cangjie type data to JSValue.

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend Int8 <: JSInteropType<Int8>

**Description:** This interface can be used to implement extension methods for the built-in Int8 type.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): Int8
```

**Description:** Converts JSValue type data to the corresponding Int8 type.

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:** Int8

| Type | Description |
|:----|:----|
| Int8 | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Description:** Gets the ArkTS type name corresponding to the Cangjie Int8 type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Description:** Converts Cangjie Int8 type data to JSValue.

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend Int16 <: JSInteropType<Int16>

**Description:** This interface can be used to implement extension methods for the built-in Int16 type.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): Int16
```

**Description:** Converts JSValue type data to the corresponding Int16 type.

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int16 | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Description:** Gets the ArkTS type name corresponding to the Cangjie Int16 type.

**Since:** 21

**Return Value:**| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts Cangjie Int16 type data to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend Int32 <: JSInteropType<Int32>

**Function:** This interface can be used to implement extension methods for the built-in type Int32.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): Int32
```

**Function:** Converts JSValue type data to the corresponding Int32 type.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie Int32 type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts Cangjie Int32 type data to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend Int64 <: JSInteropType<Int64>

**Function:** This interface can be used to implement extension methods for the built-in type Int64.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): Int64
```

**Function:** Converts JSValue type data to the corresponding Int64 type.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie Int64 type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts Cangjie Int64 type data to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend UInt8 <: JSInteropType<UInt8>

**Function:** This interface can be used to implement extension methods for the built-in type UInt8.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): UInt8
```

**Function:** Converts JSValue type data to the corresponding UInt8 type.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt8 | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie UInt8 type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts Cangjie UInt8 type data to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend UInt16 <: JSInteropType<UInt16>

**Function:** This interface can be used to implement extension methods for the built-in type UInt16.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): UInt16
```

**Function:** Converts JSValue type data to the corresponding UInt16 type.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt16 | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie UInt16 type.

**Since:** 21

**Return Value:**| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts Cangjie UInt16 type data to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend UInt32 <: JSInteropType<UInt32>

**Function:** This interface can be used to implement extension methods for the built-in type UInt32.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): UInt32
```

**Function:** Converts JSValue type data to the corresponding UInt32 type.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie UInt32 type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts Cangjie UInt32 type data to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend UInt64 <: JSInteropType<UInt64>

**Function:** This interface can be used to implement extension methods for the built-in type UInt64.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): UInt64
```

**Function:** Converts JSValue type data to the corresponding UInt64 type.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt64 | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie UInt64 type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts Cangjie UInt64 type data to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend Float16 <: JSInteropType<Float16>

**Function:** This interface can be used to implement extension methods for the built-in type Float16.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): Float16
```

**Function:** Converts JSValue type data to the corresponding Float16 type.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| Float16 | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie Float16 type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts Cangjie Float16 type data to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend Float32 <: JSInteropType<Float32>

**Function:** This interface can be used to implement extension methods for the built-in type Float32.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): Float32
```

**Function:** Converts JSValue type data to the corresponding Float32 type.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| Float32 | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie Float32 type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. || Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts Cangjie Float32 type data to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend Float64 <: JSInteropType<Float64>

**Function:** This interface can be used to implement extension methods for the built-in type Float64.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): Float64
```

**Function:** Converts JSValue type data to the corresponding Float64 type.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| Float64 | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie Float64 type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts Cangjie Float64 type data to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend Bool <: JSInteropType<Bool>

**Function:** This interface can be used to implement extension methods for the built-in type Bool.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): Bool
```

**Function:** Converts JSValue type data to the corresponding Bool type.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie Bool type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts Cangjie Bool type data to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend String <: JSInteropType<String>

**Function:** This interface can be used to implement extension methods for the built-in type String.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(_: JSContext, input: JSValue): String
```

**Function:** Converts JSValue type data to the corresponding String type.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| _ | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie String type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Converted ArkTS type name. |

## extend String <: JSKeyable

**Function:** This interface can be used to implement extension methods for the built-in type String.

**Since:** 21

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts Cangjie String type data to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## extend Unit <: JSInteropType<Unit>

**Function:** This interface can be used to implement extension methods for the built-in type Unit.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): Unit
```

**Function:** Converts JSValue type data to the corresponding Bool type.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| Unit | Cangjie type. |

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```
**Function:** Get the ArkTS type name corresponding to the Cangjie Unit type.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Converted ArkTS type name.|

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Convert Cangjie Unit type data to JSValue.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|context|[JSContext](#class-jscontext)|Yes|-|ArkTS interoperability context.|

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

## extend<T> Option<T> <: JSInteropType<Option<T>> where T <: JSInteropType<T>

**Function:** This interface can be used to implement extension methods for the Option<T> type.

**Initial Version:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(context: JSContext, input: JSValue): Option<T>
```

**Function:** Convert JSValue type data to the corresponding Option<T> type.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|context|[JSContext](#class-jscontext)|Yes|-|ArkTS interoperability context.|
|input|[JSValue](#struct-jsvalue)|Yes|-|ArkTS unified type.|

**Return Value:**

|Type|Description|
|:----|:----|
|Option<T>|Cangjie Option type.|

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Get the ArkTS type name corresponding to the Cangjie Option<T> type.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Converted ArkTS type name.|

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Convert Cangjie Option<T> type data to JSValue.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|context|[JSContext](#class-jscontext)|Yes|-|ArkTS interoperability context.|

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

## extend<T> Array<T> <: JSInteropType<Array<T>> where T <: JSInteropByte

**Function:** This interface can be used to implement extension methods for the Array<T> type.

**Initial Version:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
static func fromJSValue(_: JSContext, input: JSValue): Array<T>
```

**Function:** Convert JSValue type data to the corresponding Array<T> type.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|_|[JSContext](#class-jscontext)|Yes|-|ArkTS interoperability context.|
|input|[JSValue](#struct-jsvalue)|Yes|-|ArkTS unified type.|

**Return Value:**

|Type|Description|
|:----|:----|
|Array<T>|Cangjie Option type.|

### static func toArkTsType()

```cangjie
static func toArkTsType(): String
```

**Function:** Get the ArkTS type name corresponding to the Cangjie Array<T> type.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Converted ArkTS type name.|

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Convert Cangjie Array<T> type data to JSValue.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|context|[JSContext](#class-jscontext)|Yes|-|ArkTS interoperability context.|

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

## class JSArray

```cangjie
public class JSArray <: JSHeapObject {}
```

**Function:** A safe reference to an ArkTS array. Supports getting length and reading/writing elements.

**Initial Version:** 21

**Parent Type:**

* [JSHeapObject](#class-jsheapobject)

### prop size

```cangjie
public prop size: Int64
```

**Function:** Get the number of elements.

**Initial Version:** 21

**Type:** Int64

**Read/Write Capability:** Read-only

### func \[](Int64)

```cangjie
public operator func[](index: Int64): JSValue
```

**Function:** Write an element to the ArkTS array.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|index|Int64|Yes|-|Input index, safe range: [0, input count).|

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let jsArr = callInfo[0].asArray(context)
    let firstElement = jsArr[0]
    return firstElement
}
```

### func \[](Int64, JSValue)

```cangjie
public operator func[](index: Int64, value!: JSValue): Unit
```

**Function:** Write an element to the ArkTS array.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|index|Int64|Yes|-|Write index.|
|value|[JSValue](#struct-jsvalue)|Yes|-| **Named parameter.** Value to write.|

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let jsArr = callInfo[0].asArray(context)
    let setValue = context.number(1.0).toJSValue()
    jsArr[0] = setValue
    return setValue
}
```

### func \[](Int64, JSHeapObject)

```cangjie
public operator func[](index: Int64, value!: JSHeapObject): Unit
```

**Function:** Write an element to the ArkTS array.

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|index|Int64|Yes|-|Write index.|
|value|[JSHeapObject](#class-jsheapobject)|Yes|-| **Named parameter.** Value to write.|

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let jsArr = callInfo[0].asArray(context)
    let setValue = context.string("abc")
    jsArr[0] = setValue
    return setValue.toJSValue()
}
```

## class JSArrayBuffer

```cangjie
public class JSArrayBuffer <: JSHeapObject {}
```

**Function:** The JSArrayBuffer object is used to represent a generic raw binary data buffer. By creating a JS ArrayBuffer object, you can obtain the byte length of the object and convert it to a Cangjie array.

**Initial Version:** 21

**Parent Type:**

* [JSHeapObject](#class-jsheapobject)

### prop byteLength

```cangjie
public prop byteLength: Int32
```

**Function:** The byte length of the ArrayBuffer.

**Initial Version:** 21

**Type:** Int32

**Read/Write Capability:** Read-only

### func readBytes()

```cangjie
public func readBytes(): Array<Byte>
```

**Function:** Reads binary data and converts it to a Cangjie array.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<Byte>|Cangjie array.|

### func toArrayBufferJSValue()

```cangjie
public func toArrayBufferJSValue(): JSValue
```

**Function:** Returns the JSValue of ArkTS's ArrayBuffer.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

### func toFloat32Array()

```cangjie
public func toFloat32Array(): Array<Float32>
```

**Function:** Converts to a Cangjie array Array\<Float32>.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<Float32>|Cangjie array.|

### func toFloat32ArrayJSValue()

```cangjie
public func toFloat32ArrayJSValue(): JSValue
```

**Function:** Returns the JSValue of ArkTS's Float32Array.

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

### func toFloat64Array()

```cangjie
public func toFloat64Array(): Array<Float64>
```

**Function:** Converts to a Cangjie array Array\<Float64>.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<Float64>|Cangjie array.|

### func toFloat64ArrayJSValue()

```cangjie
public func toFloat64ArrayJSValue(): JSValue
```

**Function:** Returns the JSValue of ArkTS's Float64Array.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

### func toInt16Array()

```cangjie
public func toInt16Array(): Array<Int16>
```

**Function:** Converts to a Cangjie array Array\<Int16>.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<Int16>|Cangjie array.|

### func toInt16ArrayJSValue()

```cangjie
public func toInt16ArrayJSValue(): JSValue
```

**Function:** Returns the JSValue of ArkTS's Int16Array.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

### func toInt32Array()

```cangjie
public func toInt32Array(): Array<Int32>
```

**Function:** Converts to a Cangjie array Array\<Int32>.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<Int32>|Cangjie array.|

### func toInt32ArrayJSValue()

```cangjie
public func toInt32ArrayJSValue(): JSValue
```

**Function:** Returns the JSValue of ArkTS's Int32Array.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

### func toInt64Array()

```cangjie
public func toInt64Array(): Array<Int64>
```

**Function:** Converts to a Cangjie array Array\<Int64>.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<Int64>|Cangjie array.|

### func toInt64ArrayJSValue()

```cangjie
public func toInt64ArrayJSValue(): JSValue
```

**Function:** Returns the JSValue of ArkTS's BigInt64Array.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

### func toInt8Array()

```cangjie
public func toInt8Array(): Array<Int8>
```

**Function:** Converts to a Cangjie array Array\<Int8>.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<Int8>|Cangjie array.|

### func toInt8ArrayJSValue()

```cangjie
public func toInt8ArrayJSValue(): JSValue
```

**Function:** Returns the JSValue of ArkTS's Int8Array.

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

### func toUInt16Array()
```cangjie
public func toUInt16Array(): Array<UInt16>
```

**Function:** Converts to a Cangjie array of type Array\<UInt16>.

**Since:** 21

**Return Value:**

| Type          | Description        |
|:--------------|:-------------------|
| Array\<UInt16> | Cangjie array.     |

### func toUInt16ArrayJSValue()

```cangjie
public func toUInt16ArrayJSValue(): JSValue
```

**Function:** Returns the JSValue of ArkTS's Uint16Array.

**Since:** 21

**Return Value:**

| Type          | Description        |
|:--------------|:-------------------|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

### func toUInt32Array()

```cangjie
public func toUInt32Array(): Array<UInt32>
```

**Function:** Converts to a Cangjie array of type Array\<UInt32>.

**Since:** 21

**Return Value:**

| Type          | Description        |
|:--------------|:-------------------|
| Array\<UInt32> | Cangjie array.     |

### func toUInt32ArrayJSValue()

```cangjie
public func toUInt32ArrayJSValue(): JSValue
```

**Function:** Returns the JSValue of ArkTS's Uint32Array.

**Since:** 21

**Return Value:**

| Type          | Description        |
|:--------------|:-------------------|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

### func toUInt64Array()

```cangjie
public func toUInt64Array(): Array<UInt64>
```

**Function:** Converts to a Cangjie array of type Array\<UInt64>.

**Since:** 21

**Return Value:**

| Type          | Description        |
|:--------------|:-------------------|
| Array\<UInt64> | Cangjie array.     |

### func toUInt64ArrayJSValue()

```cangjie
public func toUInt64ArrayJSValue(): JSValue
```

**Function:** Returns the JSValue of ArkTS's BigUint64Array.

**Since:** 21

**Return Value:**

| Type          | Description        |
|:--------------|:-------------------|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

### func toUInt8Array()

```cangjie
public func toUInt8Array(): Array<UInt8>
```

**Function:** Converts to a Cangjie array of type Array\<UInt8>.

**Since:** 21

**Return Value:**

| Type          | Description        |
|:--------------|:-------------------|
| Array\<UInt8> | Cangjie array.     |

### func toUInt8ArrayJSValue()

```cangjie
public func toUInt8ArrayJSValue(): JSValue
```

**Function:** Returns the JSValue of ArkTS's Uint8Array.

**Since:** 21

**Return Value:**

| Type          | Description        |
|:--------------|:-------------------|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

### func toUInt8ClampedArrayJSValue()

```cangjie
public func toUInt8ClampedArrayJSValue(): JSValue
```

**Function:** Returns the JSValue of ArkTS's Uint8ClampedArray.

**Since:** 21

**Return Value:**

| Type          | Description        |
|:--------------|:-------------------|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## class JSArrayEx

```cangjie
public class JSArrayEx<T> <: JSInteropType<JSArrayEx<T>> where T <: JSInteropType <T> {
    public init(arr: Array<T>)
}
```

**Function:** Used in declarative interop macros, corresponding to ArkTS's Array\<T> type.

**Since:** 21

**Parent Type:**

* [JSInteropType\<JSArrayEx\<T>>](#interface-jsinteroptype)

### prop size

```cangjie
public prop size: Int64
```

**Function:** Gets the number of elements.

**Since:** 21

**Type:** Int64

**Access:** Read-only

### init(Array\<T>)

```cangjie
public init(arr: Array<T>)
```

**Function:** Constructs a corresponding JSArrayEx\<T> instance from the given Array\<T>.

**Since:** 21

**Parameters:**

| Parameter | Type       | Required | Default | Description                     |
|:----------|:-----------|:---------|:--------|:--------------------------------|
| arr       | Array\<T>  | Yes      | -       | Created based on this Array instance. |

### static func fromJSValue(JSContext, JSValue)

```cangjie
public static func fromJSValue(context: JSContext, input: JSValue): JSArrayEx<T>
```

**Function:** Converts from JSValue to JSArrayEx. Used in declarative interop macro framework scenarios; developers do not need to use this API.

**Since:** 21

**Parameters:**

| Parameter | Type          | Required | Default | Description                     |
|:----------|:--------------|:---------|:--------|:--------------------------------|
| context   | [JSContext](#class-jscontext) | Yes      | -       | ArkTS interop context.          |
| input     | [JSValue](#struct-jsvalue)    | Yes      | -       | ArkTS unified type.             |

**Return Value:**

| Type                     | Description                     |
|:-------------------------|:--------------------------------|
| [JSArrayEx](#class-jsarrayex)\<T> | Declarative interop macro type JSArrayEx. |

### static func toArkTsType()

```cangjie
public static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie type. Used in declarative interop macro framework scenarios; developers do not need to use this API.

**Since:** 21

**Return Value:**

| Type   | Description                     |
|:-------|:--------------------------------|
| String | Converted ArkTS type name.      |

### func clone()

```cangjie
public func clone(): JSArrayEx<T>
```

**Function:** Clones the JSArrayEx, performing a deep copy of the JSArrayEx data.

**Since:** 21

**Return Value:**

| Type                     | Description                     |
|:-------------------------|:--------------------------------|
| [JSArrayEx](#class-jsarrayex)\<T> | New JSArrayEx obtained by cloning. |

### func concat(JSArrayEx\<T>)

```cangjie
public func concat(other: JSArrayEx<T>): JSArrayEx<T>
```

**Function:** This function creates a new JSArrayEx by concatenating the current JSArrayEx with the JSArrayEx pointed to by `other`.

**Since:** 21

**Parameters:**

| Parameter | Type                     | Required | Default | Description                     |
|:----------|:-------------------------|:---------|:--------|:--------------------------------|
| other     | [JSArrayEx](#class-jsarrayex)\<T> | Yes      | -       | JSArrayEx to concatenate at the end. |

**Return Value:**

| Type                     | Description                     |
|:-------------------------|:--------------------------------|
| [JSArrayEx](#class-jsarrayex)\<T> | New JSArrayEx obtained by concatenation. |

### func get(Int64)

```cangjie
public func get(index: Int64): Option<T>
```

**Function:** Gets the element corresponding to the specified index in the array.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| index | Int64 | Yes | - | The index of the element to retrieve. |

**Return Value:**

| Type | Description |
|:----|:----|
| Option\<T> | The value corresponding to the specified index in the current array. |

### func isEmpty()

```cangjie
public func isEmpty(): Bool
```

**Function:** Determines whether the array is empty.

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the array is empty; otherwise, returns `false`. |

### func set(Int64, T)

```cangjie
public func set(index: Int64, element: T): Unit
```

**Function:** Modifies the value corresponding to the specified index in the array.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| index | Int64 | Yes | - | The index of the value to modify, ranging from [0..this.size]. |
| element | T | Yes | - | The target value to set. |

### func toArray()

```cangjie
public func toArray(): Array<T>
```

**Function:** Converts to an Array.

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<T> | The converted Cangjie array. |

### func toJSValue(JSContext)

```cangjie
public func toJSValue(context: JSContext): JSValue
```

**Function:** Converts to a JSValue. Used in declarative interoperability macro framework scenarios; developers do not need to use this API.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | The ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | The ArkTS unified type. |

### func \[](Int64)

```cangjie
public operator func[](index: Int64): T
```

**Function:** Retrieves the value corresponding to the specified index in the array.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| index | Int64 | Yes | - | The index of the value to retrieve. |

**Return Value:**

| Type | Description |
|:----|:----|
| T | The value corresponding to the specified index in the current array. |

### func \[](Int64, T)

```cangjie
public operator func[](index: Int64, value!: T)
```

**Function:** Modifies the value corresponding to the specified index in the array.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| index | Int64 | Yes | - | The index of the value to modify, ranging from [0..this.size]. |
| value | T | Yes | - | **Named parameter.** The target value to set. |

## class JSBigInt

```cangjie
public class JSBigInt <: JSHeapObject {}
```

**Initial Version:** 21

**Function:** The JSBigInt object represents a safe reference to the JS bigint type. By creating a JS bigint object, it can be converted to a Cangjie Int64 or Cangjie BigInt.

**Parent Type:**

* [JSHeapObject](#class-jsheapobject)

### func toBigInt()

```cangjie
public func toBigInt(): BigInt
```

**Function:** Converts to a Cangjie BigInt.

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| BigInt | The Cangjie BigInt. |

## class JSClass

```cangjie
public class JSClass <: JSHeapObject {}
```

**Function:** A safe reference to an ArkTS class (constructor). Methods and accessors can be added to this class, and instances of this class can be created.

**Initial Version:** 21

**Parent Type:**

* [JSHeapObject](#class-jsheapobject)

### prop prototype

```cangjie
public prop prototype: JSObject
```

**Function:** The prototype object of the class.

**Initial Version:** 21

**Type:** [JSObject](#class-jsobject)

**Read/Write Capability:** Read-only

### func addAccessor(JSKeyable, ?JSFunction, ?JSFunction)

```cangjie
public func addAccessor(key: JSKeyable, getter!: ?JSFunction = None, setter!: ?JSFunction = None): Unit
```

**Function:** Defines a pair of getter and setter for the current ArkTS class.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | [JSKeyable](#interface-jskeyable) | Yes | - | The property key. |
| getter | ?[JSFunction](#class-jsfunction) | No | None | **Named parameter.** The getter implementation. |
| setter | ?[JSFunction](#class-jsfunction) | No | None | **Named parameter.** The setter implementation. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let ctor: JSLambda = { _, callInfo =>
        return callInfo.thisArg
    }
    let clazz = context.clazz(ctor)
    let getClassKind: JSLambda = { context, _ =>
        context.string("aaa").toJSValue()
    }
    clazz.addAccessor("classKind", getter: context.function(getClassKind))
    let obj = clazz.new()
    let classKind = obj.getProperty(context, "classKind").toString(context)
    println("class kind is ${classKind}")
    return obj
}
```

### func addAccessor(JSKeyable, ?JSLambda, ?JSLambda)

```cangjie
public func addAccessor(key: JSKeyable, getter!: ?JSLambda = None, setter!: ?JSLambda = None): Unit
```

**Function:** Defines a pair of getter and setter for the current ArkTS class.

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Property key. |  
| getter | ?[JSLambda](#type-jslambda) | No | None | **Named parameter.** Getter implementation. |  
| setter | ?[JSLambda](#type-jslambda) | No | None | **Named parameter.** Setter implementation. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let ctor: JSLambda = { _, callInfo =>  
        return callInfo.thisArg  
    }  
    let clazz = context.clazz(ctor)  
    let getClassKind: JSLambda = { context, _ =>  
        context.string("aaa").toJSValue()  
    }  
    clazz.addAccessor("classKind", getter: getClassKind)  
    let obj = clazz.new()  
    let classKind = obj.getProperty(context, "classKind").toString(context)  
    println("class kind is ${classKind}")  
    return obj  
}  
```  

### func addMethod(JSKeyable, JSFunction)  

```cangjie  
public func addMethod(key: JSKeyable, method: JSFunction): Unit  
```  

**Function:** Defines a method for the current ArkTS class.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Property key. |  
| method | [JSFunction](#class-jsfunction) | Yes | - | Method implementation. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let ctor: JSLambda = { _, callInfo =>  
        return callInfo.thisArg  
    }  
    let clazz = context.clazz(ctor)  
    let getClassKind: JSLambda = { context, _ =>  
        context.string("aaa").toJSValue()  
    }  
    clazz.addMethod("getClassKind", context.function(getClassKind))  
    let obj = clazz.new()  
    let classKind = obj.getProperty(context, "classKind").toString(context)  
    println("class kind is ${classKind}")  
    return obj  
}  
```  

### func addMethod(JSKeyable, JSLambda)  

```cangjie  
public func addMethod(key: JSKeyable, method: JSLambda): Unit  
```  

**Function:** Defines a method for the current ArkTS class.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Property key. |  
| method | [JSLambda](#type-jslambda) | Yes | - | Method implementation. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let ctor: JSLambda = { _, callInfo =>  
        return callInfo.thisArg  
    }  
    let clazz = context.clazz(ctor)  
    let getClassKind: JSLambda = { context, _ =>  
        context.string("aaa").toJSValue()  
    }  
    clazz.addMethod("getClassKind", getClassKind)  
    let obj = clazz.new()  
    let classKind = obj.getProperty(context, "classKind").toString(context)  
    println("class kind is ${classKind}")  
    return obj  
}  
```  

### func addProperty(JSKeyable, JSValue)  

```cangjie  
public func addProperty(key: JSKeyable, value: JSValue): Unit  
```  

**Function:** Adds a data member to the target ArkTS class, typically used for defining immutable properties.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Property key. |  
| value | [JSValue](#struct-jsvalue) | Yes | - | Property value. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let ctor: JSLambda = { _, callInfo =>  
        return callInfo.thisArg  
    }  
    let clazz = context.clazz(ctor)  
    clazz.addProperty("classKind", context.string("CustomClass").toJSValue())  
    let obj = clazz.new()  
    let classKind = obj.getProperty(context, "classKind").toString(context)  
    println("class kind is ${classKind}")  
    return obj  
}  
```  

### func new()  

```cangjie  
public func new(): JSValue  
```  

**Function:** Instantiates a new object from the ArkTS class.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [JSValue](#struct-jsvalue) | The newly instantiated object. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let ctor: JSLambda = { _, callInfo =>  
        return callInfo.thisArg  
    }  
    let clazz = context.clazz(ctor)  
    let obj = clazz.new()  
    return obj  
}  
```  

### func new(JSValue)  

```cangjie  
public func new(arg: JSValue): JSValue  
```  

**Function:** Instantiates a new object from the ArkTS class.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| arg | [JSValue](#struct-jsvalue) | Yes | - | Argument for instantiation. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [JSValue](#struct-jsvalue) | The newly instantiated object. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let ctor: JSLambda = { context, callInfo =>  
        let firstArg = callInfo[0]  
        let thisArg = callInfo.thisArg  
        thisArg.setProperty(context, "id", firstArg)  
        return thisArg  
    }  
    let clazz = context.clazz(ctor)  
    let id = context.number(1.0)  
    let obj = clazz.new(id.toJSValue())  
    return obj  
}  
```  

### func new(Array\<JSValue>)  

```cangjie  
public func new(args: Array<JSValue>): JSValue  
```  

**Function:** Instantiates a new object from the ArkTS class.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| args | Array\<[JSValue](#struct-jsvalue)> | Yes | - | List of arguments for instantiation. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [JSValue](#struct-jsvalue) | The newly instantiated object. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let ctor: JSLambda = { context, callInfo =>  
        let id = callInfo[0]  
        let name = callInfo[1]  
        let thisArg = callInfo.thisArg  
        thisArg.setProperty(context, "id", id)  
        thisArg.setProperty(context, "name", name)  
        return thisArg  
    }  
    let clazz = context.clazz(ctor)  
    let id = context.number(1.0)  
    let name = context.string("aaa")  
    let obj = clazz.new([id.toJSValue(), name.toJSValue()])  
    return obj  
}  
```  

## class JSContext

```cangjie
public class JSContext {}
```

**Function:** A single-threaded ArkTS interoperability context.

**Initial Version:** 21

JSContext has a one-to-one relationship with the ArkTS runtime. Its primary purpose is to create JSValue and safe references, and manage the lifecycle of Cangjie objects referenced on the ArkTS side.

A JSContext holds a weak reference to an ArkTS runtime. This JSContext does not affect the lifecycle of the ArkTS runtime. When the ArkTS runtime becomes invalid, using this JSContext will throw a Cangjie exception.

### prop env

```cangjie
public prop env: JSEnv
```

**Function:** ArkTS interoperability context.

**Initial Version:** 21

**Type:** JSEnv

**Access:** Read-only

### prop global

```cangjie
public prop global: JSObject
```

**Function:** JavaScript global environment variable `globalThis`.

**Initial Version:** 21

**Type:** [JSObject](#class-jsobject)

**Access:** Read-only

### func array(Array\<JSValue>)

```cangjie
public func array(arr: Array<JSValue>): JSArray
```

**Function:** Creates an ArkTS array.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| arr | Array\<[JSValue](#struct-jsvalue)> | Yes | - | Reference to the ArkTS array. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArray](#class-jsarray) | ArkTS array |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.array([])
    return result.toJSValue()
}
```

### func arrayBuffer(Int32)

```cangjie
public func arrayBuffer(length: Int32): JSArrayBuffer
```

**Function:** Creates an ArkTS ArrayBuffer from a memory block.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| length | Int32 | Yes | - | Size of the memory block. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | Reference to the ArkTS ArrayBuffer object. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.arrayBuffer(Int32(10))
    return result.toJSValue()
}
```

### func arrayBuffer(Array\<Byte>)

```cangjie
public func arrayBuffer(data: Array<Byte>): JSArrayBuffer
```

**Function:** Creates an ArkTS ArrayBuffer from a memory block.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| data | Array\<Byte> | Yes | - | Cangjie array. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | Reference to the ArkTS ArrayBuffer object. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let array : Array<Byte> = [1, 2, 3, 4, 5]
    let result = context.arrayBuffer(array)
    return result.toJSValue()
}
```

### func arrayBuffer(Array\<Int8>)

```cangjie
public func arrayBuffer(data: Array<Int8>): JSArrayBuffer
```

**Function:** Creates an ArkTS ArrayBuffer from a memory block.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| data | Array\<Int8> | Yes | - | Cangjie array. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | Reference to the ArkTS ArrayBuffer object. |

### func arrayBuffer(Array\<Int16>)

```cangjie
public func arrayBuffer(data: Array<Int16>): JSArrayBuffer
```

**Function:** Creates an ArkTS ArrayBuffer from a memory block.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| data | Array\<Int16> | Yes | - | Cangjie array. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | Reference to the ArkTS ArrayBuffer object. |

### func arrayBuffer(Array\<UInt16>)

```cangjie
public func arrayBuffer(data: Array<UInt16>): JSArrayBuffer
```

**Function:** Creates an ArkTS ArrayBuffer from a memory block.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| data | Array\<UInt16> | Yes | - | Cangjie array. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | Reference to the ArkTS ArrayBuffer object. |

### func arrayBuffer(Array\<UInt32>)

```cangjie
public func arrayBuffer(data: Array<UInt32>): JSArrayBuffer
```

**Function:** Creates an ArkTS ArrayBuffer from a memory block.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| data | Array\<UInt32> | Yes | - | Cangjie array. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | Reference to the ArkTS ArrayBuffer object. |

### func arrayBuffer(Array\<Int32>)

```cangjie
public func arrayBuffer(data: Array<Int32>): JSArrayBuffer
```
**Function:** Creates an ArkTS ArrayBuffer from a memory block.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| data | Array\<Int32> | Yes | - | Cangjie array. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | Reference to an ArkTS ArrayBuffer object. |

### func arrayBuffer(Array\<Float32>)

```cangjie
public func arrayBuffer(data: Array<Float32>): JSArrayBuffer
```

**Function:** Creates an ArkTS ArrayBuffer from a memory block.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| data | Array\<Float32> | Yes | - | Cangjie array. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | Reference to an ArkTS ArrayBuffer object. |

### func arrayBuffer(Array\<Int64>)

```cangjie
public func arrayBuffer(data: Array<Int64>): JSArrayBuffer
```

**Function:** Creates an ArkTS ArrayBuffer from a memory block.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| data | Array\<Int64> | Yes | - | Cangjie array. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | Reference to an ArkTS ArrayBuffer object. |

### func arrayBuffer(Array\<UInt64>)

```cangjie
public func arrayBuffer(data: Array<UInt64>): JSArrayBuffer
```

**Function:** Creates an ArkTS ArrayBuffer from a memory block.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| data | Array\<UInt64> | Yes | - | Cangjie array. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | Reference to an ArkTS ArrayBuffer object. |

### func arrayBuffer(Array\<Float64>)

```cangjie
public func arrayBuffer(data: Array<Float64>): JSArrayBuffer
```

**Function:** Creates an ArkTS ArrayBuffer from a memory block.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| data | Array\<Float64> | Yes | - | Cangjie array. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | Reference to an ArkTS ArrayBuffer object. |

### func arrayBuffer(CPointer\<Byte>, Int32, JSBufferFinalizer)

```cangjie
public unsafe func arrayBuffer(rawData: CPointer<Byte>, length: Int32, finalizer: JSBufferFinalizer): JSArrayBuffer
```

**Function:** Creates an ArkTS ArrayBuffer from a memory block.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| rawData | CPointer\<Byte> | Yes | - | Memory block address. |
| length | Int32 | Yes | - | Memory block size. |
| finalizer | [JSBufferFinalizer](#type-jsbufferfinalizer) | Yes | - | Memory block cleanup function. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | Reference to an ArkTS ArrayBuffer object. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let rawPtr = unsafe {
        LibC.malloc<Byte>(count: 10)
    }
    let result = unsafe { context.arrayBuffer(rawPtr, 10) { rawPtr =>
        LibC.free(rawPtr)
    }}
    return result.toJSValue()
}
```

### func bigint(Int64)

```cangjie
public func bigint(value: Int64): JSBigInt
```

**Function:** Creates an ArkTS bigint with the same value as the Cangjie BigInt.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Int64 | Yes | - | Cangjie BigInt. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSBigInt](#class-jsbigint) | Reference to an ArkTS bigint object. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.bigint(100)
    return result.toJSValue()
}
```

### func bigint(BigInt)

```cangjie
public func bigint(value: BigInt): JSBigInt
```

**Function:** Creates an ArkTS bigint with the same value as the Cangjie BigInt.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | BigInt | Yes | - | Cangjie BigInt. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSBigInt](#class-jsbigint) | Reference to an ArkTS bigint object. |

**Example:**

<!--compile-->
```cangjie
import std.math.numeric.BigInt

func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.bigint(BigInt(100))
    return result.toJSValue()
}
```

### func boolean(Bool)

```cangjie
public func boolean(value: Bool): JSBoolean
```

**Function:** Creates an ArkTS boolean.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | Bool | Yes | - | Cangjie boolean value. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSBoolean](#struct-jsboolean) | ArkTS boolean value. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.boolean(true)
    return result.toJSValue()
}
```

### func clazz(JSLambda, ?JSClass)

```cangjie
public func clazz(ctor: JSLambda, superClass!: ?JSClass = None): JSClass
```

**Function:** Creates an ArkTS class.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| ctor | [JSLambda](#type-jslambda) | Yes | - | Cangjie function serving as the class constructor. |
| superClass | ?[JSClass](#class-jsclass) | No | None | **Named parameter.** Parent class of the ArkTS class. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSClass](#class-jsclass) | Reference to an ArkTS class. |

**Example:**

<!--compile-->
```cangjie
func clsCtor(context: JSContext, callInfo: JSCallInfo): JSValue {
    callInfo.thisArg
}

func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.clazz(clsCtor)
    return result.toJSValue()
}
```
### func external(SharedObject)

```cangjie
public func external(data: SharedObject): JSExternal
```

**Description:** Creates an ArkTS reference to a Cangjie object.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| data | [SharedObject](#class-sharedobject) | Yes | - | The original Cangjie object. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSExternal](#class-jsexternal) | ArkTS reference to the Cangjie object. |

**Example:**

<!--compile-->
```cangjie
class Data <: SharedObject {}

func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let data = Data()
    let result = context.external(data)
    return result.toJSValue()
}
```

### func function(JSLambda)

```cangjie
public func function(lambda: JSLambda): JSFunction
```

**Description:** Creates an ArkTS function.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| lambda | [JSLambda](#type-jslambda) | Yes | - | Cangjie function. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSFunction](#class-jsfunction) | Reference to the ArkTS function. |

**Example:**

<!--compile-->
```cangjie
func jsCallback(context: JSContext, callInfo: JSCallInfo): JSValue {
    return context.undefined().toJSValue()
}

func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.function(jsCallback)
    return result.toJSValue()
}
```

### func getNapiEnv()

```cangjie
public func getNapiEnv(): napi_env
```

**Description:** Gets a pointer to the global environment.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [napi_env](#type-napi_env) | Pointer to the global environment. |

### func isInBindThread()

```cangjie
public func isInBindThread(): Bool
```

**Description:** Multi-threading utility: Checks whether the current thread can execute interoperation interfaces.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the current thread can call interoperation interfaces. |

**Example:**

<!--compile-->
```cangjie
func createObject(context: JSContext): JSObject {
    if (!context.isInBindThread()) {
        throw Exception("not able to call arkts on current thread")
    }
    return context.object()
}
```

### func null()

```cangjie
public func null(): JSNull
```

**Description:** Creates an ArkTS `null`.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSNull](#struct-jsnull) | Returns ArkTS `null`. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.null()
    return result.toJSValue()
}
```

### func number(Float64)

```cangjie
public func number(value: Float64): JSNumber
```

**Description:** Creates an ArkTS `number`.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Float64 | Yes | - | Cangjie Int32 number. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSNumber](#struct-jsnumber) | ArkTS `number`. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.number(1.0)
    return result.toJSValue()
}
```

### func number(Int32)

```cangjie
public func number(value: Int32): JSNumber
```

**Description:** Creates an ArkTS `number`.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | Int32 | Yes | - | Cangjie Int32 number. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSNumber](#struct-jsnumber) | ArkTS `number`. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.number(Int32(10))
    return result.toJSValue()
}
```

### func object()

```cangjie
public func object(): JSObject
```

**Description:** Creates an empty ArkTS `object` reference.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSObject](#class-jsobject) | ArkTS `object` reference. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.object()
    return result.toJSValue()
}
```

### func postJSTask(() -> Unit)

```cangjie
public func postJSTask(callback: ()->Unit): Unit
```

**Description:** Multi-threading utility: Creates a task to be executed on the ArkTS thread.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ()->Unit | Yes | - | Task to be executed on the ArkTS thread. |

**Example:**

<!--compile-->
```cangjie
func createObject(context: JSContext, callback: (JSObject)->Unit): Unit {
    if (context.isInBindThread()) {
        callback(context.object())
    } else {
        context.postJSTask {
            callback(context.object())
        }
    }
}
```

### func promiseCapability()

```cangjie
public func promiseCapability(): JSPromiseCapability
```

**Description:** Creates an ArkTS `Promise`.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSPromiseCapability](#class-jspromisecapability) | Native reference to the ArkTS `Promise`. |

**Example:**<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.promiseCapability()
    return result.toJSValue()
}
```

### func requireSystemNativeModule(String, ?String)

```cangjie
public func requireSystemNativeModule(moduleName: String, prefix!: ?String = None): JSValue
```

**Function:** Loads a built-in ArkTS NAPI module from the system.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| moduleName | String | Yes | - | Registered name of the ArkTS NAPI module. |
| prefix | ?String | No | None | **Named parameter.** Archive directory of the ArkTS NAPI module. Can be omitted if located under `/system/lib64/module`. For subdirectories, specify the subdirectory name. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | Return value of the module, typically an object. Returns undefined if loading fails. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext): Unit {
    let hilog = context.requireSystemNativeModule("hilog")
    let pushService = context.requireSystemNativeModule("core.push.pushService", prefix: "hms")
}
```

### func string(String)

```cangjie
public func string(value: String): JSString
```

**Function:** Creates an ArkTS string.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | Cangjie string. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSString](#class-jsstring) | Reference to the ArkTS string. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.string("abc")
    return result.toJSValue()
}
```

### func string(Utf16String)

```cangjie
public func string(value: Utf16String): JSString
```

**Function:** Creates a JSString from a Utf16String.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [Utf16String](#class-utfstring) | Yes | - | Source Utf16String object. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSString](#class-jsstring) | JSString created from the source object. |

### func symbol(String)

```cangjie
public func symbol(description!: String = ""): JSSymbol
```

**Function:** Creates an ArkTS symbol object.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| description | String | No | "" | **Named parameter.** Description of the symbol. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSSymbol](#class-jssymbol) | Reference to the ArkTS symbol object. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.symbol()
    let symbol1 = context.symbol(description: "Symbol1")
    return result.toJSValue()
}
```

### func undefined()

```cangjie
public func undefined(): JSUndefined
```

**Function:** Creates an ArkTS undefined value.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSUndefined](#struct-jsundefined) | Returns ArkTS undefined. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let result = context.undefined()
    return result.toJSValue()
}
```

## class JSExternal

```cangjie
public class JSExternal <: JSHeapObject {}
```

**Function:** A Cangjie object reference that can be passed to the ArkTS side. Can retrieve the bound Cangjie object.

**Since:** 21

JSExternal aims to pass a strong reference of a Cangjie object to the ArkTS runtime. It can be used with other user-defined interoperability interfaces to access this Cangjie object.

**Parent Class:**

* [JSHeapObject](#class-jsheapobject)

### func cast\<T>() where T <: SharedObject

```cangjie
public func cast<T>(): Option<T> where T <: SharedObject
```

**Function:** Retrieves the bound SharedObject and casts it to type T.

**Since:** 21

**Return Value:**
| Type | Description |
|:----|:----|
| Option\<T> | The bound Cangjie object. |

**Example:**

<!--compile-->
```cangjie
class Data <: SharedObject {
    func doSth() {}
}

func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let external = callInfo[0].asExternal(context)

    if (let Some(data) <- external.cast<Data>()) {
         data.doSth()
     }

    context.undefined().toJSValue()
}
```

### func getData()

```cangjie
public func getData(): SharedObject
```

**Function:** Gets the bound SharedObject.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [SharedObject](#class-sharedobject) | The bound Cangjie object. |

**Example:**

<!--compile-->
```cangjie
class Data <: SharedObject {
    func doSth() {}
}

func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let external = callInfo[0].asExternal(context)

    let sharedObject = external.getData()
    if (let Some(data) <- (sharedObject as Data)) {
         data.doSth()
     }

    context.undefined().toJSValue()
}
```

## class JSFunction

```cangjie
public class JSFunction <: JSHeapObject {}
```

**Function:** A secure reference to an ArkTS function.

**Since:** 21

**Parent Type:**

* [JSHeapObject](#class-jsheapobject)

### func call(JSValue)

```cangjie
public func call(thisArg!: JSValue = context.undefined().toJSValue()): JSValue
```

**Function:** Performs an ArkTS function call (multiple parameters).

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| thisArg | [JSValue](#struct-jsvalue) | No | context.undefined().toJSValue() | **Named parameter.** The `this` pointer. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | The return value of the function call. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let callback = callInfo[0].asFunction(context)
    return callback.call()
}
```

### func call(JSValue, JSValue)

```cangjie
public func call(arg: JSValue, thisArg!: JSValue = context.undefined().toJSValue()): JSValue
```

**Function:** Performs an ArkTS function call (multiple parameters).

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| arg | [JSValue](#struct-jsvalue) | Yes | - | The input parameter for the ArkTS function call. |
| thisArg | [JSValue](#struct-jsvalue) | No | context.undefined().toJSValue() | **Named parameter.** The `this` pointer for the ArkTS function call. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | The return value of the function call. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let callback = callInfo[0].asFunction(context)
    let arg0 = context.number(1.0).toJSValue()
    return callback.call(arg0)
}
```

### func call(Array\<JSValue>, JSValue)

```cangjie
public func call(args: Array<JSValue>, thisArg!: JSValue = context.undefined().toJSValue()): JSValue
```

**Function:** Performs an ArkTS function call (multiple parameters).

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| args | Array\<[JSValue](#struct-jsvalue)> | Yes | - | The list of parameters. |
| thisArg | [JSValue](#struct-jsvalue) | No | context.undefined().toJSValue() | **Named parameter.** The `this` pointer. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | The return value of the function call. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let callback = callInfo[0].asFunction(context)
    let arg0 = context.number(1.0).toJSValue()
    let arg1 = context.boolean(false).toJSValue()
    return callback.call([arg0, arg1])
}
```

## class JSHashMapEx

```cangjie
public class JSHashMapEx<K, V> <: JSInteropType<JSHashMapEx<K,V>> where K <: JSKeyable & Hashable & Equatable <K> & JSInteropType <K>V <: JSInteropType <V> {
    public init(map: HashMap<K, V>)
    public init()
}
```

**Function:** Used in declarative interop macros, corresponding to the ArkTS Map type.

**Since:** 21

**Parent Type:**

* [JSInteropType\<JSHashMapEx\<K,V>>](#interface-jsinteroptype)

### prop size

```cangjie
public prop size: Int64
```

**Function:** Returns the number of key-value pairs.

**Since:** 21

**Type:** Int64

**Read-Write Capability:** Read-only

### init(HashMap\<K,V>)

```cangjie
public init(map: HashMap<K, V>)
```

**Function:** Constructs an empty JSHashMapEx\<K, V> instance.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| map | HashMap\<K, V> | Yes | - | Creates based on this HashMap instance. |

### init()

```cangjie
public init()
```

**Function:** Constructs an empty JSHashMapEx\<K, V> instance.

**Since:** 21

### static func fromJSValue(JSContext, JSValue)

```cangjie
public static func fromJSValue(context: JSContext, input: JSValue): JSHashMapEx<K, V>
```

**Function:** Converts from JSValue to JSHashMapEx. Used in declarative interop macro framework scenarios; developers do not need to use this API.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](#class-jscontext) | Yes | - | The ArkTS interop context. |
| input | [JSValue](#struct-jsvalue) | Yes | - | The ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSHashMapEx](#class-jshashmapex)\<K, V> | The declarative interop macro type JSHashMapEx. |

### static func toArkTsType()

```cangjie
public static func toArkTsType(): String
```

**Function:** Gets the ArkTS type name corresponding to the Cangjie type. Used in declarative interop macro framework scenarios; developers do not need to use this API.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The converted ArkTS type name. |

### func clear()

```cangjie
public func clear(): Unit
```

**Function:** Removes all elements from this HashMapEx.
**Initial Version:** 21

### func clone()

```cangjie
public func clone(): JSHashMapEx<K, V>
```

**Description:** Clones the JSHashMapEx, performing a deep copy of the JSHashMapEx data.

**Return Value:**

| Type | Description |
|:----|:----|
| [JSHashMapEx](#class-jshashmapex)\<K, V> | The newly cloned JSHashMapEx. |

### func containsAll(Collection\<K>)

```cangjie
public func containsAll(keys: Collection<K>): Bool
```

**Description:** Determines whether mappings for all keys in the specified collection are present.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| keys | Collection\<K> | Yes | - | The collection of keys to be checked. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if all keys are contained; otherwise, returns `false`. |

### func delete(K)

```cangjie
public func delete(key: K): Bool
```

**Description:** Removes the mapping for the specified key from this JSHashMapEx if present.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | K | Yes | - | The key to be removed. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the key existed and was successfully removed; otherwise, returns `false`. |

### func deleteAll(Collection\<K>)

```cangjie
public func deleteAll(keys: Collection<K>): Unit
```

**Description:** Removes mappings for all keys in the specified collection from this JSHashMapEx if present.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| keys | Collection\<K> | Yes | - | The collection of keys to be removed. |

### func deleteIf((K,V) -> Bool)

```cangjie
public func deleteIf(predicate: (K, V) -> Bool): Unit
```

**Description:** Removes all key-value pairs that satisfy the given predicate.

This function traverses the entire JSHashMapEx and removes all key-value pairs where `predicate(K, V) == true`.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| predicate | (K, V)->Bool | Yes | - | A lambda expression used for evaluation. |

### func get(K)

```cangjie
public func get(key: K): Option<V>
```

**Description:** Returns the value to which the specified key is mapped, or `Option<V>.None` if no mapping exists.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | K | Yes | - | The input key. |

**Return Value:**

| Type | Description |
|:----|:----|
| Option\<V> | The value corresponding to the key, encapsulated in `Option`. |

### func has(K)

```cangjie
public func has(key: K) : Bool
```

**Description:** Determines whether a mapping for the specified key exists.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | K | Yes | - | The key to be checked. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the key exists; otherwise, returns `false`. |

### func isEmpty()

```cangjie
public func isEmpty(): Bool
```

**Description:** Determines whether the JSHashMapEx is empty. Returns `true` if empty; otherwise, returns `false`.

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Indicates whether the JSHashMapEx is empty. |

### func keys()

```cangjie
public func keys(): EquatableCollection<K>
```

**Description:** Returns all keys in the JSHashMapEx, stored in a Keys container.

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| EquatableCollection\<K> | A container holding all returned keys. |

### func set(K, V)

```cangjie
public func set(key: K, value: V): Unit
```

**Description:** Inserts a key-value pair into the JSHashMapEx.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | K | Yes | - | The key to be inserted. |
| value | V | Yes | - | The value to be assigned. |

### func setAll(Collection\<(K,V)>)

```cangjie
public func setAll(elements: Collection<(K, V)>): Unit
```

**Description:** Inserts a collection of key-value pairs into the JSHashMapEx in the order of the collection's iterator.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| elements | Collection\<(K, V)> | Yes | - | The collection of key-value pairs to be added to the JSHashMapEx. |

### func setIfAbsent(K, V)

```cangjie
public func setIfAbsent(key: K, value: V): Bool
```

**Description:** Inserts the key-value pair `(key, value)` into the JSHashMapEx if the key is not already present.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | K | Yes | - | The key to be inserted. |
| value | V | Yes | - | The value to be assigned. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `false` if the key existed before insertion; otherwise, returns `true`. |

### func toHashMap()

```cangjie
public func toHashMap(): HashMap<K, V>
```

**Description:** Converts the JSHashMapEx to a HashMap.

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| HashMap\<K, V> | The converted HashMap. |

### func toJSValue(JSContext)

```cangjie
public func toJSValue(c: JSContext): JSValue
```
**Function:** Convert to JSValue. Used in declarative interoperability macro framework scenarios. Developers do not need to use this API.

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| c | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

### func values()

```cangjie
public func values(): Collection<V>
```

**Function:** Returns the values contained in JSHashMapEx and stores all values in a Values container.

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Collection\<V> | Stores all returned values. |

### func \[](K)

```cangjie
public operator func [](key: K): V
```

**Function:** Operator overload for the set method. If the key exists, the new value overwrites the old value. If the key does not exist, this key-value pair is added.

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | K | Yes | - | The key to be placed. |

**Return Value:**

| Type | Description |
|:----|:----|
| V | The value corresponding to the key. |

### func \[](K, V)

```cangjie
public operator func [](key: K, value!: V): Unit
```

**Function:** Operator overload for the set method. If the key exists, the new value overwrites the old value. If the key does not exist, this key-value pair is added.

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | K | Yes | - | The key to be placed. |
| value | V | Yes | - | **Named parameter.** The value to be assigned. |

## class JSHeapObject

```cangjie
sealed abstract class JSHeapObject {}
```

**Function:** A strong reference to an ArkTS runtime object (but it will not exceed the lifecycle of the ArkTS runtime nor prevent the ArkTS runtime from being destroyed). Can be converted to JSValue.

**Initial Version:** 21

It is the base class for all safe references. Users cannot create it; they can only create its subclasses (hidden constructor). Its purpose is to allow the referenced ArkTS runtime object to persist longer than the Cangjie object itself.

### func toJSValue()

```cangjie
public func toJSValue(): JSValue
```

**Function:** Convert to JSValue.

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## class JSModule

```cangjie
public class JSModule {}
```

**Function:** A static class that provides an interface for exporting symbols.

**Initial Version:** 21

The goal of JSModule is to provide symbol export capability (exporting to ArkTS). It works with custom static initialization functions to register export targets in a global table when the dynamic library is loaded, and the ArkTS engine executes the exports.

### static func registerClass(String, ClassRegister)

```cangjie
public static func registerClass(name: String, register: ClassRegister): Unit
```

**Function:** Register an ArkTS class (constructor) to be exported to ArkTS.

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Export name. |
| register | [ClassRegister](#type-classregister) | Yes | - | A function that returns an ArkTS class. |

**Example:**

```cangjie
class Main {
    static init() {
        JSModule.registerClass("SomeClass") { context =>
            let ctor: JSLambda = { context, callInfo =>
                return callInfo.thisArg
            }
            context.clazz(ctor)
        }
    }
}
```

### static func registerFunc(String, FuncRegister)

```cangjie
public static func registerFunc(name: String, register: FuncRegister): Unit
```

**Function:** Register a function to be exported to ArkTS.

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Export function name. |
| register | [FuncRegister](#type-funcregister) | Yes | - | A function that returns a JSFunction. |

**Example:**

```cangjie
class Main {
    static init() {
        JSModule.registerFunc("doSth") { context, callInfo =>
            return context.undefined().toJSValue()
        }
    }
}
```

### static func registerFunc(String, JSLambda)

```cangjie
public static func registerFunc(name: String, lambda: JSLambda): Unit
```

**Function:** Register a function to be exported to ArkTS.

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Export function name. |
| lambda | [JSLambda](#type-jslambda) | Yes | - | The function to be exported. |

**Example:**

```cangjie
class Main {
    static init() {
        JSModule.registerFunc("doSth") { context, callInfo =>
            return context.undefined().toJSValue()
        }
    }
}
```

### static func registerModule(ModuleRegister)

```cangjie
public static func registerModule(register: ModuleRegister): Unit
```

**Function:** Register interfaces to be exported to ArkTS.

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| register | [ModuleRegister](#type-moduleregister) | Yes | - | A function that can return an ArkTS class (constructor). |

**Example:**

```cangjie
class Main {
    static init() {
        JSModule.registerModule { context, exports =>
            exports["doSth"] = context.function { context, callInfo =>
                context.undefined().toJSValue()
            }.toJSValue()
        }
    }
}
```

## class JSObject

```cangjie
public class JSObject <: JSObjectBase {}
```

**Function:** A safe reference to an ArkTS object.

**Since:** 21

**Parent Type:**

* [JSObjectBase](#class-jsobjectbase)

## class JSObjectBase

```cangjie
sealed abstract class JSObjectBase <: JSHeapObject {}
```

**Function:** Base class for safe references to ArkTS objects. Allows operations on ArkTS objects.

**Since:** 21

**Parent Type:**

* [JSHeapObject](#class-jsheapobject)

### func attachCJObject(JSExternal)

```cangjie
public func attachCJObject(target: JSExternal): Unit
```

**Function:** Binds a Cangjie object reference in ArkTS to the current object.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| target | [JSExternal](#class-jsexternal) | Yes | - | ArkTS reference to the Cangjie object. |

**Example:**

<!--compile-->
```cangjie
class Data <: SharedObject {}

func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let obj = context.object()
    let data = Data()
    let ext = context.external(data)
    obj.attachCJObject(ext)
    return obj.toJSValue()
}
```

### func callMethod(JSKeyable, Array\<JSValue>)

```cangjie
public func callMethod(key: JSKeyable, args: Array<JSValue>): JSValue
```

**Function:** Calls a method on the current object.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Target method name. |
| args | Array\<[JSValue](#struct-jsvalue)> | Yes | - | List of call arguments. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | Method call return value. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let json = context.global["JSON"].asObject(context)
    json.callMethod("parse", [context.string("{a: 1, b: 2}").toJSValue()])
}
```

### func defineOwnAccessor(JSKeyable, ?JSFunction, ?JSFunction, Bool, Bool)

```cangjie
public func defineOwnAccessor(key: JSKeyable, getter!:? JSFunction = None, setter!: ?JSFunction = None,
    isEnumerable!: Bool = false,
    isConfigurable!: Bool = false
): Bool
```

**Function:** Defines accessors for the current object.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Target key. |
| getter | ?[JSFunction](#class-jsfunction) | No | None | **Named parameter.** Getter implementation. |
| setter | ?[JSFunction](#class-jsfunction) | No | None | **Named parameter.** Setter implementation. |
| isEnumerable | Bool | No | false | **Named parameter.** Whether enumerable. |
| isConfigurable | Bool | No | false | **Named parameter.** Whether redefinable. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let obj = context.object()
    let getter = context.function { context, callInfo =>
        context.number(1.0).toJSValue()
    }
    obj.defineOwnAccessor("a", getter: getter, isConfigurable: false)
    return obj.toJSValue()
}
```

### func defineOwnAccessor(JSKeyable, ?JSLambda, ?JSLambda, Bool, Bool)

```cangjie
public func defineOwnAccessor(key: JSKeyable, getter!:? JSLambda = None, setter!: ?JSLambda = None,
    isEnumerable!: Bool = false,
    isConfigurable!: Bool = false
): Bool
```

**Function:** Defines accessors for the current object.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Target key. |
| getter | ?[JSLambda](#type-jslambda) | No | None | **Named parameter.** Getter implementation. |
| setter | ?[JSLambda](#type-jslambda) | No | None | **Named parameter.** Setter implementation. |
| isEnumerable | Bool | No | false | **Named parameter.** Whether enumerable. |
| isConfigurable | Bool | No | false | **Named parameter.** Whether redefinable. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let obj = context.object()
    let getter: JSLambda = { context, callInfo =>
        context.number(1.0).toJSValue()
    }
    obj.defineOwnAccessor("a", getter: getter, isConfigurable: false)
    return obj.toJSValue()
}
```

### func defineOwnProperty(JSKeyable, JSValue, Bool, Bool, Bool)

```cangjie
public func defineOwnProperty(key: JSKeyable, setValue: JSValue,
    isWritable!: Bool = true,
    isEnumerable!: Bool = true,
    isConfigurable!: Bool = true
): Bool
```

**Function:** Defines a property on the current object.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Target key. |
| setValue | [JSValue](#struct-jsvalue) | Yes | - | Target value. |
| isWritable | Bool | No | true | **Named parameter.** Whether writable. |
| isEnumerable | Bool | No | true | **Named parameter.** Whether enumerable. |
| isConfigurable | Bool | No | true | **Named parameter.** Whether redefinable. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let obj = context.object()
    obj.defineOwnProperty("a", context.number(1.0).toJSValue(), isWritable: true, isConfigurable: false)
    return obj.toJSValue()
}
```

### func getAttachInfo()

```cangjie
public func getAttachInfo(): ?JSExternal
```

**Function:** Retrieves the bound Cangjie object from the current object.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| ?[JSExternal](#class-jsexternal) | ArkTS reference to the Cangjie object or None. |

**Example:**

<!--compile-->
```cangjie
class Data <: SharedObject {
    func doSth() {}
}

func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let obj = callInfo[0].asObject(context)
    let sharedObJ = obj.getAttachInfo().getOrThrow()
    let data = (sharedObJ as Data).getOrThrow()
    data.doSth()
    context.undefined().toJSValue()
}
```

### func getProperty(JSKeyable)

```cangjie
public func getProperty(key: JSKeyable): JSValue
```

**Function:** Retrieves the target property value from the current object.

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Target key. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [JSValue](#struct-jsvalue) | Retrieved value. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let obj = callInfo[0].asObject(context)  
    let result = obj.getProperty("a")  
    return result  
}  
```  

### func hasProperty(JSKeyable)  

```cangjie  
public func hasProperty(key: JSKeyable): Bool  
```  

**Function:** Determines whether the current object contains the target property.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Target key. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the current object contains the target property. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let obj = callInfo[0].asObject(context)  
    let hasA = obj.hasProperty("a")  
    println("obj has property of a: ${hasA}")  
    obj.toJSValue()  
}  
```  

### func instanceOf(JSClass)  

```cangjie  
public func instanceOf(clazz: JSClass): Bool  
```  

**Function:** Determines whether the current object is an instance of the target ArkTS class.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| clazz | [JSClass](#class-jsclass) | Yes | - | Target ArkTS class. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the object is an instance of the target ArkTS class. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let ctor: JSLambda = { context, callInfo =>  
        callInfo.thisArg  
    }  
    let classA = context.clazz(ctor)  
    let obj = classA.new().asObject(context)  
    let isClassA = obj.instanceOf(classA)  
    println("obj is classA: ${isClassA}")  
    return obj.toJSValue()  
}  
```  

### func keys()  

```cangjie  
public func keys(): Array<String>  
```  

**Function:** Enumerates all enumerable property names of the current object.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<String> | List of keys. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let keys = context.global.keys()  
    println("global keys: ${keys}")  
    context.undefined().toJSValue()  
}  
```  

### func setProperty(JSKeyable, JSValue)  

```cangjie  
public func setProperty(key: JSKeyable, setValue: JSValue): Unit  
```  

**Function:** Assigns a value to a property of the current object.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Target key. |  
| setValue | [JSValue](#struct-jsvalue) | Yes | - | Target value. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let obj = context.object()  
    obj.setProperty("a", context.number(1.0).toJSValue())  
    return obj.toJSValue()  
}  
```  

### func \[](JSKeyable)  

```cangjie  
public operator func [](key: JSKeyable): JSValue  
```  

**Function:** Assigns a value to a property of the current object.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Target key. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [JSValue](#struct-jsvalue) | Retrieved value. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let obj = callInfo[0].asObject(context)  
    let result = obj["a"]  
    return result  
}  
```  

### func \[](JSKeyable, JSValue)  

```cangjie  
public operator func [](key: JSKeyable, value!: JSValue): Unit  
```  

**Function:** Assigns a value to a property of the current object.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Target key. |  
| value | [JSValue](#struct-jsvalue) | Yes | - | **Named parameter.** Target value. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let obj = context.object()  
    obj["a"] = context.number(1.0).toJSValue()  
    return obj.toJSValue()  
}  
```  

## class JSPromise  

```cangjie  
public class JSPromise <: JSHeapObject {}  
```  

**Function:** A callback mechanism encapsulation object.  

JSPromise aims to provide a consistent encapsulation for callback patterns, enhancing usability significantly when combined with `async` and `await` syntax sugar.  

The lifecycle of JSPromise exceeds that of the referenced ArkTS object.  

**Initial Version:** 21  

**Parent Type:**  

* [JSHeapObject](#class-jsheapobject)  

### func catchError(JSFunction)  

```cangjie  
public func catchError(callback: JSFunction): Unit  
```  

**Function:** Registers an exception handling callback.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| callback | [JSFunction](#class-jsfunction) | Yes | - | Exception handling callback. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let promise = callInfo[0].asPromise(context)  
    let onError: JSLambda = {context, callInfo =>  
        context.undefined().toJSValue()  
    }  
    promise.catchError(context.function(onError))  
    context.undefined().toJSValue()  
}  
```  

### func then(JSFunction, ?JSFunction)  

```cangjie  
public func then(onFulfilled: JSFunction, onRejected!: ?JSFunction = None): Unit  
```  

**Function:** Registers a result handling callback.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| onFulfilled | [JSFunction](#class-jsfunction) | Yes | - | Result handling callback. |  
| onRejected | ?[JSFunction](#class-jsfunction) | No | None | **Named parameter.** Exception handling callback. |  

**Example:**  

<!--compile-->  
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let promise = callInfo[0].asPromise(context)
    let onFulfilled: JSLambda = {context, callInfo =>
        context.undefined().toJSValue()
    }
    promise.then(context.function(onFulfilled))
    context.undefined().toJSValue()
}
```

## class JSPromiseCapability

```cangjie
public class JSPromiseCapability {
}
```

**Function:** JSPromiseCapability corresponds to a Promise object, allowing resolution or rejection of the Promise.

**Since:** 21

Lifecycle: JSPromiseCapability is a weak reference. The lifecycle of its corresponding ArkTS object ends upon first resolution or rejection. Subsequent usage will throw a Cangjie exception.

### func reject(JSValue)

```cangjie
public func reject(value: JSValue): Unit
```

**Function:** Submits an exception to the Promise.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [JSValue](#struct-jsvalue) | Yes | - | Exception data, typically an Error object or string. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let promise = context.promiseCapability()
    // toJSValue must be called before reject, as the object becomes inaccessible after rejection
    let result = promise.toJSValue()
    promise.reject(context.string("a exception occured").toJSValue())
    return result
}
```

### func resolve(JSValue)

```cangjie
public func resolve(value: JSValue): Unit
```

**Function:** Notifies the Promise of successful completion and submits the return value.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| value | [JSValue](#struct-jsvalue) | Yes | - | Processing result. |

**Example:**

<!--compile-->
```cangjie
func addNumberAsync(context: JSContext, callInfo: JSCallInfo): JSValue {
    let a = callInfo[0].toNumber()
    let b = callInfo[1].toNumber()
    let promise = context.promiseCapability()
    // toJSValue must be called before resolve, as the object becomes inaccessible after resolution
    let result = promise.toJSValue()
    promise.resolve(context.number(a + b).toJSValue())
    return result
}
```

### func toJSValue()

```cangjie
public func toJSValue(): JSValue
```

**Function:** Converts to ArkTS unified type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

**Example:**

<!--compile-->
```cangjie
func addNumberAsync(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Convert ArkTS input parameters to Cangjie types
    let a = callInfo[0].toNumber()
    let b = callInfo[1].toNumber()
    // Create PromiseCapability
    let promise = context.promiseCapability()
    spawn {
        // Use a new thread for computationally intensive tasks
        let result = a + b
        // Return to ArkTS thread
        context.postJSTask {
            // Return result to ArkTS
            promise.resolve(context.number(result).toJSValue())
        }
    }
    // Return Promise
    promise.toJSValue()
}
```

## class JSRuntime

```cangjie
public class JSRuntime {
    public init()
}
```

**Function:** ArkTS runtime created by Cangjie.

**Since:** 21

> **Note:**
>
> In Cangjie applications, JSRuntime() can only be used on the main thread to create an ArkTS runtime.

### prop mainContext

```cangjie
public prop mainContext: JSContext
```

**Function:** Interoperability context.

**Since:** 21

**Type:** [JSContext](#class-jscontext)

**Access:** Read-only

### init()

```cangjie
public init()
```

**Function:** Constructor.

### func getNapiEnv()

```cangjie
public func getNapiEnv(): CPointer<Unit>
```

**Function:** Gets the environment pointer.

**Since:** 21

## class JSString

```cangjie
public class JSString <: JSHeapObject & ToString & JSKeyable {}
```

**Function:** A safe reference to an ArkTS string. Can be converted to String.

**Since:** 21

**Parent Types:**

* [JSHeapObject](#class-jsheapobject)
* ToString
* [JSKeyable](#interface-jskeyable)

### func toJSValue(JSContext)

```cangjie
public func toJSValue(_: JSContext): JSValue
```

**Function:** Converts to JSValue.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| _ | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

### func toString()
```cangjie
public func toString(): String
```

**Function:** Convert to a Cangjie string.

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Cangjie string.|

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let jsStr = context.string("abc")
    let value = jsStr.toString()
    println("value is ${value}")
    return jsStr.toJSValue()
}
```

### func toUtf16String()

```cangjie
public func toUtf16String(): Utf16String
```

**Function:** Convert from JSString to Utf16String.

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[Utf16String](#class-utfstring)|Converted Utf16String object.|

## class JSStringEx

```cangjie
public class JSStringEx <: JSInteropType<JSStringEx> & Equatable<JSStringEx> & ToString {
    public init(str: String)
}
```

**Function:** Extension of [JSString](#class-jsstring) functionality and performance, usable in declarative interop macros.

**Since:** 21

**Parent Types:**

* [JSInteropType\<JSStringEx>](#interface-jsinteroptype)
* Equatable\<JSStringEx>
* ToString

### init(String)

```cangjie
public init(str: String)
```

**Function:** Construct a corresponding JSStringEx instance given a String.

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|str|String|Yes|-|Initial string.|

### static func fromJSValue(JSContext, JSValue)

```cangjie
public static func fromJSValue(context: JSContext, input: JSValue): JSStringEx
```

**Function:** Convert from JSValue to JSStringEx. Used in declarative interop macro framework scenarios; developers do not need to use this API.

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|context|[JSContext](#class-jscontext)|Yes|-|ArkTS interop context.|
|input|[JSValue](#struct-jsvalue)|Yes|-|ArkTS unified type.|

**Return Value:**

|Type|Description|
|:----|:----|
|[JSStringEx](#class-jsstringex)|Declarative interop macro type JSStringEx.|

### static func toArkTsType()

```cangjie
public static func toArkTsType(): String
```

**Function:** Get the ArkTS type name corresponding to the Cangjie type. Used in declarative interop macro framework scenarios; developers do not need to use this API.

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Converted ArkTS type name.|

### func toJSValue(JSContext)

```cangjie
public func toJSValue(context: JSContext): JSValue
```

**Function:** Convert to JSValue. Used in declarative interop macro framework scenarios; developers do not need to use this API.

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|context|[JSContext](#class-jscontext)|Yes|-|ArkTS interop context.|

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Convert to String.

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Converted string.|

### func !=(JSStringEx)

```cangjie
public operator func !=(str: JSStringEx): Bool
```

**Function:** Determine if two JSStringEx instances are not equal.

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|str|[JSStringEx](#class-jsstringex)|Yes|-|String to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if not equal, false if equal.|

### func ==(JSStringEx)

```cangjie
public operator func ==(str: JSStringEx): Bool
```

**Function:** Determine if two JSStringEx instances are equal.

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|str|[JSStringEx](#class-jsstringex)|Yes|-|String to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if equal, false if not equal.|

## class JSSymbol

```cangjie
public class JSSymbol <: JSHeapObject & JSKeyable {}
```

**Function:** A safe reference to a JS symbol.

**Since:** 21

**Parent Types:**

* [JSHeapObject](#class-jsheapobject)
* [JSKeyable](#interface-jskeyable)

### prop description

```cangjie
public prop description: String
```

**Function:** Description of the symbol.

**Since:** 21

**Type:** String

**Read-Write Capability:** Read-only

### func toJSValue(JSContext)

```cangjie
public func toJSValue(_: JSContext): JSValue
```

**Function:** Convert to JSValue. Used in declarative interop macro framework scenarios; developers do not need to use this API.

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|_|[JSContext](#class-jscontext)|Yes|-|ArkTS interop context.|

**Return Value:**

|Type|Description|
|:----|:----|
|[JSValue](#struct-jsvalue)|ArkTS unified type.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Convert to String.

**Initial Version:** 21  

**Return Value:**  

| Type    | Description                  |
|:--------|:-----------------------------|
| String  | The converted string.        |

## class SharedObject  

```cangjie  
public open class SharedObject {  
    public init()  
}  
```  

**Function:** Base class for Cangjie objects that can be referenced by ArkTS.  

**Initial Version:** 21  

### prop nativeId  

```cangjie  
public prop nativeId: Int64  
```  

**Function:** Unique identifier of the object.  

**Type:** Int64  

**Read/Write Capability:** Read-only  

### init()  

```cangjie  
public init()  
```  

**Function:** Creates a SharedObject instance.  

**Initial Version:** 21  

## struct JSBoolean  

```cangjie  
public struct JSBoolean {}  
```  

**Function:** ArkTS boolean type.  

**Initial Version:** 21  

### func toBool()  

```cangjie  
public func toBool(): Bool  
```  

**Function:** Converts to a Cangjie Bool.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description                  |
|:-----|:-----------------------------|
| Bool | The Cangjie Bool value.      |

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let jsBool = context.boolean(true)  
    let value = jsBool.toBool()  
    println("value is ${value}")  
    return jsBool.toJSValue()  
}  
```  

### func toJSValue()  

```cangjie  
public func toJSValue(): JSValue  
```  

**Function:** Converts to a JSValue.  

**Initial Version:** 21  

**Return Value:**  

| Type               | Description                  |
|:-------------------|:-----------------------------|
| [JSValue](#struct-jsvalue) | The ArkTS unified type.      |

## struct JSCallInfo  

```cangjie  
public struct JSCallInfo {}  
```  

**Function:** Information related to an ArkTS function call. Allows accessing the `this` pointer, obtaining the number of arguments, and reading arguments by index.  

Each ArkTS function call stores the argument list and other related information on the ArkTS stack. JSCallInfo is a pointer to this information.  

**Initial Version:** 21  

**Lifecycle:** The JSCallInfo becomes invalid once the ArkTS function call ends.  

### prop count  

```cangjie  
public prop count: Int64  
```  

**Function:** Number of input arguments.  

**Initial Version:** 21  

**Type:** Int64  

**Read/Write Capability:** Read-only  

### prop thisArg  

```cangjie  
public prop thisArg: JSValue  
```  

**Function:** The `this` pointer.  

**Initial Version:** 21  

**Type:** [JSValue](#struct-jsvalue)  

**Read/Write Capability:** Read-only  

### func \[](Int64)  

```cangjie  
public operator func[](index: Int64): JSValue  
```  

**Function:** Retrieves the corresponding argument by index.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type    | Required | Default Value | Description                          |
|:----------|:--------|:---------|:--------------|:-------------------------------------|
| index     | Int64   | Yes      | -             | Argument index. Safe range: [0, argument count). |

**Return Value:**  

| Type               | Description                  |
|:-------------------|:-----------------------------|
| [JSValue](#struct-jsvalue) | The value of the argument.   |

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    if (callInfo.count > 0) {  
        let firstArg = callInfo[0]  
        return firstArg  
    }  
    return context.undefined().toJSValue()  
}  
```  

## struct JSNull  

```cangjie  
public struct JSNull {}  
```  

**Function:** ArkTS null type.  

**Initial Version:** 21  

### func toJSValue()  

```cangjie  
public func toJSValue(): JSValue  
```  

**Function:** Converts to the unified ArkTS type.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [JSValue](#struct-jsvalue) | The unified ArkTS type. |  

## struct JSNumber  

```cangjie  
public struct JSNumber {}  
```  

**Function:** ArkTS number.  

**Initial Version:** 21  

### func toFloat64()  

```cangjie  
public func toFloat64(): Float64  
```  

**Function:** Converts to Float64.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Float64 | Cangjie floating-point number. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let jsNum = context.number(1.0)  
    let value = jsNum.toFloat64()  
    println("value is ${value}")  
    return jsNum.toJSValue()  
}  
```  

### func toJSValue()  

```cangjie  
public func toJSValue(): JSValue  
```  

**Function:** Converts to JSValue.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [JSValue](#struct-jsvalue) | The unified ArkTS type. |  

## struct JSType  

```cangjie  
public struct JSType {  
    public static let UNDEFINED: JSType = JSType(0)  
    public static let NULL: JSType = JSType(1)  
    public static let NUMBER: JSType = JSType(2)  
    public static let BOOLEAN: JSType = JSType(3)  
    public static let BIGINT: JSType = JSType(4)  
    public static let STRING: JSType = JSType(5)  
    public static let SYMBOL: JSType = JSType(6)  
    public static let OBJECT: JSType = JSType(7)  
    public static let FUNCTION: JSType = JSType(8)  
    public static let EXTERNAL: JSType = JSType(9)  
}  
```  

**Function:** ArkTS data type enumeration.  

**Initial Version:** 21  

In ArkTS, the `typeof` operator can enumerate the general type of data. `JSType` lists these types and includes the `EXTERNAL` type.  

### static let BIGINT  

```cangjie  
public static let BIGINT: JSType = JSType(4)  
```  

**Function:** bigint type.  

**Initial Version:** 21  

**Type:** [JSType](#struct-jstype)  

### static let BOOLEAN  

```cangjie  
public static let BOOLEAN: JSType = JSType(3)  
```  

**Function:** bool type.  

**Initial Version:** 21  

**Type:** [JSType](#struct-jstype)  

### static let EXTERNAL  

```cangjie  
public static let EXTERNAL: JSType = JSType(9)  
```  

**Function:** external type.  

**Initial Version:** 21  

**Type:** [JSType](#struct-jstype)  

### static let FUNCTION  

```cangjie  
public static let FUNCTION: JSType = JSType(8)  
```  

**Function:** function type.  

**Initial Version:** 21  

**Type:** [JSType](#struct-jstype)  

### static let NULL  

```cangjie  
public static let NULL: JSType = JSType(1)  
```  

**Function:** null type.  

**Initial Version:** 21  

**Type:** [JSType](#struct-jstype)  

### static let NUMBER  

```cangjie  
public static let NUMBER: JSType = JSType(2)  
```  

**Function:** number type.  

**Initial Version:** 21  

**Type:** [JSType](#struct-jstype)  

### static let OBJECT  

```cangjie  
public static let OBJECT: JSType = JSType(7)  
```  

**Function:** object type.  

**Initial Version:** 21  

**Type:** [JSType](#struct-jstype)  

### static let STRING  

```cangjie  
public static let STRING: JSType = JSType(5)  
```  

**Function:** string type.  

**Initial Version:** 21  

**Type:** [JSType](#struct-jstype)  

### static let SYMBOL  

```cangjie  
public static let SYMBOL: JSType = JSType(6)  
```  

**Function:** symbol type.  

**Initial Version:** 21  

**Type:** [JSType](#struct-jstype)  

### static let UNDEFINED  

```cangjie  
public static let UNDEFINED: JSType = JSType(0)  
```  

**Function:** undefined type.  

**Initial Version:** 21  

**Type:** [JSType](#struct-jstype)  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Function:** Gets the string description of `JSType`.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | String description. |  

### func !=(JSType)  

```cangjie  
public operator func !=(target: JSType): Bool  
```  

**Function:** Performs an inequality check between two `JSType` instances.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| target | [JSType](#struct-jstype) | Yes | - | The target type for comparison. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two types are not equal. |  

### func ==(JSType)  

```cangjie  
public operator func ==(target: JSType): Bool  
```  

**Function:** Performs an equality check between two `JSType` instances.  

**Initial Version:** 21**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| target | [JSType](#struct-jstype) | Yes | - | The target type for comparison. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two types are equal. |

## struct JSUndefined

```cangjie
public struct JSUndefined {}
```

**Function:** ArkTS null.

**Since:** 21

### func toJSValue()

```cangjie
public func toJSValue(): JSValue
```

**Function:** Converts to JSValue.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](#struct-jsvalue) | ArkTS unified type. |

## struct JSValue

```cangjie
public struct JSValue {}
```

**Function:** An ArkTS variable (weakly typed, short lifecycle).

**Since:** 21

JSValue is the unified type in the ArkTS runtime and also the data type that directly interacts with the ArkTS runtime.

Only interoperation interfaces can create JSValue. Its lifecycle ends when it is popped from the stack (the stack where it was created). It cannot be copied, captured, or returned in non-interoperation functions. If you need to pass this variable, it must first be converted and then passed as a Cangjie type or in the form of a safe reference.

### func asArray()

```cangjie
public func asArray(): JSArray
```

**Function:** Converts a JSValue to JSArray.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArray](#class-jsarray) | A reference to an ArkTS array. |

### func asArrayBuffer()

```cangjie
public func asArrayBuffer(): JSArrayBuffer
```

**Function:** Converts a JSValue to JSArrayBuffer.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSArrayBuffer](#class-jsarraybuffer) | A reference to an ArkTS ArrayBuffer. |

### func asBigInt()

```cangjie
public func asBigInt(): JSBigInt
```

**Function:** Converts a JSValue to JSBigInt.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSBigInt](#class-jsbigint) | A reference to an ArkTS bigint. |

### func asBoolean()

```cangjie
public func asBoolean(): JSBoolean
```

**Function:** Converts a JSValue to JSBoolean.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSBoolean](#struct-jsboolean) | An ArkTS boolean. |

### func asClass()

```cangjie
public func asClass(): JSClass
```

**Function:** Converts a JSValue to JSClass.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSClass](#class-jsclass) | A reference to an ArkTS class. |

### func asExternal()

```cangjie
public func asExternal(): JSExternal
```

**Function:** Converts a JSValue to JSExternal.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSExternal](#class-jsexternal) | A reference to an ArkTS reference to a Cangjie object. |


### func asFunction()

```cangjie
public func asFunction(): JSFunction
```

**Function:** Converts a JSValue to JSFunction.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSFunction](#class-jsfunction) | A reference to an ArkTS function. |

### func asNull()

```cangjie
public func asNull(): JSNull
```

**Function:** Converts a JSValue to JSNull.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSNull](#struct-jsnull) | An ArkTS null. |

### func asNumber()

```cangjie
public func asNumber(): JSNumber
```

**Function:** Converts a JSValue to JSNumber.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSNumber](#struct-jsnumber) | An ArkTS number. |

### func asObject()

```cangjie
public func asObject(): JSObject
```

**Function:** Converts a JSValue to JSObject.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSObject](#class-jsobject) | A reference to an ArkTS object. |

> **Note:**
>
> If the type of JSValue is not an object, a BusinessException will be thrown. For example, during Cangjie-ArkTS interoperability, ArkTS types are uniformly converted to JSValue and then converted to Cangjie types via asObject. If the type returned from the ArkTS side does not match the actual type, an exception will be thrown.

### func asPromise()

```cangjie
public func asPromise(): JSPromise
```

**Function:** Converts a JSValue to JSPromise.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSPromise](#class-jspromise) | A reference to an ArkTS promise. |

### func asString()

```cangjie
public func asString(): JSString
```

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSString](#class-jsstring) | A reference to an ArkTS string. |

### func asSymbol()

```cangjie
public func asSymbol(): JSSymbol
```

**Function:** Converts a JSValue to JSSymbol.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSSymbol](#class-jssymbol) | A reference to an ArkTS symbol. |

### func asUndefined()

```cangjie
public func asUndefined(): JSUndefined
```

**Function:** Converts a JSValue to JSUndefined.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [JSUndefined](#struct-jsundefined) | An ArkTS undefined. |

### func bindObject(JSValue)

```cangjie
public func bindObject(external: JSValue): Unit
```

**Function:** Binds a Cangjie object to an ArkTS object.

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| external | [JSValue](#struct-jsvalue) | Yes | - | ArkTS reference to the Cangjie object. |

**Example:**

<!--compile-->
```cangjie
class Data <: SharedObject {
}

func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let jsObJ = callInfo[0]
    let data = Data()
    let external = context.external(data)
    jsObJ.bindObject(external.toJSValue())
    return jsObJ
}
```

>

### func bindObject(SharedObject)  

```cangjie  
public func bindObject(data: SharedObject): Unit  
```  

**Functionality:** Binds a Cangjie object to an ArkTS object.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| data | [SharedObject](#class-sharedobject) | Yes | - | Cangjie object. |  

**Example:**  

<!--compile-->  
```cangjie  
class Data <: SharedObject {  
}  

func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let jsObJ = callInfo[0]  
    let data = Data()  
    jsObJ.bindObject(data)  
    return jsObJ  
}  
```  

>  

### func getBindingObject()  

```cangjie  
public func getBindingObject(): ?SharedObject  
```  

**Functionality:** Retrieves the Cangjie object bound to an ArkTS object.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| ?[SharedObject](#class-sharedobject) | The bound Cangjie object. |  

**Example:**  

<!--compile-->  
```cangjie  
class Data <: SharedObject {  
    func doSth() {}  
}  

func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let jsObJ = callInfo[0]  
    if (let Some(shareData) <- jsObJ.getBindingObject()) {  
        if (let Some(data) <- (shareData as Data)) {  
            data.doSth()  
        }  
    }  
    return jsObJ  
}  
```  

### func getElement(Int64)  

```cangjie  
public func getElement(index: Int64): JSValue  
```  

**Functionality:** Reads an element from an ArkTS array.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| index | Int64 | Yes | - | Array element index. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [JSValue](#struct-jsvalue) | An ArkTS value. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let jsArr = callInfo[0]  
    let element = jsArr.getElement(0)  
    return element  
}  
```  

### func getProperty(JSKeyable)  

```cangjie  
public func getProperty(key: JSKeyable): JSValue  
```  

**Functionality:** Reads a property from an ArkTS object.  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| key | [JSKeyable](#interface-jskeyable) | Yes | - | Property key, which can be a String, JSString, or JSSymbol. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [JSValue](#struct-jsvalue) | Retrieved value. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    let jsObJ = callInfo[0]  
    let element = jsObJ.getProperty(context, "a")  
    let element1 = jsObJ.getProperty(context, context.string("a"))  
    let element2 = jsObJ.getProperty(context, context.symbol())  
    return element  
}  
```  

>  

### func isArray()  

```cangjie  
public func isArray(): Bool  
```  

**Functionality:** Determines whether a JSValue is of Array type.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns true if the type is Array. |  

**Example:**  

<!--compile-->  
```cangjie  
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {  
    // Get input parameter  
    let arg0 = callInfo[0]  
    // Check if it is an object  
    let result = arg0.isArray()  
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isArrayBuffer()

```cangjie
public func isArrayBuffer(): Bool
```

**Function:** Determines whether a JSValue is of ArrayBuffer type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is ArrayBuffer. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameter
    let arg0 = callInfo[0]
    // Check if it is ArrayBuffer
    let result = arg0.isArrayBuffer()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isBigInt()

```cangjie
public func isBigInt(): Bool
```

**Function:** Determines whether a JSValue is of bigint type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is bigint. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameter
    let arg0 = callInfo[0]
    // Check if it is bigint
    let result = arg0.isBigInt()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isBoolean()

```cangjie
public func isBoolean(): Bool
```

**Function:** Determines whether a JSValue is of boolean type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is boolean. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameter
    let arg0 = callInfo[0]
    // Check if it is boolean
    let result = arg0.isBoolean()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isClass()

```cangjie
public func isClass(): Bool
```

**Function:** Determines whether a JSValue is an ArkTS class (constructor).

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is an ArkTS class (constructor). |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameter
    let arg0 = callInfo[0]
    // Check if it is an ArkTS class (constructor)
    let result = arg0.isClass()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isExternal()

```cangjie
public func isExternal(): Bool
```

**Function:** Determines whether a JSValue is an external object (ArkTS reference of a Cangjie object).

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is an external object (ArkTS reference of a Cangjie object). |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameter
    let arg0 = callInfo[0]
    // Check if it is an external object (ArkTS reference of a Cangjie object)
    let result = arg0.isExternal()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isFunction()

```cangjie
public func isFunction(): Bool
```

**Function:** Determines whether a JSValue is of function type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is function. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameter
    let arg0 = callInfo[0]
    // Check if it is a function
    let result = arg0.isFunction()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isNull()

```cangjie
public func isNull(): Bool
```

**Function:** Determines whether a JSValue is null.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is null. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameter
    let arg0 = callInfo[0]
    // Check if it is null
    let result = arg0.isNull()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isNumber()

```cangjie
public func isNumber(): Bool
```

**Function:** Determines whether a JSValue is of number type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is number. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameter
    let arg0 = callInfo[0]
    // Check if it is a number
    let result = arg0.isNumber()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isObject()

```cangjie
public func isObject(): Bool
```

**Function:** Determines whether a JSValue is of object type.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is object. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameter
    let arg0 = callInfo[0]
    // Check if it is an object
    let result = arg0.isObject()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isPromise()

```cangjie
public func isPromise(): Bool
```

**Function:** Determines whether a JSValue is of Promise type.

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is Promise. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameters
    let arg0 = callInfo[0]
    // Check if it's a Promise
    let result = arg0.isPromise()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isString()

```cangjie
public func isString(): Bool
```

**Function:** Determines whether a JSValue is of string type.

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is string. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameters
    let arg0 = callInfo[0]
    // Check if it's a string
    let result = arg0.isString()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isSymbol()

```cangjie
public func isSymbol(): Bool
```

**Function:** Determines whether a JSValue is of Symbol type.

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is Symbol. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameters
    let arg0 = callInfo[0]
    // Check if it's a Symbol
    let result = arg0.isSymbol()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func isUndefined()

```cangjie
public func isUndefined(): Bool
```

**Function:** Determines whether a JSValue is undefined.

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the type is undefined. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get input parameters
    let arg0 = callInfo[0]
    // Check if it's undefined
    let result = arg0.isUndefined()
    // Return the result
    return context.boolean(result).toJSValue()
}
```

### func setElement(Int64, JSValue)

```cangjie
public func setElement(index: Int64, value: JSValue): Unit
```

**Function:** Writes an element to an ArkTS array.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| index | Int64 | Yes | - | The index for array writing. |
| value | [JSValue](#struct-jsvalue) | Yes | - | The value to write to the array. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let jsArr = callInfo[0]
    let setValue = context.number(1.0)
    jsArr.setElement(0, setValue.toJSValue())
    let element = jsArr.getElement(0)
    return element
}
```

### func setProperty(JSKeyable, JSValue)

```cangjie
public func setProperty(key: JSKeyable, setValue: JSValue): Unit
```

**Function:** Writes a property to an ArkTS object.

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | [JSKeyable](#interface-jskeyable) | Yes | - | The property key. |
| setValue | [JSValue](#struct-jsvalue) | Yes | - | The property value. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let jsObJ = context.object()
    let setValue = context.number(1.0)
    jsObJ.setProperty("a", setValue.toJSValue())
    return jsObJ.toJSValue()
}
```
### func strictEqual(JSValue)

```cangjie
public func strictEqual(target: JSValue): Bool
```

**Function:** Performs strict equality comparison between two JSValues (type consistency + value equality).

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| target | [JSValue](#struct-jsvalue) | Yes | - | The target value for comparison. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two values are identical. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get two input parameters
    let arg0 = callInfo[0]
    let arg1 = callInfo[1]
    // Perform strict equality comparison
    let isStrictEqual = arg0.strictEqual(arg1)
    // Return the comparison result
    return context.boolean(isStrictEqual).toJSValue()
}
```

### func toBigInt()

```cangjie
public func toBigInt(): BigInt
```

**Function:** Converts a JSValue to BigInt.

**Initial Version:** 21

**Return Value:**| Type | Description |
|:----|:----|
|BigInt| Cangjie BigInt. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let value = callInfo[0].toBigInt()
    println("value is ${value}")
    return context.undefined().toJSValue()
}
```

### func toBoolean()

```cangjie
public func toBoolean(): Bool
```

**Function:** Converts a JSValue to Bool.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|Bool| Cangjie Bool value. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let value = callInfo[0].toBoolean()
    println("value is ${value}")
    return context.undefined().toJSValue()
}
```

### func toNumber()

```cangjie
public func toNumber(): Float64
```

**Function:** Converts a JSValue to Float64.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|Float64| Cangjie Float64 value. |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    let value = callInfo[0].toNumber()
    println("value is ${value}")
    return context.undefined().toJSValue()
}
```

### func toString()

```cangjie
public func toString(): String
```

**Function:** Converts a JSValue to String.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|String| Cangjie string. |

**Example:**

<!--compile-->
```cangjie
// Checks if the first argument is a number, returns true if yes, otherwise returns the string of the data type
func checkIsNumber(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get argument
    let value: JSValue = callInfo[0]
    // Get argument type
    let valueType: JSType = value.typeof()
    // Type check
    if (valueType == JSType.NUMBER) {
        // Return true
        return context.boolean(true).toJSValue()
    }
    // Return type string
    return context.string(valueType.toString()).toJSValue()
}
```
### func toUtf16String()

```cangjie
public func toUtf16String(): Utf16String
```

**Function:** Converts from JSValue to Utf16String.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|[Utf16String](#class-utfstring)| Converted Utf16String object. |

### func typeof()

```cangjie
public func typeof(): JSType
```

**Function:** Gets the type of a JSValue, which is basically consistent with the types enumerated by ArkTS's typeof syntax.

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|[JSType](#struct-jstype)| ArkTS type |

**Example:**

<!--compile-->
```cangjie
func doSth(context: JSContext, callInfo: JSCallInfo): JSValue {
    // Get first argument
    let arg0 = callInfo[0]
    // Get argument type
    let valueType = arg0.typeof()
    // Print argument type
    println("arg type is ${valueType.toString()}")
    arg0
}
```

## type ClassRegister

```cangjie
public type ClassRegister =(JSContext) -> JSClass
```

**Function:** ClassRegister is a type alias for ([JSContext](#class-jscontext)) -> [JSClass](#class-jsclass).

**Since:** 21

## type FuncRegister

```cangjie
public type FuncRegister =(JSContext) -> JSFunction
```

**Function:** FuncRegister is a type alias for ([JSContext](#class-jscontext)) -> [JSFunction](#class-jsfunction).

**Since:** 21

## type JSBufferFinalizer

```cangjie
public type JSBufferFinalizer =(CPointer<Byte>) -> Unit
```

**Function:** JSBufferFinalizer is a type alias for (CPointer\<Byte>) -> Unit.

**Since:** 21

## type JSLambda

```cangjie
public type JSLambda =(JSContext, JSCallInfo) -> JSValue
```

**Function:** JSLambda is a type alias for ([JSContext](#class-jscontext), [JSCallInfo](#struct-jscallinfo)) -> [JSValue](#struct-jsvalue).

**Since:** 21

## type ModuleRegister

```cangjie
public type ModuleRegister =(JSContext, JSObject) -> Unit
```

**Function:** ModuleRegister is a type alias for ([JSContext](#class-jscontext), [JSObject](#class-jsobject)) -> Unit.

**Since:** 21

## type napi_env

```cangjie
public type napi_env = CPointer<Unit>
```

**Function:** napi_env is a type alias for CPointer\<Unit>.

**Since:** 21

## type napi_value

```cangjie
public type napi_value = CPointer<Unit>
```

**Function:** napi_value is a type alias for CPointer\<Unit>.

**Since:** 21

## class Utf16String

```cangjie
public class Utf16String <: ToString & Equatable<Utf16String> & Hashable & JSKeyable & JSInteropType<Utf16String> {
    public init(src: String)
}
```

**Function:** A string stored in UTF-16 encoding format, which provides better performance than String when converting to/from ArkTS strings.

**Since:** 21

**Parent Types:**

* ToString
* Equatable\<Utf16String>
* Hashable
* [JSKeyable](#interface-jskeyable)
* [JSInteropType\<Utf16String>](#interface-jsinteroptype)

### prop accessible

```cangjie
public prop accessible: Bool
```

**Function:** Determines whether the string content is accessible. The string content of this object can be manually released using dispose, and accessing it after release will throw an exception.

**Initial Version:** 21  

**Type:** Bool  

**Read-Write Capability:** Read-only  

### prop size  

```cangjie  
public prop size: Int64  
```  

**Description:** Represents the total length of encoding units in this string (UTF-16 encoded format). Each encoding unit in UTF-16 format occupies 2 bytes, and each character consists of 1-2 encoding units.  

**Initial Version:** 21  

**Type:** Int64  

**Read-Write Capability:** Read-only  

### prop totalChars  

```cangjie  
public prop totalChars: Int64  
```  

**Description:** The total number of characters.  

**Initial Version:** 21  

**Type:** Int64  

**Read-Write Capability:** Read-only  

### static let empty  

```cangjie  
public static let empty: Utf16String  
```  

**Description:** An empty string.  

**Initial Version:** 21  

**Type:** Utf16String  

**Read-Write Capability:** Read-only  

### init(String)  

```cangjie  
public init(src: String)  
```  

**Description:** Creates a Utf16String from a standard library String.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| src | String | Yes | - | The target string. |  

### static func fromJSValue(JSContext, JSValue)  

```cangjie  
public static func fromJSValue(_: JSContext, value: JSValue): Utf16String  
```  

**Description:** Converts a JSValue to a Utf16String object.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| _ | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |  
| value | [JSValue](#struct-jsvalue) | Yes | - | ArkTS unified type. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [Utf16String](#class-utfstring) | The Utf16String object. |  

### static func toArkTsType()  

```cangjie  
public static func toArkTsType(): String  
```  

**Description:** The corresponding ArkTS type name.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:---|  
| String | The corresponding ArkTS type name. |  

### func compare(Utf16String)  

```cangjie  
public func compare(target: Utf16String): Ordering  
```  

**Description:** Compares the size based on the Unicode dictionary order of characters.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| target | [Utf16String](#class-utfstring) | Yes | - | The Utf16String object to compare. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Ordering | The comparison result. |  

### func contains(Utf16String)  

```cangjie  
public func contains(target: Utf16String): Bool  
```  

**Description:** Checks whether the string contains the target string.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| target | [Utf16String](#class-utfstring) | Yes | - | The target string. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Whether the target string is contained. |  

### func count(Utf16String)  

```cangjie  
public func count(src: Utf16String): Int64  
```  

**Description:** Counts the occurrences of the target string.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| src | [Utf16String](#class-utfstring) | Yes | - | The target string. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int64 | The number of occurrences of the target string. |  

### func dispose()  

```cangjie  
public func dispose(): Unit  
```  

**Description:** Releases the memory storing the string content. Accessing the string content after the first disposal will cause an exception.  

**Initial Version:** 21  

### func endsWith(Utf16String)  

```cangjie  
public func endsWith(target: Utf16String): Bool  
```  

**Description:** Checks whether the string ends with the target string.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| target | [Utf16String](#class-utfstring) | Yes | - | The target string. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Whether the string ends with the target string. |  

### func hashCode()  

```cangjie  
public func hashCode(): Int64  
```  

**Description:** The hash value of the string.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int64 | The hash value of the string.  
**Note:** This hash value is not guaranteed to match the hash of a String with the same content. It is also not guaranteed to match the hash of an ArkTS string with the same content. |  

### func indexOf(Utf16String)  

```cangjie  
public func indexOf(target: Utf16String): ?Int64  
```  

**Description:** Searches backward for the position of the target string (character index).  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| target | [Utf16String](#class-utfstring) | Yes | - | The target string. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| ?Int64 | Returns the position index when the target string is first found, or None if not found. |  

### func indexOf(Utf16String, Int64)  

```cangjie  
public func indexOf(target: Utf16String, fromIndex: Int64): ?Int64  
```  

**Description:** Searches backward for the position of the target string (encoding unit index).  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| target | [Utf16String](#class-utfstring) | Yes | - | The target string. |  
| fromIndex | Int64 | Yes | - | The starting position for the search in the current string. Default is 0 if not specified. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| ?Int64 | Returns the position index when the target string is first found, or None if not found. |  

### func isEmpty()  

```cangjie  
public func isEmpty(): Bool  
```  

**Description:** Checks whether the string is empty.

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Whether the string is empty. |  

### func isCompressed()  

```cangjie  
public func isCompressed(): Bool  
```  

**Function:** Checks whether the content is compressed.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Whether the content is compressed. |  

### func lastIndexOf(Utf16String)  

```cangjie  
public func lastIndexOf(target: Utf16String): ?Int64  
```  

**Function:** Searches backward for the position of a character.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| target | [Utf16String](#class-utfstring) | Yes | - | Target string. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| ?Int64 | Returns the index of the first occurrence of the target string, or None if not found. |  

### func lastIndexOf(Utf16String, Int64)  

```cangjie  
public func lastIndexOf(target: Utf16String, fromIndex: Int64): ?Int64  
```  

**Function:** Searches backward for the position of a character.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| target | [Utf16String](#class-utfstring) | Yes | - | Target string. |  
| fromIndex | Int64 | Yes | - | Starting position for the search in the current string. If not specified, defaults to size. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| ?Int64 | Returns the index of the first occurrence of the target string, or None if not found. |  

### func lazySplit(Utf16String, Bool)  

```cangjie  
public func lazySplit(separator: Utf16String, remoteEmpty!: Bool = false): Iterator<Utf16String>  
```  

**Function:** Lazily splits the string.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| separator | [Utf16String](#class-utfstring) | Yes | - | Separator. If the separator is an empty string, each character is treated as a separate element. |  
| remoteEmpty | Bool | No | false | Whether to remove empty elements. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Iterator\<[Utf16String](#class-utfstring)> | Iterator of split elements. |  

### func lazySplit(Utf16String, Int64, Bool)  

```cangjie  
public func lazySplit(separator: Utf16String, maxSplit: Int64, remoteEmpty!: Bool = false): Iterator<Utf16String>  
```  

**Function:** Lazily splits the string.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| separator | [Utf16String](#class-utfstring) | Yes | - | Separator. If the separator is an empty string, each character is treated as a separate element. |  
| maxSplit | Int64 | Yes | - | Maximum number of splits. If 0, there is no limit. |  
| remoteEmpty | Bool | No | false | Whether to remove empty elements. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Iterator\<[Utf16String](#class-utfstring)> | Iterator of split elements. |  

### func lines()  

```cangjie  
public func lines(): Iterator<Utf16String>  
```  

**Function:** Gets a line iterator.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Iterator\<[Utf16String](#class-utfstring)> | Line iterator. |  

### func replace(Utf16String, Utf16String, Int64)  

```cangjie  
public func replace(old: Utf16String, new: Utf16String, count!: Int64 = Int64.Max): Utf16String  
```  

**Function:** Replaces a string.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:--------------|:---|  
| old | [Utf16String](#class-utfstring) | Yes | -             | Element to be replaced. |  
| new | [Utf16String](#class-utfstring) | Yes | -             | Replacement element. |  
| count | Int64 | No | Int64.Max     | Number of replacements. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [Utf16String](#class-utfstring) | The replaced string. |  

### func runes()  

```cangjie  
public func runes(): Iterator<Rune>  
```  

**Function:** Gets a character iterator.  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Iterator\<Rune> | Character iterator. |  

### func split(Utf16String, Bool)  

```cangjie  
public func split(seperator: Utf16String, remoteEmpty!: Bool = false): Array<Utf16String>  
```  

**Function:** Splits the string.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| seperator | [Utf16String](#class-utfstring) | Yes | - | Separator. If the separator is an empty string, each character is treated as a separate element. |  
| remoteEmpty | Bool | No | false | Whether to remove empty elements. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<[Utf16String](#class-utfstring)> | Array of split elements. |  

### func split(Utf16String, Int64, Bool)  

```cangjie  
public func split(seperator: Utf16String, maxSplit: Int64, remoteEmpty!: Bool = false): Array<Utf16String>  
```  

**Function:** Splits the string.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| seperator | [Utf16String](#class-utfstring) | Yes | - | Separator. If the separator is an empty string, each character is treated as a separate element. |  
| maxSplit | Int64 | Yes | - | Maximum number of splits. If 0, there is no limit. |  
| remoteEmpty | Bool | No | false | Whether to remove empty elements. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<[Utf16String](#class-utfstring)> | Array of split elements. |  

### func startsWith(Utf16String)  

```cangjie  
public func startsWith(target: Utf16String): Bool  
```  

**Function:** Checks whether the string starts with the target string.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| target | [Utf16String](#class-utfstring) | Yes | - | Target string. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Whether the string starts with the target string. |  

### func toJSValue(JSContext)  

```cangjie  
public func toJSValue(context: JSContext): JSValue  
```  

**Function:** Converts a Utf16String object to a JSValue.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| context | [JSContext](#class-jscontext) | Yes | - | ArkTS interoperability context. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [JSValue](#struct-jsvalue) | ArkTS unified type. |  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Function:** Converts to a String.  

**Initial Version:** 21  

**Return Value:**  

| Type    | Description |  
|:--------|:------------|  
| String  | The converted String object. |  

### func !=(Utf16String)  

```cangjie  
public operator func != (target: Utf16String): Bool  
```  

**Function:** Determines whether the string is not equal to the target string.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type                     | Required | Default | Description |  
|:----------|:-------------------------|:---------|:--------|:------------|  
| target    | [Utf16String](#class-utfstring) | Yes      | -       | The target string to compare. |  

**Return Value:**  

| Type | Description |  
|:-----|:------------|  
| Bool | Returns `true` if the strings are not equal, otherwise returns `false`. |  

### func +(Utf16String)  

```cangjie  
public operator func + (right: Utf16String): Utf16String  
```  

**Function:** Concatenates a string at the end.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type                     | Required | Default | Description |  
|:----------|:-------------------------|:---------|:--------|:------------|  
| right     | [Utf16String](#class-utfstring) | Yes      | -       | The target string to concatenate. |  

**Return Value:**  

| Type                     | Description |  
|:-------------------------|:------------|  
| [Utf16String](#class-utfstring) | The concatenated string. |  

### func <(Utf16String)  

```cangjie  
public operator func < (target: Utf16String): Bool  
```  

**Function:** Determines whether the string is less than the target string (based on Unicode lexicographical order).  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type                     | Required | Default | Description |  
|:----------|:-------------------------|:---------|:--------|:------------|  
| target    | [Utf16String](#class-utfstring) | Yes      | -       | The target string to compare. |  

**Return Value:**  

| Type | Description |  
|:-----|:------------|  
| Bool | Returns `true` if the string is less than the target string, otherwise returns `false`. |  

### func <=(Utf16String)  

```cangjie  
public operator func <= (target: Utf16String): Bool  
```  

**Function:** Determines whether the string is less than or equal to the target string (based on Unicode lexicographical order).  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type                     | Required | Default | Description |  
|:----------|:-------------------------|:---------|:--------|:------------|  
| target    | [Utf16String](#class-utfstring) | Yes      | -       | The target string to compare. |  

**Return Value:**  

| Type | Description |  
|:-----|:------------|  
| Bool | Returns `true` if the string is less than or equal to the target string, otherwise returns `false`. |  

### func ==(Utf16String)  

```cangjie  
public operator func == (target: Utf16String): Bool  
```  

**Function:** Determines whether the string is equal to the target string.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type                     | Required | Default | Description |  
|:----------|:-------------------------|:---------|:--------|:------------|  
| target    | [Utf16String](#class-utfstring) | Yes      | -       | The target string to compare. |  

**Return Value:**  

| Type | Description |  
|:-----|:------------|  
| Bool | Returns `true` if the strings are equal, otherwise returns `false`. |  

### func >(Utf16String)  

```cangjie  
public operator func > (target: Utf16String): Bool  
```  

**Function:** Determines whether the string is greater than the target string (based on Unicode lexicographical order).  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type                     | Required | Default | Description |  
|:----------|:-------------------------|:---------|:--------|:------------|  
| target    | [Utf16String](#class-utfstring) | Yes      | -       | The target string to compare. |  

**Return Value:**  

| Type | Description |  
|:-----|:------------|  
| Bool | Returns `true` if the string is greater than the target string, otherwise returns `false`. |  

### func >=(Utf16String)  

```cangjie  
public operator func >= (target: Utf16String): Bool  
```  

**Function:** Determines whether the string is greater than or equal to the target string (based on Unicode lexicographical order).  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type                     | Required | Default | Description |  
|:----------|:-------------------------|:---------|:--------|:------------|  
| target    | [Utf16String](#class-utfstring) | Yes      | -       | The target string to compare. |  

**Return Value:**  

| Type | Description |  
|:-----|:------------|  
| Bool | Returns `true` if the string is greater than or equal to the target string, otherwise returns `false`. |  

### func [](Int64)  

```cangjie  
public operator func [](index: Int64): UInt16  
```  

**Function:** Retrieves a character based on the element index.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type  | Required | Default | Description |  
|:----------|:------|:---------|:--------|:------------|  
| index     | Int64 | Yes      | -       | The index. |  

**Return Value:**  

| Type   | Description |  
|:-------|:------------|  
| UInt16 | The retrieved character. |  

### func [](Range\<Int64>)  

```cangjie  
public operator func [](range: Range<Int64>): Utf16String  
```  

**Function:** Extracts a substring from the string.  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type          | Required | Default | Description |  
|:----------|:--------------|:---------|:--------|:------------|  
| range     | Range\<Int64> | Yes      | -       | The range to extract. |  

**Return Value:**  

| Type                     | Description |  
|:-------------------------|:------------|  
| [Utf16String](#class-utfstring) | The extracted Utf16String substring. |