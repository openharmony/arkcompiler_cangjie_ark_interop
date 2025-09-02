# Declarative UI Description  

The Cangjie programming language uses a declarative approach to compose and extend components for describing application UIs. It also provides basic property, event, and child component configuration methods to help developers implement application interaction logic.  

## Building Components  

Depending on the component construction method, creating components can be done with or without parameters.  

### Without Parameters  

If a component's interface definition does not include mandatory construction parameters, the "()" after the component does not need to contain any configuration. For example, the Divider component does not include construction parameters.  

<!-- run-->  

```cangjie  
package ohos_app_cangjie_entry  

import kit.ArkUI.*  
import ohos.arkui.state_macro_manage.*  

@Entry  
@Component  
class EntryView {  
    func build() {  
        Column() {  
            Text("item 1")  
            Divider()  
            Text("item 2")  
        }  
    }  
}  
```  

### With Parameters  

If a component's interface definition includes construction parameters, the corresponding parameters must be configured within the "()" after the component.  

- The mandatory `src` parameter for the Image component.  

  ```cangjie  
  Image("https://xyz/test.jpg")  
  ```  

- The optional `content` parameter for the Text component.  

  ```cangjie  
  // String-type parameter  
  Text("test")  
  // @r notation for referencing application resources, applicable to multilingual scenarios  
  Text(@r(app.string.title_value))  
  // Parameterless form  
  Text() {}  
  ```  

- Variables or expressions can also be used for parameter assignment, provided the result type of the expression meets the parameter type requirements.  

  For example, setting variables or expressions to construct parameters for the Image and Text components.  

  ```cangjie  
  Image(this.imagePath)  
  Image("https://" + this.imageUrl)  
  Text("count: ${this.count}")  
  ```  

## Configuring Properties  

Property methods are configured using chained calls with "." notation. It is recommended to write each property method on a separate line.  

- Configuring the font size for the Text component.  

  ```cangjie  
  Text("test")  
    .fontSize(12)  
  ```  

- Configuring multiple properties for a component.  

  ```cangjie  
  Image("test.jpg")  
    .alt("error.jpg")  
    .width(100)  
    .height(100)  
  ```  

- In addition to passing constant parameters directly, variables or expressions can also be passed.  

  ```cangjie  
  Text("hello")  
    .fontSize(this.size)  
  Image("test.jpg")  
    .width(if(this.count % 2 == 0) {100} else {200})  
    .height(this.offset + 100)  
  ```  

- For system components, the Cangjie programming language also predefines some enumeration types for developers to use. Enumeration types can be passed as parameters but must meet the parameter type requirements.  

  For example, configuring the color and font style of the Text component can be done as follows:  

  ```cangjie  
  Text("hello")  
    .fontSize(20)  
    .fontColor(Color.RED)  
    .fontWeight(FontWeight.Bold)  
  ```  

## Configuring Events  

Event methods are configured using chained calls with "." notation. It is recommended to write each event method on a separate line.  

- Using arrow functions to configure component event methods.  

  ```cangjie  
  Button("Click me")  
  .onClick({ =>  
    this.myText = "Cangjie"  
  })  
  ```  

- Using arrow function expressions to configure component event methods requires the use of "{ => ...}" to ensure the function is bound to the component and complies with the Cangjie programming language syntax.  

  ```cangjie  
  Button("add counter")  
    .onClick({ =>  
      this.counter += 2  
    })  
  ```  

- Using declared Lambda expressions, which can be called directly.  

  ```cangjie  
  var fn: () -> Unit = {=>}  
  protected func aboutToAppear() {  
      fn = { =>  
          this.counter++  
      }  
  }  
  ...  
  Button("add counter")  
    .onClick(fn)  
  ```  

> **Note:**  
>  
> The `this` inside an arrow function is lexically scoped and determined by the context. Anonymous functions may have ambiguous `this` binding and are not allowed in the Cangjie programming language.  

## Configuring Child Components  

If a component supports child component configuration, the child component UI description must be added within the trailing closure "{...}". Components such as Column, Row, Stack, Grid, and List are container components.  

Below is a simple example of configuring child components for a Column component.  

```cangjie  
Column() {  
  Text("Hello")  
    .fontSize(100)  
  Divider()  
  Text(this.myText)  
    .fontSize(100)  
    .fontColor(Color.RED)  
}  
```  

Container components all support child component configuration, enabling relatively complex multi-level nesting.  

```cangjie  
Column() {  
  Row() {  
    Image("test1.jpg")  
      .width(100)  
      .height(100)  
    Button("click +1")  
      .onClick({ =>  
        AppLog.info("+1 clicked!");  
      })  
  }  
}  
```