# PersistentStorage：持久化存储UI状态

前两个小节介绍的LocalStorage和AppStorage都是运行时的内存，但是在应用退出再次启动后，依然能保存选定的结果，是应用开发中十分常见的现象，这就需要用到PersistentStorage。

PersistentStorage是应用程序中的可选单例对象。此对象的作用是持久化存储选定的AppStorage属性，以确保这些属性在应用程序重新启动时的值与应用程序关闭时的值相同。

PersistentStorage提供状态变量持久化的能力，但是需要注意，其持久化和读回UI的能力都需要依赖AppStorage。在阅读本文档前，建议提前阅读：[AppStorage](./cj-appstorage.md)，[PersistentStorage API文档](../../../../reference/source_zh_cn/arkui-cj/cj-state-rendering-appstatemanagement.md#class-persistentstorage)。

## 概述

PersistentStorage将选定的AppStorage属性保留在设备磁盘上。应用程序通过API，以决定哪些AppStorage属性应借助PersistentStorage持久化。UI和业务逻辑不直接访问PersistentStorage中的属性，所有属性访问都是对AppStorage的访问，AppStorage中的更改会自动同步到PersistentStorage。

PersistentStorage和AppStorage中的属性建立双向同步。应用开发通常通过AppStorage访问PersistentStorage，另外还有一些接口可以用于管理持久化属性，但是业务逻辑始终是通过AppStorage获取和设置属性的。

## 限制条件

PersistentStorage允许的类型和值有：

- Bool、String、整数，浮点，等简单类型。
- 可以被JSON.stringify()和JSON.parse()重构的对象，但是对象中的成员方法不支持持久化。

PersistentStorage不允许的类型和值有：

- 嵌套对象（对象数组，对象的属性是对象等）。因为目前框架无法检测AppStorage中嵌套对象（包括数组）值的变化，所以无法写回到PersistentStorage中。

持久化数据是一个相对缓慢的操作，应用程序应避免以下情况：

- 持久化大型数据集。
- 持久化经常变化的变量。

PersistentStorage的持久化变量最好是小于2kb的数据，不要大量的数据持久化，因为PersistentStorage写入磁盘的操作是同步的，大量的数据本地化读写会同步在UI线程中执行，影响UI渲染性能。如果开发者需要存储大量的数据，建议使用数据库api。

## 使用场景

### 从AppStorage中访问PersistentStorage初始化的属性

1.初始化PersistentStorage：

```cangjie
PersistentStorage.persistProp("aProp",47)
```

2.在AppStorage获取对应属性：

```cangjie
AppStorage.get<Int64>("aProp")
```

&nbsp;&nbsp;或在组件内部定义

```cangjie
@StorageLink["aProp"] var aProp : Int64 = 48
```

完整代码如下：

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    let temp = PersistentStorage.persistProp("aProp",47)
    @State var message : String = "Hello World"
    @StorageLink["aProp"] var aProp : Int64 = 48
    func build() {
        Row(){
            Column(){
                Text("${this.aProp}")
                    .onClick{
                        etv=> this.aProp += 1
                    }
            }
        }
    }
}
```

- 新应用安装后首次启动运行：
  a.调用persistProp初始化PersistentStorage，首先查询在PersistentStorage本地文件中是否存在"aProp"，查询结果为不存在，因为应用是第一次安装。
  b.接着查询属性"aProp"在AppStorage中是否存在，依旧不存在。
  c.在AppStorage中创建名为"aProp"的number类型属性，属性初始值是定义的默认值47。
  d.PersistentStorage将属性"aProp"和值47写入磁盘，AppStorage中"aProp"对应的值和其后续的更改将被持久化。
  e.在Index组件中创建状态变量@StorageLink("aProp") aProp，和AppStorage中"aProp"双向绑定，在创建的过程中会在AppStorage中查找，成功找到"aProp"，所以使用其在AppStorage找到的值47。

**图1**PersistProp初始化规则图示

![PersistProp](figures/PersistProp.png)

- 触发点击事件后：
  a.状态变量@StorageLink("aProp") aProp改变，触发Text组件重新刷新。
  b.@StorageLink装饰的变量是和AppStorage中建立双向同步的，所以@StorageLink("aProp") aProp的变化会被同步回AppStorage中。
  c.AppStorage中"aProp"属性的改变会同步到所有绑定该"aProp"的单向或者双向变量，在本示例中没有其他的绑定"aProp"的变量。
  d.因为"aProp"对应的属性已经被持久化，所以在AppStorage中"aProp"的改变会触发PersistentStorage，将新的改变写入本地磁盘。

- 后续启动应用：
  a.执行PersistentStorage.persistProp("aProp", 47)，首先在PersistentStorage本地文件查询"aProp"属性，成功查询到。
  b.将在PersistentStorage查询到的值写入AppStorage中。
  c.将在PersistentStorage查询到的值写入AppStorage中。

### 在PersistentStorage之前访问AppStorage中的属性

该示例为反例。在调用PersistentStorage.persistProp或者persistProps之前使用接口访问AppStorage中的属性是错误的，因为这样的调用顺序会丢失上一次应用程序运行中的属性值：

```cangjie
let aProp = AppStorage.setOrCreate("aProp", 47)
let temp = PersistentStorage.persistProp("aProp", 48)
```

应用在非首次运行时，先执行AppStorage.setOrCreate("aProp", 47)：属性"aProp"在AppStorage中创建，其类型为number，其值设置为指定的默认值47。"aProp"是持久化的属性，所以会被写回PersistentStorage磁盘中，PersistentStorage存储的上次退出应用的值丢失。

PersistentStorage.persistProp("aProp", 48)：在PersistentStorage中查找到"aProp"，值为刚刚使用AppStorage接口写入的47。

### 在PersistentStorage之后访问AppStorage中的属性

开发者可以先判断是否需要覆盖上一次保存在PersistentStorage中的值，如果需要覆盖，再调用AppStorage的接口进行修改，如果不需要覆盖，则不调用AppStorage的接口。

```cangjie
let temp = PersistentStorage.persistProp("aProp", 48)
if(AppStorage.get<Int64>("aProp").getOrThrow() > 50){
    AppStorage.setOrCreate("aProp", 47)
}
```

示例代码在读取PersistentStorage储存的数据后判断"aProp"的值是否大于50，如果大于50的话使用AppStorage的接口设置为47。
