# @Builder Macro: Custom Build Functions

The Cangjie UI provides a lightweight UI element reuse mechanism called @Builder, which has a fixed internal UI structure and only communicates data with the caller. Developers can abstract reusable UI elements into a method and invoke them within the build method.

For simplicity, functions decorated with @Builder are also referred to as "custom build functions."

Before reading this document, it is recommended to review: [Basic Syntax Overview](./cj-basic-syntax-overview.md), [Declarative UI Description](./cj-declarative-ui-description.md), [Custom Components - Creating Custom Components](./cj-create-custom-components.md).

## Macro Usage Instructions

The @Builder macro can be used in two ways: as a private custom build function defined within a custom component or as a global custom build function defined outside any component.

### Private Custom Build Function

Definition Syntax:

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @Builder
    func showTextBuilder() {
        Text("Hello World")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }

    @Builder
    func showTextValueBuilder(param: String) {
        Text(param)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
    }

    func build() {
        Column {
            // No parameters
            this.showTextBuilder()
            // With parameters
            this.showTextValueBuilder("Hello @Builder")
        }
    }
}
```

Usage Method:

```cangjie
this.showTextBuilder()
```

- Allows defining one or more @Builder methods within a custom component. These methods are considered private, special-type member functions of the component.

- Private custom build functions can be invoked within the custom component, in the build method, and in other custom build functions.

- In the custom function body, `this` refers to the current component, and the component's state variables can be accessed within the custom build function. It is recommended to access the component's state variables via `this` rather than passing them as parameters.

### Global Custom Build Function

Definition Syntax:

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Builder
func showTextBuilder() {
    Text("Hello World")
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
}

@Entry
@Component
class EntryView {

    func build() {
        Column {
            showTextBuilder()
        }
    }
}
```

Usage Method:

```cangjie
showTextBuilder()
```

- If component state changes are not involved, it is recommended to use global custom build methods.

- Global custom build functions can be invoked in the build method and other custom build functions.

## Parameter Passing Rules

