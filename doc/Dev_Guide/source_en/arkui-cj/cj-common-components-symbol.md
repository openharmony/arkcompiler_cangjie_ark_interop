# Icon Symbols (SymbolGlyph/SymbolSpan)

SymbolGlyph is an icon symbol component that facilitates the use of elegant icons, such as rendering multicolor icons and animated icons. SymbolSpan, as a subcomponent of the Text component, can display icon symbols interspersed within text.

## Creating Icons

SymbolGlyph is created by referencing Resource assets via @r, currently supporting only system-preset Symbol resource names.

<!--RP1--><!--RP1End-->

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*
import ohos.component

@Entry
@Component
class EntryView {
    func build(){
        SymbolGlyph(@r(sys.symbol.ohos_folder_badge_plus))
            .fontSize(96)
            .renderingStrategy(SymbolRenderingStrategy.SINGLE)
            .fontColor([Color.BLACK, Color.GREEN, Color.WHITE])
    }
}
```

![icon](figures/tubiao.jpg)

## Adding to Text

- Creating SymbolSpan.

  The SymbolSpan component must be embedded within a Text component to be displayed; a standalone SymbolSpan component will not render any content.

     <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import kit.LocalizationKit.*
  import ohos.arkui.state_macro_manage.*
  import ohos.component

  @Entry
  @Component
  class EntryView {
      func build(){
          Text() {
              SymbolSpan(@r(sys.symbol.ohos_trash))
                  .fontWeight(FontWeight.Normal)
                  .fontSize(96)
          }
      }
  }
  ```

  ![image](figures/tupianzujian.jpg)

     <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import kit.LocalizationKit.*
  import ohos.arkui.state_macro_manage.*
  import ohos.component

  @Entry
  @Component
  class EntryView {
      func build(){
          Row() {
              Column() {
                  Text("24")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_trash))
                          .fontWeight(FontWeight.Normal)
                      .fontSize(24)
                  }
              }
              Column() {
                  Text("48")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_trash))
                          .fontWeight(FontWeight.Normal)
                          .fontSize(48)
                  }
              }
              Column() {
                  Text("96")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_trash))
                         .fontWeight(FontWeight.Normal)
                         .fontSize(96)
                  }
              }
          }
      }
  }
  ```

  ![imagesize](figures/tupiansize.jpg)

     <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import kit.LocalizationKit.*
  import ohos.arkui.state_macro_manage.*
  import ohos.component

  @Entry
  @Component
  class EntryView {
      func build(){
          Row() {
              Column() {
                  Text("Light")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_trash))
                          .fontWeight(FontWeight.Lighter)
                          .fontSize(96)
                  }
              }
              Column() {
                  Text("Normal")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_trash))
                          .fontWeight(FontWeight.Normal)
                          .fontSize(96)
                  }
              }
              Column() {
                  Text("Bold")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_trash))
                          .fontWeight(FontWeight.Bold)
                          .fontSize(96)
                  }
              }
          }
      }
  }
  ```

  ![fontweight](figures/tupiancuxi.jpg)

     <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import kit.LocalizationKit.*
  import ohos.arkui.state_macro_manage.*
  import ohos.component

  @Entry
  @Component
  class EntryView {
      func build(){
          Row() {
              Column() {
                  Text("Gray")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_folder_badge_plus))
                          .fontColor(Color.GRAY)
                          .fontSize(96)
                  }
              }
              Column() {
                  Text("Blue")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_folder_badge_plus))
                          .fontColor(Color.BLUE)
                          .fontSize(96)
                  }
              }
              Column() {
                  Text("Pink")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_folder_badge_plus))
                          .fontColor(Color.PINK)
                          .fontSize(96)
                  }
              }
          }
      }
  }
  ```

  ![color](figures/tupiancolor.jpg)

     <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import kit.LocalizationKit.*
  import ohos.arkui.state_macro_manage.*
  import ohos.component

  @Entry
  @Component
  class EntryView {
      func build(){
          Row() {
              Column() {
                  Text("Monochrome")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_folder_badge_plus))
                          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
                          .fontColor(([Color.BLACK, Color.GREEN, Color.WHITE]))
                          .fontSize(96)
                  }
              }
              Column() {
                  Text("Multicolor")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_folder_badge_plus))
                          .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
                          .fontColor(([Color.BLACK, Color.GREEN, Color.WHITE]))
                          .fontSize(96)
                  }
              }
              Column() {
                  Text("Layered")
                  Text() {
                  SymbolSpan(@r(sys.symbol.ohos_folder_badge_plus))
                      .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_OPACITY)
                      .fontColor(([Color.BLACK, Color.GREEN, Color.WHITE]))
                      .fontSize(96)
                  }
              }
          }
      }
  }
  ```

  ![rendering](figures/cengci.jpg)

     <!-- run -->

  ```cangjie
  package ohos_app_cangjie_entry
  import kit.ArkUI.*
  import kit.LocalizationKit.*
  import ohos.arkui.state_macro_manage.*
  import ohos.component

  @Entry
  @Component
  class EntryView {
      func build(){
          Row() {
              Column() {
                  Text("No Animation")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_wifi))
                          .fontSize(96)
                          .effectStrategy(SymbolEffectStrategy.NONE)
                  }
              }
              Column() {
                  Text("Scale Animation")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_wifi))
                          .fontSize(96)
                          .effectStrategy(SymbolEffectStrategy.SCALE)
                  }
              }
              Column() {
                  Text("Hierarchical Animation")
                  Text() {
                      SymbolSpan(@r(sys.symbol.ohos_wifi))
                          .fontSize(96)
                          .effectStrategy(SymbolEffectStrategy.HIERARCHICAL)
                  }
              }
          }
      }
  }
  ```

  ![animation](figures/dongxiao.jpg)

