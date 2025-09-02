# Text Display (Text/Span)

Text is a text component typically used to display user views, such as the textual content of articles. It supports binding custom text selection menus, allowing users to choose different functions as needed. Additionally, it can extend custom menus to enrich available options, further enhancing the user experience. Span is used to render inline text. For specific usage, refer to the documentation for the [Text](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md) and [Span](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-span.md) components.

## Creating Text

Text can be created in the following two ways:

- String literal.

  ```cangjie
  Text('I am a text segment')
  ```

  ![Textdisply](figures/Textdisply.png)

- Referencing AppResource resources.

  Resource reference types can create AppResource objects via @r. The file location is /resources/base/element/string.json, with the following content:

  ```cangjie
  {
    "string": [
      {
        "name": "module_desc",
        "value": "Module description"
      }
    ]
  }
  ```

  ```cangjie
  Text(@r(app.string.module_desc))
    .baselineOffset(0)
    .fontSize(30)
    .border(width: 1)
    .padding(10)
    .width(300)
  ```

  ![Textdisply1](figures/Textdisply1.png)

## Adding Child Components

[Span](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-span.md) can only be displayed as a child component of [Text](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md) and [RichEditor](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-richeditor.md) components to render text content. Multiple Spans can be added within a single Text to display a segment of information, such as product manuals or commitment letters.

- Creating Span.

  The Span component must be embedded within a Text component to be displayed. A standalone Span component will not render any content.

    <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import ohos.arkui.state_macro_manage.*
  import ohos.resource_manager.*

  @Entry
  @Component
  class EntryView {
      func build() {
          Column() {
              Text() {
                  Span("I am Span")
              }
              .padding(10)
              .borderWidth(1)
          }
      }
  }
  ```

  ![Textdisply2](figures/Textdisply2.png)

- Setting text decoration lines and colors.

  Use [decoration](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-span.md#func-decorationtextdecorationtype-resourcecolor) to set text decoration lines and colors.

    <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import ohos.arkui.state_macro_manage.*

  @Entry
  @Component
  class EntryView {
      func build() {
          Scroll {
              Column {
                  Text() {
                      Span('I am Span1,').fontSize(16).fontColor(Color.GREY)
                        .decoration(decorationType: TextDecorationType.LineThrough, color: Color.RED)
                      Span('I am Span2').fontColor(Color.BLUE).fontSize(16)
                        .fontStyle(FontStyle.Italic)
                        .decoration(decorationType: TextDecorationType.Underline, color: Color.BLACK)
                      Span(', I am Span3').fontSize(16). fontColor(Color.GREY)
                        .decoration(decorationType: TextDecorationType.Overline, color: Color.GREEN)
                  }
                  .borderWidth(1)
                  .padding(10)
              }
              .height(100.percent)
              .width(100.percent)
          }
      }
  }
  ```

  ![Textdisply3](figures/Textdisply3.png)

