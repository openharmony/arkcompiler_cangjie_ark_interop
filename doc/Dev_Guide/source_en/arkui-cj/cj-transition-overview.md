# Overview of Transition Animation

Transition animation refers to animating components that are about to appear or disappear. For components that remain visible, [property animation](./cj-attribute-animation-overview.md) should be used instead. The primary purpose of transition animation is to free developers from the cumbersome management of disappearing nodes. If property animation is used for component transitions, developers would need to delete component nodes in the animation end callback. Additionally, since deleted component nodes might reappear before the animation completes, it is also necessary to add state checks for nodes in the end callback.

Transition animations are categorized into basic transitions and advanced templated transitions, including the following types:

- [Modal Transition](./cj-modal-transition.md): An animation where the new interface overlays the old one. The old interface does not disappear, and the new interface appears. For example, a dialog box is a typical modal transition animation.