- SymbolSpan does not support generic events.

## Customizing Icon Animations

Compared to the effectStrategy property which triggers animations upon startup, the following two methods can be used to control animation playback states and select more diverse animation strategies.

- By setting the SymbolEffect property, you can configure both the animation strategy and playback state of SymbolGlyph.

    <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*
import ohos.component

@Entry
@Component
class EntryView {
    @State
    var isActive: Bool = true;
    func build(){
        Column() {
            Text("Variable Color Animation")
            SymbolGlyph(@r(sys.symbol.ohos_wifi))
                .fontSize(96)
                .symbolEffect(HierarchicalSymbolEffect(fillStyle:EffectFillStyle.ITERATIVE), isActive:this.isActive)
            Button((func1(this.isActive))).onClick({=>
            this.isActive = !this.isActive;
            })
        }
    }
    func func1(value: Bool): String {
        if (value) {
            return "Turn Off"
        }
        return "Play"
    }
}
```

![kai](figures/kai.jpg)![guan](figures/guan.png)

- By setting the SymbolEffect property, you can simultaneously specify the animation strategy and playback trigger conditions for SymbolGlyph.

    <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*
import ohos.component

@Entry
@Component
class EntryView {
    @State
    var triggerValueReplace: Int32 = 0;
    func build(){
        Column() {
            Text("Bounce Animation")
            SymbolGlyph(@r(sys.symbol.ellipsis_message_1))
                .fontSize(96)
                .fontColor([Color.GRAY])
                .symbolEffect(BounceSymbolEffect(scope:EffectScope.WHOLE,direction:EffectDirection.UP), triggerValue: this.triggerValueReplace)
            Button("trigger").onClick({=>
                this.triggerValueReplace = this.triggerValueReplace + 1;
            })
        }
    }
}
```

![tantiaodongxiao](figures/tantiaodongxiao.jpg)

## Adding Events

