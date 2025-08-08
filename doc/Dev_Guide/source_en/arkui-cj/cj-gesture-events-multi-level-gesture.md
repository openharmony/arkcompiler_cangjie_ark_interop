# Multi-level Gesture Events

Multi-level gesture events refer to scenarios where both parent and child components are nested and have gesture or event bindings. In such cases, the response to gestures or events is influenced by multiple factors, leading to propagation and competition between them, which may result in unexpected responses.

This chapter primarily introduces the default response sequence of multi-level gesture events and how to influence this sequence by setting relevant properties.

## Default Multi-level Gesture Events

### Touch Events

[Touch events](../../../API_Reference/source_en/arkui-cj/cj-universal-event-touch.md) (onTouch events) form the foundation of all gestures and consist of four types: Down, Move, Up, and Cancel. Gestures are composed of touch events. For example, a click is Down + Up, while a swipe is Down + a series of Moves + Up. Touch events have the following unique characteristics:

1. Components that listen to onTouch events will receive callbacks if they are touched when a finger lands, depending on the touch hotspot and touch control.

2. onTouch event callbacks are closed-loop. If a component receives a Down event for finger ID 0, it will subsequently receive Move and Up events for the same finger ID.

3. onTouch event callbacks are consistent. If a component receives a Down event for finger ID 0 but not for finger ID 1, it will only receive subsequent touch events for finger ID 0 and not for finger ID 1.

For general container components (e.g., Column), onTouch events can be triggered simultaneously between parent and child components, while sibling components trigger onTouch events based on layout.

```cangjie
ComponentA() {
    ComponentB().onTouch({ => })
    ComponentC().onTouch({ => })
}.onTouch({ => })
```

Components B and C are child components of Component A. When touching Component B or C, Component A is also touched. Since onTouch events allow multiple components to trigger simultaneously, touching Component B will trigger onTouch callbacks for Components A and B but not for Component C. Similarly, touching Component C will trigger onTouch callbacks for Components A and C but not for Component B.

Special container components like Stack have overlapping relationships between child components, which affects their layout. Thus, onTouch events can be triggered simultaneously between parent and child components, while sibling components may block each other.

```cangjie
Stack A() {
    ComponentB().onTouch({ => })
    ComponentC().onTouch({ => })
}.onTouch({ => })
```

Components B and C are child components of Stack A, with Component C overlapping Component B. When touching Component B or C, Stack A is also touched. Since onTouch events allow multiple components to trigger simultaneously, touching the overlapping area of Components B and C will trigger onTouch callbacks for Stack A and Component C but not for Component B (as Component B is blocked by Component C).

### Gestures and Events

All gestures and events other than touch events (onTouch events) are implemented using basic or combined gestures. For example, a drag event is a sequential gesture composed of a long press and a swipe gesture.

By default, only one gesture in a finger's gesture group will succeed and trigger its callback at any given time, unless explicitly declared to allow multiple gestures to succeed simultaneously.

The response priority follows these rules:

1. When parent and child components are bound to the same type of gesture, the child component takes precedence over the parent.

2. When a component is bound to multiple gestures, the gesture that meets its trigger condition first takes precedence.

```cangjie
ComponentA() {
    ComponentB().gesture(TapGesture(count: 1))
}.gesture(TapGesture(count: 1))
```

When both parent and child components are bound to a tap gesture, the child component has higher priority.

Thus, tapping Component B will trigger the TapGesture callback for Component B but not for Component A.

```cangjie
ComponentA()
.gesture(
    GestureGroup(
        GestureMode.Exclusive,
        [TapGesture(count: 1),
        PanGesture(distance: 5)]
    )
)
```

When Component A is bound to an exclusive gesture group composed of tap and swipe gestures, the gesture that meets its trigger condition first will trigger its callback.

If the user performs a tap, the tap callback is triggered. If the user swipes and the distance threshold is met, the swipe callback is triggered.

## Custom Control of Multi-level Gesture Events

Properties can be set to control the default competition flow of multi-level gesture events for better implementation.

Currently, the `responseRegion` and `hitTestBehavior` properties can control the distribution of touch events, thereby affecting onTouch events and gesture responses. Gesture binding methods can control gesture competition but do not affect onTouch events.

### Control via `responseRegion` and `responseRegionArray`

The `responseRegion` and `responseRegionArray` properties can modify a component's response area, which may extend beyond or be smaller than its layout area.

