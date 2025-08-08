# Gesture Binding Methods

Supports binding different gesture events to various components and designing the response methods for these events. When gesture recognition succeeds, the ArkUI framework will notify components of the gesture recognition results through event callbacks.

## gesture (Standard Gesture Binding Method)

```cangjie
.gesture(gesture: GestureType, mask: GestureMask)
```

`gesture` is a universal method for binding gestures to corresponding components.

## priorityGesture (Priority Gesture Binding Method)

```cangjie
.priorityGesture(gesture: GestureType, mask: GestureMask)
```

`priorityGesture` is a gesture binding method with priority, allowing binding gestures that should be recognized first on components.

By default, when both parent and child components use `gesture` to bind the same type of gesture, the child component's `gesture`-bound gesture takes precedence. When the parent component uses `priorityGesture` to bind the same type of gesture as the child component, the parent component's `priorityGesture`-bound gesture takes precedence.

For long-press gestures, the component with the shorter minimum trigger time will respond first, ignoring `priorityGesture` settings.

## parallelGesture (Parallel Gesture Binding Method)

```cangjie
.parallelGesture(gesture: GestureType, mask: GestureMask)
```

`parallelGesture` is a parallel gesture binding method that allows binding the same gesture to parent and child components for simultaneous response.

By default, gesture events are non-bubbling events. When parent and child components bind the same gesture, their gesture events compete, with only one component's gesture event being able to respond. When the parent component binds a parallel gesture (`parallelGesture`), both parent and child components can trigger the same gesture event, achieving a bubbling-like effect.