# 组件标识

id为组件的唯一标识，在整个应用内唯一。本模块提供组件标识相关接口，可以获取指定id组件的属性，也提供向指定id组件发送事件的功能。

> **说明：**
>
> 若同一个组件设置了多个id或者key，最后设置的生效。

## func id(String)

```cangjie
public func id(value: String): This
```

**功能：** 组件的唯一标识，唯一性由使用者保证。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|组件的唯一标识，唯一性由使用者保证。|

## func key(String)

```cangjie
public func key(value: String): This
```

**功能：** 组件的唯一标识，唯一性由使用者保证。

此接口仅用于对应用的测试。与id同时使用时，后赋值的属性会覆盖先赋值的属性，建议仅设置id。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|String|是|-|组件的唯一标识，唯一性由使用者保证。|

## func getInspectorByKey(String)

```cangjie
public func getInspectorByKey(id: String): String
```

**功能：** 获取指定id的组件的所有属性，不包括子组件信息。此接口仅用于对应用的测试。由于耗时长，不建议使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :-------   | :---------- | :------- | :-------- | :----------|
| id   | String   | 是   |  - | 要获取属性的组件id。 |

**返回值：**

|类型|说明|
| :-------   | :---------- |
| String   | 组件属性列表的JSON字符串。<br>**说明：** <br>字符串信息包含组件的tag、id、位置信息(相对于窗口左上角的坐标)以及用于测试检查的组件所包含的相关属性信息。   |

## func getInspectorTree()

```cangjie
public func getInspectorTree(): String
```

**功能：** 获取组件树及组件属性。此接口仅用于对应用的测试。由于耗时长，不建议使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**返回值：**

|类型|说明|
| :-------   | :---------- |
| String  | 组件树及组件属性列表的JSON对象。 |

## func sendEventByKey(String, IntNative, String)

```cangjie
public func sendEventByKey(id: String, action: IntNative, params: String): Bool
```

**功能：** 给指定id的组件发送事件。此接口仅用于对应用的测试。由于耗时长，不建议使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :-------   | :---------- | :------- | :-------- | :----------|
| id     | String | 是    |  - | 要触发事件的组件的id。 |
| action | IntNative | 是  | - | 要触发的事件类型，目前支持取值：<br/>- 点击事件Click: 10。<br/>- 长按事件LongClick: 11。|
| params | String | 是    | - | 事件参数，无参数传空字符串 ""。|

**返回值：**

|类型|说明|
| :-------   | :---------- |
| Bool   | 找不到指定id的组件时返回false，其余情况返回true。 |

## func sendTouchEvent(TouchObject)

```cangjie
public func sendTouchEvent(event: TouchObject): Bool
```

