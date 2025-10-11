# CheckboxGroup

多选框群组，用于控制多选框全选或者不全选状态。

## 导入模块

```cangjie
import kit.UIkit.*
```

## 子组件

无

## 创建组件

### init(String)

```cangjie
public init(group!: String = "")
```

**功能：** 创建多选框群组，可以控制群组内的Checkbox全选或者不全选，group值相同的Checkbox和CheckboxGroup为同一群组。

在结合带缓存组件使用时(如List)，未被创建的Checkbox选中状态需要应用手动控制。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|group|String|否|""| **命名参数。** 多选框的群组名称。<br/>**说明**：<br/>多个相同群组名称的CheckboxGroup，仅第一个CheckboxGroup生效。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func selectAll(Bool)

```cangjie
public func selectAll(value: Bool): This
```

**功能：** 设置是否全选。若同组的[Checkbox](./cj-button-picker-checkbox.md#checkbox)显式设置了select属性，则Checkbox的优先级高。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否全选。<br>初始值：false。<br>值为true时，多选框群组都被选中。值为false时，多选框群组都不被选中。|

### func selectedColor(ResourceColor)

```cangjie
public func selectedColor(value: ResourceColor): This
```

**功能：** 设置被选中或部分选中状态的颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|被选中或部分选中状态的颜色。<br/>初始值：<br/>@r(sys.color.ohos_id_color_text_primary_activated)。<br/>异常值按照默认值处理。|

## 组件事件

### func onChange(OnCheckboxGroupChangeCallback)

```cangjie
public func onChange(callback: OnCheckboxGroupChangeCallback): This
```

**功能：** CheckboxGroup的选中状态或群组内的Checkbox的选中状态发生变化时，触发回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|OnCheckboxGroupChangeCallback|是|-|多选框群组的信息。|

## 基础类型定义

### class CheckboxGroupResult

```cangjie
public class CheckboxGroupResult {
    public var status: SelectStatus
    public var name: Array<String>
    public init(
        status: SelectStatus,
        name: Array<String>
    )
}
```

**功能：** 多选框群组选中状态信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var name

```cangjie
public var name: Array<String>
```

**功能：** 群组内所有被选中的多选框名称。

**类型：** Array\<String>

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var status

```cangjie
public var status: SelectStatus
```

**功能：** 选中状态。

**类型：** [SelectStatus](#enum-selectstatus)

**读写能力：** 可读写

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init(SelectStatus, Array\<String>)

```cangjie
public init(
    status: SelectStatus,
    name: Array<String>
)
```

**功能：** 构造多选框群组选中状态信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|status|[SelectStatus](#enum-selectstatus)|是|-|选中状态。|
|name|Array\<String>|是|-|群组内所有被选中的多选框名称。|

### enum SelectStatus

```cangjie
public enum SelectStatus <: Equatable<SelectStatus> {
    | All
    | Part
    | None
    | ...
}
```

**功能：** 多选框选择状态类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SelectStatus>

#### All

```cangjie
All
```

**功能：** 群组多选择框全部选择。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### None

```cangjie
None
```

**功能：** 群组多选择框全部没有选择。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### Part

```cangjie
Part
```

**功能：** 群组多选择框部分选择。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func !=(SelectStatus)

```cangjie
public operator func !=(other: SelectStatus): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SelectStatus](#enum-selectstatus)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

#### func ==(SelectStatus)

```cangjie
public operator func ==(other: SelectStatus): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SelectStatus](#enum-selectstatus)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

#### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|枚举的值。|

## 示例代码

### 示例1（设置多选框群组）

该示例用于控制多选框全选或者不全选状态。

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.ArkUI.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

func loggerInfo(str: String) {
    Hilog.info(0, "CangjieTest", str)
}

func formatNames(names: Array<String>): String {
    var result = ""
    for(name in names) {
        result += name + ";"
    }
    result
}

@Entry
@Component
class EntryView {
    func build() {
        Column(){
            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                CheckboxGroup(group:"checkboxGroup")
                .size(width: 50.vp, height: 50.vp)
                .selectedColor(0xed6f21)
                .selectAll(false)
                .onChange { val =>
                    loggerInfo("checkboxGroup onChange names:" + formatNames(val.name))
                }

                Text("Select All").fontSize(50)
            }
            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                Checkbox(name: "checkbox1", group:"checkboxGroup")
                .size(width: 50.vp, height: 50.vp)

                Text("checkbox1").fontSize(50)
            }

            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                Checkbox(name: "checkbox2", group:"checkboxGroup")
                .size(width: 50.vp, height: 50.vp)

                Text("checkbox2").fontSize(50)
            }
        }
    }
}
```

![checkbox_group](figures/checkbox_group.gif)

### 示例2（自定义勾选样式）

该示例通过配置mark实现自定义多选框群组的勾选样式。

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.ArkUI.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

func loggerInfo(str: String) {
    Hilog.info(0, "CangjieTest", str)
}

func formatNames(names: Array<String>): String {
    var result = ""
    for(name in names) {
        result += name + ";"
    }
    result
}

@Entry
@Component
class EntryView {
    func build() {
        Column(){
            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                CheckboxGroup(group:"checkboxGroup1")
                .size(width: 50.vp, height: 50.vp)
                .selectedColor(0xed6f21)
                .selectAll(true)
                .onChange { val =>
                    loggerInfo("checkboxGroup1 onChange names:" + formatNames(val.name))
                }

                Text("Select All").fontSize(50)
            }
            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                Checkbox(name: "checkbox1", group:"checkboxGroup1")
                .size(width: 50.vp, height: 50.vp)

                Text("checkbox1").fontSize(50)
            }

            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                Checkbox(name: "checkbox2", group:"checkboxGroup1")
                .size(width: 50.vp, height: 50.vp)

                Text("checkbox2").fontSize(50)
            }

            Flex(justifyContent: FlexAlign.Start, alignItems: ItemAlign.Center) {
                Checkbox(name: "checkbox3", group:"checkboxGroup1")
                .size(width: 50.vp, height: 50.vp)

                Text("checkbox3").fontSize(50)
            }
        }
    }
}
```

![checkbox_group2](figures/checkbox_group2.gif)

