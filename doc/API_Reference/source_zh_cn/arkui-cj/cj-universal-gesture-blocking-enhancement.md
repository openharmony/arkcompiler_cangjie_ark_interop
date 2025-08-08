# 手势拦截增强

为组件提供手势拦截能力。开发者可根据需要，将系统内置手势和比其优先级高的手势做并行化处理，并可以动态控制手势事件的触发。

## func shouldBuiltInRecognizerParallelWith((GestureRecognizer, Array\<GestureRecognizer>) -> GestureRecognizer)

```cangjie
public func shouldBuiltInRecognizerParallelWith(callback: (GestureRecognizer, Array<GestureRecognizer>) -> GestureRecognizer): This
```

**功能：** 提供系统内置手势与响应链上其他组件的手势设置并行关系的回调事件，当该组件进行触摸碰撞测试时，会触发用户定义的回调来形成手势并行关系。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([GestureRecognizer](#class-gesturerecognizer),Array\<[GestureRecognizer](#class-gesturerecognizer)>)->[GestureRecognizer](#class-gesturerecognizer)|是|-|提供系统内置手势与响应链上其他组件的手势设置并行关系的回调事件，当该组件进行触摸碰撞测试时，会触发用户定义的回调来形成手势并行关系。<br>参数一：当前组件的系统内置手势识别器，当前版本只提供内置的[PAN_GESTURE](./cj-universal-gesture-judge.md#pan_gesture)类型的手势识别器。<br>参数二：响应链上更高优先级的其他组件相同类别的手势识别器。<br>返回值：与current识别器绑定并行关系的某个手势识别器。|

## func onGestureRecognizerJudgeBegin((BaseGestureEvent, GestureRecognizer, Array\<GestureRecognizer>) -> GestureJudgeResult, Bool)

```cangjie
public func onGestureRecognizerJudgeBegin(callback: (BaseGestureEvent, GestureRecognizer, Array<GestureRecognizer>) -> GestureJudgeResult, exposeInnerGesture: Bool): This
```

**功能：** 给组件绑定自定义手势识别器判定回调。

新增exposeInnerGesture参数作为是否将回调暴露给ArkUI系统组合组件的内置组件的标识，当该标识置为true时，将回调暴露给cangjie系统组合组件的内置组件。

对于不需要将回调暴露给cangjie系统组合组件内置组件的场景，建议采用原有[onGestureRecognizerJudgeBegin](#func-ongesturerecognizerjudgebeginbasegestureeventgesturerecognizerarraygesturerecognizer---gesturejudgeresult)接口。若要求将回调暴露给cangjie系统组合组件的内置组件，建议使用该接口并将exposeInnerGesture设置为true。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([BaseGestureEvent](./cj-universal-gesture-judge.md#class-basegestureevent),[GestureRecognizer](#class-gesturerecognizer),Array\<[GestureRecognizer](#class-gesturerecognizer)>)->[GestureJudgeResult](./cj-universal-gesture-judge.md#enum-gesturejudgeresult)|是|-|给组件绑定自定义手势识别器判定回调，当绑定到该组件的手势被接受时，会触发用户定义的回调来获取结果。<br>参数一：当前基础手势事件信息。<br>参数二：当前即将要响应的识别器对象。<br>参数三：响应链上的其他手势识别器对象。<br>返回值：手势是否裁决成功的判定结果。|
|exposeInnerGesture|Bool|是|-|暴露内部手势标识。<br>初始值：false。<br>**说明：**<br>如果是组合组件，此参数设置true，则会在current参数回调出组合组件内部的手势识别器。设置为false时，功能与原接口[onGestureRecognizerJudgeBegin](#func-ongesturerecognizerjudgebeginbasegestureeventgesturerecognizerarraygesturerecognizer---gesturejudgeresult)相同。|

## func onGestureRecognizerJudgeBegin((BaseGestureEvent, GestureRecognizer, Array\<GestureRecognizer>) -> GestureJudgeResult)

```cangjie
public func onGestureRecognizerJudgeBegin(callback: (BaseGestureEvent, GestureRecognizer, Array<GestureRecognizer>) -> GestureJudgeResult): This
```

**功能：** 给组件绑定自定义手势识别器判定回调。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([BaseGestureEvent](./cj-universal-gesture-judge.md#class-basegestureevent),[GestureRecognizer](#class-gesturerecognizer),Array\<[GestureRecognizer](#class-gesturerecognizer)>)->[GestureJudgeResult](./cj-universal-gesture-judge.md#enum-gesturejudgeresult)|是|-|给组件绑定自定义手势识别器判定回调，当绑定到该组件的手势被接受时，会触发用户定义的回调来获取结果。<br>参数一：当前基础手势事件信息。<br>参数二：当前即将要响应的识别器对象。<br>参数三：响应链上的其他手势识别器对象。<br>返回值：手势是否裁决成功的判定结果。|

## 基础类型定义

### class EventTargetInfo

```cangjie
public open class EventTargetInfo {}
```

**功能：** 手势识别器对应组件的信息。

**起始版本：** 20

#### func getId()

```cangjie
public func getId(): String
```

**功能：** 返回当前组件的组件标识。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**返回值：**

|类型|说明|
|:----|:----|
|String|当前组件的[组件标识](./cj-universal-attribute-componentid.md#组件标识)。|

### class GestureRecognizer

```cangjie
public open class GestureRecognizer {
    public init()
}
```

**功能：** 手势识别器对象。

**系统能力：**  SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

#### init()

```cangjie
public init()
```

**功能：** 构建一个手势识别器对象。

**起始版本：** 20

#### func getEventTargetInfo()

```cangjie
public func getEventTargetInfo(): EventTargetInfo
```

**功能：** 返回当前手势识别器对应组件的信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**返回值：**

|类型|说明|
|:----|:----|
|[EventTargetInfo](#class-eventtargetinfo)|当前手势识别器对应组件的信息。|

#### func getState()

```cangjie
public func getState(): GestureRecognizerState
```

**功能：** 返回当前手势识别器的状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**返回值：**

|类型|说明|
|:----|:----|
|[GestureRecognizerState](#enum-gesturerecognizerstate)|当前手势识别器的状态。|

#### func getTag()

```cangjie
public func getTag(): String
```

**功能：** 返回当前手势识别器的tag。

**系统能力：**  SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**返回值：**

|类型|说明|
|:----|:----|
|String|当前手势识别器的tag。|

#### func getType()

```cangjie
public func getType(): GestureTypes
```

**功能：** 返回当前手势识别器的类型。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**返回值：**

|类型|说明|
|:----|:----|
|[GestureTypes](./cj-universal-gesture-judge.md#enum-gesturetypes)|当前手势识别器的类型。|

#### func isBuiltIn()

```cangjie
public func isBuiltIn(): Bool
```

**功能：** 返回当前手势识别器是否为系统内置手势。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**返回值：**

|类型|说明|
|:----|:----|
|Bool|当前手势识别器是否为系统内置手势。true表示手势识别器为系统内置手势，false表示非系统内置手势。|

#### func isValid()

```cangjie
public func isValid(): Bool
```

**功能：** 返回当前手势识别器是否有效。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**返回值：**

|类型|说明|
|:----|:----|
|Bool|当前手势识别器是否有效。当该识别器绑定的组件被析构或者该识别器不在响应链上时返回false。|

#### func isEnabled()

```cangjie
public func isEnabled(): Bool
```

**功能：** 返回当前手势识别器的使能状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**返回值：**

|类型|说明|
|:----|:----|
|Bool|当前手势识别器的使能状态。true表示当前手势识别器能够回调应用事件，false表示当前手势识别器不回调应用事件。|

#### func setEnabled(Bool)

```cangjie
public func setEnabled(isEnabled: Bool): Unit
```

**功能：** 设置当前手势识别器的使能状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isEnabled|Bool|是|-|手势识别器的使能状态。true表示当前手势识别器能够回调应用事件，false表示当前手势识别器不回调应用事件。|

### class PanGestureRecognizer

```cangjie
public class PanGestureRecognizer <: GestureRecognizer {}
```

**功能：** 拖动手势识别器对象。

**起始版本：** 20

**父类型：**

- [GestureRecognizer](#class-gesturerecognizer)

#### func getPanGestureOptions()

```cangjie
public func getPanGestureOptions(): PanGestureOptions
```

**功能：** 返回当前滑动手势识别器的属性。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**返回值：**

|类型|说明|
|:----|:----|
|[PanGestureOptions](./cj-universal-gesture-pangesture.md#class-pangestureoptions)|当前拖动手势识别器的属性。|

### class ScrollableTargetInfo

```cangjie
public class ScrollableTargetInfo <: EventTargetInfo {}
```

**功能：** 手势识别器对应的滚动类容器组件的信息。

**起始版本：** 20

**父类型：**

- [EventTargetInfo](#class-eventtargetinfo)

#### func isBegin()

```cangjie
public func isBegin(): Bool
```

**功能：** 返回当前滚动类容器组件是否在顶部，如果为Swiper组件且在循环模式下返回false。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**返回值：**

|类型|说明|
|:----|:----|
|Bool|当前滚动类容器组件是否在顶部。true表示组件在顶部，false表示组件不在顶部。|

#### func isEnd()

```cangjie
public func isEnd(): Bool
```

**功能：** 返回当前滚动类容器组件是否在底部，如果为Swiper组件且在循环模式下返回false。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 20

**返回值：**

|类型|说明|
|:----|:----|
|Bool|当前滚动类容器组件是否在底部。true表示组件在底部，false表示组件不在底部。|

### enum GestureRecognizerState

```cangjie
public enum GestureRecognizerState {
    | Ready
    | Detecting
    | Pending
    | Blocked
    | Successful
    | Failed
}
```

**功能：** 定义手势识别器状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

#### Blocked

```cangjie
Blocked
```

**功能：** 阻塞状态。

#### Detecting

```cangjie
Detecting
```

**功能：** 检测状态。

#### Failed

```cangjie
Failed
```

**功能：** 失败状态。

#### Pending

```cangjie
Pending
```

**功能：** 等待状态。

#### Ready

```cangjie
Ready
```

**功能：** 准备状态。

#### Successful

```cangjie
Successful
```

**功能：** 成功状态。
