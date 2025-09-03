# Navigation Component (Recommended)

The Navigation component is primarily used to implement page-to-page navigation and intra-component page transitions. It supports passing parameters between different components during navigation and provides flexible stack operations, enabling more convenient access and reuse of various pages. This document will provide a detailed introduction to the Navigation component from several aspects, including routing operations, subpage management, and transition animations.

[Navigation](../../../API_Reference/source_zh_cn/arkui-cj/cj-navigation-switching-navigation.md) serves as the root view container for routing navigation and is typically used as the root container for pages (@Entry). The Navigation component is suitable for intra-module routing transitions, offering more natural and fluid transition experiences through component-level routing capabilities. It also provides multiple title bar styles to deliver better title-content interaction effects. In a "write once, deploy everywhere" scenario, the Navigation component automatically adapts to window display sizes and switches to a split-column layout in larger window scenarios.

The Navigation component mainly consists of a navigation page and subpages. The navigation page comprises a title bar (including a menu bar), content area, and toolbar. The navigation page does not exist in the page stack. Transitions between the navigation page and subpages, as well as between subpages, can be achieved through routing operations.

It is recommended to use [NavPathStack](../../../API_Reference/source_zh_cn/arkui-cj/cj-navigation-switching-navigation.md#class-navpathstack) for page routing.

## Routing Operations

Navigation routing operations are based on methods provided by the page stack [NavPathStack](../../../API_Reference/source_zh_cn/arkui-cj/cj-navigation-switching-navigation.md#class-navpathstack). Each Navigation instance requires the creation and passing of a NavPathStack object to manage pages. Key functionalities include page navigation and page return.

> **Note:**
>
> It is not recommended for developers to manage their own page stacks by monitoring lifecycle events.

```cangjie
@Entry
@Component
class EntryView {
    // Create a page stack object and pass it to Navigation
    var pageStack: NavPathStack = NavPathStack()
    func build(){
        Navigation(this.pageStack) {
        }
    }
}
```

### Page Navigation

NavPathStack implements page navigation functionality through Push-related interfaces, primarily using the page name for navigation and optionally carrying parameters.

```cangjie
this.pageStack.pushPath(NavPathInfo('PageOne', 'PageOne Param'))
```

### Page Return

NavPathStack implements page return functionality through Pop-related interfaces.

```cangjie
// Return to the previous page
this.pageStack.pop()
```

## Page Transitions

Navigation provides default transition animations for page switching. Different transition effects are triggered during page stack operations. Navigation also offers capabilities to disable system transitions, customize transitions, and implement shared element transitions.

### Shared Element Transitions

Shared element transitions between NavDestinations can be achieved using [geometryTransition](../../../API_Reference/source_zh_cn/arkui-cj/cj-animation-geometrytransition.md#func-geometryTransition). Pages configured for shared element transitions must also disable the system's default transition animations.

1. Add the geometryTransition property to components requiring shared element transitions. The id parameter must remain consistent between the two NavDestinations.

    ```cangjie
    // Configure shared element ID on the source page
    // ...
    @Component
    class PageOne {
        func build() {
            NavDestination() {
                Column() {
                    // ...
                    Image(@r(app.media.startIcon))
                        .geometryTransition('sharedId')
                        .width(200)
                        .height(200)
                }
            }
        }
    }

    // Configure shared element ID on the destination page
    // ...  
    @Component
    class PageTwo {
        func build() {
            NavDestination() {
                Column() {
                    // ...
                    Image(@r(app.media.startIcon))
                        .geometryTransition('sharedId')
                        .width(200)
                        .height(200)
                }
            }
        }
    }
    ```

2. Place the page routing operation within an animateTo animation closure and configure the corresponding animation parameters.

    ```cangjie
    @Component
    class PageOne {
        func build() {
            NavDestination() {
                Column() {
                    Button('Navigate to Destination Page')
                    .width(80.percent)
                    .height(40)
                    .margin(20)
                    .onClick({ => animateTo(AnimateParam(duration: 1200),
                        { => this.pageStack.pushPath(NavPathInfo("PageTwo", "information"))})
                    })
                }
            }
        }
    }
    ```