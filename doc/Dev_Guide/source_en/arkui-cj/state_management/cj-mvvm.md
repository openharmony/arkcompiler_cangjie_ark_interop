# MVVM Pattern

When developers grasp the basic concepts of state management, they often want to build their own applications. However, if the project structure is not carefully planned during the initial stages of application development, as the project expands and becomes more complex, the increasing number of state variables will lead to intricate relationships between components. At this point, developing any new feature may trigger a chain reaction, and maintenance costs will rise. To address this, this article aims to introduce the MVVM pattern and the relationship between ArkUI's UI development model and MVVM, guiding developers on how to design their project structure so that product iteration and upgrades can be developed and maintained more easily.

This document covers most of the state management V1 decorators, so before reading this document, it is recommended that developers have a basic understanding of state management V1. It is advisable to read the following in advance: [State Management Overview](cj-state-management-overview.md) and the documentation related to state management V1 decorators.

## Introduction to MVVM Pattern

### Concept

In application development, UI updates need to synchronize in real-time with changes in data state, and this synchronization often determines the performance and user experience of the application. To address the complexity of synchronizing data and UI, ArkUI adopts the Model-View-ViewModel (MVVM) architectural pattern. MVVM divides the application into three core parts: Model, View, and ViewModel, achieving separation of data, view, and logic. Through this pattern, the UI can automatically update as the state changes, without manual intervention, thereby more efficiently managing the binding and updating of data and views.

- **Model**: Responsible for storing and managing application data and business logic, without directly interacting with the user interface. It typically retrieves data from backend interfaces and serves as the data foundation of the application, ensuring data consistency and integrity.
- **View**: Responsible for displaying data on the user interface and interacting with users, without containing any business logic. It dynamically updates the UI by binding to data provided by the ViewModel layer.
- **ViewModel**: Responsible for managing UI state and interaction logic. As the bridge connecting Model and View, a View usually corresponds to a ViewModel. The ViewModel monitors changes in Model data, notifies the View to update the UI, and handles user interaction events, converting them into data operations.

ArkUI's UI development model follows the MVVM pattern. With this basic introduction to MVVM, developers can roughly guess the role state management plays in MVVM. State management aims to drive updates through data, allowing developers to focus solely on page design without worrying about the entire UI refresh logic. Data maintenance also does not require developer awareness, as state variables automatically handle updates. This is precisely what the ViewModel layer needs to support. Therefore, using the MVVM pattern to develop applications is the most effortless approach for developers.

## ArkUI Development Model Diagram

ArkUI's UI development model is the MVVM pattern, where state variables play the role of ViewModel in the MVVM pattern, refreshing the UI upward and updating data downward. The overall framework is as follows:

![ArkUI Development Model Diagram](./figures/arkui开发模式图.png)

### View Layer

- **Page Components**: Most applications are categorized by pages, such as login pages, list pages, edit pages, help pages, copyright pages, etc. The data required for each page may be completely different, or multiple pages may share the same set of data.
- **Business Components**: Functional components that inherently possess part of the application's business capabilities. Typically, these components are associated with data from the ViewModel of the current project and cannot be shared with other projects.
- **General Components**: Like system components, these components are not associated with data from the ViewModel of the current application. They can be shared across multiple projects to implement relatively general functionalities.

### ViewModel Layer

**Page Data**: Data organized by pages. When users browse pages, some pages may not be displayed. Therefore, this page data is best designed in a lazy-loading (on-demand) mode.

**Difference Between ViewModel Layer Data and Model Layer Data**:

- **Model Layer Data**: Data organized for the entire project, serving as the complete business data of the application.
- **ViewModel Layer Data**: Data provided for use on specific pages, which may be a subset of the application's business data. Additionally, the ViewModel layer can include auxiliary data for page display, which may be entirely unrelated to the application's business logic and merely facilitates page presentation.

### Model Layer

The Model layer is the original data provider of the application.

## Core Architectural Principles

### No Cross-Layer Access

