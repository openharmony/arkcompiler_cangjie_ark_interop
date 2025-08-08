# Gesture Interception Enhancement

Provides components with gesture interception capabilities. Developers can parallelize system-built gestures with higher-priority gestures as needed, and dynamically control the triggering of gesture events.

## func shouldBuiltInRecognizerParallelWith((GestureRecognizer, Array\<GestureRecognizer>) -> GestureRecognizer)

```cangjie
public func shouldBuiltInRecognizerParallelWith(callback: (GestureRecognizer, Array<GestureRecognizer>) -> GestureRecognizer): This
```

**Function:** Provides a callback event for setting parallel relationships between system-built gestures and gestures of other components in the response chain. When touch collision testing is performed on this component, the user-defined callback is triggered to establish gesture parallel relationships.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([GestureRecognizer](#class-gesturerecognizer), Array\<[GestureRecognizer](#class-gesturerecognizer)>)->[GestureRecognizer](#class-gesturerecognizer) | Yes | - | Callback event for setting parallel relationships between system-built gestures and gestures of other components in the response chain. When touch collision testing is performed on this component, the user-defined callback is triggered to establish gesture parallel relationships.<br>Parameter 1: The system-built gesture recognizer of the current component. The current version only provides built-in gesture recognizers of type [PAN_GESTURE](./cj-universal-gesture-judge.md#pan_gesture).<br>Parameter 2: Gesture recognizers of the same category from other components with higher priority in the response chain.<br>Return value: A gesture recognizer bound in parallel with the current recognizer. |

## func onGestureRecognizerJudgeBegin((BaseGestureEvent, GestureRecognizer, Array\<GestureRecognizer>) -> GestureJudgeResult, Bool)

```cangjie
public func onGestureRecognizerJudgeBegin(callback: (BaseGestureEvent, GestureRecognizer, Array<GestureRecognizer>) -> GestureJudgeResult, exposeInnerGesture: Bool): This
```

**Function:** Binds a custom gesture recognizer judgment callback to a component.

Adds the `exposeInnerGesture` parameter as an identifier for whether to expose the callback to the built-in components of ArkUI system composite components. When this identifier is set to `true`, the callback is exposed to the built-in components of the cangjie system composite components.

For scenarios where the callback does not need to be exposed to the built-in components of cangjie system composite components, it is recommended to use the original [onGestureRecognizerJudgeBegin](#func-ongesturerecognizerjudgebeginbasegestureeventgesturerecognizerarraygesturerecognizer---gesturejudgeresult) interface. If the callback needs to be exposed to the built-in components of cangjie system composite components, it is recommended to use this interface and set `exposeInnerGesture` to `true`.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([BaseGestureEvent](./cj-universal-gesture-judge.md#class-basegestureevent), [GestureRecognizer](#class-gesturerecognizer), Array\<[GestureRecognizer](#class-gesturerecognizer)>)->[GestureJudgeResult](./cj-universal-gesture-judge.md#enum-gesturejudgeresult) | Yes | - | Binds a custom gesture recognizer judgment callback to a component. When a gesture bound to this component is accepted, the user-defined callback is triggered to obtain the result.<br>Parameter 1: Current basic gesture event information.<br>Parameter 2: The recognizer object that is about to respond.<br>Parameter 3: Other gesture recognizer objects in the response chain.<br>Return value: The judgment result of whether the gesture is successfully adjudicated. |
| exposeInnerGesture | Bool | Yes | - | Identifier for exposing internal gestures.<br>Initial value: false.<br>**Description:**<br>For composite components, if this parameter is set to `true`, the callback will expose the internal gesture recognizers of the composite component in the `current` parameter. When set to `false`, the functionality is the same as the original interface [onGestureRecognizerJudgeBegin](#func-ongesturerecognizerjudgebeginbasegestureeventgesturerecognizerarraygesturerecognizer---gesturejudgeresult). |

## func onGestureRecognizerJudgeBegin((BaseGestureEvent, GestureRecognizer, Array\<GestureRecognizer>) -> GestureJudgeResult)

```cangjie
public func onGestureRecognizerJudgeBegin(callback: (BaseGestureEvent, GestureRecognizer, Array<GestureRecognizer>) -> GestureJudgeResult): This
```

**Function:** Binds a custom gesture recognizer judgment callback to a component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | ([BaseGestureEvent](./cj-universal-gesture-judge.md#class-basegestureevent), [GestureRecognizer](#class-gesturerecognizer), Array\<[GestureRecognizer](#class-gesturerecognizer)>)->[GestureJudgeResult](./cj-universal-gesture-judge.md#enum-gesturejudgeresult) | Yes | - | Binds a custom gesture recognizer judgment callback to a component. When a gesture bound to this component is accepted, the user-defined callback is triggered to obtain the result.<br>Parameter 1: Current basic gesture event information.<br>Parameter 2: The recognizer object that is about to respond.<br>Parameter 3: Other gesture recognizer objects in the response chain.<br>Return value: The judgment result of whether the gesture is successfully adjudicated. |

## Basic Type Definitions

### class EventTargetInfo

```cangjie
public open class EventTargetInfo {}
```

**Function:** Information about the component corresponding to the gesture recognizer.

**Initial Version:** 20

#### func getId()

```cangjie
public func getId(): String
```

**Function:** Returns the component identifier of the current component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Return Value:**

| Type | Description |
|:----|:----|
| String | The [component identifier](./cj-universal-attribute-componentid.md#component-identifier) of the current component. |

### class GestureRecognizer

```cangjie
public open class GestureRecognizer {
    public init()
}
```

**Function:** Gesture recognizer object.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

#### init()

```cangjie
public init()
```

**Function:** Constructs a gesture recognizer object.

**Initial Version:** 20

#### func getEventTargetInfo()

```cangjie
public func getEventTargetInfo(): EventTargetInfo
```

**Function:** Returns information about the component corresponding to the current gesture recognizer.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Return Value:**

| Type | Description |
|:----|:----|
| [EventTargetInfo](#class-eventtargetinfo) | Information about the component corresponding to the current gesture recognizer. |

#### func getState()

```cangjie
public func getState(): GestureRecognizerState
```

**Function:** Returns the state of the current gesture recognizer.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Return Value:**

| Type | Description |
|:----|:----|
| [GestureRecognizerState](#enum-gesturerecognizerstate) | The state of the current gesture recognizer. |

#### func getTag()

```cangjie
public func getTag(): String
```

**Function:** Returns the tag of the current gesture recognizer.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Return Value:**

| Type | Description |
|:----|:----|
| String | The tag of the current gesture recognizer. |

#### func getType()

```cangjie
public func getType(): GestureTypes
```

**Function:** Returns the type of the current gesture recognizer.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Return Value:**

| Type | Description |
|:----|:----|
| [GestureTypes](./cj-universal-gesture-judge.md#enum-gesturetypes) | The type of the current gesture recognizer. |

#### func isBuiltIn()

```cangjie
public func isBuiltIn(): Bool
```

**Function:** Returns whether the current gesture recognizer is a system-built gesture.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the current gesture recognizer is a system-built gesture. `true` indicates the gesture recognizer is a system-built gesture, `false` indicates it is not. |

#### func isValid()

```cangjie
public func isValid(): Bool
```

**Function:** Returns whether the current gesture recognizer is valid.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the current gesture recognizer is valid. Returns `false` when the component bound to this recognizer is destructed or the recognizer is not in the response chain. |

#### func isEnabled()

```cangjie
public func isEnabled(): Bool
```

**Function:** Returns the enabled state of the current gesture recognizer.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | The enabled state of the current gesture recognizer. `true` indicates the current gesture recognizer can callback application events, `false` indicates it cannot. |

#### func setEnabled(Bool)

```cangjie
public func setEnabled(isEnabled: Bool): Unit
```

**Function:** Sets the enabled state of the current gesture recognizer.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| isEnabled | Bool | Yes | - | The enabled state of the gesture recognizer. `true` indicates the current gesture recognizer can callback application events, `false` indicates it cannot. |

### class PanGestureRecognizer

```cangjie
public class PanGestureRecognizer <: GestureRecognizer {}
```

**Function:** Pan gesture recognizer object.

**Initial Version:** 20

**Parent Type:**

- [GestureRecognizer](#class-gesturerecognizer)

#### func getPanGestureOptions()

```cangjie
public func getPanGestureOptions(): PanGestureOptions
```

**Function:** Returns the properties of the current pan gesture recognizer.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 20

**Return Value:**

| Type | Description |
|:----|:----|
| [PanGestureOptions](./cj-universal-gesture-pangesture.md#class-pangestureoptions) | The properties of the current pan gesture recognizer. |

### class ScrollableTargetInfo

```cangjie
public class ScrollableTargetInfo <: EventTargetInfo {}
```

**Function:** Information about the scrollable container component corresponding to the gesture recognizer.

**Initial Version:** 20**Parent Type:**

- [EventTargetInfo](#class-eventtargetinfo)

#### func isBegin()

```cangjie
public func isBegin(): Bool
```

**Function:** Returns whether the current scrollable container component is at the top. Returns false if it is a Swiper component in loop mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 20

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Indicates whether the current scrollable container component is at the top. true means the component is at the top, false means it is not.|

#### func isEnd()

```cangjie
public func isEnd(): Bool
```

**Function:** Returns whether the current scrollable container component is at the bottom. Returns false if it is a Swiper component in loop mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 20

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Indicates whether the current scrollable container component is at the bottom. true means the component is at the bottom, false means it is not.|

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

**Function:** Defines the states of a gesture recognizer.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

#### Blocked

```cangjie
Blocked
```

**Function:** Blocked state.

#### Detecting

```cangjie
Detecting
```

**Function:** Detecting state.

#### Failed

```cangjie
Failed
```

**Function:** Failed state.

#### Pending

```cangjie
Pending
```

**Function:** Pending state.

#### Ready

```cangjie
Ready
```

**Function:** Ready state.

#### Successful

```cangjie
Successful
```

**Function:** Successful state.