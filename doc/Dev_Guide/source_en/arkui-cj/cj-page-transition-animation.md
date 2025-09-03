# Page Transition Animation (Not Recommended)

For better transition effects, it is recommended to use [Navigation Transition](./cj-navigation-transition.md) and [Modal Transition](./cj-modal-transition.md).

When transitioning between two pages where one page disappears and another appears, you can configure custom page transition parameters for each page. The [page transition](../../../API_Reference/source_zh_cn/arkui-cj/cj-animation-pagetransition.md) effect is defined in the `pageTransition` function, specifying the animation effects for page entry and exit through [PageTransitionEnter](../../../API_Reference/source_zh_cn/arkui-cj/cj-animation-pagetransition.md#class-pagetransitionenter) and [PageTransitionExit](../../../API_Reference/source_zh_cn/arkui-cj/cj-animation-pagetransition.md#class-pagetransitionexit).

The `pageTransition` function is as follows:

```cangjie
protected func pageTransition(): Unit {
    PageTransitionEnter()
    PageTransitionExit()
}
```

The interface for `PageTransitionEnter` is:

```cangjie
PageTransitionEnter(PageTransitionOptions(`type`: RouteType.None, duration: 1000))
```

The interface for `PageTransitionExit` is:

```cangjie
PageTransitionExit(PageTransitionOptions(`type`: RouteType.None, duration: 1000))
```

The above interfaces define the `PageTransitionEnter` and `PageTransitionExit` components, allowing different page transition effects through properties like `slide`, `translate`, `scale`, and `opacity`. For `PageTransitionEnter`, these effects represent the starting values during entry, while for `PageTransitionExit`, they represent the ending values during exit, similar to the `transition` configuration for component transitions. Additionally, `PageTransitionEnter` provides the `onEnter` callback for custom entry animations, and `PageTransitionExit` provides the `onExit` callback for custom exit animations.

The `type` parameter in these interfaces specifies the route type, which can be confusing. During a page transition, one page exits while another enters. For example:
- When navigating from Page A to Page B via `router.pushUrl`, Page A exits (exit animation) and Page B enters (entry animation).
- When returning from Page B to Page A via `router.back`, Page B exits (exit animation) and Page A enters (entry animation).

Thus, `PageTransitionEnter` can apply to either a new page entering (push, stack operation) or an existing page re-entering (back or pop, unstack operation). The `type` parameter helps distinguish between these scenarios, allowing developers to define all types of page transition effects.

## Configuring `type` as `RouteType.None`

Setting `type` to `RouteType.None` means the transition effect applies to both push and pop operations. The default value for `type` is `RouteType.None`.

```cangjie
// Page A
protected func pageTransition(): Unit {
    // Define entry effect: slide in from the left with a duration of 1200ms, effective for both push and pop operations
    PageTransitionEnter(PageTransitionOptions(`type`: RouteType.None, duration: 1200))
        .slide(SlideEffect.Left)
    // Define exit effect: slide out to the left with a duration of 1000ms, effective for both push and pop operations
    PageTransitionExit(PageTransitionOptions(`type`: RouteType.None, duration: 1000))
        .slide(SlideEffect.Left)
}
```

```cangjie
// Page B
protected func pageTransition(): Unit {
    // Define entry effect: slide in from the right with a duration of 1000ms, effective for both push and pop operations
    PageTransitionEnter(PageTransitionOptions(`type`: RouteType.None, duration: 1000))
        .slide(SlideEffect.Right)
    // Define exit effect: slide out to the right with a duration of 1200ms, effective for both push and pop operations
    PageTransitionExit(PageTransitionOptions(`type`: RouteType.None, duration: 1200))
        .slide(SlideEffect.Right)
}
```

Assuming the page navigation is configured for multi-instance mode (allowing duplicate pages in the stack), the four possible scenarios and their corresponding transition effects are as follows:

| Routing Operation | Page A Transition Effect | Page B Transition Effect |
|:---|:---|:---|
| `router.pushUrl` from Page A to new Page B | Page exits: `PageTransitionExit` takes effect, sliding out to the left | Page enters: `PageTransitionEnter` takes effect, sliding in from the right |
| `router.back` from Page B back to Page A | Page enters: `PageTransitionEnter` takes effect, sliding in from the left | Page exits: `PageTransitionExit` takes effect, sliding out to the right |
| `router.pushUrl` from Page B to new Page A | Page enters: `PageTransitionEnter` takes effect, sliding in from the left | Page exits: `PageTransitionExit` takes effect, sliding out to the right |
| `router.back` from Page A back to Page B | Page exits: `PageTransitionExit` takes effect, sliding out to the left | Page enters: `PageTransitionEnter` takes effect, sliding in from the right |

If you want pages entered via `pushUrl` to always slide in from the right and pages exited via `back` to always slide out to the right, the above table shows that scenarios 3 and 4 do not meet this requirement. In such cases, you need to define all four page transition effects explicitly.

## Configuring `type` as `RouteType.Push` or `RouteType.Pop`

Setting `type` to `RouteType.Push` means the effect applies only to push operations, while `RouteType.Pop` means it applies only to pop operations.

```cangjie
// Page A
protected func pageTransition(): Unit {
    // Define entry effect: slide in from the right with a duration of 1200ms, effective only for push operations
    PageTransitionEnter(PageTransitionOptions(`type`: RouteType.Push, duration: 1200))
        .slide(SlideEffect.Right)
    // Define entry effect: slide in from the left with a duration of 1200ms, effective only for pop operations
    PageTransitionEnter(PageTransitionOptions(`type`: RouteType.Pop, duration: 1200))
        .slide(SlideEffect.Left)
    // Define exit effect: slide out to the left with a duration of 1000ms, effective only for push operations
    PageTransitionExit(PageTransitionOptions(`type`: RouteType.Push, duration: 1000))
        .slide(SlideEffect.Left)
    // Define exit effect: slide out to the right with a duration of 1000ms, effective only for pop operations
    PageTransitionExit(PageTransitionOptions(`type`: RouteType.Pop, duration: 1000))
        .slide(SlideEffect.Right)
}
```

```cangjie
// Page B
protected func pageTransition(): Unit {
    // Define entry effect: slide in from the right with a duration of 1000ms, effective only for push operations
    PageTransitionEnter(PageTransitionOptions(`type`: RouteType.Push, duration: 1000))
        .slide(SlideEffect.Right)
    // Define entry effect: slide in from the left with a duration of 1000ms, effective only for pop operations
    PageTransitionEnter(PageTransitionOptions(`type`: RouteType.Pop, duration: 1000))
        .slide(SlideEffect.Left)
    // Define exit effect: slide out to the left with a duration of 1200ms, effective only for push operations
    PageTransitionExit(PageTransitionOptions(`type`: RouteType.Push, duration: 1200))
        .slide(SlideEffect.Left)
    // Define exit effect: slide out to the right with a duration of 1200ms, effective only for pop operations
    PageTransitionExit(PageTransitionOptions(`type`: RouteType.Pop, duration: 1200))
        .slide(SlideEffect.Right)
}
```

The above code defines all possible page transition styles explicitly. Assuming multi-instance mode is enabled, the four scenarios and their effects are as follows:

| Routing Operation | Page A Transition Effect | Page B Transition Effect |
|:---|:---|:---|
| `router.pushUrl` from Page A to new Page B | Page exits: `PageTransitionExit` with `RouteType.Push` takes effect, sliding out to the left | Page enters: `PageTransitionEnter` with `RouteType.Push` takes effect, sliding in from the right |
| `router.back` from Page B back to Page A | Page enters: `PageTransitionEnter` with `RouteType.Pop` takes effect, sliding in from the left | Page exits: `PageTransitionExit` with `RouteType.Pop` takes effect, sliding out to the right |
| `router.pushUrl` from Page B to new Page A | Page enters: `PageTransitionEnter` with `RouteType.Push` takes effect, sliding in from the right | Page exits: `PageTransitionExit` with `RouteType.Push` takes effect, sliding out to the left |
| `router.back` from Page A back to Page B | Page exits: `PageTransitionExit` with `RouteType.Pop` takes effect, sliding out to the right | Page enters: `PageTransitionEnter` with `RouteType.Pop` takes effect, sliding in from the left |

> **Note:**
>
> - Since each page's transition effects can be configured independently, and transitions involve two pages, developers should ensure smooth transitions between pages, such as maintaining consistent durations.
> - If no matching transition effect is defined, the system's default page transition effect will be used.

## Disabling Page Transition for a Page

Set the transition duration to 0 to disable page transition animations for a specific page.

```cangjie
protected func pageTransition(): Unit {
    PageTransitionEnter(PageTransitionOptions(`type`: RouteType.None, duration: 0))
    PageTransitionExit(PageTransitionOptions(`type`: RouteType.None, duration: 0))
}
```

## Example Scenario

Below is an example demonstrating all four page transition styles using the [router.pushUrl](../../../API_Reference/source_zh_cn/arkui-cj/cj-apis-router.md#static-func-pushurlstring-string-optionint32---unit) navigation capability.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
import ohos.router.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Image(@r(app.media.background))
                .width(90.percent).height(80.percent)
                .objectFit(ImageFit.Fill)
                .syncLoad(true) // Load image synchronously to ensure it's ready when the page appears
                .margin(30)

             Row(10){
                Button("pushUrl")
                  .onClick { evt =>
                    // Navigate to the next page (push operation)
                    Router.push(url: "Page1")
                  }
                Button("back")
                    .onClick { evt =>
                    // Return to the previous page (pop operation)
                    Router.back()
                  }
            }.justifyContent(FlexAlign.Center)
        }
        .width(100.percent).height(100.percent)
        .alignItems(HorizontalAlign.Center)
    }

    protected func pageTransition(): Unit {
        // Define entry effect: slide in from the right with a duration of 1000ms, effective only for push operations
        PageTransitionEnter(PageTransitionOptions(`type`: RouteType.Push, duration: 1000))
            .slide(SlideEffect.Right)
        // Define entry effect: slide in from the left with a duration of 1000ms, effective only for pop operations
        PageTransitionEnter(PageTransitionOptions(`type`: RouteType.Pop, duration: 1000))
            .slide(SlideEffect.Left)
        // Define exit effect: slide out to the left with a duration of 1000ms, effective only for push operations
        PageTransitionExit(PageTransitionOptions(`type`: RouteType.Push, duration: 1000))
            .slide(SlideEffect.Left)
        // Define exit effect: slide out to the right with a duration of 1000ms, effective only for pop operations
        PageTransitionExit(PageTransitionOptions(`type`: RouteType.Pop, duration: 1000))
            .slide(SlideEffect.Right)
    }
}
```

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
import ohos.router.*

@Entry
@Component
class Page1 {
    func build() {
        Column() {
            Image(@r(app.media.foreground))
                .width(90.percent).height(80.percent)
                .objectFit(ImageFit.Fill)
                .syncLoad(true) // Load image synchronously to ensure it's ready when the page appears
                .margin(30)

             Row(10){
                Button("pushUrl")
                  .onClick { evt =>
                    // Navigate to the next page (push operation)
                    Router.push(url: "EntryView")
                  }
                Button("back")
                    .onClick { evt =>
                    // Return to the previous page (pop operation)
                    Router.back()
                  }
            }.justifyContent(FlexAlign.Center)
        }
        .width(100.percent).height(100.percent)
        .alignItems(HorizontalAlign.Center)
    }

    protected func pageTransition(): Unit {
        // Define entry effect: slide in from the right with a duration of 1000ms, effective only for push operations
        PageTransitionEnter(PageTransitionOptions(`type`: RouteType.Push, duration: 1000))
            .slide(SlideEffect.Right)
        // Define entry effect: slide in from the left with a duration of 1000ms, effective only for pop operations
        PageTransitionEnter(PageTransitionOptions(`type`: RouteType.Pop, duration: 1000))
            .slide(SlideEffect.Left)
        // Define exit effect: slide out to the left with a duration of 1000ms, effective only for push operations
        PageTransitionExit(PageTransitionOptions(`type`: RouteType.Push, duration: 1000))
            .slide(SlideEffect.Left)
        // Define exit effect: slide out to the right with a duration of 1000ms, effective only for pop operations
        PageTransitionExit(PageTransitionOptions(`type`: RouteType.Pop, duration: 1000))
            .slide(SlideEffect.Right)
    }
}
```