- The **View layer** cannot directly call data from the **Model layer**; it must use methods provided by the ViewModel.
- **Model layer** data cannot directly manipulate the UI. The Model layer can only notify the ViewModel layer of data updates, and the ViewModel layer updates the corresponding data.

### Lower Layers Cannot Access Upper Layer Data

Data in lower layers updates upper layer data through notification patterns. In business logic, lower layers cannot directly write code to access upper layer data. For example, the logic processing in the ViewModel layer cannot depend on a value from the View layer interface.

### No Direct Access Between Non-Parent-Child Components

This is a core principle for the View layer design. A component should adhere to the following logic:

- **Direct access to parent components is prohibited** (must use events or subscription capabilities).
- **Direct access to sibling components is prohibited**. This is because a component should only access its visible child nodes (via parameters) and parent nodes (via events or notifications), thereby decoupling components.

The reasons for designing a component this way are:

- The child components a component uses are explicit, so they can be accessed.
- The parent node under which a component is placed is unknown, so accessing the parent node can only be done through notifications or events.
- A component cannot know who its sibling nodes are, so it cannot manipulate sibling nodes.

## Practical Development of a Memo Application

This section demonstrates how to design an application using the ArkUI framework through the development of a memo application. This section does not design the code architecture upfront but develops features on demand, without considering future maintenance. It also introduces the decorators required for feature development.

### State Variables

