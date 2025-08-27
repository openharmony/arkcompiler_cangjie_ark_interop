# ohos.arkui.state_management

提供ObservedArray和ObservedArrayList作为状态管理的数组类型，当其中数组发生变化时，如修改其中一项的值，删除或添加一项，就会触发UI更新。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## class ObservedArrayList

```cangjie
public class ObservedArrayList<T> <: ObservedComplexAbstract {


    public init(initValue: ArrayList<T>)


    public init(initValue: Array<T>)
}
```

**功能：** 提供支持状态管理的可变长度的数组的功能，可以感知内部的变化。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [ObservedComplexAbstract](./cj-state-rendering-appstatemanagement.md#class-observedcomplexabstract)
- [CollectionEx](please add link)\<T>

### prop size

```cangjie
public prop size: Int64
```

**功能：**  此 ObservedArrayList 中的元素个数。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(ArrayList\<T>)

```cangjie

public init(initValue: ArrayList<T>)
```

**功能：** 构造一个包含指定Array数组中所有元素的 ObservedArrayList。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|initValue|ArrayList\<T>|是|-|ArrayList数组,用来初始化ObservedArrayList。|

### init(Array\<T>)

```cangjie

public init(initValue: Array<T>)
```

**功能：** 构造一个包含指定Array数组中所有元素的 ObservedArrayList。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|initValue|Array\<T>|是|-|Array数组,用来初始化ObservedArrayList。|

### func append(T)

```cangjie

public func append(element: T): Unit
```

**功能：** 将指定的元素附加到此 ObservedArrayList 的末尾。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|element|T|是|-|插入的元素。|

### func appendAll(Collection\<T>)

```cangjie

public func appendAll(elements: Collection<T>): Unit
```

**功能：** 将指定集合中的所有元素附加到此 ObservedArrayList 的末尾。函数会按照迭代器顺序遍历入参中的集合，并且将所有元素插入到此 ObservedArrayList 的尾部。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|elements|[Collection](<font color="red" face="bold">please add link</font>)\<T>|是|-|需要插入的元素的集合。|

### func clear()

```cangjie

public func clear(): Unit
```

**功能：** 从此 ObservedArrayList 中删除所有元素。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func clone()

```cangjie

public func clone(): ObservedArrayList<T>
```

**功能：** 返回此 ObservedArrayList 实例的拷贝(浅拷贝)。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[ObservedArrayList](#class-observedarraylist)\<T>|此 ObservedArrayList 实例的拷贝(浅拷贝)。|

### func get()

```cangjie

public func get(): ArrayList<T>
```

**功能：** 返回一个ArrayList数组，其中包含此 ObservedArrayList 中按正确顺序排列的所有元素。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|ArrayList\<T>|返回的ArrayList数组。|

### func insert(Int64, T)

```cangjie

public func insert(index: Int64, element: T): Unit
```

**功能：** 在此 ObservedArrayList 中的指定位置插入指定元素。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int64|是|-|插入元素的目标索引。|
|element|T|是|-|要插入的 T 类型元素。|

### func insertAll(Int64, Collection\<T>)

```cangjie

public func insertAll(index: Int64, elements: Collection<T>): Unit
```

**功能：** 从指定位置开始，将指定集合中的所有元素插入此 ObservedArrayList。函数会按照迭代器顺序遍历入参中的集合，并且将所有元素插入到指定位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int64|是|-|插入集合的目标索引。|
|elements|[Collection](<font color="red" face="bold">please add link</font>)\<T>|是|-|要插入的 T 类型元素集合。|

### func isEmpty()

```cangjie

public func isEmpty(): Bool
```

**功能：** 判断 ObservedArrayList 是否为空。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|判断 ObservedArrayList 是否为空。如果为空，返回true；如果不为空，返回false。|

### func prepend(T)

```cangjie

public func prepend(element: T): Unit
```

**功能：** 将指定的元素附加到此 ObservedArrayList 的末尾。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|element|T|是|-|插入的元素。|

### func prependAll(Collection\<T>)

```cangjie

public func prependAll(elements: Collection<T>): Unit
```

**功能：** 从起始位置开始，将指定集合中的所有元素插入此 ObservedArrayList。函数会按照迭代器顺序遍历入参中的集合，并且将所有元素插入到指定位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|elements|[Collection](<font color="red" face="bold">please add link</font>)\<T>|是|-|需要插入的元素的集合。|

### func remove(Int64)

```cangjie

public func remove(index: Int64): T
```

**功能：** 删除此 ObservedArrayList 中指定位置的元素。返回被移除的元素。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int64|是|-|被删除元素的索引。|

**返回值：**

|类型|说明|
|:----|:----|
|T|被移除的元素。|

### func remove(Range\<Int64>)

```cangjie

public func remove(range: Range<Int64>): Unit
```

**功能：** 删除此 ObservedArrayList 中 Range 范围所包含的所有元素。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|range|[Range](<font color="red" face="bold">please add link</font>)\<Int64>|是|-|需要被删除的元素的范围。|

### func removeIf((T) -> Bool)

```cangjie

public func removeIf(predicate: (T) -> Bool): Unit
```

**功能：** 删除此 ObservedArrayList 中满足给定 lambda 表达式或函数的所有元素。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|predicate|(T)->Bool|是|-|判断删除的条件。|

### func set(ArrayList\<T>)

```cangjie

public func set(newValue: ArrayList<T>): Unit
```

**功能：** 通过一个ArrayList数组重置当前 ObservedArrayList 的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|newValue|ArrayList\<T>|是|-|ArrayList数组，用来设置 ObservedArrayList 的值。|

### func set(Array\<T>)

```cangjie

public func set(newValue: Array<T>): Unit
```

**功能：** 通过一个Array数组重置当前 ObservedArrayList 的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|newValue|Array\<T>|是|-|Array数组，用来设置 ObservedArrayList 的值。|

### func set(ObservedComplexAbstract)

```cangjie

public func set(newValue: ObservedComplexAbstract): Unit
```

**功能：** 通过ObservedComplexAbstract重置当前 ObservedArrayList 的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|newValue|[ObservedComplexAbstract](<font color="red" face="bold">please add link</font>)|是|-|ObservedComplexAbstract数据，用来设置ObservedArrayList的值。|

### func subscribeInner(Observer)

```cangjie

public func subscribeInner(observer: Observer): Unit
```

**功能：** 对状态管理数组的每一项进行递归的观察绑定。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](<font color="red" face="bold">please add link</font>)|是|-|绑定的观察类。|

### func unsubscribeInner(Observer)

```cangjie

public func unsubscribeInner(observer: Observer): Unit
```

**功能：** 对状态管理数组的每一项进行递归的解绑。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](<font color="red" face="bold">please add link</font>)|是|-|解绑的观察类。|

