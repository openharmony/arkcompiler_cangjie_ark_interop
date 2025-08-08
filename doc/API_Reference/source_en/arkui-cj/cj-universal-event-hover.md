# Hover Event

Triggered when the cursor slides or a stylus hovers over a component while moving across the screen.

> **Note:**
>
> Currently supported triggers include external mice, styluses, and trackpads.

## func onHover((Bool) -> Unit)

```cangjie
public func onHover(callback: (Bool)->Unit): This
```

**Function:** Triggered when the mouse enters or exits the component.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 12

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | (Bool)->Unit | Yes | - | Callback function triggered when the mouse enters or exits the component.<br>Returns `true` when entering and `false` when exiting. |