- Use [textCase](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-span.md#func-textcasetextcase) to set text to always remain uppercase or lowercase.

    <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import ohos.arkui.state_macro_manage.*

  @Entry
  @Component
  class EntryView {
      func build() {
          Scroll {
              Column {
                  Text() {
                    Span('I am Upper-span').fontSize(12)
                      .textCase(TextCase.UpperCase)
                  }
                  .borderWidth(1)
                  .padding(10)
              }
              .height(100.percent)
              .width(100.percent)
          }
      }
  }
  ```

  ![Textdisply4](figures/Textdisply4.png)

- Adding events.

  Since the Span component has no dimension information, it only supports adding click events [onClick](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-event-click.md#func-onclickclickevent---unit).

    <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import ohos.arkui.state_macro_manage.*
  import ohos.resource_manager.*

  @Entry
  @Component
  class EntryView {
      func build() {
          Scroll() {
              Column() {
                    Text() {
                        Span('I am Upper-span').fontSize(12)
                            .textCase(TextCase.UpperCase)
                            .onClick{evt =>
                                AppLog.info('I am Span—onClick')
                            }
                    }
              }
          }.height(100.percent).width(100.percent)
      }
  }
  ```

## Customizing Text Styles

- Use the [textAlign](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#textaligntextalign) property to set text alignment styles.

    <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import ohos.arkui.state_macro_manage.*

  @Entry
  @Component
  class EntryView {
      func build() {
          Scroll {
              Column {
                  Text('Left-aligned')
                      .width(300)
                      .textAlign(TextAlign.Start)
                      .border(width: 1)
                      .padding(10)
                  Text('Center-aligned')
                      .width(300)
                      .textAlign(TextAlign.Center)
                      .border(width: 1)
                      .padding(10)
                  Text('Right-aligned')
                      .width(300)
                      .textAlign(TextAlign.End)
                      .border(width: 1)
                      .padding(10)
              }
              .height(100.percent)
              .width(100.percent)
          }
      }
  }
  ```

  ![Textdisply5](figures/Textdisply5.png)

- Use the [textOverflow](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#textoverflowtextoverflow) property to control text overflow handling. textOverflow must be used with [maxLines](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#maxlinesint32) (by default, text automatically wraps).

    <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import ohos.arkui.state_macro_manage.*

  @Entry
  @Component
  class EntryView {
      func build() {
          Scroll {
              Column {
                  Text('This is the setting of textOverflow to Clip text content This is the setting of textOverflow to None text content. This is the setting of textOverflow to Clip text content This is the setting of textOverflow to None text content.')
                      .width(250)
                      .textOverflow(TextOverflow.None)
                      .maxLines(1)
                      .fontSize(12)
                      .border(width: 1)
                      .padding(10)
                  Text('I am an extra-long text, with ellipses displayed for any excess. I am an extra long text, with ellipses displayed for any excess.')
                      .width(250)
                      .textOverflow(TextOverflow.Ellipsis)
                      .maxLines(1)
                      .fontSize(12)
                      .border(width: 1)
                      .padding(10)
                  Text('When the text overflows its dimensions, the text will scroll for displaying. When the text overflows its dimensions, the text will scroll for displaying.')
                      .width(250)
                      .textOverflow(TextOverflow.MARQUEE)
                      .maxLines(1)
                      .fontSize(12)
                      .border(width: 1)
                      .padding(10)
              }
              .height(100.percent)
              .width(100.percent)
          }
      }
  }
  ```

  ![Textdisply6](figures/Textdisply6.gif)

- Use the [lineHeight](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#func-lineheightlength) property to set text line height.

    <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import ohos.arkui.state_macro_manage.*

  @Entry
  @Component
  class EntryView {
      func build() {
          Scroll {
              Column {
                  Text('This is the text with the line height set. This is the text with the line height set.')
                      .width(300).fontSize(12).border(width: 1).padding(10)
                  Text('This is the text with the line height set. This is the text with the line height set.')
                      .width(300).fontSize(12).border(width: 1).padding(10)
                      .lineHeight(20)
              }
              .height(100.percent)
              .width(100.percent)
          }
      }
  }
  ```

  ![Textdisply7](figures/Textdisply7.png)

- Use the [decoration](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#decorationtextdecorationtype-color-textdecorationstyle) property to set text decoration line styles and colors.

    <!-- run -->
```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Scroll {
            Column {
                Text('This is the text')
                    .decoration(
                        decorationType: TextDecorationType.LineThrough,
                        color: Color.RED
                    )
                    .borderWidth(1).padding(10).margin(5)
                Text('This is the text')
                    .decoration(
                        decorationType: TextDecorationType.Overline,
                        color: Color.RED
                    )
                    .borderWidth(1).padding(10).margin(5)
                Text('This is the text')
                    .decoration(
                        decorationType: TextDecorationType.Underline,
                        color: Color.RED
                    )
                    .borderWidth(1).padding(10).margin(5)
            }
            .height(100.percent)
            .width(100.percent)
        }
    }
}
```

![Textdisply8](figures/Textdisply8.png)

- Set the baseline offset of text through the [baselineOffset](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#baselineoffsetlength) property.

     <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Scroll {
            Column {
                Text('This is the text content with baselineOffset 0.')
                    .baselineOffset(0)
                    .fontSize(12)
                    .border(width: 1)
                    .padding(10)
                    .width(100.percent)
                    .margin(5)
                Text('This is the text content with baselineOffset 30.')
                    .baselineOffset(30)
                    .fontSize(12)
                    .border(width: 1)
                    .padding(10)
                    .width(100.percent)
                    .margin(5)
                Text('This is the text content with baselineOffset -20.')
                    .baselineOffset(-20)
                    .fontSize(12)
                    .border(width: 1)
                    .padding(10)
                    .width(100.percent)
                    .margin(5)
            }
            .height(100.percent)
            .width(100.percent)
        }
    }
}
```

![Textdisply9](figures/Textdisply9.png)

- Set the character spacing of text through the [letterSpacing](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#letterspacinglength) property.

     <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Scroll {
            Column {
                Text('This is the text content with letterSpacing 0.')
                    .letterSpacing(0)
                    .fontSize(12)
                    .border(width: 1)
                    .padding(10)
                    .width(100.percent)
                    .margin(5)
                Text('This is the text content with letterSpacing 3.')
                    .letterSpacing(3)
                    .fontSize(12)
                    .border(width: 1)
                    .padding(10)
                    .width(100.percent)
                    .margin(5)
                Text('This is the text content with letterSpacing -1.')
                    .letterSpacing(-1)
                    .fontSize(12)
                    .border(width: 1)
                    .padding(10)
                    .width(100.percent)
                    .margin(5)
            }
            .height(100.percent)
            .width(100.percent)
        }
    }
}
```

![Textdisply10](figures/Textdisply10.png)

- Adaptive font size through [minFontSize](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#minfontsizelength) and [maxFontSize](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#maxfontsizelength).

minFontSize sets the minimum display font size for text, while maxFontSize sets the maximum display font size. Both properties must be set simultaneously to take effect and need to be used in conjunction with the [maxLines](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#maxlinesint32) property or layout size constraints. Setting either property alone will not produce any effect.

     <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Scroll {
            Column {
                Text('My maximum font size is 30, minimum font size is 5, width is 250, maxLines is 1')
                    .width(250)
                    .maxLines(1)
                    .maxFontSize(30)
                    .minFontSize(5)
                    .border(width: 1)
                    .padding(10)
                    .margin(5)
                Text('My maximum font size is 30, minimum font size is 5, width is 250, maxLines is 2')
                    .width(250)
                    .maxLines(2)
                    .maxFontSize(30)
                    .minFontSize(5)
                    .border(width: 1)
                    .padding(10)
                    .margin(5)
                Text('My maximum font size is 30, minimum font size is 15, width is 250, height is 50')
                    .width(250)
                    .height(50)
                    .maxFontSize(30)
                    .minFontSize(15)
                    .border(width: 1)
                    .padding(10)
                    .margin(5)
                Text('My maximum font size is 30, minimum font size is 15, width is 250, height is 100')
                    .width(250)
                    .height(100)
                    .maxFontSize(30)
                    .minFontSize(15)
                    .border(width: 1)
                    .padding(10)
                    .margin(5)
            }
            .height(100.percent)
            .width(100.percent)
        }
    }
}
```