Custom build functions support two parameter passing methods: [Pass by Value](#pass-by-value) and [Pass by Reference](#pass-by-reference). Both must adhere to the following rules:

- The parameter type must match the declared type.

- Within a function decorated with @Builder, parameter values must not be modified.

- UI syntax within @Builder must follow [UI Syntax Rules](./cj-create-custom-components.md).

- Only when a single parameter is passed and requires direct object literal input will the parameter be passed by reference. All other cases use pass by value.

### Pass by Value

By default, parameters are passed by value when invoking a function decorated with @Builder. When passing state variables, changes to the state variables will not trigger UI refreshes within the @Builder method. Therefore, when using state variables, [Pass by Reference](#pass-by-reference) is recommended.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Builder
func overBuilder(paramA1: String) {
    Row {
        Text("UseStateVarByValue: ${paramA1}")
    }
}

@Entry
@Component
class EntryView {
    @State var label: String = "Hello"

    func build() {
        Column {
            overBuilder(label)
        }
    }
}
```

### Pass by Reference

When passing parameters by reference, the parameters can be state variables, and changes to the state variables will trigger UI refreshes within the @Builder method.

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Observed
class Tmp {
    @Publish
    var paramA1: String = ""

}

@Builder
func overBuilder(params: Tmp) {
    Row {
        Text("UseStateVarByReference: ${params.paramA1}")
    }
}

@Entry
@Component
class EntryView {
    @State var tmp: Tmp = Tmp(paramA1: "Hello")

    func build() {
        Column {
            // When invoking the overBuilder component in the parent component,
            // pass the parameter to the overBuilder component by reference.
            overBuilder(tmp)
            Button("Click me")
            .onClick({
                _ =>
                // After clicking "Click me," the UI text changes to "ArkUI."
                this.tmp.paramA1 = "ArkUI"
            })
        }
    }
}
```

## Constraints

@Builder triggers dynamic UI rendering only when parameters are passed by reference. Refer to [Pass by Reference](#pass-by-reference).

## Usage Scenarios

### Using Custom Build Functions Within Custom Components

Create a private @Builder method and invoke it within a Column using `this.builder()`. Modify the content of `builder_value` through the `aboutToAppear` lifecycle function and a button click event to achieve dynamic UI rendering.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    @State var builder_value: String = "Hello"

    @Builder
    func builder() {
        Column {
            Text(this.builder_value)
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
    }

    protected override func aboutToAppear() {
        this.builder_value = "Hello World"
    }

    func build() {
        Row {
            Column {
                Text(this.builder_value)
                .fontSize(30)
                .fontWeight(FontWeight.Bold)

                this.builder()
                Button("Click to change builder_value content")
                .onClick({
                    =>
                    this.builder_value = "builder_value was clicked"
                })
            }
        }
    }
}
```

### Using Global Custom Build Functions

Create a global @Builder method and invoke it within a Column using `overBuilder()`. Pass parameters in the form of object literals. Changes to values, whether simple or complex, will trigger UI refreshes.

<!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.ArrayList

@Observed
class ChildTmp {
    @Publish
    var val: Int64 = 1
}

@Observed
class Tmp {
    @Publish
    var tmp_value: ChildTmp = ChildTmp()
    @Publish
    var str_value: String = "Hello"
    @Publish
    var num_value: Int64 = 0
    @Publish
    var arrayTmp_value: ObservedArrayList<ChildTmp> = ObservedArrayList<ChildTmp>()
}

@Builder
func overBuilder(param: Tmp) {
    Column {
        Text("str_value: ${param.str_value}")
        Text("num_value: ${param.num_value}")
        Text("tmp_value: ${param.tmp_value.val}")
        ForEach(
            param.arrayTmp_value,
            itemGeneratorFunc: {
                item: ChildTmp, idx: Int64 => Text("arrayTmp_value: ${item.val}")
            }
        )
    }
}

@Entry
@Component
class EntryView {
    @State
    var objParam: Tmp = Tmp()

    func build() {
        Column {
            Text("Render UI interface by calling @Builder").fontSize(20)
            overBuilder(this.objParam)

            Line()
                .width(100.percent)
                .height(10)
                .backgroundColor(0x000000)
                .margin(10)

            Button("Click to modify parameter values").onClick(
                {
                    _ =>
                    this.objParam.str_value = "Hello World"
                    this.objParam.num_value = 1
                    this.objParam.tmp_value.val = 8
                    let child_value: ChildTmp = ChildTmp(val: 2)
                    this.objParam.arrayTmp_value.append(child_value)
                }
            )
        }
    }
}
```

### Triggering UI refresh by modifying macro-decorated variables

In this scenario, @Builder is only used to display Text components and does not participate in dynamic UI refresh functionality. The value changes in Text components are triggered by macro features that detect value modifications, rather than through @Builder's capabilities.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Observed
class Tmp {
    @Publish var str_value: String = "Hello"
}

@Entry
@Component
class EntryView {
    @State var objParam: Tmp = Tmp()
    @State var label: String = "World"

    @Builder
    func privateBuilder() {
        Column {
            Text("wrapBuilder str_value: ${this.objParam.str_value}")
            Text("wrapBuilder num: ${this.label}")
        }
    }

    func build() {
        Column {
            Text("Render UI interface by calling @Builder")
            .fontSize(20)
            this.privateBuilder()
            Line()
            .width(100.percent)
            .height(10)
            .backgroundColor(0x000000)
            .margin(10)

            Button("Click to modify parameter values")
            .onClick({
                _ =>
                this.objParam.str_value = "str_value: Hello World"
                this.label = "label Hello World"
            })
        }

    }
}
```

### Passing global and local @Builder as customBuilder type

When a parameter type is customBuilder, defined @Builder functions can be passed in because customBuilder is essentially a Function type or Unit type, and @Builder is also a Function type. In this scenario, specific effects are achieved by passing @Builder.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Builder
func myBuilder2() {
    Column {
        Text("Global Builder")
    }
    .width(100.percent)
    .height(100.percent)
    .align(Alignment.Center)
}

@Entry
@Component
class EntryView {
    @State var isShow: Bool = false
    @State var isShow2: Bool = false

    @Builder
    func myBuilder() {
        Column {
            Text("Local Builder")
        }
        .width(100.percent)
        .height(100.percent)
        .align(Alignment.Center)
    }

    func build() {
        Column {
            Button("Local Builder")
            .onClick({
              => this.isShow = true
            })
            .fontSize(20)
            .margin(10)
            .bindSheet(this.isShow, myBuilder, options: SheetOptions(onDisappear: {=> this.isShow = false}) )

            Button("Global Builder")
            .onClick({
              => this.isShow2 = true
            })
            .fontSize(20)
            .margin(10)
            .bindSheet(this.isShow2, myBuilder2, options: SheetOptions(onDisappear: {=> this.isShow2 = false}) )
        }
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.WHITE)
        .width(100.percent)
        .height(100.percent)
    }
}
```

### Nested usage of multi-layer @Builder methods

Call custom components or other @Builder methods within @Builder methods to achieve scenarios where multiple @Builders are nested. To implement dynamic UI refresh functionality for the innermost @Builder, it's necessary to ensure pass-by-reference is used at each layer where @Builder is called.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Observed
class Tmp {
    @Publish var paramA1: String = ""
}

@Builder
func parentBuilder(params: Tmp) {
    Row {
        Text("parentBuilder: ${params.paramA1}")
    }
    childBuilder(params)
}

@Builder
func childBuilder(params: Tmp) {

    Row {
        Text("childBuilder: ${params.paramA1}")
    }
    grandsonBuilder(params)
}

@Builder
func grandsonBuilder(params: Tmp) {

    Row {
        Text("grandsonBuilder: ${params.paramA1}")
    }
}

@Entry
@Component
class EntryView {
    @State var tmp: Tmp = Tmp(paramA1: "Hello")

    func build() {
        Column {
            parentBuilder(this.tmp)
            Text(this.tmp.paramA1)
            Button("Click me")
            .onClick({
                _ =>
                this.tmp.paramA1 = "ArkUI"
            })
        }
    }
}
```