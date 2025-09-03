# Router to Navigation Switching

Given that component-based Navigation supports richer animations, multi-platform deployment capabilities with a single development effort, and more flexible stack operations, this article primarily introduces how to switch from Router to Navigation in terms of page navigation, animations, and lifecycle.

## Page Structure

A Router-based page is a Component decorated with `@Entry`.

Below is an example of a Router page.

<!-- run -->

```cangjie
// index.cj
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello World";
    func build() {
        Row() {
            Column() {
                Text(this.message)
                    .fontSize(10)
                    .fontWeight(FontWeight.Bold)
                Button("router to pageOne")
                    .stateEffect(true)
                    .width(120)
                    .height(80)
                    .margin(40)
                    .onClick({ =>
                        Router.pushUrl(url: "pageOne", // Target URL
                        params: "pagesparams", mode: RouterMode.Standard, callback: { code => })
                    })
            }
            .width(100)
        }
    .height(100)
    }
}
```

<!-- run -->

```cangjie
//pageOne.cj
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class pageOne {
    @State
    var message: String = "This is pageOne";
    func build() {
        Row() {
            Column() {
                Text(this.message)
                    .fontSize(10)
                    .fontWeight(FontWeight.Bold)
                Button("router back to Index")
                    .stateEffect(true)
                    .width(120)
                    .height(80)
                    .margin(40)
                    .onClick({ =>
                        Router.back();
                    })
            }
            .width(100)
        }
        .height(100)
    }
}
```

In contrast, Navigation-based routing pages are divided into navigation pages (Navbar) and subpages. The navigation page is a child component contained within Navigation, while subpages are child components contained within NavDestination.

Below is an example of a Navigation navigation page and subpage.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Builder
func pageMap(name: String) {
    if (name == "pageOne") {
        PageOne()
    }
}

@Entry
@Component
class EntryView {
    var pageInfos: NavPathStack = NavPathStack()
    public func build() {
        Navigation(pageInfos) {
            Button("Navigation page")
                .onClick {
                    pageInfos.pushPath(NavPathInfo("pageOne", "pageOne test"))
            }
        }
        .navDestination(bind<String>(pageMap, this))
    }
}

@Component
class PageOne {
    var pageInfos: NavPathStack = NavPathStack()

    public func build() {
        NavDestination() {
            Column(){
                Button("Back to Home", ButtonOptions(shape: ButtonType.Capsule))
                .width(80.percent)
                .height(40)
                .onClick{
                    => this.pageInfos.pop()
                }
            }
        }.title("pageOne")
        .onReady {context =>
            this.pageInfos = context.pathStack
        }
        .onBackPressed {
            this.pageInfos.pop()
            true
        }
    }
}
```

## Routing Operations

Operations are performed through the global Router instance.

```cangjie
// push page
Router.pushUrl(url: "pageOne", params: "pagesparams", callback: { code => })

// pop page
Router.back(url: "pageOne", params: "pagesparams");

// replace page
Router.replaceUrl(url: "pageOne", params: "pagesparams", callback: { code => })

// clear all pages
Router.clear()

// Get the size of the page stack
let size = Router.getLength()

// Get the page state
let pageState = Router.getState()
```

Navigation uses methods provided by the page stack object [`NavPathStack`](../../../API_Reference/source_zh_cn/arkui-cj/cj-navigation-switching-navigation.md#class-navpathstack) to manipulate pages. A stack object must be created and passed into Navigation.

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    var pathStack: NavPathStack = NavPathStack()
    public func build() {
        // Set NavPathStack and pass it to Navigation
        Navigation(this.pageInfos) {
            // ...
        }.width(100.percent).height(100.perent)
        .title("Navigation")
    }
}

// push page
this.pathStack.pushPath("pageOne")

// pop page
this.pathStack.pop()
this.pathStack.popToIndex(1)
this.pathStack.popToName("pageOne")

// replace page
this.pathStack.replacePath(NavPathInfo("pageOne"))
this.pathStack.replacePathByName("pageOne")

// clear all pages
this.pathStack.clear()

// Get the size of the page stack
let size = this.pathStack.size()

// Remove all pages named "PageOne" from the stack
this.pathStack.removeByName("pageOne")

// Remove pages at specified indexes
this.pathStack.removeByIndexes([1, 3, 5])

// Get the collection of all page names in the stack
this.pathStack.getAllPathName()

// Get the parameters of the page at index 1
this.pathStack.getParamByIndex(1)

// Get the parameters of the "PageOne" page
this.pathStack.getParamByName("pageOne")

// Get the index collection of the "PageOne" page
this.pathStack.getIndexByName("pageOne")
// ...
```

Router, as a global module, can be called from any page. Navigation, as a component, requires subpages to obtain the NavPathStack object held by Navigation for routing operations. This can be achieved in the following ways:

**Method 1**: Pass via `@Provide` and `@Consume` (not recommended due to coupling).

