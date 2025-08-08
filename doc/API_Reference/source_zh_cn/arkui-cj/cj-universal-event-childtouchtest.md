# 自定义事件分发

在处理触屏事件时，会在触屏事件触发前进行按压点和组件区域的触摸测试，来收集需要响应触屏事件的组件，再基于触摸测试结果分发相应的触屏事件。在父节点，开发者可以通过onChildTouchTest决定如何让子节点去做触摸测试，影响子组件的触摸测试，最终影响后续的触屏事件分发，具体影响参考[TouchTestStrategy](#enum-touchteststrategy)枚举说明。

> **说明：**
>
> onClick、旋转、捏合手势经过自定义事件分发后可能会因为触摸热区没有命中导致事件不响应。

## func onChildTouchTest((Array\<TouchTestInfo>) -> TouchResult)

```cangjie
public func onChildTouchTest(callback: (Array<TouchTestInfo>) -> TouchResult): This
```

**功能：** 设置自定义子节点的触摸测试事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(Array\<[TouchTestInfo](#class-touchtestinfo)>)->[TouchResult](#class-touchresult)|是|-|回调函数，自定义子节点进行触摸测试时触发。<br/>参数：包含子节点信息的数组。<br/>返回值：自定义事件分发结果。|

## 基础类型定义

### class TouchTestInfo

```cangjie
public class TouchTestInfo {
    public let windowX: Float32
    public let windowY: Float32
    public let parentX: Float32
    public let parentY: Float32
    public let x: Float32
    public let y: Float32
    public let rect: RectResult
    public let id: String
    public init(windowX: Float32, windowY: Float32, parentX: Float32, parentY: Float32, x: Float32, y: Float32, rect: RectResult, id: String)
}
```

**功能：** 表示当前按压点所在组件的坐标系、id和尺寸相关信息的类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### let id

```cangjie
public let id: String
```

**功能：** 存放当前按压点所在组件的id。

**类型：** String

**读写能力：** 只读

**起始版本：** 19

#### let parentX

```cangjie
public let parentX: Float32
```

**功能：** 存放按压点相对于父组件左上角的横向坐标。

**类型：** Float32

**读写能力：** 只读

**起始版本：** 19

#### let parentY

```cangjie
public let parentY: Float32
```

**功能：** 存放按压点相对于父组件左上角的纵向坐标。

**类型：** Float32

**读写能力：** 只读

**起始版本：** 19

#### let rect

```cangjie
public let rect: RectResult
```

**功能：** 存放子组件的大小信息。

**类型：** [RectResult](./cj-common-types.md#class-rectresult)

**读写能力：** 只读

**起始版本：** 19

#### let windowX

```cangjie
public let windowX: Float32
```

**功能：** 存放按压点相对于窗口左上角的横向坐标。

**类型：** Float32

**读写能力：** 只读

**起始版本：** 19

#### let windowY

```cangjie
public let windowY: Float32
```

**功能：** 存放按压点相对于窗口左上角的纵向坐标。

**类型：** Float32

**读写能力：** 只读

**起始版本：** 19

#### let x

```cangjie
public let x: Float32
```

**功能：** 存放按压点相对于子组件的左上角的横向坐标。

**类型：** Float32

**读写能力：** 只读

**起始版本：** 19

#### let y

```cangjie
public let y: Float32
```

**功能：** 存放按压点相对于子组件的左上角的纵向坐标。

**类型：** Float32

**读写能力：** 只读

**起始版本：** 19

#### init(Float32, Float32, Float32, Float32, Float32, Float32, RectResult, String)

```cangjie
public init(windowX: Float32, windowY: Float32, parentX: Float32, parentY: Float32, x: Float32, y: Float32, rect: RectResult, id: String)
```

**功能：** 构建一个TouchTestInfo类型的对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|windowX|Float32|是|-|按压点相对于窗口左上角的x轴坐标。|
|windowY|Float32|是|-|按压点相对于窗口左上角的y轴坐标。|
|parentX|Float32|是|-|按压点相对于父组件左上角的x轴坐标。|
|parentY|Float32|是|-|按压点相对于父组件左上角的y轴坐标。|
|x|Float32|是|-|按压点相对于子组件左上角的x轴坐标。|
|y|Float32|是|-|按压点相对于子组件左上角的y轴坐标。|
|rect|[RectResult](./cj-common-types.md#class-rectresult)|是|-|子组件的大小。|
|id|String|是|-|通过id属性设置的组件id。|

### class TouchResult

```cangjie
public class TouchResult {
    public init(strategy: TouchTestStrategy, id!: String = "")
    public init(cTouchResult: CTouchResult)
}
```

**功能：** 自定义事件分发结果，开发者通过返回结果来影响事件分发。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### init(TouchTestStrategy, String)

```cangjie
public init(strategy: TouchTestStrategy, id!: String = "")
```

**功能：** 构建一个TouchResult对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|strategy|[TouchTestStrategy](#enum-touchteststrategy)|是|-|事件派发策略。|
|id|String|否|""| **命名参数。** 通过id属性设置的组件id。当strategy为TouchTestStrategy.DEFAULT时，id是可选的；当strategy是TouchTestStrategy.FORWARD_COMPETITION或TouchTestStrategy.FORWARD时，id是必需的（如果没有返回id，则当成TouchTestStrategy.DEFAULT处理）。|

#### init(CTouchResult)

```cangjie
public init(cTouchResult: CTouchResult)
```

**功能：** 构建一个TouchResult对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|cTouchResult|CTouchResult|是|-|自定义事件分发结果。|

### enum TouchTestStrategy

```cangjie
public enum TouchTestStrategy {
    | DEFAULT
    | FORWARD_COMPETITION
    | FORWARD
}
```

**功能：** 事件派发策略。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 19

#### DEFAULT

```cangjie
DEFAULT
```

**功能：** 自定义分发不产生影响，系统按当前节点命中状态分发事件。

**起始版本：** 19

#### FORWARD

```cangjie
FORWARD
```

**功能：** 应用指定分发事件到某个子节点，系统不再处理分发事件到其他兄弟节点。

**起始版本：** 19

#### FORWARD_COMPETITION

```cangjie
FORWARD_COMPETITION
```

**功能：** 应用指定分发事件到某个子节点，其他兄弟节点是否分发事件交由系统决定。

**起始版本：** 19

## 示例代码

### 示例1（设置事件派发策略为FORWARD_COMPETITION）

该示例点击List下方空白区域后拖动，可使List滑动。点击Button按钮时，Button会响应onClick事件。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class EntryView {
    @State var value: Int32 = 1
    @State var text: String = "Button"
    let numbers: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    func touchTestInfo(touchinfo: Array<TouchTestInfo>): TouchResult {
        let items = ArrayList<TouchTestInfo>()
        for (item in touchinfo) {
            if (item.id == 'MyList') {
                return TouchResult(TouchTestStrategy.FORWARD_COMPETITION, id: item.id)
            }
        }
        return TouchResult(TouchTestStrategy.DEFAULT, id: "")
    }

    func build() {
        Column {
            List(space: 10, initialIndex: 0) {
                ForEach(this.numbers, itemGeneratorFunc: { item: Int64, _: Int64 =>
                        ListItem() {
                            Text("${item}")
                                .width(100.percent)
                                .height(56)
                                .fontSize(16)
                                .textAlign(TextAlign.Start)
                        }
                        .backgroundColor(Color.WHITE)
                        .borderRadius(24)
                        .padding(left: 12, right: 12)
                    }
                )
            }
            .listDirection(Axis.Vertical)
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring)
            .onScrollIndex({first: Int32, last: Int32 =>
                AppLog.info("first: " + first.toString() + " last: " + last.toString())
            })
            .onDidScroll({scrollOffset: Float64, scrollState: ScrollState =>
                AppLog.info('onScroll scrollState = ScrollState.${scrollState.toString()}, scrollOffset = ${scrollOffset}')
            })
            .width(100.percent)
            .height(65.percent)
            .id("MyList")

            Button(this.text)
                .width(312)
                .height(40)
                .id("Mybutton")
                .margin(top: 80)
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .onClick({evt =>
                        this.text = "click the button"
                        PromptAction.showToast(message: "you click the button", duration: 3000)
                })
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xF1F3F5)
        .justifyContent(FlexAlign.End)
        .padding(left: 12, right: 12, bottom: 24)
        .onChildTouchTest(touchTestInfo)
    }
}
```

![childtouchtest](./figures/childrentouch-2.gif)

### 示例2（设置事件派发策略为FORWARD）

点击List下方空白区域后拖动，可以滑动List。点击Button按钮时，Button不会响应onClick事件。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class EntryView {
    @State var value: Int32 = 1
    @State var text: String = "Button"
    let numbers: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    func touchTestInfo(touchinfo: Array<TouchTestInfo>): TouchResult {
        let items = ArrayList<TouchTestInfo>()
        for (item in touchinfo) {
            if (item.id == 'MyList') {
                return TouchResult(TouchTestStrategy.FORWARD, id: item.id)
            }
        }
        return TouchResult(TouchTestStrategy.DEFAULT, id: "")
    }

    func build() {
        Column {
            List(space: 10, initialIndex: 0) {
                ForEach(this.numbers, itemGeneratorFunc: { item: Int64, _: Int64 =>
                        ListItem() {
                            Text("${item}")
                                .width(100.percent)
                                .height(56)
                                .fontSize(16)
                                .textAlign(TextAlign.Center)
                                .borderRadius(10)
                                .backgroundColor(0xFFFFFF)
                        }
                        .backgroundColor(Color.WHITE)
                        .borderRadius(24)
                        .padding(12)
                    }
                )
            }
            .scrollBar(BarState.Off)
            .width(80.percent)
            .onScrollIndex({first: Int32, last: Int32 =>
                AppLog.info("first: " + first.toString() + " last: " + last.toString())
            })
            .width(100.percent)
            .height(65.percent)
            .id("MyList")

            Button(this.text)
                .width(312)
                .height(40)
                .id("Mybutton")
                .onClick({evt =>
                        this.text = "click the button"
                        PromptAction.showToast(message: "you click the button", duration: 3000)
                })
        }
        .width(100.percent)
        .height(100.percent)
        .onChildTouchTest(touchTestInfo)
    }
}
```

![touch_event](figures/onChildTouchTest.gif)

### 示例3（设置事件派发策略为DEFAULT）

点击List下方空白区域后拖动，List不会滑动。点击Button按钮时，Button会响应onClick事件。

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.UIKit.*
import ohos.state_macro_manage.*
import std.collection.{ArrayList, HashMap}

@Entry
@Component
class EntryView {
    @State var value: Int32 = 1
    @State var text: String = "Button"
    let numbers: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
    func touchTestInfo(touchinfo: Array<TouchTestInfo>): TouchResult {
        return TouchResult(TouchTestStrategy.DEFAULT, id: "")
    }

    func build() {
        Column {
            List(space: 10, initialIndex: 0) {
                ForEach(this.numbers, itemGeneratorFunc: { item: Int64, _: Int64 =>
                        ListItem() {
                            Text("${item}")
                                .width(100.percent)
                                .height(56)
                                .fontSize(16)
                                .textAlign(TextAlign.Start)
                        }
                        .backgroundColor(Color.WHITE)
                        .borderRadius(24)
                        .padding(left: 12, right: 12)
                    }
                )
            }
            .listDirection(Axis.Vertical)
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring)
            .onScrollIndex({first: Int32, last: Int32 =>
                AppLog.info("first: " + first.toString() + " last: " + last.toString())
            })
           .onDidScroll({scrollOffset: Float64, scrollState: ScrollState =>
                AppLog.info('onScroll scrollState = ScrollState.${scrollState.toString()}, scrollOffset = ${scrollOffset}')
            })
            .width(100.percent)
            .height(65.percent)
            .id("MyList")

            Button(this.text)
                .width(312)
                .height(40)
                .id("Mybutton")
                .margin(top: 80)
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
                .onClick({evt =>
                        this.text = "click the button"
                        PromptAction.showToast(message: "you click the button", duration: 3000)
                })
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xF1F3F5)
        .justifyContent(FlexAlign.End)
        .padding(left: 12, right: 12, bottom: 24)
        .onChildTouchTest(touchTestInfo)
    }
}
```

![childrentouch](./figures/childrentouch-3.gif)
