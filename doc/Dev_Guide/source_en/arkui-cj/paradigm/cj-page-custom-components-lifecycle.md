# Page and Custom Component Lifecycle

Before we begin, it's essential to clarify the relationship between custom components and pages:

- **Custom Component**: A UI unit decorated with `@Component`, which can combine multiple system components to achieve UI reuse and can invoke component lifecycle methods.

- **Page**: The UI page of an application. It can consist of one or more custom components. The custom component decorated with `@Entry` serves as the entry component of the page, i.e., the root node of the page. A page can have only one `@Entry`. Only components decorated with `@Entry` can invoke page lifecycle methods.

**Page Lifecycle**: Refers to the lifecycle of components decorated with `@Entry`, providing the following lifecycle interfaces:

**Component Lifecycle**: Refers to the lifecycle of general custom components decorated with `@Component`, providing the following lifecycle interfaces:

The lifecycle flow is illustrated in the diagram below, which depicts the lifecycle of a component (page) decorated with `@Entry`.

![lifecycle](./figures/lifecycle.png)

Based on the above flowchart, this document provides a detailed explanation from the perspectives of custom component creation, re-rendering, and deletion.

## Custom Component Creation and Rendering Process

1. **Creation of Custom Component**: The instance of a custom component is created by the ArkUI framework.

2. **Initialization of Custom Component Member Variables**: Member variables of the custom component are initialized via local default values or parameters passed through the constructor, following the order in which the member variables are defined.

3. If the developer has defined `aboutToAppear`, the `aboutToAppear` method is executed.

4. **First Rendering**: During the initial rendering, the `build` method is executed to render system components. If a child component is a custom component, an instance of the custom component is created. During the initial rendering, the framework records the mapping relationship between state variables and components. When state variables change, the framework drives the associated components to refresh.

5. If the developer has defined `onDidBuild`, the `onDidBuild` method is executed.

## Custom Component Re-rendering

When an event handler is triggered (e.g., a click event is set and triggered), changing state variables, or when properties in `LocalStorage`/`AppStorage` are modified, causing bound state variables to change their values:

1. The framework observes the changes and initiates re-rendering.