![Textdisply11](figures/Textdisply11.png)

- Set text case through the [textCase](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#textcasetextcase) property.

     <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Scroll {
            Column {
                Text('This is the text content with textCase set to Normal.')
                    .textCase(TextCase.Normal)
                    .padding(10)
                    .border(width: 1)
                    .padding(10)
                    .margin(5)
                    // Display text in all lowercase
                Text('This is the text content with textCase set to LowerCase.')
                    .textCase(TextCase.LowerCase)
                    .border(width: 1)
                    .padding(10)
                    .margin(5)
                    // Display text in all uppercase
                Text('This is the text content with textCase set to UpperCase.')
                    .textCase(TextCase.UpperCase)
                    .border(width: 1)
                    .padding(10)
                    .margin(5)
            }
            .height(100.percent)
            .width(100.percent)
        }
    }
}
```

![Textdisply12](figures/Textdisply12.png)

- Set whether text can be copied and pasted through the [copyOption](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#copyoptioncopyoptions) property.

     <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Scroll {
            Column {
                Text("This is a copyable text")
                    .fontSize(30)
                    .copyOption(CopyOptions.InApp)
            }
            .height(100.percent)
            .width(100.percent)
        }
    }
}
```

![Textdisply13](figures/Textdisply13.png)

## Adding Events

