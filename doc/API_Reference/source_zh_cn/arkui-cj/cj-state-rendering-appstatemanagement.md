# 应用级变量的状态管理

状态管理模块提供了应用程序的数据存储能力、持久化数据管理能力、UIAbility数据存储能力和应用程序需要的环境状态。

## 导入模块

```cangjie
import 警告警告！.*
```

## 使用说明

AppStorage是在应用启动的时候会被创建的单例。它的目的是为了提供应用状态数据的中心存储，这些状态数据在应用级别都是可访问的。AppStorage将在应用运行过程保留其属性。属性通过唯一的键字符串值访问。

AppStorage可以和UI组件同步，且可以在应用业务逻辑中被访问。

AppStorage支持应用的主线程内多个UIAbility实例间的状态共享。

AppStorage中的属性可以被双向同步，数据可以是存在于本地或远程设备上，并具有不同的功能，比如数据持久化（详见[PersistentStorage](#class-persistentstorage)）。这些数据是通过业务逻辑中实现，与UI解耦，如果希望这些数据在UI中使用，需要用到@StorageProp和@StorageLink。

## class AppStorage

```cangjie
public class AppStorage {}
```

**功能：** 与AppStorage中对应的propName建立单向属性绑定。如果给定的propName在AppStorage中存在，则返回与AppStorage中propName对应属性的单向绑定数据。如果AppStorage中不存在propName，则返回None。单向绑定数据的修改不会被同步回AppStorage中。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func `prop`\<T>(String)

```cangjie
public static func `prop`<T>(propName: String): ?ObservedProperty<T>
```

**功能：** 与AppStorage中对应的propName建立单向属性绑定。如果给定的propName在AppStorage中存在，则返回与AppStorage中propName对应属性的单向绑定数据。如果AppStorage中不存在propName，则返回None。单向绑定数据的修改不会被同步回AppStorage中。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|AppStorage中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|?ObservedProperty<T>|返回单向绑定的数据，如果AppStorage中不存在对应的属性值，则返回None。|

### static func clear()

```cangjie

public static func clear(): Bool
```

**功能：** 删除AppStorage中所有的属性。删除所有属性的前提是已经没有任何订阅者。如果有订阅者，clear不会生效并返回false。如果没有订阅者则删除成功并返回true。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果AppStorage中的属性已经没有任何订阅者，则删除成功，并返回true。否则返回false。|

### static func delete(String)

```cangjie

public static func delete(propName: String): Bool
```

**功能：** 在AppStorage中删除propName对应的属性。在AppStorage中删除属性的前提是该属性已经没有订阅者，如果有订阅者，则返回false。如果没有订阅者则删除成功并返回true。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|AppStorage中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool| 如果AppStorage中有对应的属性，且该属性已经没有订阅者，则删除成功，返回true。如果属性不存在，或者该属性还存在订阅者，则返回false。|

### static func get\<T>(String)

```cangjie

public static func get<T>(propName: String): ?T
```

**功能：** 获取propName在AppStorage中对应的属性值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|AppStorage中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|?T|AppStorage中propName对应的属性值，如果不存在则返回None。|

### static func has(String)

```cangjie

public static func has(propName: String): Bool
```

**功能：** 判断propName对应的属性是否在AppStorage中存在。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|AppStorage中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果propName对应的属性在AppStorage中存在，则返回true。不存在则返回false。|

### static func keys()

```cangjie

public static func keys(): EquatableCollection<String>
```

**功能：** 返回AppStorage中所有的属性名。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|EquatableCollection<String>|AppStorage中所有的属性名。|

### static func link\<T>(String)

```cangjie

public static func link<T>(propName: String): ?ObservedProperty<T>
```

**功能：** 如果给定的propName在AppStorage实例中存在，则返回与AppStorage中propName对应属性的双向绑定数据。

双向绑定数据的修改会被同步回AppStorage中，AppStorage会将变化同步到所有绑定该propName的数据和Component中。

如果AppStorage中不存在propName，则返回None。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|AppStorage中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|?ObservedProperty<T>|Option\<ObservedProperty\<T>>的实例，与AppStorage中propName对应属性的双向绑定的数据，如果AppStorage中不存在对应的propName，则返回None。|

### static func set\<T>(String, T)

```cangjie

public static func set<T>(propName: String, newValue: T): Bool
```

**功能：** 在AppStorage中设置propName对应属性的值。如果newValue的值和propName对应属性的值相同，即不需要做赋值操作，状态变量不会通知UI刷新propName对应属性的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-| AppStorage中的属性名。|
|newValue|T|是|-|属性值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果AppStorage中不存在propName对应的属性，返回false。设置成功返回true。|

### static func setAndLink\<T>(String, T)

```cangjie

public static func setAndLink<T>(propName: String, defaultValue: T): ObservedProperty<T>
```

**功能：** 与link接口类似，如果给定的propName在AppStorage中存在，则返回该propName对应的属性的双向绑定数据。如果不存在，则使用defaultValue在AppStorage中创建和初始化propName对应的属性，返回其双向绑定数据。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|AppStorage中的属性名。|
|defaultValue|T|是|-|当propName在AppStorage中不存在时，使用defaultValue在AppStorage中初始化对应的propName。|

**返回值：**

|类型|说明|
|:----|:----|
|ObservedProperty<T>|ObservedProperty\<T>的实例，与AppStorage中propName对应属性的双向绑定的数据。|

### static func setAndProp\<T>(String, T)

```cangjie

public static func setAndProp<T>(propName: String, defaultValue: T): ObservedProperty<T>
```

**功能：** 与Prop接口类似。如果给定的propName在AppStorage中存在，则返回该propName对应的属性的单向绑定数据。如果不存在，则使用defaultValue在AppStorage中创建和初始化propName对应的属性，返回其单向绑定数据。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|AppStorage中的属性名。|
|defaultValue|T|是|-|当propName在AppStorage中不存在时，使用defaultValue在AppStorage中初始化对应的propName，defaultValue不能为None。|

**返回值：**

|类型|说明|
|:----|:----|
|ObservedProperty<T>|ObservedProperty\<T>的实例。|

### static func setOrCreate\<T>(String, T)

```cangjie

public static func setOrCreate<T>(propName: String, newValue: T): Unit
```

**功能：** 如果propName已经在AppStorage中存在，并且newValue和propName对应属性的值不同，则设置propName对应属性的值为newValue，否则状态变量不会通知UI刷新propName对应属性的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|AppStorage中的属性名。|
|newValue|T|是|-| 属性值。|

### static func size()

```cangjie

public static func size(): Int64
```

**功能：** 返回AppStorage中的属性数量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|AppStorage中属性的数量。|

## class Environment

```cangjie
public class Environment {}
```

**功能：** 将Environment的内置环境变量key存入AppStorage中。如果系统中未查询到Environment环境变量key的值，则使用默认值value，存入成功，返回true。如果AppStorage中已经有对应的key，则返回false。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func aboutToBeDeleted()

```cangjie

public static func aboutToBeDeleted(): Unit
```

**功能：** 取消SubscribedAbstractProperty实例对AppStorage/LocalStorage的单/双向同步关系，并无效化SubscribedAbstractProperty实例，即当调用aboutToBeDeleted方法之后不能再使用SubscribedAbstractProperty实例调用set或get方法。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func envProp\<T>(String, T)

```cangjie

public static func envProp<T>(key: String, defaultValue: T): Bool
```

**功能：** 将Environment的内置环境变量key存入AppStorage中。如果系统中未查询到Environment环境变量key的值，则使用默认值value，存入成功，返回true。如果AppStorage中已经有对应的key，则返回false。

所以建议在程序启动的时候调用该接口。

在没有调用envProp的情况下，就使用AppStorage读取环境变量是错误的。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|key|String|是|-|环境变量名称，支持的范围详见内置环境变量说明。|
|defaultValue|T|是|-|查询不到环境变量key，则使用defaultValue作为默认值存入AppStorage中。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果key对应的属性在AppStorage中存在，则返回false。不存在则在AppStorage中用value作为默认值创建key对应的属性，返回true。 |

### static func keys()

```cangjie

public static func keys(): Array<String>
```

**功能：** 返回环境变量的属性key的集合。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|返回关联的系统项集合。|

## class LocalStorage

```cangjie
public class LocalStorage {

    public init()
}
```

**功能：** 页面级的UI状态存储。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init()

```cangjie

public init()
```

**功能：** 构造函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func `prop`\<T>(String)

```cangjie
public func `prop`<T>(propName: String): ?ObservedProperty<T>
```

**功能：** 如果给定的propName在LocalStorage中存在，则返回与LocalStorage中propName对应属性的单向绑定数据。如果LocalStorage中不存在propName，则返回None。单向绑定数据的修改不会被同步回LocalStorage中。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|LocalStorage中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|?ObservedProperty<T>|ObservedProperty\<T>的实例，和LocalStorage中propName对应属性的单向绑定的数据。如果LocalStorage中不存在对应的propName，则返回None。|

### func aboutToBeDeleted()

```cangjie

public func aboutToBeDeleted(): Bool
```

**功能：** 删除LocalStorage中所有的属性。删除所有属性的前提是已经没有任何订阅者。如果有订阅者，clear不会生效并返回false。如果没有订阅者则删除成功并返回true。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果LocalStorage中的属性已经没有任何订阅者，则删除成功，并返回true。否则返回false|

### func clear()

```cangjie

public func clear(): Bool
```

**功能：** 删除LocalStorage中所有的属性。删除所有属性的前提是已经没有任何订阅者。如果有订阅者，clear不会生效并返回false。如果没有订阅者则删除成功并返回true。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果LocalStorage中的属性已经没有任何订阅者，则删除成功，并返回true。否则返回false|

### func delete(String)

```cangjie

public func delete(propName: String): Bool
```

**功能：** 在LocalStorage中删除propName对应的属性。在LocalStorage中删除属性的前提是该属性已经没有订阅者，如果有订阅者，则返回false。如果没有订阅者则删除成功并返回true。

属性的订阅者为link等接口绑定的propName，以及@LocalStorageLink["propName"]和@LocalStorageProp["propName"]。如果自定义组件中使用@LocalStorageLink["propName"]和@LocalStorageProp["propName"]或者ObservedProperty实例（link接口的返回类型）依旧对propName有同步关系，则该属性不能从LocalStorage中删除。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|LocalStorage中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果LocalStorage中有对应的属性，且该属性已经没有订阅者，则删除成功，返回true。如果属性不存在，或者该属性还存在订阅者，则返回false。|

### func get\<T>(String)

```cangjie

public func get<T>(propName: String): ?T
```

**功能：** 获取propName在LocalStorage中对应的属性值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|LocalStorage中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|?T|LocalStorage中propName对应的属性值，如果不存在则返回None。|

### func has(String)

```cangjie

public func has(propName: String): Bool
```

**功能：** 判断propName对应的属性是否在LocalStorage中存在。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|LocalStorage中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果propName对应的属性在LocalStorage中存在，则返回true。不存在则返回false。|

### func keys()

```cangjie

public func keys(): EquatableCollection<String>
```

**功能：** 返回LocalStorage中所有的属性名。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|EquatableCollection<String>|LocalStorage中所有的属性名。|

### func link\<T>(String)

```cangjie

public func link<T>(propName: String): ?ObservedProperty<T>
```

**功能：** 如果给定的propName在LocalStorage实例中存在，则返回与LocalStorage中propName对应属性的双向绑定数据。

双向绑定数据的修改会被同步回LocalStorage中，LocalStorage会将变化同步到所有绑定该propName的数据和Component中。

如果LocalStorage中不存在propName，则返回None。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|LocalStorage中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|?ObservedProperty<T>| Option\<ObservedProperty\<T>>的实例，与LocalStorage中propName对应属性的双向绑定的数据，如果LocalStorage中不存在对应的propName，则返回None。|

### func set\<T>(String, T)

```cangjie

public func set<T>(propName: String, newValue: T): Bool
```

**功能：** 在LocalStorage中设置propName对应属性的值。如果newValue的值和propName对应属性的值相同，即不需要做赋值操作，状态变量不会通知UI刷新propName对应属性的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|LocalStorage中的属性名。|
|newValue|T|是|-|属性值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果LocalStorage中不存在propName对应的属性，返回false。设置成功返回true。|

### func setAndLink\<T>(String, T)

```cangjie

public func setAndLink<T>(propName: String, defaultValue: T): ObservedProperty<T>
```

**功能：** 与link接口类似，如果给定的propName在LocalStorage中存在，则返回该propName对应的属性的双向绑定数据。如果不存在，则使用defaultValue在LocalStorage中创建和初始化propName对应的属性，返回其双向绑定数据。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|LocalStorage中的属性名。|
|defaultValue|T|是|-|当propName在LocalStorage中不存在时，使用defaultValue在LocalStorage中初始化对应的propName。|

**返回值：**

|类型|说明|
|:----|:----|
|ObservedProperty<T>|ObservedProperty\<T>的实例，与LocalStorage中propName对应属性的双向绑定的数据。|

### func setAndProp\<T>(String, T)

```cangjie

public func setAndProp<T>(propName: String, defaultValue: T): ObservedProperty<T>
```

**功能：** 与prop接口类似。如果propName在LocalStorage中存在，则返回该propName对应的属性的单向绑定数据。如果不存在，则使用defaultValue在LocalStorage中创建和初始化propName对应的属性，返回其单向绑定数据。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|LocalStorage中的属性名。|
|defaultValue|T|是|-|当propName在LocalStorage中不存在时，使用defaultValue在LocalStorage中初始化对应的propName。|

**返回值：**

|类型|说明|
|:----|:----|
|ObservedProperty<T>|ObservedProperty\<T>的实例，和LocalStorage中propName对应属性的单向绑定的数据。|

### func setOrCreate\<T>(String, T)

```cangjie

public func setOrCreate<T>(propName: String, newValue: T): Bool
```

**功能：** 如果propName已经在LocalStorage中存在，并且newValue和propName对应属性的值不同，则设置propName对应属性的值为newValue，否则状态变量不会通知UI刷新propName对应属性的值。 如果propName不存在，则创建propName属性，值为newValue。setOrCreate只可以创建单个LocalStorage的键值对，如果想创建多个LocalStorage键值对，可以多次调用此方法。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|LocalStorage中的属性名。|
|newValue|T|是|-|属性值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果LocalStorage中存在propName，则更新其值为newValue，返回true。<br/>如果LocalStorage中不存在propName，则创建propName，并初始化其值为newValue，返回true。|

### func size()

```cangjie

public func size(): Int64
```

**功能：** 返回LocalStorage中的属性数量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|LocalStorage中属性的数量。|

## class PersistentStorage

```cangjie
public class PersistentStorage <: Observer {}
```

**功能：** 将key对应的属性从PersistentStorage中删除。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [Observer](./cj-state-rendering-componentstatemanagement.md#class-observer)

### static func deleteProp(String)

```cangjie

public static func deleteProp(key: String): Unit
```

**功能：**  将key对应的属性从PersistentStorage中删除。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|key|String|是|-|PersistentStorage中的属性名。|

### static func keys()

```cangjie

public static func keys(): Array<String>
```

**功能：** 返回所有持久化属性的属性名的集合。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|返回所有持久化属性的属性名的集合。|

### static func persistProp\<T>(String, T)

```cangjie

public static func persistProp<T>(key: String, defaultValue: T): Unit
```

**功能：** 将AppStorage中key对应的属性持久化到文件中。该接口的调用通常在访问AppStorage之前。

确定属性的类型和值的顺序如下：

1. 如果PersistentStorage文件中存在key对应的属性，在AppStorage中创建对应的propName，并用在PersistentStorage中找到的key的属性初始化。

2. 如果PersistentStorage文件中没有查询到key对应的属性，则在AppStorage中查找key对应的属性。如果找到key对应的属性，则将该属性持久化。

3. 如果AppStorage中也没查找到key对应的属性，则在AppStorage中创建key对应的属性。用defaultValue初始化其值，并将该属性持久化。

根据上述的初始化流程，如果AppStorage中有该属性，则会使用其值，覆盖掉PersistentStorage文件中的值。由于AppStorage是内存内数据，该行为会导致数据丧失持久化能力。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|key|String|是|-|属性名。|
|defaultValue|T|是|-|在PersistentStorage和AppStorage中未查询到时，则使用默认值进行初始化。|

### static func persistProps\<T>(Array\<(String,T)>)

```cangjie

public static func persistProps<T>(props: Array<(String, T)>): Unit
```

**功能：** 行为和persistProp类似，不同在于可以一次性持久化多个数据，适合在应用启动的时候初始化。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|props|Array\<(String,T)>|是|-|持久化数据数组，数组元素以元组(key, defaultValue)形式体现。|

### func aboutToBeDeleted()

```cangjie

public func aboutToBeDeleted(): Unit
```

**功能：** 取消SubscribedAbstractProperty实例对AppStorage/LocalStorage的单/双向同步关系，并无效化SubscribedAbstractProperty实例，即当调用aboutToBeDeleted方法之后不能再使用SubscribedAbstractProperty实例调用set或get方法。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func id()

```cangjie

public func id(): Int64
```

**功能：** 返回属性ID。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|属性ID|

### func notifyRead(String)

```cangjie

public func notifyRead(_: String): Unit
```

**功能：** 读取属性名称。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|_|String|是|-|属性名称|

### func onStateUpdate(String, ArrayList\<Int64>)

```cangjie

public func onStateUpdate(_: String, _: ArrayList<Int64>): Unit
```

**功能：** 更新状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|_|String|是|-|属性名称。|
|_|ArrayList\<Int64>|是|-|属性列表。|

## enum ColorMode

```cangjie
public enum ColorMode {
    | Light
    | Dark
    | ...
}
```

**功能：** 色彩模型类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Dark

```cangjie
Dark
```

**功能：** 深色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Light

```cangjie
Light
```

**功能：** 浅色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## enum LayoutDirection

```cangjie
public enum LayoutDirection {
    | Ltr
    | Rtl
    | Auto
    | ...
}
```

**功能：** 布局方向类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Auto

```cangjie
Auto
```

**功能：** 跟随系统。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Ltr

```cangjie
Ltr
```

**功能：** 从左到右。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Rtl

```cangjie
Rtl
```

**功能：** 从右到左。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21
