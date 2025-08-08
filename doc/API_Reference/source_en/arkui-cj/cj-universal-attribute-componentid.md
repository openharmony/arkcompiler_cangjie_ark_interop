# Component Identification

The `id` serves as the unique identifier for a component, which must be unique within the entire application. This module provides interfaces related to component identification, allowing retrieval of attributes for a specified component by its `id`, as well as the functionality to send events to a specified component by its `id`.

> **Note:**
>
> If multiple `id` or `key` values are set for the same component, the last one assigned will take effect.

## func id(String)

```cangjie
public func id(value: String): This
```

**Function:** The unique identifier of the component, with uniqueness guaranteed by the user.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | The unique identifier of the component, with uniqueness guaranteed by the user. |

## func key(String)

```cangjie
public func key(value: String): This
```

**Function:** The unique identifier of the component, with uniqueness guaranteed by the user.

This interface is intended solely for application testing. When used alongside `id`, the latter assigned property will override the former. It is recommended to only set `id`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| value | String | Yes | - | The unique identifier of the component, with uniqueness guaranteed by the user. |

## func getInspectorByKey(String)

```cangjie
public func getInspectorByKey(id: String): String
```

**Function:** Retrieves all attributes of the component with the specified `id`, excluding child component information. This interface is intended solely for application testing. Due to its time-consuming nature, its use is not recommended.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :------- | :---------- | :------- | :-------- | :---------- |
| id | String | Yes | - | The `id` of the component whose attributes are to be retrieved. |

**Return Value:**

| Type | Description |
| :------- | :---------- |
| String | A JSON string containing the component's attribute list.<br>**Note:** <br>The string includes the component's `tag`, `id`, position information (coordinates relative to the top-left corner of the window), and relevant attribute information for testing purposes. |

## func getInspectorTree()

```cangjie
public func getInspectorTree(): String
```

**Function:** Retrieves the component tree and component attributes. This interface is intended solely for application testing. Due to its time-consuming nature, its use is not recommended.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Return Value:**

| Type | Description |
| :------- | :---------- |
| String | A JSON object containing the component tree and component attribute list. |

## func sendEventByKey(String, IntNative, String)

```cangjie
public func sendEventByKey(id: String, action: IntNative, params: String): Bool
```

**Function:** Sends an event to the component with the specified `id`. This interface is intended solely for application testing. Due to its time-consuming nature, its use is not recommended.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :------- | :---------- | :------- | :-------- | :---------- |
| id | String | Yes | - | The `id` of the component to which the event will be sent. |
| action | IntNative | Yes | - | The type of event to trigger. Currently supported values:<br/>- Click event: 10.<br/>- LongClick event: 11. |
| params | String | Yes | - | Event parameters. Pass an empty string `""` if no parameters are required. |

**Return Value:**

| Type | Description |
| :------- | :---------- |
| Bool | Returns `false` if the specified `id` is not found; otherwise, returns `true`. |

## func sendTouchEvent(TouchObject)

```cangjie
public func sendTouchEvent(event: TouchObject): Bool
```