```cangjie
// Navigation root container
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    // Navigation creates a NavPathStack decorated with @Provide
    @Provide
    var pathStack: NavPathStack = NavPathStack()

    func build() {
        Navigation(this.pathStack) {
        // ...
        }
    }
}

// Navigation subpage
@Component
class PageOne {
    // NavDestination obtains it via @Consume
    @Consume
    var pathStack: NavPathStack;

    func build() {
        NavDestination() {
        // ...
        }
    }
}
```

**Method 2**: Subpages obtain it via the `OnReady` callback.

```cangjie
@Component
class EntrvView {
    var pathStack: NavPathStack = NavPathStack()

    func build() {
        NavDestination() {
            // ...
        }
        .onReady{context =>
            this.pageInfos = context.pathStack
        }
    }
}
```

**Method 3**: Obtain it via the global `AppStorage` interface.

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntrvView {
    var pathStack: NavPathStack = NavPathStack()
    func build() {
        Row() {
            Column() {
                Navigation(this.pathStack) {
                // ...
                }
                Text("title")
                    .fontSize(10)
                    .fontWeight(FontWeight.Bold)
                Button("button1")
                    .stateEffect(true)
                    .width(120)
                    .height(80)
                    .margin(40)
                    .onClick({ =>
                        AppStorage.setOrCreate("PathStack", this.pathStack)
                    })
            }
        }
    }
}

// Navigation subpage
@Component
class PageOne {
    // Get global NavPathStack in subpage
    var pathStack: NavPathStack = AppStorage.get<NavPathStack>("PathStack").getOrThrow()

    func build() {
        NavDestination() {
        // ...
        }
    }
}
```

## Lifecycle

Router page lifecycle refers to common methods in @Entry pages, mainly including the following four lifecycles:

```cangjie

// Callback executed before its build() function
public func aboutToAppear(){
}

// Callback executed before custom component destruction
public func aboutToDisappear(){
}

// Callback when page is displayed
public func onPageShow(){
}

// Callback when page is hidden
public func onPageHide(){
}

// Callback when page is hidden
public fun onPageHide(){
}
```

The lifecycle sequence is shown in the following figure:

![zhouqi](figures/zhouqi.jpg)

As a routing container, Navigation's lifecycle is carried on the NavDestination component and exposed in the form of component events.

```cangjie
@Component
class EntryView {
    protected func aboutToDisappear() {
    }

    protected func aboutToAppear() {
    }

    func build() {
        NavDestination() {
            // ...
        }
        .onWillAppear({=>
        })
        .onAppear({=>
        })
        .onWillShow({=>
        })
        .onShown({=>
        })
        .onWillHide({=>
        })
        .onHide({=>
        })
        .onWillDisappear({=>
        })
        .onDisAppear({=>
        })
        .
    }
}
```

## Transition Animation

Both Router and Navigation provide system transition animations as well as custom transition capabilities.

For Router, custom page transitions are implemented through the general method pageTransition(). For details, please refer to [Router Page Transition Animation](./cj-page-transition-animation.md).

As a routing container component, the page switching animation within Navigation essentially belongs to property animations between components.

## Shared Element Transition

When jumping between pages, shared element transition animations are required. Router can achieve shared element transitions through the general attribute sharedTransition. For details, please refer to the following link:

[Router Shared Element Transition Animation](../../../API_Reference/source_zh_cn/arkui-cj/cj-animation-sharedtransition.md#shared-element-transition-sharedtransition)

Navigation also provides the capability for shared element transitions with continuous shots. This needs to be coordinated with the geometryTransition attribute. When switching between subpages (NavDestination), shared element transitions can be achieved. For details, please refer to [Navigation Shared Element Transition Animation](cj-navigation-navigation.md#shared-element-transition).

## Cross-Package Routing

As a routing component, Navigation inherently supports cross-package jumps.

1. Import custom components in mainPage and add them to pageMap to enable normal calls.

         <!-- run -->

    ```cangjie
    package ohos_app_cangjie_entry
    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Builder
    func pageMap(name: String) {
       // 1.Define routing mapping table
       if (name == "PageInHSP") {
           PageInHSP()
       }
    }

    @Entry
    @Component
    class EntryView {
        var pageInfos: NavPathStack = NavPathStack()
        public func build() {
            Navigation(pageInfos) {
                Button("Navigation page")
                    .onClick {
                    // 1.Define routing mapping table
                        pageInfos.pushPath(NavPathInfo("PageInHSP", "pageOne test"))
                }
            }
            .navDestination(bind<String>(pageMap, this))
        }
    }

    @Component
    class PageInHSP {
        var pageInfos: NavPathStack = NavPathStack()
        public func build() {
            NavDestination() {
                Text("Page One")
                    .onClick {evt =>
                        pageInfos.pop()
                }
            }
            .onReady { context =>
                pageInfos = context.pathStack
            }
            .onBackPressed {
                pageInfos.pop()
                true
            }
        }
    }
   ```

The above completes cross-package routing through **static dependency**.

## Route Interception

Router does not natively provide route interception capabilities. Developers need to encapsulate their own route jump interfaces and implement route interception judgments and route redirections within their encapsulated interfaces.
