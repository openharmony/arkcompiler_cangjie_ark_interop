# Single Gesture

## Tap Gesture (TapGesture)

```cangjie
TapGesture(count!: Int32 = 1, fingers!: Int32 = 1)
```

The tap gesture supports single and multiple taps, with two optional parameters:

- count: Specifies the number of consecutive taps required for recognition. Default is 1. Values less than 1 will be converted to the default. For multi-tap configurations, the timeout between lifting the previous tap and pressing the next is 300ms.

- fingers: Specifies the number of fingers required to trigger the tap. Minimum is 1, maximum is 10, default is 1. For multi-finger configurations, if sufficient fingers aren't pressed within 300ms of the first finger press, gesture recognition fails.

## Long Press Gesture (LongPressGesture)

```cangjie
LongPressGesture(fingers!: Int32 = 1, repeat!: Bool = false, duration!: Int32 = 500)
```

The long press gesture triggers long press events, with three optional parameters:

- fingers: Specifies the minimum number of fingers required. Range: 1-10, default is 1.

- repeat: Determines whether to continuously trigger event callbacks. Default is false.

- duration: Specifies the minimum press duration in milliseconds. Default is 500.

## Pan Gesture (PanGesture)

```cangjie
PanGesture(fingers!: Int32 = 1, direction!: PanDirection = PanDirection.All, distance!: Float64 = 5.0)
```

The pan gesture triggers pan events when the sliding distance reaches the minimum threshold (default 5vp). Three optional parameters:

- fingers: Specifies minimum finger count (1-10, default 1).

- direction: Specifies allowed pan directions (supports logical AND & and OR | operations). Default is PanDirection.All.

- distance: Specifies minimum recognition distance in px. Default is 5.

## Pinch Gesture (PinchGesture)

```cangjie
PinchGesture(fingers!: Int32 = 2, distance!: Float64 = 5.0)
```

The pinch gesture triggers pinch events, with two parameters:

- fingers: Specifies minimum finger count (2-5, default 2).

- distance: Specifies minimum pinch distance in vp. Default is 5.

## Rotation Gesture (RotationGesture)

```cangjie
RotationGesture(fingers!: Int32 = 2, angle!: Float64 = 1.0)
```

The rotation gesture triggers rotation events, with two parameters:

- fingers: Specifies minimum finger count (2-5, default 2).

- angle: Specifies minimum rotation angle in degrees. Default is 1.

## Swipe Gesture (SwipeGesture)

```cangjie
SwipeGesture(fingers!: Int32 = 1, direction!: SwipeDirection = SwipeDirection.All, speed!: Float64 = 100.0)
```

The swipe gesture triggers when swipe speed exceeds 100vp/s. Three parameters:

- fingers: Specifies minimum finger count (1-10, default 1).

- direction: Specifies allowed swipe directions (supports logical AND & and OR | operations). Default is SwipeDirection.All.

- speed: Specifies minimum recognition speed in vp/s. Default is 100.

> **Note:**
>
> When SwipeGesture and PanGesture are bound simultaneously with default or mutually exclusive configurations, they compete. SwipeGesture triggers at 100vp/s speed, while PanGesture triggers at 5vp distance - whichever condition is met first. Adjust parameters of both gestures to achieve different effects.