**功能：** 发送触摸事件。此接口仅用于对应用的测试。由于耗时长，不建议使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :-------   | :---------- | :------- | :-------- | :----------|
| event | [TouchObject](./cj-universal-event-touch.md#class-touchobject) | 是   | - | 触发触摸事件的位置，event参数见[TouchEvent](./cj-universal-event-touch.md#class-touchevent)中TouchObject的介绍。 |

**返回值：**

|类型|说明|
| :-------   | :---------- |
| Bool | 事件发送失败时时返回false，其余情况返回true。|

## func sendKeyEvent(KeyEvent)

```cangjie
public func sendKeyEvent(event: KeyEvent): Bool
```

**功能：** 发送按键事件。此接口仅用于对应用的测试。由于耗时长，不建议使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :-------   | :---------- | :------- | :-------- | :----------|
| event | [KeyEvent](./cj-universal-event-key.md#class-keyevent) | 是    | - | 按键事件，event参数见[KeyEvent](./cj-universal-event-key.md#class-keyevent)介绍。 |

**返回值：**

|类型|说明|
| :-------   | :---------- |
| Bool | 事件发送失败时时返回false，其余情况返回true。|

## func sendMouseEvent(MouseEvent)

```cangjie
public func sendMouseEvent(event: MouseEvent): Bool
```

**功能：** 发送鼠标事件。此接口仅用于对应用的测试。由于耗时长，不建议使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 12

**参数：**

|名称|类型|必填|默认值|说明|
| :-------   | :---------- | :------- | :-------- | :----------|
| event | [MouseEvent](./cj-universal-event-mouse.md#class-mouseevent) | 是  | -  | 鼠标事件，event参数见[MouseEvent](./cj-universal-event-mouse.md#class-mouseevent)介绍。 |

**返回值：**

|类型|说明|
| :-------   | :---------- |
| Bool | 事件发送失败时时返回false，其余情况返回true。|

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

class Utils {
    static var rect_left: Float64 = 0.00f64
    static var rect_top: Float64 = 0.00f64
    static var rect_right: Float64 = 0.00f64
    static var rect_bottom: Float64 = 0.00f64
    static var rect_value: HashMap<String, Float64> = HashMap<String, Float64>()

    //获取组件所占矩形区域坐标
    static func getComponentRect(key: String): HashMap<String, Float64> {
        let strJson = getInspectorByKey(key)
        rect_value.add("rect_left", 4.0)
        rect_value.add("rect_top", 14.0)
        rect_value.add("rect_right", 4.0)
        rect_value.add("rect_bottom", 14.0)
        return Utils.rect_value
    }
}

@Entry
@Component
class EntryView {
    @State
    var text: String = ""

    func build() {
        Column {
            Flex(
                FlexParams(direction: FlexDirection.Column, alignItems: ItemAlign.Center,
                justifyContent: FlexAlign.Center)) {
                Button() {
                    Text("SendEventByKey to the 'button1'").fontSize(25).fontWeight(FontWeight.Bold)
                }.margin(top: 20).onClick(
                    {
                        _ =>
                        AppLog.info("SendEventByKey is clicked")
                        AppLog.info(getInspectorByKey("button1"))
                        AppLog.info(getInspectorTree())
                        sendEventByKey("button1", 10, "") // 向id为"button1"的组件发送点击事件
                    }
                )

                Button() {
                    Text("SendTouchEvent to the 'button2'").fontSize(25).fontWeight(FontWeight.Bold)
                }.margin(top: 20).onClick(
                    {
                        _ =>
                        AppLog.info("SendTouchEvent is clicked")
                        let rect = Utils.getComponentRect("button2") // 获取id为"button2"组件的矩形区域坐标
                        let left = rect.get("rect_left").getOrThrow()
                        let top = rect.get("rect_top").getOrThrow()
                        let right = rect.get("rect_right").getOrThrow()
                        let bottom = rect.get("rect_bottom").getOrThrow()
                        var touchPoint = TouchObject(
                            TouchType.Down,
                            1,
                            left + (right - left) / 2.0, // 相对于应用窗口左上角的水平方向坐标，API10已废弃，采用windowX替代
                            left + (right - left) / 2.0, // 相对于应用窗口左上角的垂直方向坐标，API10已废弃，采用windowY替代
                            left + (right - left) / 2.0, // 相对于组件左上角的水平方向坐标
                            top + (bottom - top) / 2.0, // 相对于组件左上角的垂直方向坐标
                        )
                        sendTouchEvent(touchPoint) // 发送触摸事件
                        touchPoint.touchType = TouchType.Up
                        sendTouchEvent(touchPoint) // 发送触摸事件
                    }
                )

                Button() {
                    Text("SendMouseEvent to the 'button3'").fontSize(25).fontWeight(FontWeight.Bold)
                }.margin(top: 20).onClick(
                    {
                        _ =>
                        let rect = Utils.getComponentRect("button3") // 获取id为"button3"组件的矩形区域坐标
                        let left = rect.get("rect_left").getOrThrow()
                        let top = rect.get("rect_top").getOrThrow()
                        let right = rect.get("rect_right").getOrThrow()
                        let bottom = rect.get("rect_bottom").getOrThrow()
                        var mouseEvent = MouseEvent(
                            1,
                            left + (right - left) / 2.0, // 相对于应用窗口左上角的水平方向坐标，API10已废弃，采用windowX替代
                            left + (right - left) / 2.0, // 相对于应用窗口左上角的垂直方向坐标，API10已废弃，采用windowY替代
                            left + (right - left) / 2.0, // 相对于组件左上角的水平方向坐标
                            top + (bottom - top) / 2.0, // 相对于组件左上角的垂直方向坐标
                            MouseButton.Left,
                            MouseAction.Press
                        )
                        sendMouseEvent(mouseEvent) // 发送鼠标事件
                    }
                )

                Button() {
                    Text("sendKeyEvent").fontSize(25).fontWeight(FontWeight.Bold)
                }.margin(top: 20).onClick(
                    {
                        _ =>
                        var keyEvent = KeyEvent(
                            "tab",
                            KeyType.Down,
                            2049,
                            KeySource.Keyboard,
                            0,
                            0,
                            0
                        )
                        sendKeyEvent(keyEvent) // 发送按键事件
                    }
                )

                Button() {
                    Text("button1").fontSize(25).fontWeight(FontWeight.Bold)
                }.margin(top: 20).backgroundColor(0x0D9FFB).onClick(
                    {
                        _ =>
                        AppLog.info("button1 clicked")
                        this.text = "button1 is clicked"
                    }
                ).id("button1")

                Button() {
                    Text("button2").fontSize(25).fontWeight(FontWeight.Bold)
                }.margin(top: 20).backgroundColor(0x0D9FFB).onClick(
                    {
                        _ =>
                        AppLog.info("button2 clicked")
                        this.text = "button2 is clicked"
                    }
                ).id("button2")

                Button() {
                    Text("button3").fontSize(25).fontWeight(FontWeight.Bold)
                }.margin(top: 20).backgroundColor(0x0D9FFB).onMouse(
                    {
                        _ =>
                        AppLog.info("button3 is clicked by the mouse")
                        this.text = "button3 is clicked by the mouse"
                    }
                ).id("button3")

                Text(this.text).fontSize(25).padding(15)
            }
        }
    }
}
```

![uni_component_id](figures/uni-componentid.jpg)
