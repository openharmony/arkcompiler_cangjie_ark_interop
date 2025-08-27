# 模糊

动画效果可以丰富界面的细节，提升UI界面的真实感和品质感。例如，模糊和阴影效果可以让物体看起来更加立体，使得动画更加生动。ArkUI提供了丰富的效果接口，开发者可快速打造出精致、个性化的效果。本章中主要对常用的模糊、阴影和色彩效果等效果接口进行了介绍。

模糊可以用来体现界面空间的纵深感，区分前后元素的层级关系。

| 接口                                                         | 说明                                         |
| :------------------------------------------------------------ | :-------------------------------------------- |
| [backdropBlur](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-background.md#func-backdropblurfloat64) | 为当前组件添加背景模糊效果，入参为模糊半径。 |
| [blur](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-imageeffect.md#func-blurfloat64) | 为当前组件添加内容模糊效果，入参为模糊半径。 |
| [backgroundBlurStyle](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-background.md#func-backgroundblurstyleblurstyle-optionbackgroundblurstyleoptions) | 为当前组件添加背景模糊效果，入参为模糊样式。 |
| [foregroundBlurStyle](../../../API_Reference/source_zh_cn/arkui-cj/cj-universal-attribute-foregroundblurstyle.md#func-foregroundblurstyleforegroundblurstyle-optionforegroundblurstyleoptions) | 为当前组件添加内容模糊效果，入参为模糊样式。 |

> **说明：**
>
> 以上接口是实时模糊接口，会每帧进行实时渲染，性能负载较高。

## 使用backdropBlur为组件添加背景模糊

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.__GenerateResource__

@Entry
@Component
class EntryView {
    func build() {
        Column(10) {
            Text('backdropBlur')
                .width(90.percent)
                .height(90.percent)
                .fontSize(20)
                .fontColor(Color.White)
                .textAlign(TextAlign.Center)
                .backdropBlur(10)
                .backgroundImage(src: @r(app.media.share))
                .backgroundImageSize(width: 400, height: 300)
        }
        .width(100.percent)
        .height(50.percent)
        .margin(top: 30)
    }
}
```

![blur](./figures/blur.PNG)

## 使用blur为组件添加内容模糊

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.__GenerateResource__

@Entry
@Component
class EntryView {
    @State var radius: Float64 = 0.0
    @State var text: String = ''
    @State var y: String = '手指不在屏幕上'

    protected override func aboutToAppear() {
        this.text = "按住屏幕上下滑动\n" + "当前手指所在y轴位置 ： " + this.y +
            "\n" + "当前图片模糊程度为 : " + this.radius.toString();
    }

    func build() {
        Flex(FlexOptions(direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center)){
            Text(this.text)
                .height(200)
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .fontFamily("cursive")
                .fontStyle(FontStyle.Italic)
            Image(@r(app.media.share))
                .blur(this.radius)
                .height(100.percent)
                .width(100.percent)
                .objectFit(ImageFit.Cover)
        }
        .height(100.percent)
        .width(100.percent)
        .onTouch({event: TouchEvent =>
                if (event.eventType.getValue() == TouchType.Move.getValue()) {
                    this.y = event.touches[0].y.toString()
                    this.radius = event.touches[0].y / 10.0
                }
                if (event.eventType.getValue() == TouchType.Up.getValue()) {
                    this.radius = 0.0
                    this.y = '手指离开屏幕'
                }
                this.text = "按住屏幕上下滑动\n" + "当前手指所在y轴位置 ： " + this.y +
                    "\n" + "当前图片模糊程度为 : " + this.radius.toString();
            })
    }
}
```

![blur2](./figures/blur2.gif)

## 使用backgroundBlurStyle为组件添加背景模糊效果

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.__GenerateResource__

@Entry
@Component
class EntryView {
    func build() {
        Grid() {
            GridItem() {
                Column() {
                    Column() {
                        Text('原图')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))

                    Text('原图')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('Thin')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    // BlurStyle.Thin: 为组件添加轻薄材质模糊效果
                    // ThemeColorMode.LIGHT: 固定使用浅色模式效果
                    // AdaptiveColor.DEFAULT: 不使用取色模糊，使用默认的颜色作为蒙版颜色
                    // scale: 背景材质模糊效果程度，默认值是1
                    .backgroundBlurStyle(
                        value: BlurStyle.Thin,
                        options: BackgroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('Thin')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('Regular')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    .backgroundBlurStyle(
                        value: BlurStyle.Regular,
                        options: BackgroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('Regular')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('Thick')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    .backgroundBlurStyle(
                        value: BlurStyle.Thick,
                        options: BackgroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('Thick')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('BACKGROUND_THIN')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    .backgroundBlurStyle(
                        value: BlurStyle.BACKGROUND_THIN,
                        options: BackgroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('BACKGROUND_THIN')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('BACKGROUND_REGULAR')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    .backgroundBlurStyle(
                        value: BlurStyle.BACKGROUND_REGULAR,
                        options: BackgroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('BACKGROUND_REGULAR')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('BACKGROUND_THICK')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    .backgroundBlurStyle(
                        value: BlurStyle.BACKGROUND_THICK,
                        options: BackgroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('BACKGROUND_THICK')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('BACKGROUND_ULTRA_THICK')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    .backgroundBlurStyle(
                        value: BlurStyle.BACKGROUND_ULTRA_THICK,
                        options: BackgroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('BACKGROUND_ULTRA_THICK')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)
        }
        .columnsTemplate("1fr 1fr")
        .rowsTemplate("1fr 1fr 1fr 1fr")
        .width(100.percent)
        .height(100.percent)
        .margin(top: 40)
    }
}
```

![blur3](./figures/blur3.png)

## 使用foregroundBlurStyle为组件添加内容模糊效果

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.__GenerateResource__

@Entry
@Component
class EntryView {
    func build() {
        Grid() {
            GridItem() {
                Column() {
                    Column() {
                        Text('原图')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))

                    Text('原图')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('Thin')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    // ForegroundBlurStyle.Thin: 为组件添加轻薄材质模糊效果
                    // ThemeColorMode.LIGHT: 固定使用浅色模式效果
                    // AdaptiveColor.DEFAULT: 不使用取色模糊，使用默认的颜色作为蒙版颜色
                    // scale: 背景材质模糊效果程度，默认值是1
                    .foregroundBlurStyle(
                        ForegroundBlurStyle.THIN,
                        options: ForegroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('Thin')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('Regular')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    .foregroundBlurStyle(
                        ForegroundBlurStyle.REGULAR,
                        options: ForegroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('Regular')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('Thick')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    .foregroundBlurStyle(
                        ForegroundBlurStyle.THICK,
                        options: ForegroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('Thick')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('BACKGROUND_THIN')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    .foregroundBlurStyle(
                        ForegroundBlurStyle.BACKGROUND_THIN,
                        options: ForegroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('BACKGROUND_THIN')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('BACKGROUND_REGULAR')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    .foregroundBlurStyle(
                        ForegroundBlurStyle.BACKGROUND_REGULAR,
                        options: ForegroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('BACKGROUND_REGULAR')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('BACKGROUND_THICK')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    .foregroundBlurStyle(
                        ForegroundBlurStyle.BACKGROUND_THICK,
                        options: ForegroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('BACKGROUND_THICK')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)

            GridItem() {
                Column() {
                    Column() {
                        Text('BACKGROUND_ULTRA_THICK')
                            .fontSize(20)
                            .fontColor(Color.White)
                            .textAlign(TextAlign.Center)
                            .width(100.percent)
                            .height(100.percent)
                    }
                    .height(100)
                    .aspectRatio(1)
                    .borderRadius(10)
                    .backgroundImage(src: @r(app.media.scene))
                    .foregroundBlurStyle(
                        ForegroundBlurStyle.BACKGROUND_ULTRA_THICK,
                        options: ForegroundBlurStyleOptions(colorMode: ThemeColorMode.LIGHT,
                            adaptiveColor: AdaptiveColor.DEFAULT, scale: 0.1))

                    Text('BACKGROUND_ULTRA_THICK')
                        .fontSize(12)
                        .fontColor(Color.Black)
                }
                .height(100.percent)
                .justifyContent(FlexAlign.Start)
            }
            .height(200)
            .width(200)
        }
        .columnsTemplate("1fr 1fr")
        .rowsTemplate("1fr 1fr 1fr 1fr")
        .width(100.percent)
        .height(100.percent)
        .margin(top: 40)
    }
}
```

![blur4](./figures/blur4.png)

## 使用motionBlur为组件添加运动模糊效果

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.__GenerateResource__

@Entry
@Component
class EntryView {
    @State var widthSize: Int64 = 400
    @State var heightSize: Int64 = 320
    @State var flag: Bool = true
    @State var radius: Float64 = 0.0
    @State var x: Float64 = 0.0
    @State var y: Float64 = 0.0

    func build() {
        Column() {
            Column() {
                Image(@r(app.media.share))
                    .onClick({ evt =>
                            this.radius = 5.0
                            this.x = 0.5
                            this.y = 0.5
                            if (this.flag) {
                                this.widthSize = 100
                                this.heightSize = 80
                            } else {
                                this.widthSize = 400
                                this.heightSize = 320
                            }
                            this.flag = !this.flag
                        })
                    .animationStart(
                        AnimateParam(duration: 2000, curve: Curve.EaseInOut, onFinish: {=> this.radius = 0.0}))
                    .width(this.widthSize)
                    .height(this.heightSize)
                    .animationEnd()
                    .motionBlur(MotionBlurOptions(radius: this.radius, anchor: MotionBlurAnchor(x: this.x, y: this.y)))
            }
        }
    }
}
```

![motionBlurTest](./figures/motionBlurTest.gif)
