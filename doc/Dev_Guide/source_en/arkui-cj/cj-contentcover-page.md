# Binding Full-Screen Modal Page (bindContentCover)

[Full-screen modal page (bindContentCover)](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-bindcontentcover.md#func-bindcontentcoverboolunitcontentcoveroptions) is an interactive popup page in full-screen modal form that completely covers the underlying parent view. It is suitable for scenarios such as viewing large images or full-screen document review.

## Usage Constraints

The full-screen modal page is essentially a popup component, with its interaction level defaulting to the topmost layer within the application.

## Lifecycle

The full-screen modal page provides lifecycle functions to notify the application about the lifecycle state of the popup. The lifecycle triggers occur in the following sequence: onWillAppear -> onAppear -> onWillDisappear -> onDisappear.

| Name            | Type | Description                       |
| :----------------- | :------ | :---------------------------- |
| onWillAppear    | () -> Unit | Callback function when the full-screen modal page is about to appear (before animation starts). |
| onAppear    | () -> Unit | Callback function when the full-screen modal page has appeared (after animation ends).  |
| onWillDisappear | () -> Unit | Callback function when the full-screen modal page is about to disappear (before animation starts). |
| onDisappear |() -> Unit  | Callback function when the full-screen modal page has disappeared (after animation ends).     |

## Using bindContentCover to Build Full-Screen Modal Content Overlaying Half-Screen Modal

There exists a popup-style hierarchical interaction between full-screen and half-screen modals. A subsequently invoked modal page can overlay the previous modal page. If developers wish to achieve a full-screen transition that overlays a half-screen modal, while ensuring the half-screen modal remains visible after the full-screen page is dismissed via swipe, using bindSheet in combination with bindContentCover can fulfill this scenario requirement.

For details, refer to [Modal Transition](./cj-modal-transition.md#使用bindcontentcover构建全屏模态转场效果) to learn about using bindContentCover to build full-screen modal transition effects.