The Text component can add universal events, such as binding [onClick](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-event-click.md#func-onclickclickevent---unit) and [onTouch](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-event-touch.md#func-ontouchtouchevent-unit) events to respond to operations.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Scroll {
            Column {
                Text('Click me')
                    .onClick{ evt =>
                        AppLog.info('I am the click response event of Text')
                    }
            }
            .height(100.percent)
            .width(100.percent)
        }
    }
}
```

## Selection Menu

- When Text is selected, a menu containing copy and translate options will pop up.

The Text component needs to set the [copyOption](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#func-copyoptioncopyoptions) property to be selectable.

```cangjie
Text("This is a text used to demonstrate the selection menu")
    .fontSize(30)
    .copyOption(CopyOptions.InApp)
```

  ![Textdisply14](figures/Textdisply14.png)

- The Text component binds a custom selection menu by setting the [bindSelectionMenu](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#func-bindselectionmenutextspantype----unit-textresponsetype-int32int32---unit----unit) property.

     <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import ohos.arkui.state_macro_manage.*
  import ohos.resource_manager.*
  import kit.PerformanceAnalysisKit.Hilog
  import std.collection.ArrayList

  @Entry
  @Component
  class EntryView {
      let controller: TextController = TextController()
      @Builder
      func RightClickTextCustomMenu() {
              Menu() {
                  MenuItemGroup(header: "", footer: "") {
                      =>
                      MenuItem(startIcon: @r(app.media.startIcon),   endIcon: @r(app.string.blank), content: @r(app.string.content1), labelInfo: @r(app.string.blank) )
                        .onChange ({ selected =>
                          // Use closeSelectionMenu interface to close the menu
                          this.controller.closeSelectionMenu()
                        })
                      MenuItem(startIcon: @r(app.media.startIcon),   endIcon: @r(app.string.blank), content: @r(app.string.content2), labelInfo: @r(app.string.blank) )
                      MenuItem(startIcon: @r(app.media.startIcon),   endIcon: @r(app.string.blank), content: @r(app.string.content3), labelInfo: @r(app.string.blank) )
                  }
              }.backgroundColor(0XF0F0F0)
      }
      func build() {
          Scroll() {
              Column {
                  Text("This is a text segment to demonstrate the selection menu", controller:   TextController())
                      .fontSize(30)
                      .copyOption(CopyOptions.InApp)
                      .bindSelectionMenu( TextSpanType.TEXT, bind  (RightClickTextCustomMenu, this),   TextResponseType.LONG_PRESS,
                      onDisappear: {
                          => Hilog.info(0, '', 'This callback is triggered when the custom selection menu closes')
                      },
                      onAppear: {
                          _: Int32, _: Int32 => Hilog.info(0, '', 'Callback when the custom selection menu pops up')
                      })
              }
          }
      }
  }
  ```

  ![Textdisply2](figures/Textdisply2.gif)

