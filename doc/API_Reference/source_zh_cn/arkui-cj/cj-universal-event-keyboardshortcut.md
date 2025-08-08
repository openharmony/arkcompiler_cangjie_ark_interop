# 组件快捷键事件

开发者可以设置组件的自定义组合键，每个组件可以设置多个组合键。

即使组件未获焦或是在所在页面未展示，只要已经挂载到获焦窗口的组件树上就会响应自定义组合键。

开发者在设置组合键的同时可以设置自定义事件，组合键按下时，触发该自定义事件，若没有设置自定义事件，则组合键行为与click行为一致。

## func keyboardShortcut(String, Array\<ModifierKey>, () -> Unit)

```cangjie
public func keyboardShortcut(value: String, keys: Array<ModifierKey>, action: () -> Unit): This
```

**功能：** 设置组件的自定义组合键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|热键的单个字符（可以通过键盘输入的字符）。|
|keys|Array\<[ModifierKey](./cj-common-types.md#enum-modifierkey)>|是|-|热键组合。仅当value为FunctionKey的情况下可以为空。|
|action|() -> Unit|是|-|组合快捷键触发成功后的自定义事件回调。|

## func keyboardShortcut(FunctionKey, Array\<ModifierKey>, () -> Unit)

```cangjie
public func keyboardShortcut(value: FunctionKey, keys: Array<ModifierKey>, action: () -> Unit): This
```

**功能：** 设置组件的自定义组合键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[FunctionKey](./cj-common-types.md#enum-functionkey)|是|-|热键的FunctionKey。|
|keys|Array\<[ModifierKey](./cj-common-types.md#enum-modifierkey)>|是|-|热键组合。仅当value为FunctionKey的情况下可以为空。|
|action|() -> Unit|是|-|组合快捷键触发成功后的自定义事件回调。|

## func keyboardShortcut(String, Array\<ModifierKey>)

```cangjie
public func keyboardShortcut(value: String, keys: Array<ModifierKey>): This
```

**功能：** 设置组件的自定义组合键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|热键的单个字符（可以通过键盘输入的字符）。|
|keys|Array\<[ModifierKey](./cj-common-types.md#enum-modifierkey)>|是|-|热键组合。仅当value为FunctionKey的情况下可以为空。|

## func keyboardShortcut(FunctionKey, Array\<ModifierKey>)

```cangjie
public func keyboardShortcut(value: FunctionKey, keys: Array<ModifierKey>): This
```

**功能：** 设置组件的自定义组合键。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[FunctionKey](./cj-common-types.md#enum-functionkey)|是|-|热键的单个字符（可以通过键盘输入的字符）。|
|keys|Array\<[ModifierKey](./cj-common-types.md#enum-modifierkey)>|是|-|热键组合。|

## 快捷键使用注意事项

快捷键是对系统按键的响应，优先于普通的按键事件OnKeyEvent，按键事件触发的逻辑详见[按键事件](../../../Dev_Guide/source_zh_cn/arkui-cj/cj-common-events-device-input-event.md#按键事件)。

|场景|快捷键处理逻辑|示例|
|:---|:---|:---|
|所有支持onClick事件的组件|支持自定义组合键|无|
|自定义组合键要求|控制键Ctrl、Shift、Alt及它们的组合加上其它可输入字符按键|Button("button1").keyboardShortcut("a",\[ModifierKey.CTRL])|
|多个不同组件设置相同组合键|只响应结点树上的第一个组件，其它组件不响应快捷键。|Button("button1").keyboardShortcut("a",\[ModifierKey.CTRL])<br>Button("button2").keyboardShortcut("a",\[ModifierKey.CTRL])|
|无论组件是否获得焦点|只要窗口获焦快捷键就会响应|无|
|绑定单个快捷键时候，通过keyboardShortcut接口value值或者是keys值或两者都是空的情况下。<br>绑定多个快捷键的时候无法取消快捷键。|取消快捷键的设置|Button("button1").keyboardShortcut("",\[ModifierKey.CTRL])<br>Button("button2").keyboardShortcut("a",\[])<br>Button("button3").keyboardShortcut("",\[])|
|独立pipeline子窗口、主窗口共存的情况下|获焦的窗口响应快捷键|无|
|keyboardShortcut接口中的keys命令中ctrl、shift、alt|不区分左右键都响应|Button("button1").keyboardShortcut("a",\[ModifierKey.CTRL, ModifierKey.ALT])|
|keyboardShortcut接口中的value单个字符|不区分大小写都响应|Button("button1").keyboardShortcut("a",\[ModifierKey.CTRL])<br>Button("button2").keyboardShortcut("A",\[ModifierKey.CTRL])|
|快捷键的响应|所有快捷键down的状态下响应、且连续响应|无|
|隐藏组件|响应快捷键|无|
|disable状态组件|不响应快捷键|无|
|1\. 组件的组合键(包括系统预定义快捷键)相同时。<br>2\. 接口参数value有多个字符时。<br>3\. 接口参数keys有重复的控制键时。|这几种情况不绑定组合键, 先前绑定的组合键仍然有效|Button("button1").keyboardShortcut("c",\[ModifierKey.CTRL])<br>Button("button2").keyboardShortcut("ab",\[ModifierKey.CTRL])<br>Button("button3").keyboardShortcut("ab",\[ModifierKey.CTRL,ModifierKey.CTRL])|

## 禁止绑定的系统快捷键

以下组合键绑定为快捷键不生效。

- Alt + F4
- Alt + Shift + F4
- Alt + TAB
- Alt + Shift + TAB
- Ctrl + Shift + ESC

## 系统已存在的按键事件

已存在如下系统响应的按键事件，具体规格如下表。

表中的按键事件与自定义按键事件的触发有优先级关系，高优先级的事件会拦截低优先级事件，焦点事件响应优先级详见[按键事件](../../../Dev_Guide/source_zh_cn/arkui-cj/cj-common-events-device-input-event.md#按键事件)。

|快捷键|获焦组件|用途|事件处理类别|
|:---|:---|:---|:---|
|方向键、Shift + 方向键|输入框组件|移动光标|输入法|
|方向键、Shift + 方向键|通用组件|系统处于走焦状态时，用于方向走焦|系统按键|
|TAB、Shift + TAB|通用组件|触发进入走焦状态/走焦|系统按键|

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
  @State var message: String = 'disable'
  @State var shortCutEnable: Bool = false
  @State var keyValue: String = ''

  func build() {
    Row() {
      Column(5) {
        Text('Ctrl+A is ' + this.message)
        Button("Test short cut").onClick({event =>
          this.message = "I clicked Button"
          AppLog.info("I clicked")
        }).keyboardShortcut(this.keyValue, [ModifierKey.CTRL])
        Button(this.message + 'shortCut').onClick({event =>
          this.shortCutEnable = !this.shortCutEnable
          this.message = if(this.shortCutEnable)  {'enable'} else {'disable'}
          this.keyValue = if(this.shortCutEnable)  {'a'} else {''}
        })
        Button('multi-shortcut').onClick({event =>
          AppLog.info('Trigger keyboard shortcut success.')

        }).keyboardShortcut('q', [ModifierKey.CTRL])
          .keyboardShortcut('w', [ModifierKey.CTRL])
          .keyboardShortcut('', []) // 不生效，绑定了多个快捷键的组件不能取消快捷键
      }
      .width(100.percent)
    }
    .height(100.percent)
  }
}
```

![uni_events_keyboardshortcut](figures/uni_events_keyboardshortcut.png)