![transiton-animation](figures/transition-animation1.gif)

Below is an example using `type: RouteType.None` for page transitions.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
import ohos.router.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Image(@r(app.media.background))
                .width(90.percent).height(80.percent)
                .objectFit(ImageFit.Fill)
                .syncLoad(true) // Load image synchronously to ensure it's ready when the page appears
                .margin(30)

             Row(10){
                Button("pushUrl")
                  .onClick { evt =>
                    // Navigate to the next page (push operation)
                    Router.push(url: "Page1")
                  }
                Button("back")
                    .onClick { evt =>
                    // Return to the previous page (pop operation)
                    Router.back()
                  }
            }.justifyContent(FlexAlign.Center)
        }
        .width(100.percent).height(100.percent)
        .alignItems(HorizontalAlign.Center)
    }

    protected func pageTransition(): Unit {
        // Define entry effect: slide in from the left with a duration of 1000ms, effective for both push and pop operations
        PageTransitionEnter(PageTransitionOptions(duration: 1000))
            .slide(SlideEffect.Left)
        // Define the exit effect of the page: translates 100vp in the x-direction and 100vp in the y-direction relative to the normal page position, with opacity changing to 0, duration of 1200ms. This effect applies whether the page stack undergoes push or pop operations.
        PageTransitionExit(PageTransitionOptions(duration: 1200))
            .translate(x: 100.0, y: 100.0)
            .opacity(0)
    }
}
```

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*
import ohos.router.*

@Entry
@Component
class Page1 {
    func build() {
        Column() {
            Image(@r(app.media.foreground))
                .width(90.percent).height(80.percent)
                .objectFit(ImageFit.Fill)
                .syncLoad(true) // Synchronously load the image to ensure it's fully loaded when the page appears
                .margin(30)

             Row(10){
                Button("pushUrl")
                  .onClick { evt =>
                    // Route to the next page via push operation
                    Router.push(url: "EntryView")
                  }
                Button("back")
                    .onClick { evt =>
                    // Return to the previous page, equivalent to a pop operation
                    Router.back()
                  }
            }.justifyContent(FlexAlign.Center)
        }
        .width(100.percent).height(100.percent)
        .alignItems(HorizontalAlign.Center)
    }

    protected func pageTransition(): Unit {
        // Define the page entry effect: slides in from the left with a duration of 1200ms. This effect applies whether the page stack undergoes push or pop operations.
        PageTransitionEnter(PageTransitionOptions(duration: 1200))
            .slide(SlideEffect.Left)
        // Define the page exit effect: translates 100vp in the x-direction and 100vp in the y-direction relative to the normal page position, with opacity changing to 0, duration of 1000ms. This effect applies whether the page stack undergoes push or pop operations.
        PageTransitionExit(PageTransitionOptions(duration: 1000))
            .translate(x: 100.0, y: 100.0)
            .opacity(0)
    }
}
```

![transiton-animation](figures/transition-animation2.gif)