- The `@State` decorator is the most commonly used decorator for defining state variables, typically serving as the data source for parent components. When developers click, the state variables are updated, thereby refreshing the UI. Removing `@State` disables UI refresh support.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    @State
    var isFinished: Bool = false
    func build(){
        Column{
            Row(){
                Text("All Todos")
                .fontSize(30)
                .fontWeight(FontWeight.Bold)
            }
            .width(100.percent)
            .margin(top: 40.vp, bottom: 10.vp, left: 50.vp)

            // Todo Item
            Row(15){
                if(this.isFinished){
                    // 'app.media.ic_public_todo_filled' is only an example. Developers should replace it; otherwise, imageSource creation failure will prevent normal execution.
                    Image(@r(app.media.ic_public_todo_filled))
                    .width(28)
                    .height(28)
                }
                else{
                    // 'app.media.ic_public_todo' is only an example. Developers should replace it; otherwise, imageSource creation failure will prevent normal execution.
                    Image(@r(app.media.ic_public_todo))
                    .width(28)
                    .height(28)
                }
                Text('Learn Advanced Mathematics')
                .fontSize(24)
                .fontWeight(FontWeight.Bold)
                .decoration(decorationType: if(this.isFinished){TextDecorationType.LineThrough}else {TextDecorationType.None}, color: Color.BLACK, decorationStyle: TextDecorationStyle.SOLID)
            }
            .width(100.percent)
            .margin(left: 60, top: 15)
            .onClick({event => this.isFinished = !this.isFinished})
        }
        .height(100.percent)
        .width(100.percent)
        .backgroundColor(0x90f1f3f5)
    }
}
```

![mvvm_state](./figures/mvvm_state.gif)

### Roles of @Prop and @Link

In the above example, all code is written in the `@Entry` component. As the number of components to render increases, the `@Entry` component must be split. For this purpose, child components need to use the `@Prop` and `@Link` decorators:

- `@Prop`: Unidirectional transfer between parent and child components. Child components deep-copy parent component data, which can be updated from the parent or by itself but will not synchronize with the parent component data.
- `@Link`: Bidirectional transfer between parent and child components. Changes in the parent component notify all `@Link` variables, and updates to `@Link` variables also notify the corresponding parent component variables to refresh.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.*
import kit.LocalizationKit.*

@Component
class TodoComponent {
    func build(){
        Row(){
            Text('All Todos')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .width(100.percent)
        .margin(top: 40.vp, bottom: 10.vp, left: 50.vp)
    }
}

@Component
class AllChooseComponent {
    @Link var isFinished: Bool;

    func build(){
        Row(){
            Button("Select All", ButtonOptions(shape: ButtonType.Capsule))
            .onClick({event => this.isFinished = !this.isFinished})
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .backgroundColor(0xf7f6cc74)
        }
        .width(100.percent)
        .margin(top: 10.vp, left: 60.vp)
    }
}

@Component
class ThingsComponent1 {
    @Prop var isFinished: Bool;

    func build(){
        Row(15){
            if(this.isFinished){
                // 'app.media.ic_public_todo_filled' is only an example. Developers should replace it; otherwise, imageSource creation failure will prevent normal execution.
                Image(@r(app.media.ic_public_todo_filled))
                .width(28)
                .height(28)
            }
            else{
                // 'app.media.ic_public_todo' is only an example. Developers should replace it; otherwise, imageSource creation failure will prevent normal execution.
                Image(@r(app.media.ic_public_todo))
                .width(28)
                .height(28)
            }
            Text("Learn Chinese")
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .decoration(decorationType: if(this.isFinished){TextDecorationType.LineThrough}else {TextDecorationType.None}, color: Color.BLACK, decorationStyle: TextDecorationStyle.SOLID)
        }
        .width(100.percent)
        .margin(left: 60, top: 15)
        .onClick({event => this.isFinished = !this.isFinished})
    }
}

@Component
class ThingsComponent2 {
    @Prop var isFinished: Bool;

    func build(){
        Row(15){
            if(this.isFinished){
                // 'app.media.ic_public_todo_filled' is only an example. Developers should replace it; otherwise, imageSource creation failure will prevent normal execution.
                Image(@r(app.media.ic_public_todo_filled))
                .width(28)
                .height(28)
            }
            else{
                // 'app.media.ic_public_todo' is only an example. Developers should replace it; otherwise, imageSource creation failure will prevent normal execution.
                Image(@r(app.media.ic_public_todo))
                .width(28)
                .height(28)
            }
            Text("Learn Advanced Mathematics")
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .decoration(decorationType: if(this.isFinished){TextDecorationType.LineThrough}else {TextDecorationType.None}, color: Color.BLACK, decorationStyle: TextDecorationStyle.SOLID)
        }
        .width(100.percent)
        .margin(left: 60, top: 15)
        .onClick({event => this.isFinished = !this.isFinished})
    }
}

@Entry
@Component
class EntryView {
    @State
    var isFinished: Bool = false;

    func build() {
        Column(){

            // All Todos
            TodoComponent()

            // Select All
            AllChooseComponent(isFinished: this.isFinished)

            // Todo Item 1
            ThingsComponent1(isFinished: this.isFinished)

            // Todo Item 2
            ThingsComponent2(isFinished: this.isFinished)
        }
        .height(100.percent)
        .width(100.percent)
        .margin(top: 5, bottom: 5)
        .backgroundColor(0x90f1f3f5)
    }
}
```

![mvvm_proplink](./figures/mvvm_proplink.gif)

### Loop Rendering Components

Although the previous example splits components, it is evident that Component 1 and Component 2 have very similar code. When rendering components with identical settings except for data, `ForEach` loops should be used for rendering.

Using `ForEach` reduces redundant code and makes the structure clearer.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*

