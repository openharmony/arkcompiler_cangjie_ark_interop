# Binding Half-Modal Page (bindSheet)

The [half-modal page (bindSheet)](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-sheettransition.md#func-bindsheetbool----unit-sheetoptions) is a non-full-screen popup-style interactive page in modal form by default, allowing partial visibility of the underlying parent view to help users retain their parent view context while interacting with the half-modal.

Half-modal pages are suitable for displaying simple tasks or information panels, such as personal information, text introductions, share panels, creating schedules, adding content, etc. If a half-modal page that may affect the parent view needs to be displayed, the half-modal supports configuration as a non-modal interactive form.

Half-modal pages exhibit different form capabilities on devices of varying widths. Developers with different form requirements for devices of different widths should refer to the ([preferType](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-sheettransition.md#class-sheetoptions)) attribute. The bindSheet can be used to construct half-modal transition effects, as detailed in [Modal Transition](./cj-modal-transition.md). For complex or lengthy user flows, consider alternative transition methods instead of half-modal, such as [Full-Modal Transition](./cj-contentcover-page.md).

## Usage Constraints

- If there are no scenarios requiring secondary confirmation or custom close behavior, it is not recommended to use the [shouldDismiss/onWilDismiss](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-sheettransition.md#class-sheetoptions) interface.

## Lifecycle

The half-modal page provides lifecycle functions to notify users of the popup's lifecycle status. The lifecycle triggers in the following order: onWillAppear -> onAppear -> onWillDisappear -> onDisappear.

| Name | Type | Description |
|:---|:---|:---|
| onWillAppear | () -> Unit | Callback function triggered before the half-modal page appears (before animation starts). |
| onAppear | () -> Unit | Callback function triggered after the half-modal page appears (after animation ends). |
| onWillDisappear | () -> Unit | Callback function triggered before the half-modal page retreats (before animation starts). |
| onDisappear | () -> Unit | Callback function triggered after the half-modal page retreats (after animation ends). |

## Using Nested Scroll Interaction

Operation priority when sliding in the content area of a half-modal panel:

1. Content is at the top (handled as this state when content is not scrollable)<br> When sliding up, prioritize expanding panel slots upward. If no slots can be expanded, scroll the content.<br> When sliding down, prioritize contracting panel slots downward. If no slots can be contracted, close the panel.

2. Content is in the middle position (can scroll up and down)<br> When sliding up/down, prioritize scrolling content until the page content reaches the bottom/top.

3. Content is at the bottom position (when content is scrollable)<br> When sliding up, present a rebound effect in the content area without switching slots.<br> When sliding down, scroll content until reaching the top.

The default nested mode for the above half-modal interaction is: {Forward: PARENT_FIRST, Backward: SELF_FIRST}

If developers wish to define scroll containers such as List or Scroll in the panel content's builder and combine them with the half-modal's interaction capabilities, they need to set nested scroll attributes for the scroll container in the vertical direction.

```cangjie
.nestedScroll(
    NestedScrollOptions(
        // Nested scroll option when the scrollable component scrolls toward the end (gesture up)
        NestedScrollMode.PARENT_FIRST,
        // Nested scroll option when the scrollable component scrolls toward the start (gesture down)
        NestedScrollMode.SELF_FIRST,
    )
)
```

## Secondary Confirmation Capability

It is recommended to use the onWillDismiss interface, which supports handling secondary confirmation or custom close behavior in the callback.

```cangjie
// Step 1: Declare the onWillDismiss callback
onWillDismiss: {
    // Step 2: Confirm secondary callback interaction capability, using AlertDialog here to prompt "Whether to close the half-modal"
    dismissSheetAction: DismissSheetAction => {
        AlertDialog.show(
            AlertDialogParamWithButtons(
                "text",
                title: 'Whether to close the half-modal',
                primaryButton: AlertDialogButtonOptions(
                    value: 'cancel',
                    action: {
                        => AppLog.info("Callback when the cancel button is clicked")
                    }
                ),
                secondaryButton: AlertDialogButtonOptions(
                    value: 'ok',
                    // Step 3: Confirm the logic for closing the half-modal, here as the AlertDialog's Button callback
                    action: {
                        => {
                            // Step 4: When the logic in Step 3 is triggered, call dismiss() to close the half-modal
                            dismissSheetAction.dismiss(),
                            AppLog.info("Callback when the ok button is clicked")
                        }
                    }
                ),
                cancel: {
                    => AppLog.info("AlertDialog Closed callbacks")
                }
            )
        )
    }
}
```

![page](figures/page.gif)

## Blocking Partial Close Behavior

Since the onWillDismiss interface is declared, all close behaviors of the half-modal require dismiss handling. Custom close logic can be processed using if statements or similar logic.

The following example shows the half-modal page closing only when sliding down.

```cangjie
onWillDismiss: {
    dismissSheetAction: DismissSheetAction => {
        if (dismissSheetAction.reason == DismissReason.SLIDE_DOWN) {
            DismissSheetAction.dismiss() // Register dismiss behavior
        }
    }
}
```

Similarly, a better sliding-down experience can be achieved by combining the onWillSpringBackWhenDismiss interface.

Analogous to onWillDismiss, after declaring onWillSpringBackWhenDismiss, the rebound operation during sliding down requires SpringBackAction.springBack() handling. Without this logic, there will be no rebound.

The specific code is as follows, where no rebound occurs when sliding down the half-modal.

```cangjie
onWillDismiss: {
    dismissSheetAction: DismissSheetAction => {
        if (dismissSheetAction.reason == DismissReason.SLIDE_DOWN) {
            dismissSheetAction.dismiss() // Register dismiss behavior
        }
    }
}

onWillSpringBackWhenDismiss: {
    springBackAction: SpringBackAction => {
        // No springBack is registered, so sliding down the half-modal page has no rebound behavior
    }
}
```