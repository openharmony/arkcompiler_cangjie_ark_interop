# Modal Transition

Modal transition is a transition method where a new interface overlays the old one without the old interface disappearing.

**Table 1** Modal Transition Interfaces

| Interface                                       | Description                | Usage Scenarios                                     |
|:---------------------------------------- |:----------------- |:---------------------------------------- |
| [bindContentCover](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-bindcontentcover.md) | Displays a full-screen modal component.        | Used for custom full-screen modal interfaces. Combined with transition animations and shared element animations, it can achieve complex transition effects, such as clicking a thumbnail to view the full-size image. |
| [bindSheet](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-sheettransition.md#func-bindsheetbool----unit-sheetoptions) | Displays a semi-modal component.          | Used for semi-modal interfaces, such as share dialogs.                          |
| [bindMenu](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-menu.md#func-bindmenu---unit) | Displays a menu that pops up when the component is clicked.     | Scenarios requiring menu functionality, such as the "+" button in general applications.                 |
| [bindContextMenu](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-menu.md#func-bindcontextmenu---unit-responsetype) | Displays a menu that pops up on long press or right-click. | Long-press floating effect, typically used with drag-and-drop frameworks, such as long-pressing a desktop icon to make it float.             |
| [bindPopup](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-popup.md#func-bindpopupbool-custompopupoptions) | Displays a Popup dialog.        | Popup dialog scenarios, such as providing temporary explanations for a component upon clicking.               |
| if                                       | Adds or removes components via conditional rendering.      | Used to temporarily display an interface under certain conditions. The back navigation for this method requires developers to implement it by monitoring interfaces.  |