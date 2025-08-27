# StepperItem

用作[Stepper](cj-navigation-switching-stepper.md)组件的页面子组件。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

支持单个子组件。

## 创建组件

### init(() -> Unit)

```cangjie
public init(child: () -> Unit)
```

**功能：** 创建[Stepper](cj-navigation-switching-stepper.md)组件的页面子组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|child|()->Unit|是|-|StepperItem的子组件。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func nextLabel(String)

```cangjie
public func nextLabel(value: String): This
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|<font color="red" face="bold">please add description</font>|

### func prevLabel(String)

```cangjie
public func prevLabel(value: String): This
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|<font color="red" face="bold">please add description</font>|

### func status(ItemState)

```cangjie
public func status(status!: ItemState = ItemState.Normal): This
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|status|[ItemState](<font color="red" face="bold">please add link</font>)|否|ItemState.Normal|<font color="red" face="bold">please add description</font>|


## enum ItemState

```cangjie
public enum ItemState <: Equatable<ItemState> {
    | Normal
    | Disabled
    | Waiting
    | Skip
    | ...
}
```

**功能：** 项目状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ItemState>

### Disabled

```cangjie
Disabled
```

**功能：** 不可用状态，右侧文本按钮灰度显示，不可点击进入下一个StepperItem。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Normal

```cangjie
Normal
```

**功能：** 正常状态，右侧文本按钮正常显示，可点击进入下一个StepperItem。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Skip

```cangjie
Skip
```

**功能：** 跳过状态，右侧文本按钮默认显示"跳过"，此时可在Stepper的onSkip回调中自定义相关逻辑。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### Waiting

```cangjie
Waiting
```

**功能：** 等待状态，右侧文本按钮不显示，显示等待进度条，不可点击进入下一个StepperItem。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func !=(ItemState)

```cangjie
public operator func !=(other: ItemState): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ItemState](#enum-itemstate)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ItemState)

```cangjie
public operator func ==(other: ItemState): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ItemState](#enum-itemstate)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|
