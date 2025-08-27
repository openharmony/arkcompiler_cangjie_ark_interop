# LazyForEach

## 导入模块

```cangjie
import kit.ArkUI.*
```

## interface IDataSource

```cangjie
public interface IDataSource<T> {
    func totalCount(): Int64
    func getData(index: Int64): T
    func onRegisterDataChangeListener(listener: DataChangeListener): Unit
    func onUnregisterDataChangeListener(listener: DataChangeListener): Unit
}
```

**功能：** LazyForEach数据源，需要开发者实现相关接口。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func getData(Int64)

```cangjie
func getData(index: Int64): T
```

**功能：** 获取索引值index对应的数据。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int64|是|-|数据对应的索引值。|

**返回值：**

|类型|说明|
|:----|:----|
|[T](#generic-type-t)|索引值index对应的数据。|

### func onRegisterDataChangeListener(DataChangeListener)

```cangjie
func onRegisterDataChangeListener(listener: DataChangeListener): Unit
```

**功能：** 注册数据改变的监听器。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|listener|[DataChangeListener](#class-datachangelistener)|是|-|数据变化监听器。|

### func onUnregisterDataChangeListener(DataChangeListener)

```cangjie
func onUnregisterDataChangeListener(listener: DataChangeListener): Unit
```

**功能：** 注销数据改变的监听器。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|listener|[DataChangeListener](#class-datachangelistener)|是|-|数据变化监听器。|

### func totalCount()

```cangjie
func totalCount(): Int64
```

**功能：** 获得数据总数。

**返回值：**

|类型|说明|
|:----|:----|
|Int64|数据总数。|

## class DataChangeListener

```cangjie
public class DataChangeListener <: RemoteData {
    public DataChangeListener(id: Int64)
}
```

**功能：** 数据变化监听器。

> **说明：**
>
> DataChangeListener除onDatasetChange以外的方法中，当参数包含index且值为负数时，会默认用0来替换。
> onDatasetChange中，当单个DataOperation参数包含index且值在数据源索引范围之外（DataAddOperation中index可以等于数据源长度），则对应DataOperation不会生效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [RemoteData](<font color="red" face="bold">please add link</font>)

### DataChangeListener(Int64)

```cangjie
public DataChangeListener(id: Int64)
```

**功能：** 创建一个DataChangeListener类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|Int64|是|-|监听器ID。|

### func onDataAdd(Int64)

```cangjie
public func onDataAdd(index: Int64): Unit
```

**功能：** 通知组件index的位置有数据添加。添加数据完成后调用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int64|是|-|数据添加位置的索引值。|

### func onDataChange(Int64)

```cangjie
public func onDataChange(index: Int64): Unit
```

**功能：** 通知组件index的位置有数据有变化。改变数据完成后调用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int64|是|-|数据变化位置的索引值。|

### func onDataDelete(Int64)

```cangjie
public func onDataDelete(index: Int64): Unit
```

**功能：** 通知组件删除index位置的数据并刷新LazyForEach的展示内容。删除数据完成后调用。

> **说明：**
>
> 需要保证dataSource中的对应数据已经在调用onDataDelete前删除，否则页面渲染将出现未定义的行为。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int64|是|-|数据删除位置的索引值。|

### func onDataMove(Int64, Int64)

```cangjie
public func onDataMove(fromIdx: Int64, toIdx: Int64): Unit
```

**功能：** 通知组件数据有移动。将fromIdx和toIdx位置的数据进行交换。数据移动起始位置与数据移动目标位置交换完成后调用。

> **说明：**
>
> 数据移动前后键值要保持不变，如果键值有变化，应使用删除数据和新增数据接口。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fromIdx|Int64|是|-|数据移动起始位置。|
|toIdx|Int64|是|-|数据移动目标位置。|

### func onDataReloaded()

```cangjie
public func onDataReloaded(): Unit
```

**功能：** 通知组件重新加载所有数据。键值没有变化的数据项会使用原先的子组件，键值发生变化的会重建子组件。重新加载数据完成后调用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## class LazyForEach

```cangjie
public class LazyForEach <: UINodeBase {
    public LazyForEach()
}
```

**功能：** 用于创建[LazyForEach](#LazyForEach)组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [UINodeBase](<font color="red" face="bold">please add link</font>)

### func create\<T>(Int64, CustomView, IDataSource\<T>, ItemGenFuncType\<T>, KeyGenFuncType\<T>)

```cangjie
public func create<T>(viewID: Int64, parentView: CustomView, dataSource: IDataSource<T>,
    itemGeneratorFunc!: ItemGenFuncType<T>,
    keyGeneratorFunc!: KeyGenFuncType<T> = {
        _: T, idx: Int64 =>
        uniqueKey++
        return "${viewID} - ${idx} - ${uniqueKey}"
    }): LazyForEach
```

**功能：** 构建一个LazyForEach对象，LazyForEach从提供的数据源中按需迭代数据，并在每次迭代过程中创建相应的组件。当在滚动容器中使用了LazyForEach，框架会根据滚动容器可视区域按需创建组件，当组件滑出可视区域外时，框架会进行组件销毁回收以降低内存占用。

> **说明：**
>
> - 数据懒加载必须在容器组件内使用，且仅有List、Grid以及Swiper组件支持数据的懒加载（即只加载可视部分以及其前后少量数据用于缓冲），其他组件仍然是一次加载所有的数据。
> - LazyForEach在每次迭代中，必须且只允许创建一个子组件。
> - 生成的子组件必须允许在LazyForEach的父容器组件中。
> - 允许LazyForEach包含在if/else条件渲染语句中，也允许LazyForEach中出现if/else条件渲染语句。
> - 键值生成器必须针对每个数据生成唯一的值，如果键值相同，将导致键值相同的UI组件渲染出现问题。
> - LazyForEach必须使用DataChangeListener对象来进行更新，第一个参数dataSource使用状态变量时，状态变量改变不会触发LazyForEach的UI刷新。
> - 为了高性能渲染，通过DataChangeListener对象的onDataChange方法来更新UI时，需要生成不同于原来的键值来触发组件刷新。
> - List使用LazyForEach加载子组件时，没有设置List的宽高，会加载所有子组件，设置了List的宽高，会加载List显示区域内的子组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|viewID|Int64|是|-|<font color="red">please add your description</font>|
|parentView|[CustomView](./cj-ui-framework.md#class-customview)|是|-|<font color="red">please add your description</font>|
|dataSource|[IDataSource](#interface-idatasource)\<T>|是|-|LazyForEach数据源，需要开发者实现相关接口。|
|itemGeneratorFunc|ItemGenFuncType\<T>|是|-|子组件生成函数，为数组中的每一个数据项创建一个子组件。lambda函数的第一个泛型参数为数据类型，必须为FFIData的子类；第二个参数为当前列表项的索引值。|
|keyGeneratorFunc|KeyGenFuncType\<T>|否|{ _: T, idx: Int64 => uniqueKey ++ return "${viewID} - ${idx} - ${uniqueKey}" }|匿名函数，用于键值生成，为给定数组项生成唯一且稳定的键值。当子项在数组中的位置更改时，子项的键值不得更改，当数组中的子项被新项替换时，被替换项的键值和新项的键值必须不同。键值生成器的功能是可选的，但是，为了使开发框架能够更好地识别数组更改，提高性能，建议提供。如将数组反向时，如果没有提供键值生成器，则LazyForEach中的所有节点都将重建。|


**返回值：**

|类型|说明|
|:----|:----|
|[LazyForEach](#class-lazyforeach)|LazyForEach实例对象，用于后续进一步操作。|

### func initial()

```cangjie
public func initial(): Unit
```

**功能：** <font color="red">please add your description</font>

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func update()

```cangjie
public func update(): Unit
```

**功能：** <font color="red">please add your description</font>

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21


## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*

public class Student {
    public Student(
        let name: String,
        let id: Int64
    ) {}
}

class StudentDataSource <: IDataSource<Student> {
    public StudentDataSource(let data_: ArrayList<Student>) {}
    public var listenerOp: Option<DataChangeListener> = None
    public func totalCount(): Int64 {
        return data_.size
    }
    public func getData(index: Int64): Student {
        return data_[index]
    }

    public func onRegisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = listener
    }

    public func onUnregisterDataChangeListener(listener: DataChangeListener): Unit {
        listenerOp = None
    }

    public func notifyChange(): Unit {
        let listener: DataChangeListener = listenerOp.getOrThrow()
        listener.onDataReloaded()
    }
}

func getDS(): StudentDataSource
{
    let data: ArrayList<Student> = ArrayList<Student>()
    for (i in 0..10) {
        data.add(Student("name ${i}", i * i))
    }
    let dataSourceStu: StudentDataSource = StudentDataSource(data)
    return dataSourceStu
}

let dataSourceStu: StudentDataSource = getDS()
var changeID: Int64 = 0

@Entry
@Component
public class EntryView {

    public func build(): Unit {
        Column(30) {
            Column {
                LazyForEach(dataSourceStu, itemGeneratorFunc: {stu: Student, idx: Int64 =>
                    Column {
                        Text(stu.name)
                    }
                })
            }
            .height(220.0)

            Text("click to notifyChange").onClick({ evt =>
                if (changeID < dataSourceStu.data_.size) {
                    dataSourceStu.data_.remove(at: changeID)
                    dataSourceStu.data_.add(Student("xiaoming", 10086), at: changeID)
                    dataSourceStu.notifyChange()
                    changeID += 1
                }
            })
        }
    }
}
```

![lazyforeach](figures/lazyforeach.gif)