@Component
class TodoComponent {
    func build(){
        Row(){
            Text('All Todos')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .width(100.percent)
        .margin(top: 40.vp, bottom: 10.vp, left: 50.vp)
    }
}

@Component
class AllChooseComponent {
    @Link var isFinished: Bool;
    func build(){
        Row(){
            Button("Select All", ButtonOptions(shape: ButtonType.Capsule))
            .onClick({event => this.isFinished = !this.isFinished})
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .backgroundColor(0xf7f6cc74)
        }
        .width(100.percent)
        .margin(top: 10.vp, left: 60.vp)
    }
}

@Component
class ThingsComponent {
    @Prop var isFinished: Bool;
    @Prop var things: String;
    func build(){
        Row(15){
            if(this.isFinished){
                // 'app.media.ic_public_todo_filled' here is only an example. Developers should replace it themselves, otherwise imageSource creation failure will prevent normal execution.
                Image(@r(app.media.ic_public_todo_filled))
                .width(28)
                .height(28)
            }
            else{
                // 'app.media.ic_public_todo' here is only an example. Developers should replace it themselves, otherwise imageSource creation failure will prevent normal execution.
                Image(@r(app.media.ic_public_todo))
                .width(28)
                .height(28)
            }
            Text(this.things)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .decoration(decorationType: if(this.isFinished){TextDecorationType.LineThrough}else {TextDecorationType.None}, color: Color.BLACK, decorationStyle: TextDecorationStyle.SOLID)
        }
        .height(8.percent)
        .width(90.percent)
        .border(width: 1)
        .padding(left: 15)
        .opacity(if(this.isFinished){0.3} else{1.0})
        .borderColor(Color.WHITE)
        .borderRadius(25)
        .backgroundColor(Color.WHITE)
        .onClick({event => this.isFinished = !this.isFinished})
    }
}

@Entry
@Component
class EntryView {
    @State var isFinished: Bool = false;
    @State var planList: Array<String> = [
        '7.30 Wake up',
        '8.30 Breakfast',
        '11.30 Lunch',
        '17.30 Dinner',
        '21.30 Supper',
        '22.30 Shower',
        '1.30 Wake up'
        ]

