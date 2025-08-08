# Composite Gestures

Composite gestures are formed by combining multiple single gestures. By using different [GestureMode](../../../API_Reference/source_en/arkui-cj/cj-universal-gesture-groupgesture.md#enum-gesturemode) in GestureGroup, the type of composite gesture can be declared. Three types are supported: [Sequential Recognition](#sequential-recognition), [Parallel Recognition](#parallel-recognition), and [Exclusive Recognition](#exclusive-recognition).

```cangjie
GestureGroup(mode: GestureMode, gesture: Array<GestureType>)
```

- mode: An enumeration class of GestureMode. Used to declare the type of the composite gesture.

- gesture: An array composed of multiple gestures. Used to declare each gesture that forms the composite gesture.

## Sequential Recognition

The corresponding GestureMode for sequential recognition composite gestures is `Sequence`. Sequential recognition composite gestures recognize gestures in the order they are registered until all gestures are successfully recognized. If any gesture in the sequence fails to be recognized, all subsequent gestures will also fail. Only the last gesture in a sequential recognition gesture group can respond to `onActionEnd`.

> **Note:**
>
> The drag event is a typical example of a sequential recognition composite gesture, composed of a long-press gesture event and a swipe gesture event. The drag event is triggered only after a long-press meets the preset duration and is followed by a swipe. If the long-press duration is insufficient or no swipe occurs after the long-press, the drag event will fail to be recognized.

## Parallel Recognition

The corresponding GestureMode for parallel recognition composite gestures is `Parallel`. In parallel recognition composite gestures, all registered gestures are recognized simultaneously until all gestures complete their recognition. The recognition of gestures in a parallel recognition gesture group does not interfere with each other.

> **Note:**
>
> - When a parallel recognition composite gesture is formed by a single-tap gesture and a double-tap gesture, both gestures will be recognized simultaneously when a tap occurs within the region.
> - For a single tap, the single-tap gesture is recognized successfully, while the double-tap gesture fails.
> - For two taps, if the interval between them is within the specified time (default is 300 milliseconds), two single-tap events and one double-tap event will be triggered.
> - For two taps, if the interval exceeds the specified time, two single-tap events will be triggered, and no double-tap event will occur.

## Exclusive Recognition

The corresponding GestureMode for exclusive recognition composite gestures is `Exclusive`. In exclusive recognition composite gestures, all registered gestures are recognized simultaneously. If one gesture is recognized successfully, the gesture recognition process ends, and all other gestures fail to be recognized.

> **Note:**
>
> - When an exclusive recognition composite gesture is formed by a single-tap gesture and a double-tap gesture, both gestures will be recognized simultaneously when a tap occurs within the region.
> - For a single tap, the single-tap gesture is recognized successfully, while the double-tap gesture fails.
> - For two taps, the gesture response depends on the order of gesture binding. If the single-tap gesture is bound before the double-tap gesture, the single-tap gesture is recognized successfully upon the first tap, and the double-tap gesture fails. Even if a second tap occurs within the specified time, the double-tap event will not be triggered, and the single-tap event will be recognized successfully again. If the double-tap gesture is bound before the single-tap gesture, the double-tap event will be triggered, and the single-tap event will not be recognized.