# if/else: Conditional Rendering  

Cangjie provides the capability for rendering control. Conditional rendering allows displaying UI content corresponding to different application states using `if`, `else`, and `else if` statements.

## Usage Rules  

- Supports `if`, `else`, and `else if` statements.  

- The conditional statements following `if` and `else if` can use state variables or regular variables (state variables: changes in value can trigger real-time UI updates; regular variables: changes in value do not trigger real-time UI updates).  

- Permitted within container components to construct different child components through conditional rendering statements.  

- Conditional rendering statements are "transparent" when it comes to parent-child relationships between components. When one or more `if` statements exist between a parent and child component, the rules regarding child component usage by the parent component must be followed.  

- The build function within each branch must adhere to the rules of build functions and create one or more components. Empty build functions that fail to create components will result in syntax errors.  

- Certain container components impose restrictions on the type or number of child components. When conditional rendering statements are used within such components, these restrictions also apply to the components created within the conditional rendering statements. For example, the [Grid](../../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-grid.md) container component only supports [GridItem](../../../../API_Reference/source_zh_cn/arkui-cj/cj-scroll-swipe-griditem.md) as child components. When using conditional rendering statements within a Grid, only GridItem components are allowed inside the conditional rendering statements.  

## Update Mechanism  

When the state variables used in the conditional statements following `if` or `else if` change, the conditional rendering statements will update. The update process is as follows:  

1. Evaluate the conditions of `if` and `else if`. If the branch conditions remain unchanged, no further steps are required. If the branch conditions change, proceed to steps 2 and 3.  

2. Remove all previously constructed child components.  

3. Execute the build function of the new branch and add the resulting components to the parent container of the `if` statement. If no applicable `else` branch exists, nothing will be constructed.  

Conditions can include Cangjie expressions. For expressions within build functions, such expressions must not modify the application state.  

## Usage Scenarios  

### Using `if` for Conditional Rendering  

 <!-- run -->  

```cangjie  
package ohos_app_cangjie_entry  
import kit.ArkUI.*  
import ohos.arkui.state_macro_manage.*  

@Entry  
@Component  
class EntryView {  
  @State var count: Int64 = 0;  
  func build() {  
    Column() {  
      Text("count=${this.count}")  

      if (this.count > 0) {  
        Text("count is positive")  
          .fontColor(Color.GREEN)  
      }  

      Button('increase count')  
        .onClick({ =>  
          this.count++;  
        })  

      Button('decrease count')  
        .onClick({ =>  
          this.count--;  
        })  
    }  
  }  
}  
```  

Each branch of an `if` statement contains a build function. Such build functions must create one or more child components. During initial rendering, the `if` statement executes the build function and adds the generated child components to its parent component.  

Whenever the state variables used in the `if` or `else if` conditions change, the conditional statements are updated and re-evaluated. If the evaluation result changes, it means another conditional branch needs to be constructed. At this point, the ArkUI framework will:  

1. Remove all previously rendered components (from the earlier branch).  

2. Execute the build function of the new branch and add the generated child components to the parent component.  

In the above example, if `count` increases from 0 to 1, the `if` statement updates, and the condition `count > 0` is re-evaluated, changing from `false` to `true`. Thus, the build function of the `true` branch is executed, creating a `Text` component and adding it to the parent `Column` component. If `count` later changes to 0, the `Text` component is removed from the `Column` component. Since there is no `else` branch, no new build function is executed.  

### `if ... else ...` Statements and Child Component State  

The following example demonstrates an `if ... else ...` statement with child components that have `@State` decorated variables.  

 <!-- run -->  

```cangjie  
package ohos_app_cangjie_entry  
import kit.ArkUI.*  
import ohos.arkui.state_macro_manage.*  
internal import ohos.base.*  
internal import ohos.component.*  

@Component  
public class CounterView {  
      @State var counter: Int64 = 0;  
      var label: String = 'unknown';  
      func build() {  
        Column(20) {  
          Text("${this.label}")  
          Button("counter ${this.counter} +1")  
            .onClick({ =>  
              this.counter += 1;  
            })  
        }  
        .margin(10)  
        .padding(10)  
        .border( width: 1 )  
      }  
}  

@Entry  
@Component  
public class EntryView {  
    @State var toggle: Bool = true;  
    func build() {  
      Column() {  
        if (this.toggle) {  
          CounterView( label: "CounterView #positive" )  
        } else {  
          CounterView( label: "CounterView #negative" )  
        }  
        Button("toggle ${this.toggle}")  
          .onClick({ =>  
            this.toggle = !this.toggle;  
          })  
      }  
      .width(100.percent)  
      .justifyContent(FlexAlign.Center)  
    }  
}  
```  

