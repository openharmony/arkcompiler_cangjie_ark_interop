# Event Monopolization Control  

Sets whether a component monopolizes events, where the event scope includes both the component's built-in events and developer-defined click, touch, or gesture events.  
Within a window, if a component with monopolization control enabled responds to an event first, only the events set on this component will be allowed to respond during the current interaction. Events on other components within the window will not be triggered.

## func monopolizeEvents(Bool)

```cangjie
public func monopolizeEvents(value: Bool): This
```

**Function:** Sets whether a component monopolizes events.  

**System Capability:** SystemCapability.ArkUI.ArkUI.Full  

**Since:** 19  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| monopolize | Bool | Yes | - | Whether the component monopolizes events.  
  Initial value: false.  
  true: The component monopolizes events.  
  false: The component does not monopolize events.  
  **Note:**  
  1. If the first finger triggers event monopolization on a component, and a second finger is pressed before the first is lifted, the interaction of the second finger will continue under the component's monopolization state, and so on.  
  2. If the developer binds a gesture that triggers simultaneously with child components (e.g., [PanGesture](./cj-universal-gesture-pangesture.md#pangesture)) via [parallelGesture](./cj-universal-gesture-bind.md#binding-gesture-methods), and the child component has monopolization control enabled and responds to the event first, the parent component's gesture will not be triggered. |  

## Example Code  

This example demonstrates how to configure `monopolizeEvents` to control whether a component monopolizes events.  

```cangjie
package ohos_app_cangjie_entry  
import kit.UIKit.*  
import ohos.state_macro_manage.*  

@Entry  
@Component  
class EntryView {  
    @State var message: String = 'set monopolizeEvents false'  
    @State var messageOut: String = ' '  
    @State var messageInner: String = ' '  
    @State var monopolize: Bool = false  

    func build() {  
        Column() {  
            Text(this.message)  
            Text(this.messageOut)  
            Text(this.messageInner)  
            Button('clean').onClick {  
                this.messageOut = " "  
                this.messageInner = " "  
            }  
            Button('change monopolizeEvents')  
                // Toggles the monopolization control property of the inner Column via the button's click event  
                .onClick {  
                this.monopolize = !this.monopolize  
                if (!this.monopolize) {  
                    this.message = "set monopolizeEvents false"  
                } else {  
                    this.message = "set monopolizeEvents true"  
                }  
            }  
            Column {}  
                .width(100.percent)  
                .height(40.percent)  
                .backgroundColor(Color.BLUE)  
                .monopolizeEvents(this.monopolize)  
                .onTouch(  
                    {  
                        event => if (event  
                            .eventType  
                            .toString() == TouchType  
                            .Down  
                            .toString()) {  
                            this.messageInner = "inner column touch down"  
                        }  
                    })  
        }.onTouch(  
            {  
                event => if (event  
                    .eventType  
                    .toString() == TouchType  
                    .Down  
                    .toString()) {  
                    this.messageOut = "inner column touch down"  
                }  
            })  
    }  
}  
```  

![monopolizeEvents](figures/monopolizeEvents.gif)