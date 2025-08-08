# Focus Events

## Basic Concepts and Specifications

### Basic Concepts

#### Focus, Focus Chain, and Focus Navigation

- **Focus**: Refers to the currently highlighted interactive element in the application interface. When users interact indirectly with the application using non-pointing input devices such as keyboards, TV remotes, or car joysticks/knobs, focus-based navigation and interaction are essential input methods.
- **Focus Chain**: In the component tree structure of an application, when a component gains focus, all nodes along the path from the root node to that component are considered in a focused state, forming a continuous focus chain.
- **Focus Navigation**: Refers to the behavior of transferring focus between components within the application. This process is transparent to users, but developers can capture these changes by listening to the `onFocus` (focus gain) and `onBlur` (focus loss) events. For specific methods and rules of focus navigation, see [Focus Navigation Specifications](#focus-navigation-specifications).

#### Focus State

The visual style indicating the currently focused component.

- **Display Rules**: By default, the focus state is not displayed. It only appears when the application enters the active state. Therefore, while a focused component may not display the focus state (depending on whether it is active), a component displaying the focus state must be focused. Most components have built-in focus state styles, but developers can customize them using style interfaces. Once customized, the component will no longer display the built-in focus state style. In a focus chain, if multiple components have focus states, the system adopts a child-first strategy, prioritizing the child component's focus state and displaying only one focus state.
- **Entering Active State**: Pressing the TAB key on an external keyboard or using the `FocusController.activate(true)` method activates the focus state. Only after activation can focus navigation be performed using the TAB key or arrow keys. The first TAB key press used to activate the focus state does not trigger focus navigation.
- **Exiting Active State**: The focus state exits when the application receives the `FocusController.active(false)` method or a click event (including touchscreen press events and left mouse button press events).

#### Hierarchical Pages

Hierarchical pages are a collective term for specific container components in the focus framework, including `Page`, `Dialog`, `SheetPage`, `ModalPage`, `Menu`, `Popup`, `NavBar`, and `NavDestination`. These components typically have the following key characteristics:

- **Visual Hierarchy Independence**: Visually, these components are independent of other page content and usually appear above them, creating a visual hierarchy.
- **Focus Capture**: When first created and displayed, these components immediately capture the application's focus.
- **Focus Navigation Scope Limitation**: When focus is within these components, users cannot transfer focus to elements outside the component via keyboard inputs; focus movement is restricted to the component's interior.

At any time, an application must have at least one hierarchical page component holding the current focus. When a hierarchical page is closed or becomes invisible, focus automatically transfers to the next available hierarchical page component, ensuring continuity and consistency in user interaction.

> **Note**:
>
> - The `Popup` component does not exhibit the second characteristic when its `focusable` attribute (a component-specific attribute, not a universal one) is `false`.
> - `NavBar` and `NavDestination` do not have the third characteristic. Their focus navigation scope is the same as that of their first parent hierarchical page.

#### Root Container

The root container is a concept within hierarchical pages. When a hierarchical page is first created and displayed, it immediately captures focus. The end node of the focus chain for this page becomes the default focus, typically located on the root container of the hierarchical page.

By default, the default focus of a hierarchical page is on its root container, but developers can customize this behavior using the `defaultFocus` attribute.

When focus is on the root container, the first TAB key press not only activates the focus state but also triggers focus transfer to child components. If a child component is also a container, focus continues to transfer downward until reaching a leaf node. The transfer rule is: prioritize transferring to the last focused child node; if none exists, transfer to the first child node by default.

### Focus Navigation Specifications

Focus navigation can be categorized into active and passive navigation based on the triggering method.

#### Active Focus Navigation

Refers to focus movement caused by intentional actions of developers or users, including:
- Keyboard navigation (TAB, Shift+TAB, or arrow keys).
- Focus requests via `requestFocus`.
- Focus requests via `focusOnTouch` or similar interfaces.

- **Keyboard Navigation**:
    - **Prerequisite**: The application must be in the active focus state.
    - **Scope Limitation**: Keyboard navigation is restricted to the current hierarchical page. For details, see the "Focus Navigation Scope Limitation" section in [Hierarchical Pages](#hierarchical-pages).
    - **Key Types**:
        - **TAB Key**: Follows a Z-shaped traversal logic, iterating through all leaf nodes in the current scope. After reaching the last component, pressing TAB again cycles focus back to the first focusable component.
        - **Shift+TAB Key**: Reverses the focus transfer direction of the TAB key.
        - **Arrow Keys (Up, Down, Left, Right)**: Follows a cross-shaped movement strategy. In a single-layer container, focus transfer is determined by the container's specific navigation algorithm. If the algorithm determines that focus should land on a container component, the system uses a center-point distance priority algorithm to identify the target child node.
    - **Navigation Algorithm**: Each focusable container component has a specific navigation algorithm defining focus transfer rules.
    - **Child Priority**: When a child component handles a keyboard navigation event, the parent component does not intervene.

- **requestFocus**:
    For details, see [Active Focus Gain/Loss](#active-focus-gainloss). This method actively transfers focus to a specified component.
    - Cannot cross windows or ArkUI instances but can cross hierarchical pages.

- **focusOnTouch**:
    For details, see [focusOnTouch](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-focus.md#func-focusontouchbool). Enables a component to gain focus upon click. If the component is not focusable, this feature is ineffective. For container components, clicking prioritizes transferring focus to the last focused child node; otherwise, it transfers to the first focusable child node.

#### Passive Focus Navigation

Passive focus navigation refers to automatic focus transfer triggered by system or other operations without direct developer intervention. This is the default behavior of the focus system.

Current mechanisms for passive focus navigation include:

- **Component Deletion**: When a focused component is deleted, the focus framework first attempts to transfer focus to adjacent sibling components, following a back-to-front order. If no siblings are focusable, focus is released, and the parent component is notified to handle focus.
- **Attribute Changes**: If the `focusable` or `enabled` attribute of a focused component is set to `false`, or its `visibility` attribute is set to non-visible, the focus framework automatically transfers focus to another focusable component, following the same sibling order as above.
- **Hierarchical Page Switching**: When switching between hierarchical pages (e.g., navigating from one page to another), the current page's focus is released, and the new page may automatically gain focus based on preset logic.
- **Web Component Initialization**: For Web components, focus may transfer to them upon creation (e.g., pop-ups or input fields). This behavior is part of the component's logic and not within the focus framework's specifications.

### Focus Navigation Algorithms

In the focus management system, each focusable container has specific navigation algorithms defining how focus transfers from the current focused child component to the next when using TAB, Shift+TAB, or arrow keys.

The algorithm used depends on the container's UX specifications and is adapted by the container component. Currently, the focus framework supports three algorithms: linear, projection, and custom.

#### Linear Navigation Algorithm

The default strategy, based on the mounting order of child nodes in the container's tree. Commonly used for unidirectional layouts like `Row`, `Column`, and `Flex` containers. Rules:

- **Order Dependency**: Navigation order is based solely on the mounting order, independent of layout positions.
- **TAB Key Navigation**: Follows the mounting order.
- **Arrow Key Navigation**: Containers reject navigation requests perpendicular to their defined direction (e.g., up/down in a horizontal `Row`).
- **Boundary Handling**: When focus is on the first/last child, the container rejects opposite-direction arrow key requests (e.g., left arrow at the first child in a `Row`).

#### Projection Navigation Algorithm

Based on the projection of the current focused component in the navigation direction, considering overlap area and center-point distance. Used for containers with unevenly sized children (e.g., `Flex` with `wrap`). Rules:

1. **Arrow Key Navigation**: Calculate overlap area with child components. Among those with non-zero overlap, the one with the shortest center-point distance wins. If multiple candidates exist, the earlier node in the tree wins. If no overlap, the container cannot handle the request.
2. **TAB Key Navigation**: First, apply Rule 1 with the right arrow. If unsuccessful, simulate moving the current component downward by its height and apply Rule 1 with the left arrow. The child with the farthest center-point distance wins. If no overlap, the request fails.
3. **Shift+TAB Key Navigation**: First, apply Rule 1 with the left arrow. If unsuccessful, simulate moving the current component upward by its height and apply Rule 1 with the right arrow. The child with the farthest center-point distance wins. If no overlap, the request fails.

#### Custom Navigation Algorithm

Defined by the component, with specifications determined by the component itself.

## Focus Gain/Loss Events

```cangjie
public func onFocus(callback: ()->Unit): This
```

Focus gain event callback. Triggered when the bound component gains focus.

```cangjie
public func onBlur(callback: ()->Unit): This
```

Focus loss event callback. Triggered when the bound component loses focus.

The `onFocus` and `onBlur` interfaces are typically used in pairs to monitor focus changes.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var oneButtonColor: Color = Color.GRAY
    @State var twoButtonColor: Color = Color.GRAY
    @State var threeButtonColor: Color = Color.GRAY
    func build() {
        Column(20) {
        // Use up/down arrow keys to move focus between buttons. Button color changes on focus gain and reverts on loss.
        Button("First Button")
            .backgroundColor(oneButtonColor)
            .width(260)
            .height(70)
            .fontColor(Color.BLACK)
            // Listen for focus gain event; change color on focus.
            .onFocus({ =>
                oneButtonColor = Color.GREEN
            })
            // Listen for focus loss event; revert color on loss.
            .onBlur({=>
                oneButtonColor = Color.GRAY
            })
        Button("Second Button")
            .backgroundColor(twoButtonColor)
            .width(260)
            .height(70)
            .fontColor(Color.BLACK)
            // Listen for focus gain event; change color on focus.
            .onFocus({=>
                twoButtonColor = Color.GREEN
            })
            // Listen for focus loss event; revert color on loss.
            .onBlur({=>
                twoButtonColor = Color.GRAY
            })
        Button("Third Button")
            .backgroundColor(threeButtonColor)
            .width(260)
            .height(70)
            .fontColor(Color.BLACK)
            // Listen for focus gain event; change color on focus.
            .onFocus({=>
                threeButtonColor = Color.GREEN
            })
            // Listen for focus loss event; revert color on loss.
            .onBlur({=>
                threeButtonColor = Color.GRAY
            })
        }.width(100.percent).margin(top: 20)
    }
}
```

![onFocus](figures/onFocus.gif)

The above example involves three steps:

1. **Application Launch**: Press TAB to activate focus navigation. "First Button" displays the focus state (blue outline), triggers `onFocus`, and turns green.
2. **First TAB Press**: Focus moves to "Second Button," triggering its `onFocus` (green) and "First Button"'s `onBlur` (gray).
3. **Second TAB Press**: Focus moves to "Third Button," triggering its `onFocus` (green) and "Second Button"'s `onBlur` (gray).

## Setting Component Focusability

```cangjie
public func focusable(isFocusable: Bool): This
```

Sets whether a component can gain focus.

Components can be categorized into three types based on focusability:

1. **Default Focusable**: Typically interactive components like `Button`, `Checkbox`, and `TextInput`. These are focusable by default without additional attributes.
2. **Focusable but Not by Default**: Examples include `Text` and `Image`. These require `focusable(true)` to enable focus. If `onClick` or a single-tap gesture is configured, they implicitly become focusable unless `focusable(false)` is set.
3. **Non-Focusable**: Typically non-interactive display components like `Blank` and `Circle`. These cannot gain focus even with `focusable`.

```cangjie
public func enabled(value: Bool): This
```

Setting the [enabled](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-enable.md#func-enabledbool) attribute to `false` disables interaction and focus.

```cangjie
public func visibility(value: Visibility): This
```

Setting the [visibility](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-visibility.md#func-visibilityvisibility) attribute to `Visibility.None` or `Visibility.Hidden` makes the component invisible and unfocusable.

```cangjie
public func focusOnTouch(isFocusOnTouch: Bool): This
```

Sets whether the component can gain focus upon click.

> **Note**:
>
> If a focused component's `focusable` or `enabled` attribute is set to `false`, it automatically loses focus, and focus transfers according to [Focus Navigation Specifications](#focus-navigation-specifications).

## Default Focus

### Page Default Focus

```cangjie
public func defaultFocus(isDefaultFocus: Bool): This
```

Sets the component as the default focus for the current page.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var oneButtonColor: Color = Color.GRAY
    @State var twoButtonColor: Color = Color.GRAY
    @State var threeButtonColor: Color = Color.GRAY

    func build() {
        Column(20) {
            // Using up/down arrow keys on an external keyboard allows focus movement between three buttons. Button color changes when focused and reverts when blurred.
            Button("First Button")
                .width(260)
                .height(70)
                .backgroundColor(oneButtonColor)
                .fontColor(Color.BLACK)
                // Listen for focus event of the first component, change color when focused
                .onFocus({ =>
                    oneButtonColor = Color.GREEN
                })
                // Listen for blur event of the first component, change color when blurred
                .onBlur({ =>
                    oneButtonColor = Color.GRAY
                })

            Button("Second Button")
                .width(260)
                .height(70)
                .backgroundColor(twoButtonColor)
                .fontColor(Color.BLACK)
                // Listen for focus event of the second component, change color when focused
                .onFocus({ =>
                    twoButtonColor = Color.GREEN
                })
                // Listen for blur event of the second component, change color when blurred
                .onBlur({ =>
                    twoButtonColor = Color.GRAY
                })

            Button("Third Button")
                .width(260)
                .height(70)
                .backgroundColor(threeButtonColor)
                .fontColor(Color.BLACK)
                // Set default focus
                .defaultFocus(true)
                // Listen for focus event of the third component, change color when focused
                .onFocus({ =>
                    threeButtonColor = Color.GREEN
                })
                // Listen for blur event of the third component, change color when blurred
                .onBlur({ =>
                    threeButtonColor = Color.GRAY
                })
        }
        .width(100.percent)
        .margin(top: 20)
    }
}
```

![defaultFocus.gif](figures/defaultFocus.gif)

The above example includes 2 steps:

- Set `defaultFocus(true)` on the third Button component, making it focused by default (displayed in green) when the page loads.
- Press TAB key to trigger focus movement. When the third Button is focused, a focus frame will appear.

### Default Focus for Containers

Container default focus is affected by [Focus Priority](#focus-group-and-focus-priority).

**Difference between defaultFocus and FocusPriority:**

[defaultFocus](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-focus.md#func-defaultfocusbool) specifies the default focused node when the page first loads, while [FocusPriority](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-focus.md#func-focusscopeprioritystring-focuspriority) specifies the focus priority of child nodes when a container first receives focus. When both attributes are configured simultaneously in certain scenarios, the behavior is undefined. For example, in the following scenario, the page cannot simultaneously satisfy both defaultFocus and high-priority component focus during initial display:

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Row() {
            Button("Button1")
                .defaultFocus(true)
            Button("Button2")
                .focusScopePriority("RowScope", FocusPriority.PREVIOUS)
        }
        .focusScopeId("RowScope")
    }
}
```

### Focus Chain for Page/Container Global Focus

#### Global Focus vs Non-Global Focus

- Global focus occurs when a page/container itself becomes the leaf node of the focus chain, then transfers focus to descendant components. Examples include page switching, route switching in Navigation components, focus group movement, and container components actively calling `requestFocusById`.

- Non-global focus occurs when a component becomes the leaf node of the focus chain, causing its ancestor nodes to receive focus. Examples include TextInput components actively acquiring focus, TAB key movement in non-focus group scenarios.

#### Focus Chain Formation for Global Focus

1. Initial page focus:
   - The leaf node of the focus chain is the node configured with `defaultFocus`.
   - If `defaultFocus` is not configured, focus remains on the root container of the page.

2. Non-initial page focus: The last focused node receives focus.

3. When the focus chain contains components and containers with configured focus priorities:
   - If the container contains components with priority higher than PREVIOUS, the highest priority component receives focus.
   - If the container contains no components with priority higher than PREVIOUS, the last focused node receives focus (e.g., when the window regains focus after being blurred).

## Focus Style

> **Note:**
>
> The [zIndex](../../../API_Reference/source_en/arkui-cj/cj-universal-attribute-zorder.md#func-zindexint32) of the component that ultimately renders the focus state will be elevated to INT_MAX by default. If the component already has a configured zIndex, no adjustment will be made. When the component no longer renders the focus state (e.g., when blurred or exiting focus movement state), the zIndex reverts to its default level.

```cangjie
public func focusBox(style: FocusBoxStyle): This
```

Sets the system focus box style for the current component.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column(30) {
            Button("small black focus box")
                .focusBox(FocusBoxStyle(
                    margin: 0.px,
                    strokeColor: ColorMetrics.rgba(0, 0, 0),
                ))
            Button("large red focus box")
                .focusBox(FocusBoxStyle(
                    margin: 20.px,
                    strokeColor: ColorMetrics.rgba(255, 0, 0),
                    strokeWidth: 10.px
                ))
        }
        .alignItems(HorizontalAlign.Center)
        .width(100.percent)
    }
}
```

![focusBox](figures/focusBox.gif)

The above example includes 2 steps:
- Enter the page and press TAB to trigger focus movement. The first Button receives focus with a tight blue thin border style.
- Press TAB again to move focus to the second Button, which displays a large red thick border style.

## Active Focus/Blur Control

Using methods from focusControl:

```cangjie
public static func requestFocus(keyValue: String): Bool
```

Calling this interface actively transfers focus to the specified component. The focus transfer takes effect at the next frame signal.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var btColor: UInt32 = 0x2787d9
    @State var btColor2: UInt32 = 0x2787d9

    func build() {
        Column(20) {
            Column(5) {
                Button("Button")
                    .width(200)
                    .height(70)
                    .fontColor(Color.WHITE)
                    .focusOnTouch(true)
                    .backgroundColor(0x2787d9)
                    .onFocus({ =>
                        btColor = 0xd5d5d5
                    })
                    .onBlur({ =>
                        btColor = 0x2787d9
                    })
                    .id("testButton")

                Button("Button")
                    .width(200)
                    .height(70)
                    .fontColor(Color.WHITE)
                    .focusOnTouch(true)
                    .backgroundColor(btColor2)
                    .onFocus({ =>
                        btColor2 = 0xd5d5d5
                    })
                    .onBlur({ =>
                        btColor2 = 0x2787d9
                    })
                    .id("testButton2")

                Divider()
                    .vertical(false)
                    .width(80.percent)
                    .backgroundColor(0x707070)
                    .height(10)
                // Clicking the FocusControl.requestFocus button makes the second Button receive focus.
                Button("FocusControl.requestFocus")
                    .width(200)
                    .height(70)
                    .fontColor(Color.WHITE)
                    .onClick({ =>
                        FocusControl.requestFocus("testButton2")
                    })
                    .backgroundColor(0xff2787d9)
            }
        }
        .width(100.percent)
        .height(100.percent)
    }
}
```

![focus-2](figures/focus-2.gif)

## Focus Group and Focus Priority

```cangjie
public func focusScopePriority(scopeId: String, priority!: FocusPriority = FocusPriority.AUTO): This
```

Sets the focus priority of the current component within the specified container. Must be used with `focusScopeId`.

```cangjie
public func focusScopeId(id: String, isGroup!: Bool = false, arrowStepOut!: Bool = true): This
```

Sets the ID identifier for the current container component and specifies whether it is a focus group. Focus groups cannot be mixed with tabIndex.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var inputValue: String = ""

    func build() {
        Scroll {
            Row(20) { // Component spacing set to 20
                Column(20) {  // Marked as Column1
                    Column(5) {
                        Button("Group1")
                            .width(165)
                            .height(40)
                            .fontColor(Color.WHITE)
                        Row(5) {
                            Button()
                                .width(80)
                                .height(40)
                                .fontColor(Color.WHITE)
                            Button()
                                .width(80)
                                .height(40)
                                .fontColor(Color.WHITE)
                        }
                        Row(5) {
                            Button()
                                .width(80)
                                .height(40)
                                .fontColor(Color.WHITE)
                            Button()
                                .width(80)
                                .height(40)
                                .fontColor(Color.WHITE)
                        }
                    }
                    .borderWidth(2)
                    .borderColor(Color.RED)
                    .borderStyle(BorderStyle.Dashed)

                    Column(5) {
                        Button("Group2")
                            .width(165)
                            .height(40)
                            .fontColor(Color.WHITE)
                        Row(5) {
                            Button()
                                .width(80)
                                .height(40)
                                .fontColor(Color.WHITE)
                            Button()
                                .width(80)
                                .height(40)
                                .fontColor(Color.WHITE)
                                .focusScopePriority('ColumnScope1',priority: FocusPriority.PRIOR)  // Column1 gets focus first when focused
                        }
                        Row(5) {
                            Button()
                                .width(80)
                                .height(40)
                                .fontColor(Color.WHITE)
                            Button()
                                .width(80)
                                .height(40)
                                .fontColor(Color.WHITE)
                        }
                    }
                    .borderWidth(2)
                    .borderColor(Color.GREEN)
                    .borderStyle(BorderStyle.Dashed)
                }
                .focusScopeId('ColumnScope1')

                Column(5) {  // Marked as Column2
                    TextInput(placeholder: "input", text: inputValue)
                        .onChange({ value: String =>
                            inputValue = value
                        })
                        .width(156)
                    Button("Group3")
                        .width(165)
                        .height(40)
                        .fontColor(Color.WHITE)
                    Row(5) {
                        Button()
                            .width(80)
                            .height(40)
                            .fontColor(Color.WHITE)
                        Button()
                            .width(80)
                            .height(40)
                            .fontColor(Color.WHITE)
                    }
                    Button()
                        .width(165)
                        .height(40)
                        .fontColor(Color.WHITE)
                        .focusScopePriority('ColumnScope2',priority: FocusPriority.PREVIOUS)  // Gets focus when Column2 is focused
                    Row(5) {
                        Button()
                            .width(80)
                            .height(40)
                            .fontColor(Color.WHITE)
                        Button()
                            .width(80)
                            .height(40)
                            .fontColor(Color.WHITE)
                    }
                    Button()
                        .width(165)
                        .height(40)
                        .fontColor(Color.WHITE)
                    Row(5) {
                        Button()
                            .width(80)
                            .height(40)
                            .fontColor(Color.WHITE)
                        Button()
                            .width(80)
                            .height(40)
                            .fontColor(Color.WHITE)
                    }
                }
                .borderWidth(2)
                .borderColor(Color.ORANGE)
                .borderStyle(BorderStyle.Dashed)
                .focusScopeId('ColumnScope2',isGroup: true)  // Column2 as focus group
            }
            .alignItems(VerticalAlign.Top)
        }
    }
}
```

![focus-3](figures/focus-3.gif)

The above example includes the following 2 steps:

- A focus group is set in the input box, so pressing the TAB key will quickly move the focus out of the input, while pressing the arrow keys allows navigation within the input.
- The Column in the upper-left corner does not have a focus group set, so focus can only be moved one by one using the Tab key.

## Focus and Key Events

When a component is focused and has a click event (`onClick`) or single-finger tap event (`TapGesture`), pressing Enter or Space will trigger the corresponding event callback.

> **Note:**
>
> - When a click event (`onClick`) or single-finger tap event (`TapGesture`) is triggered by Enter or Space, the event does not bubble up by default, meaning the parent component's corresponding [key event](../../../API_Reference/source_en/arkui-cj/cj-universal-event-key.md) will not be triggered simultaneously.
> - Key events (`onKeyEvent`) bubble up by default, meaning the parent component's key event callback will also be triggered.
> - If a component has both a click event (`onClick`) and a key event (`onKeyEvent`), both will respond when Enter or Space is pressed.
> - The response of a focused component to a click event (`onClick`) is independent of the focus active state.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.UIKit.*
import ohos.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var count: Int = 0
    @State var name: String = "Button"

    func build() {
        Column {
            Button(name)
                .fontSize(30)
                .onClick({ =>
                    count++
                    if (count <= 0) {
                        name = "count is negative number"
                    } else if (count % 2 == 0) {
                        name = "count is even number"
                    } else {
                        name = "count is odd number"
                    }
                })
                .height(60)
        }
        .height(100.percent).width(100.percent).justifyContent(FlexAlign.Center)
    }
}
```

![focus-4](figures/focus-4.gif)