The SymbolGlyph component can add universal events, such as binding [onClick](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-event-click.md#func-onclickclickevent---unit), [onTouch](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-event-touch.md#func-ontouchtouchevent-unit) events to respond to operations.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*
import ohos.component

@Entry
@Component
class EntryView {
    @State
    var wifiColor: Color = Color.BLACK;
    func build(){
        Column() {
            SymbolGlyph(@r(sys.symbol.ohos_wifi))
                .fontSize(96)
                .fontColor([this.wifiColor])
                .onClick({event:ClickEvent=>
                    this.wifiColor = Color.PINK;
                })
        }
    }
}
```

![black](figures/black.jpg) ![pink](figures/pink.jpg)

## Scenario Example

This example demonstrates the effect of a playlist through the symbolEffect, fontSize, and fontColor properties.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*
import ohos.component
import ohos.ui_test.Driver

@Entry
@Component
class EntryView {
    @State
    var triggerValueReplace: Int32 = 0;
    @State
    var symbolTextIndex: Int64 = 0;
    @State
    var symbolSourcesIndex: Int64 = 0;
    @State
    var fontColorValue: ResourceColor = Color.GRAY;
    @State
    var fontColorValue1: ResourceColor = Color.BLUE;
    @State
    var symbolText: Array<String> = ["Sequential Play", "Single Loop", "Random Play"];

    func build(){
        Column() {
            Row() {
                Text() {
                    Span("Current Playlist")
                        .fontSize(20)
                        .fontWeight(FontWeight.Bolder)
                    Span("(101)")
                }
            }
            Row() {
                Row() {
                    SymbolGlyph(func1(this.symbolSourcesIndex))
                        .symbolEffect(ReplaceSymbolEffect(scope:EffectScope.WHOLE),triggerValue:this.triggerValueReplace)
                        .fontSize(10)
                        .fontColor(Color.GRAY)
                    Text(this.symbolText[this.symbolTextIndex])
                        .fontColor(this.fontColorValue)
                }
                .onClick({event:ClickEvent=>
                    this.symbolTextIndex++;
                    this.symbolSourcesIndex++;
                    this.triggerValueReplace++;
                    if (this.symbolSourcesIndex > 2) {
                        this.symbolSourcesIndex = 0;
                        this.triggerValueReplace = 0;
                    }
                    if (this.symbolTextIndex > 2) {
                        this.symbolTextIndex = 0;
                    }
                }).width(75)

                Row() {
                    Text() {
                        SymbolSpan(@r(sys.symbol.arrow_down_circle_badge_vip_circle_filled))
                            .fontColor(Color.GRAY)
                            .fontSize(20)
                    }

                    Text() {
                        SymbolSpan(@r(sys.symbol.heart_badge_plus))
                            .fontColor(Color.GRAY)
                            .fontSize(20)
                    }

                    Text() {
                        SymbolSpan(@r(sys.symbol.ohos_trash))
                            .fontColor(Color.GRAY)
                            .fontSize(20)
                    }
                }.width(25)
            }

            Divider().width(5).color(this.fontColorValue1).width(98)
            Row() {
                Row() {
                    Text("Song One")
                }.width(82)

            Row() {
                SymbolGlyph(@r(sys.symbol.play_arrow_triangle_2_circlepath))
                    .fontColor(Color.GRAY)
                    .fontSize(20)
                SymbolGlyph(@r(sys.symbol.trash))
                    .fontColor(Color.GRAY)
                    .fontSize(20)
            }
            }

            Divider().width(5).color(this.fontColorValue1).width(98)
            Row() {
                Row() {
                    Text("Song Two")
                }.width(82)

                Row() {
                    SymbolGlyph(@r(sys.symbol.play_arrow_triangle_2_circlepath))
                        .fontColor(Color.GRAY)
                        .fontSize(20)
                    SymbolGlyph(@r(sys.symbol.trash))
                        .fontColor(Color.GRAY)
                        .fontSize(20)
                }
            }

            Divider().width(5).color(this.fontColorValue1).width(98)
            Row() {
                Row() {
                    Text("Song Three")
                }.width(82)

                Row() {
                    SymbolGlyph(@r(sys.symbol.play_arrow_triangle_2_circlepath))
                        .fontColor(Color.GRAY)
                        .fontSize(20)
                    SymbolGlyph(@r(sys.symbol.trash))
                        .fontColor(Color.GRAY)
                        .fontSize(20)
                }
            }

            Divider().width(5).color(this.fontColorValue1).width(98)
            Row() {
                Row() {
                    Text("Song Four")
                }.width(82)

                Row() {
                    SymbolGlyph(@r(sys.symbol.play_arrow_triangle_2_circlepath))
                        .fontColor(Color.GRAY)
                        .fontSize(20)
                    SymbolGlyph(@r(sys.symbol.trash))
                        .fontColor(Color.GRAY)
                        .fontSize(20)
                }
            }

            Divider().width(5).color(this.fontColorValue1).width(98)
            Row() {
                Row() {
                    Text("Song Five")
                }.width(82)

                Row() {
                    SymbolGlyph(@r(sys.symbol.play_arrow_triangle_2_circlepath))
                        .fontColor(Color.GRAY)
                        .fontSize(20)
                    SymbolGlyph(@r(sys.symbol.trash))
                        .fontColor(Color.GRAY)
                        .fontSize(20)
                }
            }

            Divider().width(5).color(this.fontColorValue1).width(98)
            Row() {
                Row() {
                Text("Song Six")
                }.width(82)

                Row() {
                    SymbolGlyph(@r(sys.symbol.play_arrow_triangle_2_circlepath))
                        .fontColor(Color.GRAY)
                        .fontSize(20)
                    SymbolGlyph(@r(sys.symbol.trash))
                        .fontColor(Color.GRAY)
                        .fontSize(20)
                }
            }
            Divider().width(5).color(this.fontColorValue1).width(98)
                Row() {
                    Row() {
                        Text("Song Seven")
                    }.width(82)

                    Row() {
                        SymbolGlyph(@r(sys.symbol.play_arrow_triangle_2_circlepath))
                            .fontColor(Color.GRAY)
                            .fontSize(20)
                        SymbolGlyph(@r(sys.symbol.trash))
                            .fontColor(Color.GRAY)
                            .fontSize(20)
                    }
                }

            Divider().width(5).color(this.fontColorValue1).width(98)
                Column() {
                    Text("Close")
                }
                .alignItems(HorizontalAlign.Center)
                .width(98)
        }
        .alignItems(HorizontalAlign.Start)
        .width(100)
        .height(400)
        .padding(left: 10,top: 10)
    }

    func func1(index: Int64): AppResource {
        if (index % 3 == 0) {
            return @r(sys.symbol.repeat)
        }
        if (index % 3 == 1){
            return @r(sys.symbol.repeat_1)
        }
        else {
            return @r(sys.symbol.arrow_left_arrow_right)
        }
    }
}
```

![icon](figures/xiaotubiaoshili.jpg)