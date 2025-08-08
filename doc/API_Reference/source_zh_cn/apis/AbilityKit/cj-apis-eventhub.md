# ohos.eventhub

EventHub模块提供了事件中心，提供订阅、取消订阅、触发事件的能力。

## 导入模块

```cangjie
import kit.PerformanceAnalysisKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## class Event0

```cangjie
public class Event0 <: EventBase {}
```

**功能：** 参数个数为0的事件中心。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [EventBase](#class-eventbase)

### func emit()

```cangjie
public func emit(): Unit
```

**功能：** 触发参数个数为0的指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取消对指定事件callback的订阅，当该事件触发后，将不会回调该callback。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[EventCallBack0](#class-eventcallback0)|是|-|事件回调。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取消订阅参数个数为0的所有指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 订阅指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[EventCallBack0](#class-eventcallback0)|是|-|事件回调，事件触发后调用。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 参数个数为1的事件中心。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [EventBase](#class-eventbase)

### func emit(A)

```cangjie
public func emit(arg: A): Unit
```

**功能：** 触发参数个数为1的指定事件，A为泛型类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg|A|是|-|事件触发时，传递给回调事件的参数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取消对指定事件callback的订阅，当该事件触发后，将不会回调该callback。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[EventCallBack1](#class-eventcallback1)\<A>|是|-|事件回调。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取消订阅参数个数为1的所有指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 订阅指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[EventCallBack1](#class-eventcallback1)\<A>|是|-|事件回调，事件触发后调用。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 参数个数为2的事件中心。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [EventBase](#class-eventbase)

### func emit(A1, A2)

```cangjie
public func emit(arg1: A1, arg2: A2): Unit
```

**功能：** 触发指定事件，A1、A2为泛型类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg1|A1|是|-|事件触发时，传递给回调事件的参数。|
|arg2|A2|是|-|事件触发时，传递给回调事件的参数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取消对指定事件callback的订阅，当该事件触发后，将不会回调该callback。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[EventCallBack2](#class-eventcallback2)\<A1,A2>|是|-|事件回调。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取消订阅参数个数为2的所有指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 订阅指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[EventCallBack2](#class-eventcallback2)\<A1,A2>|是|-|事件回调，事件触发后调用。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 参数个数为3的事件中心。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [EventBase](#class-eventbase)

### func emit(A1, A2, A3)

```cangjie
public func emit(arg1: A1, arg2: A2, arg3: A3): Unit
```

**功能：** 触发参数个数为3的指定事件，A1、A2、A3为泛型类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg1|A1|是|-|事件触发时，传递给回调事件的参数。|
|arg2|A2|是|-|事件触发时，传递给回调事件的参数。|
|arg3|A3|是|-|事件触发时，传递给回调事件的参数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取取消对指定事件callback的订阅，当该事件触发后，将不会回调该callback。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[EventCallBack3](#class-eventcallback3)\<A1,A2,A3>|是|-|事件回调。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取消订阅参数个数为3的所有指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 订阅指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[EventCallBack3](#class-eventcallback3)\<A1,A2,A3>|是|-|事件回调，事件触发后调用。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 参数个数为4的事件中心。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [EventBase](#class-eventbase)

### func emit(A1, A2, A3, A4)

```cangjie
public func emit(arg1: A1, arg2: A2, arg3: A3, arg4: A4): Unit
```

**功能：** 触发参数个数为4的指定事件，A1、A2、A3、A4为泛型类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg1|A1|是|-|事件触发时，传递给回调事件的参数。|
|arg2|A2|是|-|事件触发时，传递给回调事件的参数。|
|arg3|A3|是|-|事件触发时，传递给回调事件的参数。|
|arg4|A4|是|-|事件触发时，传递给回调事件的参数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取消对指定事件callback的订阅，当该事件触发后，将不会回调该callback。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[EventCallBack4](#class-eventcallback4)\<A1,A2,A3,A4>|是|-|事件回调。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取消订阅参数个数为4的所有指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 订阅指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[EventCallBack4](#class-eventcallback4)\<A1,A2,A3,A4>|是|-|事件回调，事件触发后调用。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 参数个数为5的事件中心。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [EventBase](#class-eventbase)

### func emit(A1, A2, A3, A4, A5)

```cangjie
public func emit(arg1: A1, arg2: A2, arg3: A3, arg4: A4, arg5: A5): Unit
```

**功能：** 触发参数个数为5的指定事件，A1、A2、A3、A4、A5为泛型类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg1|A1|是|-|事件触发时，传递给回调事件的参数。|
|arg2|A2|是|-|事件触发时，传递给回调事件的参数。|
|arg3|A3|是|-|事件触发时，传递给回调事件的参数。|
|arg4|A4|是|-|事件触发时，传递给回调事件的参数。|
|arg5|A5|是|-|事件触发时，传递给回调事件的参数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取消对指定事件callback的订阅，当该事件触发后，将不会回调该callback。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[EventCallBack5](#class-eventcallback5)\<A1,A2,A3,A4,A5>|是|-|事件回调。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取消订阅参数个数为5的所有指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 订阅指定事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[EventCallBack5](#class-eventcallback5)\<A1,A2,A3,A4,A5>|是|-|事件回调，事件触发后调用。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 事件抽象类，A、A1、A2、A3、A4、A5均为泛型类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func as0()

```cangjie
public func as0(): Event0
```

**功能：** 校验参数个数为0的参数类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Event0](#class-event0)|校验后的回调事件中心。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码|错误信息|
  |:------|:-------------------------|
  |801|Capability not supported.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 校验参数个数为1的参数类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Event1](#class-event1)\<A>|校验后的回调事件中心。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码|错误信息|
  |:------|:-------------------------|
  |801|Capability not supported.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 校验参数个数为2的参数类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Event2](#class-event2)\<A1,A2>|校验后的回调事件中心。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码|错误信息|
  |:------|:-------------------------|
  |801|Capability not supported.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 校验参数个数为3的参数类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Event3](#class-event3)\<A1,A2,A3>|校验后的回调事件中心。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码|错误信息|
  |:------|:-------------------------|
  |801|Capability not supported.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 校验参数个数为4的参数类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Event4](#class-event4)\<A1,A2,A3,A4>|校验后的回调事件中心。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码|错误信息|
  |:------|:-------------------------|
  |801|Capability not supported.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 校验参数个数为5的参数类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Event5](#class-event5)\<A1,A2,A3,A4,A5>|校验后的回调事件中心。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码|错误信息|
  |:------|:-------------------------|
  |801|Capability not supported.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 参数个数为0的回调事件的抽象类。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func invoke()

```cangjie
public open func invoke(): Unit
```

**功能：** 触发回调事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 参数个数为1的回调事件的抽象类，A为泛型类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func invoke(A)

```cangjie
public open func invoke(arg: A): Unit
```

**功能：** 触发回调事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg|A|是|-|事件触发时，传递给回调事件的参数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 参数个数为2的回调事件的抽象类，A1、A2为泛型类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func invoke(A1, A2)

```cangjie
public open func invoke(arg1: A1, arg2: A2): Unit
```

**功能：** 触发回调事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg1|A1|是|-|事件触发时，传递给回调事件的参数。|
|arg2|A2|是|-|事件触发时，传递给回调事件的参数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 参数个数为3的回调事件的抽象类，A1、A2、A3为泛型类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func invoke(A1, A2, A3)

```cangjie
public open func invoke(arg1: A1, arg2: A2, arg3: A3): Unit
```

**功能：** 触发回调事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg1|A1|是|-|事件触发时，传递给回调事件的参数。|
|arg2|A2|是|-|事件触发时，传递给回调事件的参数。|
|arg3|A3|是|-|事件触发时，传递给回调事件的参数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 参数个数为4的回调事件的抽象类，A1、A2、A3、A4为泛型类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func invoke(A1, A2, A3, A4)

```cangjie
public open func invoke(arg1: A1, arg2: A2, arg3: A3, arg4: A4): Unit
```

**功能：** 触发回调事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg1|A1|是|-|事件触发时，传递给回调事件的参数。|
|arg2|A2|是|-|事件触发时，传递给回调事件的参数。|
|arg3|A3|是|-|事件触发时，传递给回调事件的参数。|
|arg4|A4|是|-|事件触发时，传递给回调事件的参数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 参数个数为5的回调事件的抽象类，A1、A2、A3、A4、A5为泛型类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func invoke(A1, A2, A3, A4, A5)

```cangjie
public open func invoke(arg1: A1, arg2: A2, arg3: A3, arg4: A4, arg5: A5): Unit
```

**功能：** 触发回调事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|arg1|A1|是|-|事件触发时，传递给回调事件的参数。|
|arg2|A2|是|-|事件触发时，传递给回调事件的参数。|
|arg3|A3|是|-|事件触发时，传递给回调事件的参数。|
|arg4|A4|是|-|事件触发时，传递给回调事件的参数。|
|arg5|A5|是|-|事件触发时，传递给回调事件的参数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 事件管理中心抽象类，A、A1、A2、A3、A4、A5均为泛型类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func get(String)

```cangjie
public func get(s: String): EventBase
```

**功能：** 取出回调事件。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|s|String|是|-|取出指定事件中心s。|

**返回值：**

|类型|说明|
|:----|:----|
|[EventBase](#class-eventbase)|取出的回调事件。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取出回调事件，并校验参数（参数个数为0）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|s|String|是|-|取出指定事件中心s。|

**返回值：**

|类型|说明|
|:----|:----|
|[Event0](#class-event0)|校验后的回调事件中心。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码|错误信息|
  |:------|:------------------|
  |401|Invalid parameter.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取出回调事件，并校验参数（参数个数为1）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|s|String|是|-|取出指定事件中心s。|

**返回值：**

|类型|说明|
|:----|:----|
|[Event1](#class-event1)\<A>|校验后的回调事件中心。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码|错误信息|
  |:------|:------------------|
  |401|Invalid parameter.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取出回调事件，并校验参数（参数个数为2）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|s|String|是|-|取出指定事件中心s。|

**返回值：**

|类型|说明|
|:----|:----|
|[Event2](#class-event2)\<A1,A2>|校验后的回调事件中心。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码|错误信息|
  |:------|:------------------|
  |401|Invalid parameter.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取出回调事件，并校验参数（参数个数为3）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|s|String|是|-| 取出指定事件中心s。|

**返回值：**

|类型|说明|
|:----|:----|
|[Event3](#class-event3)\<A1,A2,A3>|校验后的回调事件中心。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码|错误信息|
  |:------|:------------------|
  |401|Invalid parameter.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取出回调事件，并校验参数（参数个数为4）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|s|String|是|-|取出指定事件中心s。|

**返回值：**

|类型|说明|
|:----|:----|
|[Event4](#class-event4)\<A1,A2,A3,A4>|校验后的回调事件中心。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码|错误信息|
  |:------|:------------------|
  |401|Invalid parameter.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 取出回调事件，并校验参数（参数个数为5）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|s|String|是|-|取出指定事件中心s。|

**返回值：**

|类型|说明|
|:----|:----|
|[Event5](#class-event5)\<A1,A2,A3,A4,A5>|校验后的回调事件中心。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码|错误信息|
  |:------|:------------------|
  |401|Invalid parameter.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 创建或取出的事件（参数个数为0）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|创建或取出名为name的指定事件中心。|

**返回值：**

|类型|说明|
|:----|:----|
|[Event0](#class-event0)|创建或取出的事件中心。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 创建或取出的事件（参数个数为1）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|创建或取出名为name的指定事件中心。|

**返回值：**

|类型|说明|
|:----|:----|
|[Event1](#class-event1)\<A>|创建或取出的事件中心。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 创建或取出的事件（参数个数为2）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|创建或取出名为name的指定事件中心。|

**返回值：**

|类型|说明|
|:----|:----|
|[Event2](#class-event2)\<A1,A2>|创建或取出的事件中心。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 创建或取出的事件（参数个数为3）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|创建或取出名为name的指定事件中心。|

**返回值：**

|类型|说明|
|:----|:----|
|[Event3](#class-event3)\<A1,A2,A3>|创建或取出的事件中心。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 创建或取出的事件（参数个数为4）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|创建或取出名为name的指定事件中心。|

**返回值：**

|类型|说明|
|:----|:----|
|[Event4](#class-event4)\<A1,A2,A3,A4>|创建或取出的事件中心。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
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

**功能：** 创建或取出指定事件中心（参数个数为5）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|创建或取出名为name的指定事件中心。|

**返回值：**

|类型|说明|
|:----|:----|
|[Event5](#class-event5)\<A1,A2,A3,A4,A5>|创建或取出的事件中心。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.AbilityKit.*

// 此处代码可添加在依赖项定义中
class F10 <: EventCallBack5<Int64, Int64, Int64, Int64, Int64> {
    public override func invoke(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
        println("F10 is invoked")
    }
}

let eventhub = EventHub()
let foo10: EventCallBack5<Int64, Int64, Int64, Int64, Int64> = F10()
eventhub.obtainEvent5<Int64, Int64, Int64, Int64, Int64>("click5").on(foo10)
```
