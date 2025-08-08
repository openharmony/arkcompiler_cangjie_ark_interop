# Overview of Interaction Events

Common events are categorized by their trigger types, including touchscreen events, keyboard/mouse events, focus events, and drag events.

- [Touchscreen Events](./cj-common-events-touch-screen-event.md): Single-finger or single-stylus operations on a touchscreen.

- [Keyboard/Mouse Events](./cj-common-events-device-input-event.md): Includes operation events from peripheral mice or trackpads and key events from peripheral keyboards.
    - Mouse events refer to events triggered by connecting and using peripheral mice/trackpads.
    - Key events refer to events triggered by connecting and using peripheral keyboards.

- [Focus Events](./cj-common-events-focus-event.md): The capability to control component focus through the above methods and the corresponding events.

- [Drag Events](./cj-common-events-drag-event.md): Initiated by touchscreen events and keyboard/mouse events, including long-press-and-drag operations with fingers/styluses and mouse drags.

- [Event Distribution](./cj-common-events-distribute.md): Describes the hit collection process of the response chain for touch-based events (excluding key and focus events).

Gesture events consist of gesture binding methods and bound gestures. Bound gestures can be divided into two types: single gestures and combined gestures, distinguished by their complexity levels.

- [Gesture Binding Methods](./cj-gesture-events-binding.md): Used to bind single gestures or combined gestures to components and declare the response priority of the bound gestures.

- [Single Gestures](./cj-gesture-events-single-gesture.md): The basic units of gestures, serving as building blocks for all complex gestures.

- [Combined Gestures](./cj-gesture-events-combined-gestures.md): Composed of multiple single gestures, which can be combined into combined gestures according to declared rules and used accordingly.