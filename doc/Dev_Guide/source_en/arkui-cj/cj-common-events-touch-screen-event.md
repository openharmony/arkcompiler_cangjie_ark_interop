# Touch Events

Touch events refer to callback events triggered when a finger/stylus presses, slides, or lifts on a component. These include [Click Events](#click-events), [Drag Events](./cj-common-events-drag-event.md), and [Touch Events](#touch-events). The principle of touch events is illustrated below:

**Figure 1** Touch Event Principle

## Click Events

A click event occurs when a finger or stylus completes a full press-and-lift action. When a click event occurs, the following callback function is triggered:

```cangjie
func onClick(callback: (ClickEvent)->Unit): This
```

The `event` parameter provides the coordinate position of the click event relative to the window or component, as well as the event source that triggered the click.

## Touch Events

When a finger or stylus touches a component, different event responses corresponding to various actions are triggered, including press (Down), slide (Move), and lift (Up) events:

```cangjie
public func onTouch(callback: (TouchEvent)->Unit): This
```

- `event.type` as `TouchType.Down`: Indicates a finger press.
  
- `event.type` as `TouchType.Up`: Indicates a finger lift.
  
- `event.type` as `TouchType.Move`: Indicates finger movement while pressed.
  
- `event.type` as `TouchType.Cancel`: Indicates interruption or cancellation of the current finger operation.

Touch events can be triggered simultaneously by multiple fingers. The `event` parameter provides information such as the triggering finger's position, unique identifier, currently changed finger, and input device source.