### func \[](int64)

```cangjie

public operator func [](index: Int64): T
```

**功能：** 操作符重载 - get。返回索引位置的元素的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int64|是|-|表示 get 接口的索引。|

**返回值：**

|类型|说明|
|:----|:----|
|T|返回的索引位置元素的值。|

### func [](Int64, T)

```cangjie

public operator func [](index: Int64, value!: T): Unit
```

**功能：** 操作符重载 - set，通过下标运算符用指定的元素替换此列表中指定位置的元素。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int64|是|-|要设置的索引值。
|value|T|是|-| **命名参数。** 要设置的 T 类型的值。|

### 示例代码

<!-- run -->

```cangjie

package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var arr: ObservedArray<Int64> = ObservedArray<Int64>([1, 2])

    func build() {
        Column {
            Text("arr[0] is ${arr[0]}")
            Button("click").onClick {
                arr[0] = 0
            }
        }
    }
}
```

<!-- run -->

```cangjie

package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var arr: ObservedArrayList<Int64> = ObservedArrayList<Int64>([1, 2])

    func build() {
        Column {
            Text("arr[0] is ${arr[0]}")
            Button("click").onClick {
                arr[0] = 0
            }
            Button("append").onClick {
                arr.append(0)
            }
        }
    }
}
```

## class ObservedProperty

```cangjie
public open class ObservedProperty<T> <: ObservedPropertyAbstract {
    public init(info: String, initValue: T)
}
```

**功能：** 组件的可观测属性类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [ObservedPropertyAbstract](<font color="red" face="bold">please add link</font>)

### init(String, T)

```cangjie

public init(info: String, initValue: T)
```

**功能：** ObservedProperty类的构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|info|String|是|-|构造初始化信息。|
|initValue|T|是|-|构造初始化值。|

### func createProp(String)

```cangjie

public func createProp(info: String): ObservedProperty<T>
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|info|String|是|-|<font color="red" face="bold">please add description</font>|

**返回值：**

|类型|说明|
|:----|:----|
|[ObservedProperty](#class-observedproperty)\<T>|<font color="red" face="bold">please add description</font>|

### func get()

```cangjie

public func get(): T
```

**功能：** 读取同步属性的数据。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|T|同步属性的数据。|

### func getInner()

```cangjie

public func getInner(): T
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|T|<font color="red" face="bold">please add description</font>|

### func set(T)

```cangjie

public open func set(newValue: T): Unit
```

**功能：** 设置同步属性的数据。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|newValue|T|是|-|要设置的数据。|

### func subscribeEx(Observer)

```cangjie

public func subscribeEx(observer: Observer)
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](<font color="red" face="bold">please add link</font>)|是|-|<font color="red" face="bold">please add description</font>|

### func unsubscribeEx(Observer)

```cangjie

public func unsubscribeEx(observer: Observer)
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](<font color="red" face="bold">please add link</font>)|是|-|<font color="red" face="bold">please add description</font>|

## 示例代码

状态更新时的注意事项：不允许在spawn表达式中对状态变量进行并发修改，会导致并发安全问题。建议当需要修改状态变量时，采用`concurrency`包提供的`launch`方法，将状态更新的步骤放回主线程中运行，以保证并发安全。如下实例演示如何在spawn表达式中更新变量状态：

<!-- run -->

```cangjie

package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var text: String = "begin"

    func build() {
        Column(30) {
            Button(text).onClick { evt =>
                changeText({ p: String =>
                    // 使用launch表达式在主线程中更新状态变量
                    launch {
                        text = p
                    }
                })
            }
        }.width(100.percent)
    }

    private func changeText(callback: (String) -> Unit): Unit {
        spawn {
            while (true) {
                callback("blink 0")
                sleep(Duration.millisecond * 100)
                callback("blink 1")
                sleep(Duration.millisecond * 100)
            }
        }
    }
}
```
