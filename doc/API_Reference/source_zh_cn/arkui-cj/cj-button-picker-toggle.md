# Toggle

组件提供勾选框样式、状态按钮样式及开关样式。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 子组件

仅当ToggleType为ButtonType时可包含子组件。

## 创建组件

### init(ToggleType, Bool)

```cangjie
public init(toggleType: ToggleType, isOn!: Bool = false)
```

**功能：** 创建一个Toggle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|toggleType|[ToggleType](#enum-toggletype)|是|-|开关类型。|
|isOn|Bool|否|false|**命名参数。** 开关是否打开。true：打开，false：关闭。|

### init(ToggleType, Bool, () -> Unit)

```cangjie
public init(toggleType: ToggleType, isOn: Bool, subcomponent: () -> Unit)
```

**功能：** 创建一个Toggle类型的对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|toggleType|[ToggleType](#enum-toggletype)|是|-|开关类型。|
|isOn|Bool|是|-|开关是否打开。true：打开，false：关闭。|
|subcomponent|()->Unit|是|-|声明子组件。|

## 通用属性/通用事件

通用属性：全部支持

通用事件：全部支持。

## 组件属性

### func selectedColor(ResourceColor)

```cangjie
public func selectedColor(value: ResourceColor): This
```

**功能：** 设置组件打开状态的背景颜色。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|设置组件打开状态的背景颜色。<br/>初始值: 当ToggleType为Switch时，初始值为@r(sys.color.ohos_id_color_component_activated)。<br/>当ToggleType为Checkbox时，初始值为@r(sys.color.ohos_id_color_component_activated)。<br/>当ToggleType为Button时，初始值为@r(sys.color.ohos_id_color_component_activated)混合@r(sys.color.ohos_id_color_text_highlight_bg)的透明度。|

### func switchPointColor(ResourceColor)

```cangjie
public func switchPointColor(color: ResourceColor): This
```

**功能：** 设置Switch类型的圆形滑块颜色。仅对type为ToggleType.Switch生效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|color|[ResourceColor](../apis/BasicServicesKit/cj-apis-base.md#interface-resourcecolor)|是|-|Switch类型的圆形滑块颜色。初始值：@r(sys.color.ohos_id_color_foreground_contrary)|

## 组件事件

### func onChange((Bool) -> Unit)

```cangjie
public func onChange(callback: (Bool) -> Unit): This
```

**功能：** 开关状态切换时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(Bool)->Unit|是|-|为true时，代表状态从关切换为开。false时，代表状态从开切换为关。|

## 基础类型定义

### enum ToggleType

```cangjie
public enum ToggleType <: Equatable<ToggleType> {
    | CheckboxType
    | SwitchType
    | ButtonType
    | ...
}
```

**功能：** 开关组件类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<ToggleType>

#### ButtonType

```cangjie
ButtonType
```

**功能：** 提供状态按钮样式，如果子组件有文本设置，则相应的文本内容会显示在按钮内部。
初始尺寸为：高为28.vp，宽无初始值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### CheckboxType

```cangjie
CheckboxType
```

**功能：** 提供单选框样式。
Checkbox默认样式为圆形。
通用属性margin的默认值为：top 14.px, right 14.px, bottom 14.px, left 14.px。
默认尺寸为：宽为20.vp, 高为20.vp。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### SwitchType

```cangjie
SwitchType
```

**功能：** 提供开关样式。
通用属性margin的默认值为：top 6.px, right 14.px, bottom 6.px, left 14.px。
默认尺寸为：宽为36.vp, 高为20.vp。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func !=(ToggleType)

```cangjie
public operator func !=(other: ToggleType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ToggleType](#enum-toggletype)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等时，返回true，否则返回false。|

#### func ==(ToggleType)

```cangjie
public operator func ==(other: ToggleType): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ToggleType](#enum-toggletype)|是|-|传入的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等时，返回true，否则返回false。|

## 示例代码

### 示例1（设置开关的样式）

该示例通过配置ToggleType设置Toggle的勾选框样式、状态按钮样式及开关样式。

<!-- run -->

```cangjie

package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.PerformanceAnalysisKit.Hilog

func loggerInfo(str: String) {
    Hilog.info(0, "CangjieTest", str)
}

@Entry
@Component
class EntryView {
    func build() {
        Column(space: 15) {
            Text("type: Switch")
            .fontSize(12)
            .fontColor(0xcccccc)
            .width(90.percent)
            Flex(justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center) {
                Toggle(ToggleType.Switch, isOn: false)
                .selectedColor(0xed6f21)
                .switchPointColor(0xe5ffffff)
                .onChange({isOn: Bool =>
                    loggerInfo("Component status: ${isOn}")
                })

                Toggle(ToggleType.Switch, isOn: true)
                .selectedColor(0x39a2db)
                .switchPointColor(0xe5ffffff)
                .onChange({isOn: Bool =>
                    loggerInfo("Component status: ${isOn}")
                })
            }

            Text("type: Checkbox")
            .fontSize(12)
            .fontColor(0xcccccc)
            .width(90.percent)
            Flex(justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center) {
                Toggle(ToggleType.Checkbox, isOn: false)
                .size(width: 28, height: 28)
                .selectedColor(0xed6f21)
                .onChange({isOn: Bool =>
                    loggerInfo("Component status: ${isOn}")
                })

                Toggle(ToggleType.Checkbox, isOn: true)
                .size(width: 28, height: 28)
                .selectedColor(0x39a2db)
                .onChange({isOn: Bool =>
                    loggerInfo("Component status: ${isOn}")
                })
            }

            Text("type: Button")
            .fontSize(12)
            .fontColor(0xcccccc)
            .width(90.percent)
            Flex(justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center) {
                Toggle(ToggleType.Button, false) {
                    Text("status")
                    .padding(left:12, right: 12)
                }
                .selectedColor(0xed6f21)
                .onChange({isOn: Bool =>
                    loggerInfo("Component status: ${isOn}")
                })

                Toggle(ToggleType.Button, true) {
                    Text("status")
                    .padding(left:12, right: 12)
                }
                .selectedColor(0x39a2db)
                .onChange({isOn: Bool =>
                    loggerInfo("Component status: ${isOn}")
                })
            }
        }
    }
}
```