- The Text component extends the custom selection menu by setting the [editMenuOptions](../../../API_Reference/source_zh_cn/arkui-cj/cj-text-input-text.md#func-editmenuoptionsarraytextmenuitem---arraytextmenuitem-textmenuitem-int32-int32---bool) property, allowing configuration of extended item text content, icons, and callback methods.

     <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import ohos.arkui.state_macro_manage.*
  import ohos.resource_manager.*
  import kit.PerformanceAnalysisKit.Hilog
  import std.collection.ArrayList

  @Entry
  @Component
  class EntryView {
      func onCreateMenu(menuItems: Array<TextMenuItem>)  : Array<TextMenuItem> {
          let items = ArrayList<TextMenuItem>()
          for (item in menuItems) {
              if (item.id.equals(TextMenuItemId.  CUT) || item.id.equals(TextMenuItemId.  COPY) || item
                  .id
                  .equals(TextMenuItemId.SELECT_ALL)) {
                  items.add(item)
              }
          }
          let customItem1 = TextMenuItem(content:   "custom1", id: TextMenuItemId.of  ("customItem1"))
          let customItem2 = TextMenuItem(content:   "custom2", icon: @r(app.media.startIcon),
              id: TextMenuItemId.of("customItem2"))
          let customItem3 = TextMenuItem(content: @r(app.string.customItem3), icon: @r(app.media.startIcon),
              id: TextMenuItemId.of("customItem3"))
          items.add(customItem1)
          items.add(customItem2)
          items.add(customItem3)
          return items.toArray()
      }
      func onMenuItemClick(menuItem: TextMenuItem,   start: Int32, end: Int32): Bool {
          if (menuItem.id.equals(TextMenuItemId.of  ("custom2"))) {
              Hilog.info(0, "", "Intercept id: customMenu2   start: ${start}; end: ${end}")
              return true
          }
          if (menuItem.id.equals(TextMenuItemId.COPY))   {
              Hilog.info(0, "", "Intercept COPY start: $  {start}; end: ${end}")
              return true
          }
          if (menuItem.id.equals(TextMenuItemId.  SELECT_ALL)) {
              Hilog.info(0, "", "Do not intercept SELECT_ALL   start: ${start}; end: ${end}")
              return false
          }
          return false
      }
      func build() {
          Column() {
              Text("This is a text segment to demonstrate the selection menu")
                .fontSize(20)
                .copyOption(CopyOptions.LocalDevice)
                .editMenuOptions(onCreateMenu,onMenuItemClick)
          }
      }
  }
  ```

  ![Textdisply1](figures/Textdisply1.gif)

## Scenario Example

This example demonstrates a hot search ranking effect using maxLines, textOverflow, textAlign, and constraintSize properties.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    func build() {
        Column() {
            Row() {
                Text("1").fontSize(14).fontColor(Color.RED).margin(left: 10, right: 10)
                Text("I am hot search term 1")
                    .fontSize(12)
                    .fontColor(Color.BLUE)
                    .maxLines(1)
                    .textOverflow(TextOverflow.Ellipsis)
                    .fontWeight(W300)
                Text("Trending")
                    .margin(left: 6)
                    .textAlign(TextAlign.Center)
                    .fontSize(10)
                    .fontColor(Color.WHITE)
                    .fontWeight(W600)
                    .backgroundColor(0x770100)
                    .borderRadius(5)
                    .width(15)
                    .height(14)
                }.width(100.percent).margin(5)

            Row() {
                Text("2").fontSize(14).fontColor(Color.RED).margin(left: 10, right: 10)
                Text("I am hot search term 2 I am hot search term 2 I am hot search term 2 I am hot search term 2 I am hot search term 2")
                    .fontSize(12)
                    .fontColor(Color.BLUE)
                    .fontWeight(W300)
                    .constraintSize(maxWidth: 200)
                    .maxLines(1)
                    .textOverflow(TextOverflow.Ellipsis)
                Text("Hot")
                    .margin(left: 6)
                    .textAlign(TextAlign.Center)
                    .fontSize(10)
                    .fontColor(Color.WHITE)
                    .fontWeight(W600)
                    .backgroundColor(0xCC5500)
                    .borderRadius(5)
                    .width(15)
                    .height(14)
                }.width(100.percent).margin(5)

            Row() {
                Text("3").fontSize(14).fontColor(Color.ORANGE).margin(left: 10, right: 10)
                Text("I am hot search term 3")
                    .fontSize(12)
                    .fontColor(Color.BLUE)
                    .fontWeight(W300)
                    .maxLines(1)
                    .constraintSize(maxWidth: 200)
                    .textOverflow(TextOverflow.Ellipsis)
                Text("Hot")
                    .margin(left: 6)
                    .textAlign(TextAlign.Center)
                    .fontSize(10)
                    .fontColor(Color.WHITE)
                    .fontWeight(W600)
                    .backgroundColor(0xCC5500)
                    .borderRadius(5)
                    .width(15)
                    .height(14)
                }.width(100.percent).margin(5)

            Row() {
                Text("4").fontSize(14).fontColor(Color.GREY).margin(left: 10, right: 10)
                Text("I am hot search term 4 I am hot search term 4 I am hot search term 4 I am hot search term 4 I am hot search term 4")
                    .fontSize(12)
                    .fontColor(Color.BLUE)
                    .fontWeight(W300)
                    .constraintSize(maxWidth: 200)
                    .maxLines(1)
                    .textOverflow(TextOverflow.Ellipsis)
                }.width(100.percent).margin(5)
        }.width(100.percent)
    }
}
```

![Textdisply15](figures/Textdisply15.png)