The `CounterView` (labeled `'CounterView #positive'`) child component is created during initial rendering. This child component carries a state variable named `counter`. When the `CounterView.counter` state variable is modified, the `CounterView` (labeled `'CounterView #positive'`) child component re-renders and retains the state variable value. When the `MainView.toggle` state variable changes to `false`, the `if` statement within the `MainView` parent component updates, and the `CounterView` (labeled `'CounterView #positive'`) child component is removed. Simultaneously, a new `CounterView` (labeled `'CounterView #negative'`) instance is created, with its own `counter` state variable initialized to `0`.  

> **Note:**  
>  
> `CounterView` (labeled `'CounterView #positive'`) and `CounterView` (labeled `'CounterView #negative'`) are two different instances of the same custom component. Changes to the `if` branch do not update existing child components or preserve their state.  

The following example demonstrates modifications to preserve the `counter` value when conditions change.  

 <!-- run -->  

```cangjie  
package ohos_app_cangjie_entry  
import kit.ArkUI.*  
import ohos.arkui.state_macro_manage.*  
internal import ohos.base.*  
internal import ohos.component.*  

@Component  
class CounterView {  
    @Link var counter: Int64;  
    var label: String = 'unknown';  

    func build() {  
      Column( 20 ) {  
        Text("${this.label}")  
          .fontSize(20)  
        Button("counter ${this.counter} +1")  
          .onClick({ =>  
            this.counter += 1;  
          })  
      }  
      .margin(10)  
      .padding(10)  
      .border(width:1)  
    }  
}  

@Entry  
@Component  
public class EntryView {  
    @State var toggle: Bool = true;  
    @State var counter: Int64 = 0;  
    func build() {  
      Column() {  
        if (this.toggle) {  
          CounterView( counter: counter, label: 'CounterView #positive' )  
        } else {  
          CounterView( counter: counter, label: 'CounterView #negative' )  
        }  
        Button("toggle ${this.toggle}")  
          .onClick({ =>  
            this.toggle = !this.toggle;  
          })  
      }  
      .width(100.percent)  
      .justifyContent(FlexAlign.Center)  
    }  
}  
```  

Here, the `@State counter` variable is owned by the parent component. Thus, when the `CounterView` component instance is removed, the variable is not destroyed. The `CounterView` component references the state via the `@Link` decorator. The state must be moved from the child to its parent (or the parent's parent) to avoid losing state when conditional content or repeated content is destroyed.  

### Nested `if` Statements  

Nested conditional statements do not affect the relevant rules of the parent component.  

 <!-- run -->  

```cangjie  
package ohos_app_cangjie_entry  
import kit.ArkUI.*  
import ohos.arkui.state_macro_manage.*  
internal import ohos.base.*  
internal import ohos.component.*  
@Entry  
@Component  
public class EntryView {  
    @State var toggle: Bool = false;  
    @State var toggleColor: Bool = false;  
    func build() {  
      Column( 20 ) {  
        Text('Before')  
          .fontSize(15)  
        if (this.toggle) {  
          Text('Top True, positive 1 top')  
            .backgroundColor(Color.GREEN).fontSize(20)  
          // Inner if statement  
          if (this.toggleColor) {  
            Text('Top True, Nested True, positive COLOR  Nested ')  
              .backgroundColor(Color.GREEN).fontSize(15)  
          } else {  
            Text('Top True, Nested False, Negative COLOR  Nested ')  
              .backgroundColor(Color.BLUE).fontSize(15)  
          }  
        } else {  
          Text('Top false, negative top level').fontSize(20)  
            .backgroundColor(Color.RED)  
          if (this.toggleColor) {  
            Text('positive COLOR  Nested ')  
              .backgroundColor(Color.GREEN).fontSize(15)  
          } else {  
            Text('Negative COLOR  Nested ')  
              .backgroundColor(Color.BLUE).fontSize(15)  
          }  
        }  
        Text('After')  
          .fontSize(15)  
        Button('Toggle Outer')  
          .onClick({ =>  
            this.toggle = !this.toggle;  
          })  
        Button('Toggle Inner')  
          .onClick({ =>  
            this.toggleColor = !this.toggleColor;  
          })  
      }  
      .width(100.percent)  
      .justifyContent(FlexAlign.Center)  
    }  
}  
```