```cangjie
ComponentA() {
    ComponentB()
    .onTouch({ => })
    .gesture(TapGesture(count: 1))
    .responseRegionArray([Rect1, Rect2, Rect3])
}
.onTouch({ => })
.gesture(TapGesture(count: 1))
.responseRegion(Rect4)
```

After binding `responseRegion(Rect4)` to Component A, all touch events and gestures within Rect4 will trigger Component A's callbacks.

After binding `responseRegionArray([Rect1, Rect2, Rect3])` to Component B, all touch events and gestures within Rect1, Rect2, or Rect3 will trigger Component B's callbacks.

When `responseRegion` is bound, the response area for gestures and events will be the bound region, not the layout area, which may cause layout-related areas to not respond.

Additionally, `responseRegionArray` supports an array of Rects for more complex requirements.

### Control via `hitTestBehavior`

The `hitTestBehavior` property allows some components to respond to gestures and events while others do not in complex multi-level scenarios.

```cangjie
ComponentA() {
    ComponentB()
    .onTouch({ => })
    .gesture(TapGesture(count: 1))

    ComponentC() {
        ComponentD()
        .onTouch({ => })
        .gesture(TapGesture(count: 1))
    }
    .onTouch({ => })
    .gesture(TapGesture(count: 1))
    .hitTestBehavior(HitTestMode.Block)
}
.onTouch({ => })
.gesture(TapGesture(count: 1))
```

`HitTestMode.Block` responds to touch tests but blocks touch tests for child and sibling nodes, preventing their onTouch events and gestures from triggering.

Without `hitTestBehavior`, tapping Component D triggers onTouch events for Components A, C, and D, and Component D's tap gesture.

With `HitTestMode.Block`, tapping Component D triggers onTouch events for Components A and C but not D. Component D's tap gesture is blocked, so Component C's tap gesture triggers.

```cangjie
Stack A() {
    ComponentB()
    .onTouch({ => })
    .gesture(TapGesture(count: 1))

    ComponentC()
    .onTouch({ => })
    .gesture(TapGesture(count: 1))
    .hitTestBehavior(HitTestMode.Transparent)
}
.onTouch({ => })
.gesture(TapGesture(count: 1))
```

`HitTestMode.Transparent` responds to touch tests without blocking sibling nodes.

Without `hitTestBehavior`, tapping the overlapping area of Components B and C triggers onTouch events for Stack A and Component C, and Component C's tap gesture.

With `HitTestMode.Transparent`, tapping the overlapping area behaves similarly, but Component B also receives touch events, triggering its onTouch event and tap gesture.

```cangjie
ComponentA() {
    ComponentB()
    .onTouch({ => })
    .gesture(TapGesture(count: 1))
}
.onTouch({ => })
.gesture(TapGesture(count: 1))
.hitTestBehavior(HitTestMode.None)
```

`HitTestMode.None` does not respond to touch tests and does not block child or sibling nodes.

Without `hitTestBehavior`, tapping Component B triggers onTouch events for Components A and B, and Component B's tap gesture.

With `HitTestMode.None`, tapping Component B triggers Component B's onTouch event and tap gesture but not Component A's onTouch event.

For simple scenarios, bind `hitTestBehavior` to a single component. For complex scenarios, bind different `hitTestBehavior` values to multiple components to control touch event distribution.

### Control via Gesture Binding Methods

Gesture binding methods can influence response priority when parent and child components are bound to the same gesture.

When a parent uses `.gesture`, the child component takes precedence over the parent for the same gesture type.

```cangjie
ComponentA() {
    ComponentB()
    .gesture(TapGesture(count: 1))
}
.gesture(TapGesture(count: 1))
```

When both parent and child are bound to a tap gesture, the child takes precedence.

Tapping Component B triggers its tap gesture but not Component A's.

To give the parent higher priority, use `.priorityGesture`.

```cangjie
ComponentA() {
    ComponentB()
    .gesture(TapGesture(count: 1))
}
.priorityGesture(TapGesture(count: 1))
```

With `.priorityGesture`, the parent's gesture takes precedence.

Tapping Component B triggers Component A's tap gesture but not Component B's.

To allow both parent and child gestures to trigger, use `.parallelGesture`.

```cangjie
ComponentA() {
    ComponentB()
    .gesture(TapGesture(count: 1))
}
.parallelGesture(TapGesture(count: 1))
```

With `.parallelGesture`, both parent and child gestures can trigger.

Tapping Component B triggers tap gestures for both Components A and B.