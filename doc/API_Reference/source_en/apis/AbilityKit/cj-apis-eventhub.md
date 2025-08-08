# ohos.eventhub

The EventHub module provides an event center with capabilities for subscribing, unsubscribing, and triggering events.

## Import Module

```cangjie
import kit.PerformanceAnalysisKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Example Code Description](../../cj-development-intro.md#仓颉示例代码说明).

## class Event0

```cangjie
public class Event0 <: EventBase {}
```

**Description:** Event center with 0 parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [EventBase](#class-eventbase)

### func emit()

```cangjie
public func emit(): Unit
```

**Description:** Triggers the specified event with 0 parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F0 <: EventCallBack0 {
    public override func invoke() {
        println("F0 is invoked")
        return
    }
}

let eventhub = EventHub()
let foo0: EventCallBack0 = F0()
eventhub.obtainEvent0("click0").on(foo0)
eventhub.get0("click0").emit()
```

### func off(EventCallBack0)

```cangjie
public func off(callback: EventCallBack0): Unit
```

**Description:** Unsubscribes from the specified event callback. When the event is triggered, this callback will not be invoked.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [EventCallBack0](#class-eventcallback0) | Yes | - | Event callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F0 <: EventCallBack0 {
    public override func invoke() {
        println("F0 is invoked")
        return
    }
}

let eventhub = EventHub()
let foo0: EventCallBack0 = F0()
eventhub.obtainEvent0("click0").on(foo0)
eventhub.obtainEvent0("click0").off(foo0)
```

### func off()

```cangjie
public func off(): Unit
```

**Description:** Unsubscribes from all specified events with 0 parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F0 <: EventCallBack0 {
    public override func invoke() {
        println("F0 is invoked")
        return
    }
}

let eventhub = EventHub()
let foo0: EventCallBack0 = F0()
eventhub.obtainEvent0("click0").on(foo0)
eventhub.obtainEvent0("click0").off()
```

### func on(EventCallBack0)

```cangjie
public func on(callback: EventCallBack0): Unit
```

**Description:** Subscribes to the specified event.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [EventCallBack0](#class-eventcallback0) | Yes | - | Event callback to be invoked when the event is triggered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F0 <: EventCallBack0 {
    public override func invoke() {
        println("F0 is invoked")
        return
    }
}
class F1 <: EventCallBack0 {
    public override func invoke() {
        println("F1 is invoked")
        return
    }
}

let eventhub = EventHub()
let foo0: EventCallBack0 = F0()
let foo1: EventCallBack0 = F1()
eventhub.obtainEvent0("click0").on(foo0)
eventhub.obtainEvent0("click0").on(foo1)
```

## class Event1

```cangjie
public class Event1<A> <: EventBase {}
```

**Description:** Event center with 1 parameter.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [EventBase](#class-eventbase)

### func emit(A)

```cangjie
public func emit(arg: A): Unit
```

**Description:** Triggers the specified event with 1 parameter, where A is a generic type.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| arg | A | Yes | - | Parameter passed to the callback when the event is triggered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F2 <: EventCallBack1<Int64> {
    public override func invoke(a: Int64) {
        println("F2 is invoked")
    }
}

let eventhub = EventHub()
let foo2: EventCallBack1<Int64> = F2()
eventhub.obtainEvent1<Int64>("click1").on(foo2)
eventhub.get1<Int64>("click1").emit(1)
```

### func off(EventCallBack1\<A>)

```cangjie
public func off(callback: EventCallBack1<A>): Unit
```

**Description:** Unsubscribes from the specified event callback. When the event is triggered, this callback will not be invoked.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [EventCallBack1](#class-eventcallback1)\<A> | Yes | - | Event callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F2 <: EventCallBack1<Int64> {
    public override func invoke(a: Int64) {
        println("F2 is invoked")
    }
}

let eventhub = EventHub()
let foo2: EventCallBack1<Int64> = F2()
eventhub.obtainEvent1<Int64>("click1").on(foo2)
eventhub.obtainEvent1<Int64>("click1").off()
```

### func off()

```cangjie
public func off(): Unit
```

**Description:** Unsubscribes from all specified events with 1 parameter.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core**Initial Version:** 21  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added in the dependency definition  
class F2 <: EventCallBack1<Int64> {  
    public override func invoke(a: Int64) {  
        println("F2 is invoked")  
    }  
}  

let eventhub = EventHub()  
let foo2: EventCallBack1<Int64> = F2()  
eventhub.obtainEvent1<Int64>("click1").on(foo2)  
eventhub.obtainEvent1<Int64>("click1").off()  
```  

### func on(EventCallBack1\<A>)  

```cangjie  
public func on(callback: EventCallBack1<A>): Unit  
```  