2. Based on the two maps maintained by the framework (as mentioned in step 4 of [Custom Component Creation and Rendering Process](#custom-component-creation-and-rendering-process)), the framework identifies which UI components are managed by the state variable and their corresponding update functions. These UI components' update functions are executed to achieve minimal updates.

## Custom Component Deletion

If the branch of an `if` component changes or the array length in a `ForEach` loop rendering changes, the component will be deleted:

1. Before deletion, the `aboutToDisappear` lifecycle function is called, marking the node for destruction. ArkUI's node deletion mechanism involves: the backend node is directly removed from the component tree, the backend node is destroyed, the frontend node is dereferenced, and the frontend node is garbage collected when no references remain.

2. The custom component and its variables are deleted. If it has synchronized variables such as `@Link`, `@Prop`, or `@StorageLink`, they are deregistered from the [synchronization source](../state_management/cj-state-management-overview.md).

It is not recommended to perform asynchronous operations within the `aboutToDisappear` lifecycle. If asynchronous operations (e.g., `spawn` or callback methods) are used in `aboutToDisappear`, the custom component will be retained in the closure of `spawn` until the callback method completes. This behavior prevents garbage collection of the custom component.

The following example demonstrates the timing of lifecycle method calls:

<!-- run -->

```cangjie
// Index.cj
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.router.*

@Entry
@Component
class EntryView {
    @State var showChild: Bool = true
    @State var btnColor: Color = Color(0xFF007DFF)

    // Only components decorated with @Entry can invoke page lifecycle methods
    protected override func onPageShow() {
        AppLog.info("Index onPageShow")
    }

    // Only components decorated with @Entry can invoke page lifecycle methods
    protected override func onPageHide() {
        AppLog.info("Index onPageHide")
    }

    // Only components decorated with @Entry can invoke page lifecycle methods
    protected override func onBackPress() {
        AppLog.info("Index onBackPress")
        this.btnColor = Color(0xFFEE0606)
        // Returning true indicates the page handles the back logic itself, without routing; false uses the default routing back logic.
        return true
    }

    // Component lifecycle
    protected override func aboutToAppear() {
        AppLog.info("EntryView aboutToAppear")
    }

    // Component lifecycle
    protected override func onDidBuild() {
        AppLog.info("EntryView onDidBuild")
    }

    // Component lifecycle
    protected override func aboutToDisappear() {
        AppLog.info("EntryView aboutToDisappear")
    }

    func build() {
        Column {
            // When this.showChild is true, create Child component and execute Child aboutToAppear
            if (this.showChild) {
                Child()
            }

            Button("delete Child")
            .margin(20)
            .backgroundColor(this.btnColor)
            .onClick({
                _ =>
                // When this.showChild is false, delete Child component and execute Child aboutToDisappear
                this.showChild = false
            })

            // Push to Page page, execute onPageHide
            Button("push to next page")
            .onClick({
                _ =>
                Router.push(url: "Page")
            })
        }
    }
}

@Component
class Child {
    @State var title: String = "Hello World"

    // Component lifecycle
    protected override func aboutToAppear() {
        AppLog.info("Child aboutToAppear")
    }

    // Component lifecycle
    protected override func onDidBuild() {
        AppLog.info("Child onDidBuild")
    }

    // Component lifecycle
    protected override func aboutToDisappear() {
        AppLog.info("Child aboutToDisappear")
    }

    func build() {
        Text(this.title)
        .fontSize(50)
        .margin(20)
        .onClick({
            _ =>
            this.title = "Hello ArkUI"
        })
    }
}
```
<!-- run -->

```cangjie
// Page.cj
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class Page {
    @State var textColor: Color = Color.BLACK
    @State var num: Int64 = 0

    // Only components decorated with @Entry can invoke page lifecycle methods
    protected override func onPageShow() {
        this.num = 5
    }

    // Only components decorated with @Entry can invoke page lifecycle methods
    protected override func onPageHide() {
        AppLog.info("Page onPageHide")
    }

    // Only components decorated with @Entry can invoke page lifecycle methods
    protected override func onBackPress() {
        this.textColor = Color.GRAY
        this.num = 0
        return false
    }

    // Component lifecycle
    protected override func aboutToAppear() {
        this.textColor = Color.BLUE
    }

    func build() {
        Column {
            Text("num value: " + this.num.toString())
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.textColor)
            .margin(20)
            .onClick({
                _ =>
                this.num += 5
            })
        }
        .width(100.percent)
    }
}
```

In the above example, the Index page contains two custom components: `EntryView`, decorated with `@Entry` and serving as the entry component (root node of the page), and `Child`, a child component of `EntryView`. Only nodes decorated with `@Entry` can make page-level lifecycle methods effective. Thus, `EntryView` declares the page lifecycle methods (`onPageShow`, `onPageHide`, `onBackPress`) for the current Index page. `EntryView` and its child component `Child` declare their respective component-level lifecycle methods (`aboutToAppear`, `onDidBuild`, `aboutToDisappear`).

- **Cold Start Initialization Flow**: `EntryView aboutToAppear` --> `EntryView build` --> `EntryView onDidBuild` --> `Child aboutToAppear` --> `Child build` --> `Child onDidBuild` --> `Index onPageShow`.

- **Click "delete Child"**: The `if`-bound `this.showChild` becomes `false`, deleting the `Child` component and executing `Child aboutToDisappear`.

- **Click "push to next page"**: The `router.pushUrl` interface is called to navigate to another page. The current Index page is hidden, executing `Index onPageHide`. Since `router.pushUrl` is used, the Index page is hidden but not destroyed, so only `onPageHide` is called. After navigating to the new page, the initialization lifecycle flow of the new page is executed.

- **If `router.replaceUrl` is called**: The current Index page is destroyed. As mentioned earlier, component destruction involves directly removing the subtree from the component tree. Thus, the lifecycle flow becomes: new page initialization lifecycle flow, followed by `Index onPageHide` --> `EntryView aboutToDisappear` --> `Child aboutToDisappear`.

- **Click the back button**: Triggers `Index onBackPress`, and returning to the previous page causes the current Index page to be destroyed.

- **Minimize the app or app enters background**: Triggers `Index onPageHide`. The current Index page is not destroyed, so `aboutToDisappear` is not executed. When the app returns to the foreground, `Index onPageShow` is executed.

- **Exit the app**: Executes `Index onPageHide` --> `EntryView aboutToDisappear` --> `Child aboutToDisappear`.

## Custom Component Listening to Page Lifecycle

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.observer.*

class TabContentInfoCallback1 <: Callback1Argument<TabContentInfo> {
    public init() {}
    // Called when Tabs1's TabContent page switches
    public open func invoke(val: TabContentInfo): Unit {
        AppLog.info("TabContentUpdate1 tabContentId: ${val.tabContentId}")
        AppLog.info("TabContentUpdate1 tabContentUniqueId: ${val.tabContentUniqueId}")
        match (val.state) {
            case ON_SHOW => AppLog.info("TabContentUpdate1 ON_SHOW")
            case ON_HIDE => AppLog.info("TabContentUpdate1 ON_HIDE")
            case _ => AppLog.info("TabContentUpdate1 error")
        }
        AppLog.info("TabContentUpdate1 id:${val.id}")
        AppLog.info("TabContentUpdate1 uniqueId:${val.uniqueId}")
    }
}

class TabContentInfoCallback2 <: Callback1Argument<TabContentInfo> {
    public init() {}
    // Called when Tabs1's TabContent page switches
    public open func invoke(val: TabContentInfo): Unit {
        AppLog.info("TabContentUpdate2 tabContentId: ${val.tabContentId}")
        AppLog.info("TabContentUpdate2 tabContentUniqueId: ${val.tabContentUniqueId}")
        match (val.state) {
            case ON_SHOW => AppLog.info("TabContentUpdate2 ON_SHOW")
            case ON_HIDE => AppLog.info("TabContentUpdate2 ON_HIDE")
            case _ => AppLog.info("TabContentUpdate2 error")
        }
        AppLog.info("TabContentUpdate2 id:${val.id}")
        AppLog.info("TabContentUpdate2 uniqueId:${val.uniqueId}")
    }
}

@Entry
@Component
class EntryView {
    var tabContentUpdate1: TabContentInfoCallback1 = TabContentInfoCallback1()

    protected override func aboutToAppear() {
        // Listen to Tabs1's TabContent page switch events.
        on(ObserverType.OBSERVER_TAB_CONTENT_UPDATE, ObserverOptions("Tabs1"), tabContentUpdate1)
    }

    protected override func aboutToDisappear() {
        // Stop listening to Tabs1's TabContent page switch events.
        off(ObserverType.OBSERVER_TAB_CONTENT_UPDATE, ObserverOptions("Tabs1"), tabContentUpdate1)
    }

    func build() {
        Column {
            Tabs {
                TabContent {
                    Column {
                        Text("TabContent1")
                    }
                }.id("TabContent1")

                TabContent {
                    Column {
                        Text("TabContent2")
                    }
                }.id("TabContent2")

                TabContent {
                    Column {
                        Text("TabContent3")
                    }
                }.id("TabContent3")
            }
                .width(100.percent)
                .height(40.percent)
                .id("Tabs1")

            Column {
                SubComponent()
            }
        }
    }
}

@Component
class SubComponent {
    var tabContentUpdate2: TabContentInfoCallback2 = TabContentInfoCallback2()

    protected override func aboutToAppear() {
        // Listen for tab content switching events of Tabs2.
        on(ObserverType.OBSERVER_TAB_CONTENT_UPDATE, ObserverOptions("Tabs2"), tabContentUpdate2)
    }

    protected override func aboutToDisappear() {
        // Unregister the listener for tab content switching events of Tabs2.
        off(ObserverType.OBSERVER_TAB_CONTENT_UPDATE, ObserverOptions("Tabs2"), tabContentUpdate2)
    }

    func build() {
        Tabs {
            TabContent {
                Column {
                    Text("TabContent1")
                }
            }.id("TabContent1")

            TabContent {
                Column {
                    Text("TabContent2")
                }
            }.id("TabContent2")

            TabContent {
                Column {
                    Text("TabContent3")
                }
            }.id("TabContent3")
        }
            .width(100.percent)
            .height(40.percent)
            .id("Tabs2")
    }
}
```