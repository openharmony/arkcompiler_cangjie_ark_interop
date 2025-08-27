# ohos.router（页面路由）

本模块提供通过不同的url访问不同的页面，包括跳转到应用内的指定页面、同应用内的某个页面替换当前页面、返回上一页面或指定的页面等。

> **说明：**
>
> - 页面路由需要在页面渲染完成之后才能调用，在onInit和onReady生命周期中页面还处于渲染阶段，禁止调用页面路由方法。
> - ohos.router仅支持纯仓颉场景，不支持用于ArkTS与仓颉混合开发场景。
> - 此功能只支持在纯仓颉模式使用。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## class Router

```cangjie
public class Router {}
```

**功能：** 页面路由。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func back(String, String)

```cangjie
public static func back(url!: String, params!: String = "")
```

**功能：** 返回上一页面或指定的页面，会删除当前页面与指定页面之间的所有页面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|url|String|是|-|**命名参数。** 表示目标页面的url。|
|params|String|否|""|**命名参数。** 页面返回时携带的参数。|

### static func back()

```cangjie
public static func back()
```

**功能：** 返回上一页面或指定的页面，会删除当前页面与指定页面之间的所有页面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func back(Int32, String)

```cangjie
public static func back(index!: Int32, params!: String = "")
```

**功能：** 返回上一页面或指定的页面，会删除当前页面与指定页面之间的所有页面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int32|是|-|**命名参数。** 跳转目标页面的索引值。从栈底到栈顶，index从1开始递增。|
|params|String|否|""|**命名参数。** 页面返回时携带的参数。|

### static func getParams()

```cangjie
public static func getParams(): Option<String>
```

**功能：** 获取发起跳转的页面往当前页传入的参数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Option\<String>|发起跳转的页面往当前页传入的参数。|

### static func push(String, String)

```cangjie
public static func push(url!: String, params!: String = "")
```

**功能：** 跳转到应用内的指定页面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|url|String|是|-|**命名参数。** 表示目标页面的url。|
|params|String|否|""|**命名参数。** 表示路由跳转时要同时传递到目标页面的数据，切换到其他页面时，当前接收的数据失效。跳转到目标页面后，使用router.getParams()获取传递的参数，此外，在类web范式中，参数也可以在页面中直接使用，如this.keyValue(keyValue为跳转时params参数中的key值)，如果目标页面中已有该字段，则其值会被传入的字段值覆盖。<br>**说明：**<br>params参数不能传递方法和系统接口返回的对象（例如，媒体接口定义和返回的PixelMap对象）。建议开发者提取系统接口返回的对象中需要被传递的基础类型属性，自行构造String类型的Json对象进行传递。|

## class RouterState

```cangjie
public class RouterState {
    public var index: Int32
    public var name: String
    public var path: String
    public var params: String
    public init(
        index!: Int32,
        name!: String,
        path!: String,
        params!: String
    )
}
```

**功能：** 页面状态信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var index

```cangjie
public var index: Int32
```

**功能：** 表示当前页面在页面栈中的索引。从栈底到栈顶，index从1开始递增。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var name

```cangjie
public var name: String
```

**功能：** 表示当前页面的名称，即对应文件名。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var params

```cangjie
public var params: String
```

**功能：** 表示当前页面携带的参数。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### var path

```cangjie
public var path: String
```

**功能：** 表示当前页面的路径。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Int32, String, String, String)

```cangjie
public init(
    index!: Int32,
    name!: String,
    path!: String,
    params!: String
)
```

**功能：** 构造一个RouterState类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int32|是|-|**命名参数。** 表示当前页面在页面栈中的索引。从栈底到栈顶，index从1开始递增。|
|name|String|是|-|**命名参数。** 表示当前页面的名称，即对应文件名。|
|path|String|是|-|**命名参数。** 表示当前页面的路径。|
|params|String|是|-|**命名参数。** 表示当前页面携带的参数。|

## enum RouterMode

```cangjie
public enum RouterMode <: Equatable<RouterMode> {
    | Standard
    | Single
    | ...
}
```

**功能：** 路由跳转模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<RouterMode>

### Single

```cangjie
Single
```

**功能：** 单实例模式。如果目标页面的url已经存在于页面栈中，则该url页面移动到栈顶。如果目标页面的url在页面栈中不存在同url页面，则按照默认的多实例模式进行跳转。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Standard

```cangjie
Standard
```

**功能：** 多实例模式，也是默认情况下的跳转模式。目标页面会被添加到页面栈顶，无论栈中是否存在相同url的页面。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(RouterMode)

```cangjie
public operator func !=(other: RouterMode): Bool
```

**功能：** 对授权状态进行判不等。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[RouterMode](#enum-routermode)|是|-|授权状态。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果授权状态不同，返回true，否则返回false。|

### func ==(RouterMode)

```cangjie
public operator func ==(other: RouterMode): Bool
```

**功能：** 对授权状态进行判等。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[RouterMode](#enum-routermode)|是|-|授权状态。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果授权状态相同，返回true，否则返回false。|

## 示例代码

### 示例1（页面跳转）

该示例实现了页面间的跳转。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
import ohos.arkui.ui_context.*

@Entry
@Component
class EntryView {
    @State var active: Bool = false
    func build() {
        Column() {
            Image(@r(app.media.startIcon)).width(50).height(50).onClick {
                e => getUIContext().getRouter().pushUrl(url: "Page1")
            }.sharedTransition("sharedImage",
                options: SharedTransitionOptions(duration: 800, curve: Curve.Linear, delay: 100))
        }
    }
}
```

<!-- run -->

```cangjie
// page1.cj
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class Page1 {
    func build() {
        Column() {
            Text("This is Page1")
            Button("back()").onClick({
                evt => Router.back()
            })
        }
    }
}
```