**Function:** Subscribes to the specified event.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| callback | [EventCallBack1](#class-eventcallback1)\<A> | Yes | - | Event callback, invoked after the event is triggered. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added in the dependency definition  
class F2 <: EventCallBack1<Int64> {  
    public override func invoke(a: Int64) {  
        println("F2 is invoked")  
    }  
}  
class F3 <: EventCallBack1<Int64> {  
    public override func invoke(a: Int64) {  
        println("F3 is invoked")  
    }  
}  

let eventhub = EventHub()  
let foo2: EventCallBack1<Int64> = F2()  
let foo3: EventCallBack1<Int64> = F3()  
eventhub.obtainEvent1<Int64>("click1").on(foo2)  
eventhub.obtainEvent1<Int64>("click1").on(foo3)  
```  

## class Event2  

```cangjie  
public class Event2<A1, A2> <: EventBase {}  
```  

**Function:** Event hub with 2 parameters.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parent Type:**  

- [EventBase](#class-eventbase)  

### func emit(A1, A2)  

```cangjie  
public func emit(arg1: A1, arg2: A2): Unit  
```  

**Function:** Triggers the specified event, where A1 and A2 are generic types.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| arg1 | A1 | Yes | - | Parameter passed to the callback when the event is triggered. |  
| arg2 | A2 | Yes | - | Parameter passed to the callback when the event is triggered. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added in the dependency definition  
class F4 <: EventCallBack2<Int64, Int64> {  
    public override func invoke(a: Int64, b: Int64) {  
        println("F4 is invoked")  
    }  
}  

let eventhub = EventHub()  
let foo4: EventCallBack2<Int64, Int64> = F4()  
eventhub.obtainEvent2<Int64, Int64>("click2").on(foo4)  
eventhub.get2<Int64, Int64>("click2").emit(2, 3)  
```  

### func off(EventCallBack2\<A1,A2>)  

```cangjie  
public func off(callback: EventCallBack2<A1, A2>): Unit  
```  

**Function:** Unsubscribes from the specified event callback. The callback will not be invoked when the event is triggered.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| callback | [EventCallBack2](#class-eventcallback2)\<A1,A2> | Yes | - | Event callback. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added in the dependency definition  
class F4 <: EventCallBack2<Int64, Int64> {  
    public override func invoke(a: Int64, b: Int64) {  
        println("F4 is invoked")  
    }  
}  

let eventhub = EventHub()  
let foo4: EventCallBack2<Int64, Int64> = F4()  
eventhub.obtainEvent2<Int64, Int64>("click2").on(foo4)  
eventhub.obtainEvent2<Int64, Int64>("click2").off(foo4)  
```  

### func off()  

```cangjie  
public func off(): Unit  
```  

**Function:** Unsubscribes from all specified events with 2 parameters.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added in the dependency definition  
class F4 <: EventCallBack2<Int64, Int64> {  
    public override func invoke(a: Int64, b: Int64) {  
        println("F4 is invoked")  
    }  
}  

let eventhub = EventHub()  
let foo4: EventCallBack2<Int64, Int64> = F4()  
eventhub.obtainEvent2<Int64, Int64>("click2").on(foo4)  
eventhub.obtainEvent2<Int64, Int64>("click2").off()  
```  

### func on(EventCallBack2\<A1,A2>)  

```cangjie  
public func on(callback: EventCallBack2<A1, A2>): Unit  
```  

**Function:** Subscribes to the specified event.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| callback | [EventCallBack2](#class-eventcallback2)\<A1,A2> | Yes | - | Event callback, invoked after the event is triggered. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added in the dependency definition  
class F4 <: EventCallBack2<Int64, Int64> {  
    public override func invoke(a: Int64, b: Int64) {  
        println("F4 is invoked")  
    }  
}  
class F5 <: EventCallBack2<Int64, Int64> {  
    public func invoke(a: Int64, b: Int64) {  
        println("F5 is invoked")  
    }  
}  

let eventhub = EventHub()  
let foo4: EventCallBack2<Int64, Int64> = F4()  
let foo5: EventCallBack2<Int64, Int64> = F5()  
eventhub.obtainEvent2<Int64, Int64>("click2").on(foo4)  
eventhub.obtainEvent2<Int64, Int64>("click2").on(foo5)  
```  

## class Event3  

```cangjie  
public class Event3<A1, A2, A3> <: EventBase {}  
```  

**Function:** Event hub with 3 parameters.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parent Type:**  

- [EventBase](#class-eventbase)  

### func emit(A1, A2, A3)  

```cangjie  
public func emit(arg1: A1, arg2: A2, arg3: A3): Unit  
```  

**Function:** Triggers the specified event with 3 parameters, where A1, A2, and A3 are generic types.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| arg1 | A1 | Yes | - | Parameter passed to the callback when the event is triggered. |  
| arg2 | A2 | Yes | - | Parameter passed to the callback when the event is triggered. |  
| arg3 | A3 | Yes | - | Parameter passed to the callback when the event is triggered. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added in the dependency definition  
class F6 <: EventCallBack3<Int64, Int64, Int64> {  
       public func invoke(a: Int64, b: Int64, c: Int64) {  
           println("F6 is invoked")  
       }  
}  

let eventhub = EventHub()  
let foo6: EventCallBack3<Int64, Int64, Int64> = F6()
eventhub.obtainEvent3<Int64, Int64, Int64>("click3").on(foo6)
eventhub.get3<Int64, Int64, Int64>("click3").emit(3, 3, 3)
```

### func off(EventCallBack3\<A1,A2,A3>)

```cangjie
public func off(callback: EventCallBack3<A1, A2, A3>): Unit
```

**Function:** Unsubscribes from the specified event callback. When the event is triggered, this callback will no longer be invoked.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | [EventCallBack3](#class-eventcallback3)\<A1,A2,A3> | Yes | - | The event callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to the dependency definitions
class F6 <: EventCallBack3<Int64, Int64, Int64> {
       public func invoke(a: Int64, b: Int64, c: Int64) {
           println("F6 is invoked")
       }
}

let eventhub = EventHub()
let foo6: EventCallBack3<Int64, Int64, Int64> = F6()
eventhub.obtainEvent3<Int64, Int64, Int64>("click3").on(foo6)
eventhub.obtainEvent3<Int64, Int64, Int64>("click3").off(foo6)
```

### func off()

```cangjie
public func off(): Unit
```

**Function:** Unsubscribes from all specified events with 3 parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to the dependency definitions
class F6 <: EventCallBack3<Int64, Int64, Int64> {
       public func invoke(a: Int64, b: Int64, c: Int64) {
           println("F6 is invoked")
       }
}

let eventhub = EventHub()
let foo6: EventCallBack3<Int64, Int64, Int64> = F6()
eventhub.obtainEvent3<Int64, Int64, Int64>("click3").on(foo6)
eventhub.obtainEvent3<Int64, Int64, Int64>("click3").off()
```

### func on(EventCallBack3\<A1,A2,A3>)

```cangjie
public func on(callback: EventCallBack3<A1, A2, A3>): Unit
```

**Function:** Subscribes to the specified event.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | [EventCallBack3](#class-eventcallback3)\<A1,A2,A3> | Yes | - | The event callback to be invoked when the event is triggered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to the dependency definitions
class F6 <: EventCallBack3<Int64, Int64, Int64> {
       public func invoke(a: Int64, b: Int64, c: Int64) {
           println("F6 is invoked")
       }
}
class F7 <: EventCallBack3<Int64, Int64, Int64> {
    public func invoke(a: Int64, b: Int64, c: Int64) {
        println("F7 is invoked")
   }
}

let eventhub = EventHub()
let foo6: EventCallBack3<Int64, Int64, Int64> = F6()
let foo7: EventCallBack3<Int64, Int64, Int64> = F7()
eventhub.obtainEvent3<Int64, Int64, Int64>("click3").on(foo6)
eventhub.obtainEvent3<Int64, Int64, Int64>("click3").on(foo7)
```

## class Event4

```cangjie
public class Event4<A1, A2, A3, A4> <: EventBase {}
```

**Function:** Event hub with 4 parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [EventBase](#class-eventbase)

### func emit(A1, A2, A3, A4)

```cangjie
public func emit(arg1: A1, arg2: A2, arg3: A3, arg4: A4): Unit
```

**Function:** Triggers the specified event with 4 parameters, where A1, A2, A3, and A4 are generic types.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| arg1 | A1 | Yes | - | Parameter passed to the callback when the event is triggered. |
| arg2 | A2 | Yes | - | Parameter passed to the callback when the event is triggered. |
| arg3 | A3 | Yes | - | Parameter passed to the callback when the event is triggered. |
| arg4 | A4 | Yes | - | Parameter passed to the callback when the event is triggered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to the dependency definitions
class F8 <: EventCallBack4<Int64, Int64, Int64, Int64> {
       public func invoke(a: Int64, b: Int64, c: Int64, d: Int64) {
           println("F8 is invoked")
       }
}

let eventhub = EventHub()
let foo8: EventCallBack4<Int64, Int64, Int64, Int64> = F8()
eventhub.obtainEvent4<Int64, Int64, Int64, Int64>("click4").on(foo8)
eventhub.get4<Int64, Int64, Int64, Int64>("click4").emit(4, 4, 4, 4)
```

### func off(EventCallBack4\<A1,A2,A3,A4>)

```cangjie
public func off(callback: EventCallBack4<A1, A2, A3, A4>): Unit
```

**Function:** Unsubscribes from the specified event callback. When the event is triggered, this callback will no longer be invoked.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | [EventCallBack4](#class-eventcallback4)\<A1,A2,A3,A4> | Yes | - | The event callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to the dependency definitions
class F8 <: EventCallBack4<Int64, Int64, Int64, Int64> {
       public func invoke(a: Int64, b: Int64, c: Int64, d: Int64) {
           println("F8 is invoked")
       }
}

let eventhub = EventHub()
let foo8: EventCallBack4<Int64, Int64, Int64, Int64> = F8()
eventhub.obtainEvent4<Int64, Int64, Int64, Int64>("click4").on(foo8)
eventhub.obtainEvent4<Int64, Int64, Int64, Int64>("click4").off(foo8)
```

### func off()

```cangjie
public func off(): Unit
```

**Function:** Unsubscribes from all specified events with 4 parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to the dependency definitions
class F8 <: EventCallBack4<Int64, Int64, Int64, Int64> {
       public func invoke(a: Int64, b: Int64, c: Int64, d: Int64) {
           println("F8 is invoked")
       }
}

let eventhub = EventHub()
let foo8: EventCallBack4<Int64, Int64, Int64, Int64> = F8()
eventhub.obtainEvent4<Int64, Int64, Int64, Int64>("click4").on(foo8)
eventhub.obtainEvent4<Int64, Int64, Int64, Int64>("click4").off()
```

### func on(EventCallBack4\<A1,A2,A3,A4>)

```cangjie
public func on(callback: EventCallBack4<A1, A2, A3, A4>): Unit
```

**Function:** Subscribes to the specified event.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | [EventCallBack4](#class-eventcallback4)\<A1,A2,A3,A4> | Yes | - | The event callback to be invoked when the event is triggered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to the dependency definitions
class F8 <: EventCallBack4<Int64, Int64, Int64, Int64> {
       public func invoke(a: Int64, b: Int64, c: Int64, d: Int64) {
           println("F8 is invoked")
       }
}
class F9 <: EventCallBack4<Int64, Int64, Int64, Int64> {
       public func invoke(a: Int64, b: Int64, c: Int64, d: Int64) {
           println("F9 is invoked")
       }
}

let eventhub = EventHub()
let foo8: EventCallBack4<Int64, Int64, Int64, Int64> = F8()
let foo9: EventCallBack4<Int64, Int64, Int64, Int64> = F9()
eventhub.obtainEvent4<Int64, Int64, Int64, Int64>("click4").on(foo8)
eventhub.obtainEvent4<Int64, Int64, Int64, Int64>("click4").on(foo9)
```

## class Event5

```cangjie
public class Event5<A1, A2, A3, A4, A5> <: EventBase {}
```

**Function:** Event center with 5 parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [EventBase](#class-eventbase)

### func emit(A1, A2, A3, A4, A5)

```cangjie
public func emit(arg1: A1, arg2: A2, arg3: A3, arg4: A4, arg5: A5): Unit
```

**Function:** Triggers a specified event with 5 parameters, where A1, A2, A3, A4, A5 are generic types.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| arg1 | A1 | Yes | - | Parameter passed to the callback when the event is triggered. |
| arg2 | A2 | Yes | - | Parameter passed to the callback when the event is triggered. |
| arg3 | A3 | Yes | - | Parameter passed to the callback when the event is triggered. |
| arg4 | A4 | Yes | - | Parameter passed to the callback when the event is triggered. |
| arg5 | A5 | Yes | - | Parameter passed to the callback when the event is triggered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F10 <: EventCallBack5<Int64, Int64, Int64, Int64, Int64> {
    public override func invoke(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
        println("F10 is invoked")
    }
}

let eventhub = EventHub()
let foo10: EventCallBack5<Int64, Int64, Int64, Int64, Int64> = F10()
eventhub.obtainEvent5<Int64, Int64, Int64, Int64, Int64>("click5").on(foo10)
eventhub.get5<Int64, Int64, Int64, Int64, Int64>("click5").emit(5, 5, 5, 5, 5)
```

### func off(EventCallBack5\<A1,A2,A3,A4,A5>)

```cangjie
public func off(callback: EventCallBack5<A1, A2, A3, A4, A5>): Unit
```

**Function:** Unsubscribes from the specified event callback. When the event is triggered, this callback will not be invoked.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [EventCallBack5](#class-eventcallback5)\<A1,A2,A3,A4,A5> | Yes | - | Event callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F10 <: EventCallBack5<Int64, Int64, Int64, Int64, Int64> {
    public override func invoke(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
        println("F10 is invoked")
    }
}

let eventhub = EventHub()
let foo10: EventCallBack5<Int64, Int64, Int64, Int64, Int64> = F10()
eventhub.obtainEvent5<Int64, Int64, Int64, Int64, Int64>("click5").on(foo10)
eventhub.obtainEvent5<Int64, Int64, Int64, Int64, Int64>("click5").off(foo10)
```

### func off()

```cangjie
public func off(): Unit
```

**Function:** Unsubscribes from all specified events with 5 parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F10 <: EventCallBack5<Int64, Int64, Int64, Int64, Int64> {
    public override func invoke(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
        println("F10 is invoked")
    }
}

let eventhub = EventHub()
let foo10: EventCallBack5<Int64, Int64, Int64, Int64, Int64> = F10()
eventhub.obtainEvent5<Int64, Int64, Int64, Int64, Int64>("click5").on(foo10)
eventhub.obtainEvent5<Int64, Int64, Int64, Int64, Int64>("click5").off()
```

### func on(EventCallBack5\<A1,A2,A3,A4,A5>)

```cangjie
public func on(callback: EventCallBack5<A1, A2, A3, A4, A5>): Unit
```

**Function:** Subscribes to a specified event.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | [EventCallBack5](#class-eventcallback5)\<A1,A2,A3,A4,A5> | Yes | - | Event callback, invoked when the event is triggered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F10 <: EventCallBack5<Int64, Int64, Int64, Int64, Int64> {
    public override func invoke(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
        println("F10 is invoked")
    }
}
class F11 <: EventCallBack5<Int64, Int64, Int64, Int64, Int64> {
    public func invoke(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
        println("F11 is invoked")
    }
}

let eventhub = EventHub()
let foo10: EventCallBack5<Int64, Int64, Int64, Int64, Int64> = F10()
let foo11: EventCallBack5<Int64, Int64, Int64, Int64, Int64> = F11()
eventhub.obtainEvent5<Int64, Int64, Int64, Int64, Int64>("click5").on(foo10)
eventhub.obtainEvent5<Int64, Int64, Int64, Int64, Int64>("click5").on(foo11)
```

## class EventBase

```cangjie
public abstract class EventBase {}
```

**Function:** Abstract class for events, where A, A1, A2, A3, A4, A5 are generic types.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func as0()

```cangjie
public func as0(): Event0
```

**Function:** Validates the parameter type for 0 parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Event0](#class-event0) | Validated callback event center. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code | Error Message |
  |:------|:-------------------------|
  | 801 | Capability not supported. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F0 <: EventCallBack0 {
    public override func invoke() {
        println("F0 is invoked")
        return
    }
}

let eventhub = EventHub()
let foo0: EventCallBack0 = F0()
eventhub.obtainEvent0("click0").on(foo0)
eventhub.get("click0").as0().emit()
```

### func as1\<A>()

```cangjie
public func as1<A>(): Event1<A>
```

**Function:** Validates the parameter type for 1 parameter.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Event1](#class-event1)\<A> | Validated callback event center. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code | Error Message |
  |:------|:-------------------------|
  | 801 | Capability not supported. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F2 <: EventCallBack1<Int64> {
    public override func invoke(a: Int64) {
        println("F2 is invoked")
    }
}

let eventhub = EventHub()
let foo2: EventCallBack1<Int64> = F2()
eventhub.obtainEvent1<Int64>("click1").on(foo2)
eventhub.get("click1").as1<Int64>().emit(1)
```

### func as2\<A1, A2>()

```cangjie
public func as2<A1, A2>(): Event2<A1, A2>
```

**Function:** Validates the parameter type for 2 parameters.**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [Event2](#class-event2)\<A1,A2> | The validated callback event hub. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code | Error Message |  
  |:------|:-------------------------|  
  | 801 | Capability not supported. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added to dependency definitions  
class F4 <: EventCallBack2<Int64, Int64> {  
    public override func invoke(a: Int64, b: Int64) {  
        println("F4 is invoked")  
    }  
}  

let eventhub = EventHub()  
let foo4: EventCallBack2<Int64, Int64> = F4()  
eventhub.obtainEvent2<Int64, Int64>("click2").on(foo4)  
eventhub.get("click2").as2<Int64, Int64>().emit(2, 3)  
```  

### func as3\<A1, A2, A3>()  

```cangjie  
public func as3<A1, A2, A3>(): Event3<A1, A2, A3>  
```  

**Function:** Validates parameter types for 3 parameters.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [Event3](#class-event3)\<A1,A2,A3> | The validated callback event hub. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code | Error Message |  
  |:------|:-------------------------|  
  | 801 | Capability not supported. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added to dependency definitions  
class F6 <: EventCallBack3<Int64, Int64, Int64> {  
       public func invoke(a: Int64, b: Int64, c: Int64) {  
           println("F6 is invoked")  
       }  
}  

let eventhub = EventHub()  
let foo6: EventCallBack3<Int64, Int64, Int64> = F6()  
eventhub.obtainEvent3<Int64, Int64, Int64>("click3").on(foo6)  
eventhub.get("click3").as3<Int64, Int64, Int64>().emit(3, 3, 3)  
```  

### func as4\<A1, A2, A3, A4>()  

```cangjie  
public func as4<A1, A2, A3, A4>(): Event4<A1, A2, A3, A4>  
```  

**Function:** Validates parameter types for 4 parameters.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [Event4](#class-event4)\<A1,A2,A3,A4> | The validated callback event hub. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code | Error Message |  
  |:------|:-------------------------|  
  | 801 | Capability not supported. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added to dependency definitions  
class F8 <: EventCallBack4<Int64, Int64, Int64, Int64> {  
       public func invoke(a: Int64, b: Int64, c: Int64, d: Int64) {  
           println("F8 is invoked")  
       }  
}  

let eventhub = EventHub()  
let foo8: EventCallBack4<Int64, Int64, Int64, Int64> = F8()  
eventhub.obtainEvent4<Int64, Int64, Int64, Int64>("click4").on(foo8)  
eventhub.get("click4").as4<Int64, Int64, Int64, Int64>().emit(4, 4, 4, 4)  
```  

### func as5\<A1, A2, A3, A4, A5>()  

```cangjie  
public func as5<A1, A2, A3, A4, A5>(): Event5<A1, A2, A3, A4, A5>  
```  

**Function:** Validates parameter types for 5 parameters.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [Event5](#class-event5)\<A1,A2,A3,A4,A5> | The validated callback event hub. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code | Error Message |  
  |:------|:-------------------------|  
  | 801 | Capability not supported. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added to dependency definitions  
class F10 <: EventCallBack5<Int64, Int64, Int64, Int64, Int64> {  
    public override func invoke(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {  
        println("F10 is invoked")  
    }  
}  

let eventhub = EventHub()  
let foo10: EventCallBack5<Int64, Int64, Int64, Int64, Int64> = F10()  
eventhub.obtainEvent5<Int64, Int64, Int64, Int64, Int64>("click5").on(foo10)  
eventhub.get("click5").as5<Int64, Int64, Int64, Int64, Int64>().emit(5, 5, 5, 5, 5)  
```  

## class EventCallBack0  

```cangjie  
public abstract class EventCallBack0 {}  
```  

**Function:** Abstract class for callback events with 0 parameters.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### func invoke()  

```cangjie  
public open func invoke(): Unit  
```  

**Function:** Triggers the callback event.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added to dependency definitions  
class F0 <: EventCallBack0 {  
    public override func invoke() {  
        println("F0 is invoked")  
   }  
}  
```  

## class EventCallBack1  

```cangjie  
public abstract class EventCallBack1<A> {}  
```  

**Function:** Abstract class for callback events with 1 parameter, where A is the generic type.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### func invoke(A)  

```cangjie  
public open func invoke(arg: A): Unit  
```  

**Function:** Triggers the callback event.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| arg | A | Yes | - | The parameter passed to the callback event when triggered. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.AbilityKit.*  

// This code can be added to dependency definitions  
class F1 <: EventCallBack1<Int64> {  
    public override func invoke(a: Int64) {  
        println("F1 is invoked")  
    }  
}  
```  

## class EventCallBack2  

```cangjie  
public abstract class EventCallBack2<A1, A2> {}  
```  

**Function:** Abstract class for callback events with 2 parameters, where A1 and A2 are generic types.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### func invoke(A1, A2)  

```cangjie  
public open func invoke(arg1: A1, arg2: A2): Unit  
```  

**Function:** Triggers the callback event.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| arg1 | A1 | Yes | - | The first parameter passed to the callback event when triggered. |  
| arg2 | A2 | Yes | - | The second parameter passed to the callback event when triggered. ||:---|:---|:---|:---|:---|
|arg1|A1|Yes|-|Parameters passed to the callback event when triggered.|
|arg2|A2|Yes|-|Parameters passed to the callback event when triggered.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// Code here can be added in dependency definitions
class F2 <: EventCallBack2<Int64,Int64> {
    public func invoke(a: Int64, b: Int64) {
        println("F2 is invoked")
    }
}
```

## class EventCallBack3

```cangjie
public abstract class EventCallBack3<A1, A2, A3> {}
```

**Function:** Abstract class for callback events with 3 parameters, where A1, A2, A3 are generic types.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func invoke(A1, A2, A3)

```cangjie
public open func invoke(arg1: A1, arg2: A2, arg3: A3): Unit
```

**Function:** Triggers the callback event.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|arg1|A1|Yes|-|Parameters passed to the callback event when triggered.|
|arg2|A2|Yes|-|Parameters passed to the callback event when triggered.|
|arg3|A3|Yes|-|Parameters passed to the callback event when triggered.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// Code here can be added in dependency definitions
class F3 <: EventCallBack3<Int64,Int64,Int64> {
    public func invoke(a: Int64, b: Int64, c: Int64) {
        println("F3 is invoked")
    }
}
```

## class EventCallBack4

```cangjie
public abstract class EventCallBack4<A1, A2, A3, A4> {}
```

**Function:** Abstract class for callback events with 4 parameters, where A1, A2, A3, A4 are generic types.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func invoke(A1, A2, A3, A4)

```cangjie
public open func invoke(arg1: A1, arg2: A2, arg3: A3, arg4: A4): Unit
```

**Function:** Triggers the callback event.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|arg1|A1|Yes|-|Parameters passed to the callback event when triggered.|
|arg2|A2|Yes|-|Parameters passed to the callback event when triggered.|
|arg3|A3|Yes|-|Parameters passed to the callback event when triggered.|
|arg4|A4|Yes|-|Parameters passed to the callback event when triggered.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// Code here can be added in dependency definitions
class F4 <: EventCallBack4<Int64,Int64,Int64,Int64> {
    public func invoke(a: Int64, b: Int64,c: Int64, d: Int64) {
        println("F4 is invoked")
    }
}
```

## class EventCallBack5

```cangjie
public abstract class EventCallBack5<A1, A2, A3, A4, A5> {}
```

**Function:** Abstract class for callback events with 5 parameters, where A1, A2, A3, A4, A5 are generic types.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func invoke(A1, A2, A3, A4, A5)

```cangjie
public open func invoke(arg1: A1, arg2: A2, arg3: A3, arg4: A4, arg5: A5): Unit
```

**Function:** Triggers the callback event.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|arg1|A1|Yes|-|Parameters passed to the callback event when triggered.|
|arg2|A2|Yes|-|Parameters passed to the callback event when triggered.|
|arg3|A3|Yes|-|Parameters passed to the callback event when triggered.|
|arg4|A4|Yes|-|Parameters passed to the callback event when triggered.|
|arg5|A5|Yes|-|Parameters passed to the callback event when triggered.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// Code here can be added in dependency definitions
class F5 <: EventCallBack5<Int64,Int64,Int64,Int64,Int64> {
    public func invoke(a: Int64, b: Int64,c: Int64, d: Int64, e: Int64) {
        println("F5 is invoked")
    }
}
```

## class EventHub

```cangjie
public class EventHub {}
```

**Function:** Abstract class for event management center, where A, A1, A2, A3, A4, A5 are all generic types.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func get(String)

```cangjie
public func get(s: String): EventBase
```

**Function:** Retrieves a callback event.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|s|String|Yes|-|Retrieves the specified event center s.|

**Return Value:**

|Type|Description|
|:----|:----|
|[EventBase](#class-eventbase)|The retrieved callback event.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// Code here can be added in dependency definitions
class F10 <: EventCallBack5<Int64, Int64, Int64, Int64, Int64> {
    public override func invoke(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
        println("F10 is invoked")
    }
}

let eventhub = EventHub()
let foo10: EventCallBack5<Int64, Int64, Int64, Int64, Int64> = F10()
eventhub.obtainEvent5<Int64, Int64, Int64, Int64, Int64>("click5").on(foo10)
eventhub.get("click5").as5<Int64, Int64, Int64, Int64, Int64>().emit(5, 5, 5, 5, 5)
```

### func get0(String)

```cangjie
public func get0(s: String): Event0
```

**Function:** Retrieves a callback event and validates parameters (0 parameters).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|s|String|Yes|-|Retrieves the specified event center s.|

**Return Value:**

|Type|Description|
|:----|:----|
|[Event0](#class-event0)|The validated callback event center.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code|Error Message|
  |:------|:------------------|
  |401|Invalid parameter.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// Code here can be added in dependency definitions
class F0 <: EventCallBack0 {
    public override func invoke() {
        println("F0 is invoked")
        return
    }
}

let eventhub = EventHub()
let foo0: EventCallBack0 = F0()
eventhub.obtainEvent0("click0").on(foo0)
eventhub.get0("click0").emit()
```

### func get1\<A>(String)

```cangjie
public func get1<A>(s: String): Event1<A>
```

**Function:** Retrieves a callback event and validates parameters (1 parameter).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
| s | String | Yes | - | Retrieve the specified event center s. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Event1](#class-event1)\<A> | The validated callback event center. |

**Exceptions:**

- BusinessException: For detailed information on corresponding error codes, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code | Error Message |
  |:------|:------------------|
  | 401 | Invalid parameter. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// The following code can be added to dependency definitions
class F2 <: EventCallBack1<Int64> {
    public override func invoke(a: Int64) {
        println("F2 is invoked")
    }
}

let eventhub = EventHub()
let foo2: EventCallBack1<Int64> = F2()
eventhub.obtainEvent1<Int64>("click1").on(foo2)
eventhub.get1<Int64>("click1").emit(1)
```

### func get2\<A1, A2>(String)

```cangjie
public func get2<A1, A2>(s: String): Event2<A1, A2>
```

**Function:** Retrieve a callback event and validate parameters (with 2 parameters).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| s | String | Yes | - | Retrieve the specified event center s. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Event2](#class-event2)\<A1,A2> | The validated callback event center. |

**Exceptions:**

- BusinessException: For detailed information on corresponding error codes, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code | Error Message |
  |:------|:------------------|
  | 401 | Invalid parameter. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// The following code can be added to dependency definitions
class F4 <: EventCallBack2<Int64, Int64> {
    public override func invoke(a: Int64, b: Int64) {
        println("F4 is invoked")
    }
}

let eventhub = EventHub()
let foo4: EventCallBack2<Int64, Int64> = F4()
eventhub.obtainEvent2<Int64, Int64>("click2").on(foo4)
eventhub.get2<Int64, Int64>("click2").emit(2, 3)
```

### func get3\<A1, A2, A3>(String)

```cangjie
public func get3<A1, A2, A3>(s: String): Event3<A1, A2, A3>
```

**Function:** Retrieve a callback event and validate parameters (with 3 parameters).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| s | String | Yes | - | Retrieve the specified event center s. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Event3](#class-event3)\<A1,A2,A3> | The validated callback event center. |

**Exceptions:**

- BusinessException: For detailed information on corresponding error codes, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code | Error Message |
  |:------|:------------------|
  | 401 | Invalid parameter. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// The following code can be added to dependency definitions
class F6 <: EventCallBack3<Int64, Int64, Int64> {
       public func invoke(a: Int64, b: Int64, c: Int64) {
           println("F6 is invoked")
       }
}

let eventhub = EventHub()
let foo6: EventCallBack3<Int64, Int64, Int64> = F6()
eventhub.obtainEvent3<Int64, Int64, Int64>("click3").on(foo6)
eventhub.get3<Int64, Int64, Int64>("click3").emit(3, 3, 3)
```

### func get4\<A1, A2, A3, A4>(String)

```cangjie
public func get4<A1, A2, A3, A4>(s: String): Event4<A1, A2, A3, A4>
```

**Function:** Retrieve a callback event and validate parameters (with 4 parameters).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| s | String | Yes | - | Retrieve the specified event center s. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Event4](#class-event4)\<A1,A2,A3,A4> | The validated callback event center. |

**Exceptions:**

- BusinessException: For detailed information on corresponding error codes, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code | Error Message |
  |:------|:------------------|
  | 401 | Invalid parameter. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// The following code can be added to dependency definitions
class F8 <: EventCallBack4<Int64, Int64, Int64, Int64> {
       public func invoke(a: Int64, b: Int64, c: Int64, d: Int64) {
           println("F8 is invoked")
       }
}

let eventhub = EventHub()
let foo8: EventCallBack4<Int64, Int64, Int64, Int64> = F8()
eventhub.obtainEvent4<Int64, Int64, Int64, Int64>("click4").on(foo8)
eventhub.get4<Int64, Int64, Int64, Int64>("click4").emit(4, 4, 4, 4)
```

### func get5\<A1, A2, A3, A4, A5>(String)

```cangjie
public func get5<A1, A2, A3, A4, A5>(s: String): Event5<A1, A2, A3, A4, A5>
```

**Function:** Retrieve a callback event and validate parameters (with 5 parameters).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| s | String | Yes | - | Retrieve the specified event center s. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Event5](#class-event5)\<A1,A2,A3,A4,A5> | The validated callback event center. |

**Exceptions:**

- BusinessException: For detailed information on corresponding error codes, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code | Error Message |
  |:------|:------------------|
  | 401 | Invalid parameter. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// The following code can be added to dependency definitions
class F10 <: EventCallBack5<Int64, Int64, Int64, Int64, Int64> {
    public override func invoke(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
        println("F10 is invoked")
    }
}

let eventhub = EventHub()
let foo10: EventCallBack5<Int64, Int64, Int64, Int64, Int64> = F10()
eventhub.obtainEvent5<Int64, Int64, Int64, Int64, Int64>("click5").on(foo10)
eventhub.get5<Int64, Int64, Int64, Int64, Int64>("click5").emit(5, 5, 5, 5, 5)
```

### func obtainEvent0(String)

```cangjie
public func obtainEvent0(name: String): Event0
```

**Function:** Create or retrieve an event (with 0 parameters).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Create or retrieve the specified event center named `name`. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Event0](#class-event0) | The created or retrieved event center. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// The following code can be added to dependency definitions
class F0 <: EventCallBack0 {
    public override func invoke() {
        println("F0 is invoked")
        return
    }
}

let eventhub = EventHub()
let foo0: EventCallBack0 = F0()
eventhub.obtainEvent0("click0").on(foo0)
```
### func obtainEvent1\<A>(String)

```cangjie
public func obtainEvent1<A>(name: String): Event1<A>
```

**Function:** Creates or retrieves an event (with 1 parameter).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Creates or retrieves the specified event hub with the given name. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Event1](#class-event1)\<A> | The created or retrieved event hub. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F2 <: EventCallBack1<Int64> {
    public override func invoke(a: Int64) {
        println("F2 is invoked")
    }
}

let eventhub = EventHub()
let foo2: EventCallBack1<Int64> = F2()
eventhub.obtainEvent1<Int64>("click1").on(foo2)
```

### func obtainEvent2\<A1, A2>(String)

```cangjie
public func obtainEvent2<A1, A2>(name: String): Event2<A1, A2>
```

**Function:** Creates or retrieves an event (with 2 parameters).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Creates or retrieves the specified event hub with the given name. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Event2](#class-event2)\<A1,A2> | The created or retrieved event hub. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F4 <: EventCallBack2<Int64, Int64> {
    public override func invoke(a: Int64, b: Int64) {
        println("F4 is invoked")
    }
}

let eventhub = EventHub()
let foo4: EventCallBack2<Int64, Int64> = F4()
eventhub.obtainEvent2<Int64, Int64>("click2").on(foo4)
```

### func obtainEvent3\<A1, A2, A3>(String)

```cangjie
public func obtainEvent3<A1, A2, A3>(name: String): Event3<A1, A2, A3>
```

**Function:** Creates or retrieves an event (with 3 parameters).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Creates or retrieves the specified event hub with the given name. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Event3](#class-event3)\<A1,A2,A3> | The created or retrieved event hub. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F6 <: EventCallBack3<Int64, Int64, Int64> {
       public func invoke(a: Int64, b: Int64, c: Int64) {
           println("F6 is invoked")
       }
}

let eventhub = EventHub()
let foo6: EventCallBack3<Int64, Int64, Int64> = F6()
eventhub.obtainEvent3<Int64, Int64, Int64>("click3").on(foo6)
```

### func obtainEvent4\<A1, A2, A3, A4>(String)

```cangjie
public func obtainEvent4<A1, A2, A3, A4>(name: String): Event4<A1, A2, A3, A4>
```

**Function:** Creates or retrieves an event (with 4 parameters).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Creates or retrieves the specified event hub with the given name. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Event4](#class-event4)\<A1,A2,A3,A4> | The created or retrieved event hub. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F8 <: EventCallBack4<Int64, Int64, Int64, Int64> {
       public func invoke(a: Int64, b: Int64, c: Int64, d: Int64) {
           println("F8 is invoked")
       }
}

let eventhub = EventHub()
let foo8: EventCallBack4<Int64, Int64, Int64, Int64> = F8()
eventhub.obtainEvent4<Int64, Int64, Int64, Int64>("click4").on(foo8)
```

### func obtainEvent5\<A1, A2, A3, A4, A5>(String)

```cangjie
public func obtainEvent5<A1, A2, A3, A4, A5>(name: String): Event5<A1, A2, A3, A4, A5>
```

**Function:** Creates or retrieves the specified event hub (with 5 parameters).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Creates or retrieves the specified event hub with the given name. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Event5](#class-event5)\<A1,A2,A3,A4,A5> | The created or retrieved event hub. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// This code can be added to dependency definitions
class F10 <: EventCallBack5<Int64, Int64, Int64, Int64, Int64> {
    public override func invoke(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
        println("F10 is invoked")
    }
}

let eventhub = EventHub()
let foo10: EventCallBack5<Int64, Int64, Int64, Int64, Int64> = F10()
eventhub.obtainEvent5<Int64, Int64, Int64, Int64, Int64>("click5").on(foo10)
```