    func build() {
        Column(){
            // All todos
            TodoComponent()

            // Select All
            AllChooseComponent(isFinished: this.isFinished)

            List(){
                ForEach(
                    this.planList, {item: String, _:Int64 =>
                        ListItem(){
                            // Todo item
                            ThingsComponent(isFinished: this.isFinished, things: item)
                        }.margin(top: 10.vp).width(100.percent)
                    }
                )
            }.margin(left: 10.vp, right: 10.vp)

        }
        .height(100.percent)
        .width(100.percent)
        .backgroundColor(0x90f1f3f5)
    }
}
```

![mvvm_foreach](./figures/mvvm_foreach.gif)

### Builder Method

The Builder method is used to define methods within components, enabling code reuse within the component.

This example not only uses the @Builder method for deduplication but also moves data out. It can be seen that the code is now clearer and more readable. Compared to the initial code, the @Entry component is primarily used for handling page construction logic, without dealing with large amounts of content unrelated to page design.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*

@Observed
class TodoListData{
    var planList: Array<String> = [
        '7.30 Wake up',
        '8.30 Breakfast',
        '11.30 Lunch',
        '17.30 Dinner',
        '21.30 Supper',
        '22.30 Shower',
        '1.30 Wake up'
        ]
}

@Component
class TodoComponent{
    func build(){
        Row(){
            Text('All Todos')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .width(100.percent)
        .margin(top: 40.vp, bottom: 10.vp, left: 50.vp)
    }
}

@Component
class AllChooseComponent {
    @Link var isFinished: Bool;

    func build(){
        Row(){
            Button("Select All", ButtonOptions(shape: ButtonType.Capsule))
            .onClick({event => this.isFinished = !this.isFinished})
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .backgroundColor(0xf7f6cc74)
        }
        .width(100.percent)
        .margin(top: 10.vp, left: 60.vp)
    }
}

@Component
class ThingsComponent{
    @Prop var isFinished: Bool
    @Prop var things: String

    @Builder
    func displayIcon(icon: AppResource){
        Image(icon)
        .width(28.vp)
        .height(28.vp)
        .onClick({event => this.isFinished = !this.isFinished})
    }

    func build(){
        Row(15){
            if(this.isFinished){
                // 'app.media.ic_public_todo_filled' here is only an example. Developers should replace it themselves, otherwise imageSource creation failure will prevent normal execution.
                this.displayIcon(@r(app.media.ic_public_todo_filled))
            }
            else{
                // 'app.media.ic_public_todo' here is only an example. Developers should replace it themselves, otherwise imageSource creation failure will prevent normal execution.
                this.displayIcon(@r(app.media.ic_public_todo))
            }
            Text(this.things)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .decoration(decorationType: if(this.isFinished){TextDecorationType.LineThrough}else {TextDecorationType.None}, color: Color.BLACK, decorationStyle: TextDecorationStyle.SOLID)
            .onClick({event => this.things += '啦'})
        }
        .height(8.percent)
        .width(90.percent)
        .padding(left: 15.vp)
        .opacity(if(this.isFinished){0.3} else{1.0})
        .border(width: 1)
        .borderColor(Color.WHITE)
        .borderRadius(25)
        .backgroundColor(Color.WHITE)
    }
}

@Entry
@Component
class EntryView{
    @State var isFinished = false
    @State var data: TodoListData = TodoListData()

    func build(){
        Column(){
            TodoComponent()

            AllChooseComponent(isFinished: this.isFinished)

            List(){
                ForEach(
                    this.data.planList, {item: String, _:Int64 =>
                        ListItem(){
                            ThingsComponent(isFinished: this.isFinished, things: item)
                        }.margin(top: 10.vp).width(100.percent)
                    }
                )
            }.margin(left: 10.vp, right: 10.vp)

        }
        .height(100.percent)
        .width(100.percent)
        .backgroundColor(0x90f1f3f5)
    }
}
```

The effect is as follows:

![mvvm_builder](./figures/mvvm_builder.gif)

### Summary

Through step-by-step optimization of the code structure, it can be seen that the @Entry component, as the entry point of the page, should only need to consider combining the required components, similar to building blocks, assembling the needed components. The subcomponents called by the page are like building blocks, waiting to be called by the required page. State variables act like glue; when a UI refresh event is triggered, the state variables automatically refresh the corresponding bound components, thereby achieving on-demand page refresh.

Although the existing architecture does not use MVVM design concepts, the core idea of MVVM is already emerging. This is why ArkUI's UI development is inherently suited to the MVVM pattern. The page and components constitute the View layer, with the page responsible for assembling the components, which are the building blocks organized by the page. Components need to refresh, driven by state variables to update the page. The data in the ViewModel needs a source, which is provided by the Model layer.

The functionality in the example code is still relatively simple, but it already feels that as more features are added, the main page's code grows increasingly larger. When more features need to be added to the memo, and other pages need to use the main page's components, how should the project structure be organized? The MVVM pattern is the preferred choice for organization.

## Memo Development Practice with MVVM

[Memo Development Practice](#Memo-Development-Practice) demonstrates how to organize code in a non-MVVM pattern. It can be felt that as the main page's code becomes increasingly bulky, reasonable layering should be adopted to make the project structure clear, with components not referencing each other, which could lead to widespread impacts during later maintenance and increase the difficulty of future feature updates. Therefore, this chapter introduces the core file organization mode of MVVM, showing developers how to use MVVM to organize the code from the previous chapter.

### Layered Design Techniques

#### Model Layer

The Model layer stores the core data structure of the application. This layer itself is not closely related to UI development, allowing users to encapsulate it according to their business logic.

#### ViewModel Layer

> **Note:**
>
> The ViewModel layer is not just for storing data; it also needs to provide data services and processing. Therefore, many frameworks express this layer as "service."

The ViewModel layer is the data layer serving the view. Its design generally has two characteristics:

1. Organize data according to pages.
2. Lazy load data for each page.

#### View Layer

The View layer is organized as needed, but it should distinguish between the following three types of components:

- Page components: Provide overall page layout, implement multi-page navigation, handle foreground and background events, and other page-related content.
- Business components: Referenced by pages to construct the page.
- Shared components: Multi-project shared components unrelated to the project.

Differences between shared components and business components:

Business components contain ViewModel layer data; without the ViewModel, these components cannot run.

Shared components: Do not contain ViewModel layer data; required data is passed in from outside. Shared components include custom components that can work as long as external parameters (non-business parameters) are satisfied.

### Code Example

Now, reorganize the structure according to the MVVM pattern as follows:

- src
    - main
        - cangjie
            - model
                - thing_model.cj
                - todolist_model.cj
            - view
                - index.cj
                - allchoose_component.cj
                - thing_component.cj
                - todo_component.cj
                - todolist_component.cj
            - view_model
                - thing_viewmodel.cj
                - todolist_viewmodel.cj

File code is as follows:

- index.cj


    ```cangjie
    package ohos_app_cangjie_entry.view

    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*
    import ohos_app_cangjie_entry.view_model.*

    @Entry
    @Component

    class EntryView {
        @State var thingsTodo: TodoListViewModel = TodoListViewModel()

        public func aboutToAppear() {
            this.thingsTodo.loadTasks()
        }

        func build() {
            Column() {
                Row {
                    TodoComponent()
                    AllChooseComponent(thingsViewModel: this.thingsTodo)
                }
                Column() {
                    TodoListComponent(thingViewModelArray: this.thingsTodo.thingViewModelArray)
                }
            }
            .height(100.percent)
            .width(100.percent)
            .backgroundColor(0x90f1f3f5)
        }
    }
    ```

- thing_model.cj


    ```cangjie
    package ohos_app_cangjie_entry.model

    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Observed
    public class ThingModel {
        @Publish public var thingName: String = "Todo"
        @Publish public var isFinish: Bool = false
    }
    ```

- todolist_model.cj


    ```cangjie
    package ohos_app_cangjie_entry.model

    public class TodoListModel {
        public var things: Array<ThingModel> = []

        public init(things: Array<ThingModel>) {
            this.things = things
        }

        public func loadTasks() {
            this.things = [
                ThingModel(thingName: "7:30 Wake up", isFinish: false),
                ThingModel(thingName: "8:30 Breakfast", isFinish: false),
                ThingModel(thingName: "11:30 Lunch", isFinish: false),
                ThingModel(thingName: "17:30 Dinner", isFinish: false),
                ThingModel(thingName: "21:30 Supper", isFinish: false),
                ThingModel(thingName: "22:30 Shower", isFinish: false),
                ThingModel(thingName: "1:30 Sleep", isFinish: false)
                ]
        }
    }
    ```

- allchoose_component.cj


    ```cangjie
    package ohos_app_cangjie_entry.view

    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*
    import ohos_app_cangjie_entry.view_model.*

    @Component
    public class AllChooseComponent {
        @State var titleName: String = "Select All"
        @Link var thingsViewModel: TodoListViewModel = TodoListViewModel(isChoosen: false, thingViewModelArray: ObservedArrayList<ThingViewModel>())

        func build() {
            Row() {
                Button(this.titleName, ButtonOptions(shape: ButtonType.Capsule))
                .onClick({ =>
                    this.thingsViewModel.chooseAll()
                    this.titleName = if (!this.thingsViewModel.isChoosen) {"Select All"} else {"Deselect All"}
                })
                .fontSize(30)
                .fontWeight(FontWeight.Bold)
                .backgroundColor(0xf7f6cc74)
            }
            .width(40.percent)
            .margin(top: 40.vp, bottom: 10.vp, left: 30.vp)
        }
    }
    ```

- thing_component.cj


    ```cangjie
    package ohos_app_cangjie_entry.view

    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*
    import kit.LocalizationKit.*
    import ohos_app_cangjie_entry.view_model.*

    @Component
    public class ThingComponent  {
        @Link var thingViewModel: ThingViewModel

        @Builder
        func displayIcon(icon: AppResource) {
            Image(icon)
            .width(28)
            .height(28)
            .onClick({ evt: ClickEvent =>
            this.thingViewModel.updateIsFinish()
            })
        }

        func build() {
            Row(15){
                if(this.thingViewModel.isFinish){
                    // The 'app.media.ic_public_todo_filled' here is for demonstration only. Developers should replace it themselves, otherwise imageSource creation failure will prevent subsequent normal execution.
                    this.displayIcon(@r(app.media.ic_public_todo_filled))
                }
                else{
                    // The 'app.media.ic_public_todo' here is for demonstration only. Developers should replace it themselves, otherwise imageSource creation failure will prevent subsequent normal execution.
                    this.displayIcon(@r(app.media.ic_public_todo))
                }
                Text(this.thingViewModel.thingName)
                .fontSize(24)
                .fontWeight(FontWeight.Bold)
                .decoration(decorationType: if(this.thingViewModel.isFinish) {TextDecorationType.LineThrough} else {TextDecorationType.None}, color: Color.BLACK, decorationStyle: TextDecorationStyle.SOLID)
                .onClick({event => this.thingViewModel.addSuffixes()})
            }
            .height(8.percent)
            .width(95.percent)
            .margin(top: 10.vp, left: 10.vp, right: 10.vp)
            .padding(left: 15.vp)
            .opacity(if(this.thingViewModel.isFinish) {0.3} else {1.0})
            .border(width: 1)
            .borderColor(Color.WHITE)
            .borderRadius(25)
            .backgroundColor(Color.WHITE)
        }
    }
    ```

- todo_component.cj


    ```cangjie
    package ohos_app_cangjie_entry.view

    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*

    @Component
    public class TodoComponent {
        func build() {
            Row() {
                Text('All Todos')
                .fontSize(30)
                .fontWeight(FontWeight.Bold)
            }
            .width(40.percent)
            .margin(top: 40.vp, bottom: 10.vp, left: 30.vp)
        }
    }
    ```

- todolist_component.cj


    ```cangjie
    package ohos_app_cangjie_entry.view

    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*
    import ohos_app_cangjie_entry.view_model.*

    @Component
    public class TodoListComponent {
        @Link var thingViewModelArray: ObservedArrayList<ThingViewModel>

        func build() {
            Column() {
                List() {
                    ForEach(
                        this.thingViewModelArray, {item: ThingViewModel, _:Int64 =>
                            ListItem() {
                                ThingComponent(thingViewModel: item)
                            }
                        }
                    )
                }
            }
            .width(100.percent)
        }
    }
    ```

- thing_viewmodel.cj


    ```cangjie
    package ohos_app_cangjie_entry.view_model

    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*
    import ohos_app_cangjie_entry.model.*

    @Observed
    public class ThingViewModel {
        @Publish public var thingName: String = "Todo"
        @Publish public var isFinish: Bool = false

        public func updateTask(thing: ThingModel) {
            this.thingName = thing.thingName
            this.isFinish = thing.isFinish
        }

        public func updateIsFinish(): Unit {
            this.isFinish = !this.isFinish
        }

        public func addSuffixes(): Unit {
            this.thingName += '啦'
        }
    }
    ```

- todolist_viewmodel.cj


    ```cangjie
    package ohos_app_cangjie_entry.view_model

    import kit.ArkUI.*
    import ohos.arkui.state_macro_manage.*
    import ohos_app_cangjie_entry.model.*

    @Observed
    public class TodoListViewModel {
        @Publish public var isChoosen: Bool = false
        @Publish public var thingViewModelArray: ObservedArrayList<ThingViewModel> = ObservedArrayList<ThingViewModel>()

        public func loadTasks() {
            let todoList = TodoListModel([])
            todoList.loadTasks()
            for (thing in todoList.things) {
                let thingsViewModel = ThingViewModel()
                thingsViewModel.updateTask(thing)
                this.thingViewModelArray.append(thingsViewModel)
            }
        }

        public func chooseAll(): Unit {
            this.isChoosen = !this.isChoosen
            for (i in 0..this.thingViewModelArray.size) {
                this.thingViewModelArray[i].isFinish = this.isChoosen
            }
        }
    }
    ```

After refactoring with the MVVM pattern, the project structure becomes clearer with more distinct responsibilities for each module. If new pages need to use event components, such as the TodoListComponent, simply import the component.

The effect is shown below:

![mvvm_example](./figures/mvvm_example.gif)
```