**Function:** Sends a touch event. This interface is intended solely for application testing. Due to its time-consuming nature, its use is not recommended.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :------- | :---------- | :------- | :-------- | :---------- |
| event | [TouchObject](./cj-universal-event-touch.md#class-touchobject) | Yes | - | The position where the touch event is triggered. For details on the `event` parameter, refer to the introduction of [TouchObject](./cj-universal-event-touch.md#class-touchobject) in [TouchEvent](./cj-universal-event-touch.md#class-touchevent). |

**Return Value:**

| Type | Description |
| :------- | :---------- |
| Bool | Returns `false` if the event fails to send; otherwise, returns `true`. |

## func sendKeyEvent(KeyEvent)

```cangjie
public func sendKeyEvent(event: KeyEvent): Bool
```

**Function:** Sends a key event. This interface is intended solely for application testing. Due to its time-consuming nature, its use is not recommended.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :------- | :---------- | :------- | :-------- | :---------- |
| event | [KeyEvent](./cj-universal-event-key.md#class-keyevent) | Yes | - | The key event. For details on the `event` parameter, refer to the introduction of [KeyEvent](./cj-universal-event-key.md#class-keyevent). |

**Return Value:**

| Type | Description |
| :------- | :---------- |
| Bool | Returns `false` if the event fails to send; otherwise, returns `true`. |

## func sendMouseEvent(MouseEvent)

```cangjie
public func sendMouseEvent(event: MouseEvent): Bool
```

**Function:** Sends a mouse event. This interface is intended solely for application testing. Due to its time-consuming nature, its use is not recommended.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 12

**Parameters:**

| Name | Type | Required | Default Value | Description |
| :------- | :---------- | :------- | :-------- | :---------- |
| event | [MouseEvent](./cj-universal-event-mouse.md#class-mouseevent) | Yes | - | The mouse event. For details on the `event` parameter, refer to the introduction of [MouseEvent](./cj-universal-event-mouse.md#class-mouseevent). |

**Return Value:**

| Type | Description |
| :------- | :---------- |
| Bool | Returns `false` if the event fails to send; otherwise, returns `true`. |

## Example Code

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

    // Retrieves the rectangular coordinates occupied by the component
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
                        sendEventByKey("button1", 10, "") // Sends a click event to the component with id "button1"
                    }
                )

                Button() {
                    Text("SendTouchEvent to the 'button2'").fontSize(25).fontWeight(FontWeight.Bold)
                }.margin(top: 20).onClick(
                    {
                        _ =>
                        AppLog.info("SendTouchEvent is clicked")
                        let rect = Utils.getComponentRect("button2") // Retrieves the rectangular coordinates of the component with id "button2"
                        let left = rect.get("rect_left").getOrThrow()
                        let top = rect.get("rect_top").getOrThrow()
                        let right = rect.get("rect_right").getOrThrow()
                        let bottom = rect.get("rect_bottom").getOrThrow()
                        var touchPoint = TouchObject(
                            TouchType.Down,
                            1,
                            left + (right - left) / 2.0, // Horizontal coordinate relative to the top-left corner of the application window (deprecated in API10, replaced by windowX)
                            left + (right - left) / 2.0, // Vertical coordinate relative to the top-left corner of the application window (deprecated in API10, replaced by windowY)
                            left + (right - left) / 2.0, // Horizontal coordinate relative to the top-left corner of the component
                            top + (bottom - top) / 2.0, // Vertical coordinate relative to the top-left corner of the component
                        )
                        sendTouchEvent(touchPoint) // Sends a touch event
                        touchPoint.touchType = TouchType.Up
                        sendTouchEvent(touchPoint) // Sends a touch event
                    }
                )

                Button() {
                    Text("SendMouseEvent to the 'button3'").fontSize(25).fontWeight(FontWeight.Bold)
                }.margin(top: 20).onClick(
                    {
                        _ =>
                        let rect = Utils.getComponentRect("button3") // Retrieves the rectangular coordinates of the component with id "button3"
                        let left = rect.get("rect_left").getOrThrow()
                        let top = rect.get("rect_top").getOrThrow()
                        let right = rect.get("rect_right").getOrThrow()
                        let bottom = rect.get("rect_bottom").getOrThrow()
                        var mouseEvent = MouseEvent(
                            1,
                            left + (right - left) / 2.0, // Horizontal coordinate relative to the top-left corner of the application window (deprecated in API10, replaced by windowX)
                            left + (right - left) / 2.0, // Vertical coordinate relative to the top-left corner of the application window (deprecated in API10, replaced by windowY)
                            left + (right - left) / 2.0, // Horizontal coordinate relative to the top-left corner of the component
                            top + (bottom - top) / 2.0, // Vertical coordinate relative to the top-left corner of the component
                            MouseButton.Left,
                            MouseAction.Press
                        )
                        sendMouseEvent(mouseEvent) // Sends a mouse event
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
                        sendKeyEvent(keyEvent) // Send key event
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