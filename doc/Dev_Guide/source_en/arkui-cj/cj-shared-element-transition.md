# Shared Element Transition (One-Shot Effect)

Shared element transition is an animation effect that matches the position and size of identical or similar elements during interface switching, also known as the one-shot effect.

As shown in the following example, when an image is clicked, it disappears while a new image appears at another location with identical content. A one-shot effect can be applied between them. The left image shows the effect without the one-shot transition, while the right image demonstrates the effect with the one-shot transition. The one-shot effect creates a coordinated appearance and disappearance, making the content switch appear fluid and natural rather than abrupt.

|![sharedelementtransiton1](./figures/sharedelementtransition1.gif)|![sharedelementtransiton2](./figures/sharedelementtransition2.gif)|
| ---- | ---- |

The one-shot effect can be implemented in various ways. During actual development, the appropriate method should be selected based on the specific scenario.

Below is a comparison of different implementation methods:

| One-Shot Implementation Method | Characteristics | Applicable Scenarios |
| :----- | :----- | :----- |
| Directly modifying the original container without creating a new one | No routing jump occurs; the layout for both expanded and collapsed states must be implemented within a single component, with the component hierarchy remaining unchanged after expansion. | Suitable for simple scenarios with minimal transition overhead, such as opening a page without loading large amounts of data or components. |
| Using geometryTransition for shared element transition | Leverages system capabilities. The two components before and after the transition call the geometryTransition interface to bind the same ID, with the transition logic placed within the animateTo animation closure. The system automatically applies a one-shot transition effect between them. | The system adjusts the width, height, and position of the two bound components to the same values and switches their transparency to achieve the one-shot transition effect. To ensure smooth animation, ensure that there are no abrupt jumps in the width and height animations of the nodes bound to geometryTransition. This method is suitable for scenarios where creating new nodes incurs minimal overhead. |

## Directly Modifying the Original Component Without Creating a New One

This method does not create a new container. Instead, it triggers [transition](../../../API_Reference/source_zh_cn/arkui-cj/cj-animation-transition.md#func-transition) by adding or removing components from the existing container, combined with component [attribute animations](./cj-attribute-animation-apis.md) to achieve the one-shot effect.

For scenarios where the same container expands and sibling components disappear or appear, the one-shot effect can be achieved by changing the width, height, and position of the container before and after expansion and configuring attribute animations, while applying appearance/disappearance transition animations to sibling components. The basic steps are:

1. Construct the page to be expanded and design the interfaces for both the normal and expanded states using state variables.

2. Expand the target page, control the disappearance or appearance of sibling components using state variables, and bind appearance/disappearance transitions to achieve the transition effect for sibling components.

Take the scenario of clicking a card to display its detailed content as an example:

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.AppResource
import ohos.resource_manager.__GenerateResource__
import std.collection.ArrayList

let storage: LocalStorage = LocalStorage()

class PostData{
    public var avatar: AppResource = @r(app.media.app_foreground)
    public var name: String = ""
    public var message: String = ""
    public var images: Array<AppResource> = []

    public init(avatar: AppResource,name:String,message: String,images: Array<AppResource>) {
        this.avatar = avatar
        this.name = name
        this.message = message
        this.images = images
    }
}

@Entry
@Component
class EntryView {
    @State var isExpand: Bool = false
    @State @Watch[onItemClicked] var selectedIndex: Int64 = -1

    private var allPostData: Array<PostData> = [
        PostData(@r(app.media.flower),"Alice","天气晴朗",[@r(app.media.spring), @r(app.media.tree)] ),
        PostData(@r(app.media.sky),"Bob","你好世界",[@r(app.media.island)]),
        PostData(@r(app.media.tree),"Carl","万物生长",[@r(app.media.flower),@r(app.media.sky),@r(app.media.spring)])
        ]

    private func onItemClicked():Unit {
        if(this.selectedIndex<0){
            return
        }
        animateTo(
            AnimateParam(duration: 350,curve: Curve.Friction),
            {
                => this.isExpand = !this.isExpand
            }
        )
    }

    func build() {
        Column(){
            ForEach(this.allPostData,itemGeneratorFunc:{postData: PostData,index: Int64
                    =>
                    // When a post is clicked, other posts disappear from the tree
                    if(!this.isExpand || this.selectedIndex==index){
                        Column(){
                           Post(data:postData,selecteIndex: this.selectedIndex,index: index)
                        }
                        .width(100.percent)
                        // Add opacity and displacement transition effects to appearing/disappearing posts
                        .transition(TransitionEffect.OPACITY
                                    .combine(TransitionEffect.translate(TranslateOptions(x:250.0,y:250.0,z:250.0)))
                                    .animation(AnimateParam(duration: 350,curve: Curve.Friction)))
                    }
                }
             )
        }
        .size(width: 100.percent, height: 100.percent)
        .backgroundColor(Color.GREY)
    }
}

@Component
class Post{
    @Link var selecteIndex:Int64

    @Prop var data:PostData
    @Prop var index:Int64

    @State var itemHeight: Int64 = 250
    @State var isExpand: Bool = false
    @State var expandImageSize: Int64 = 100
    @State var avatarSize: Int64 = 50

    public func build(){
        Column(){
            Row(){
                Image(this.data.avatar)
                    .size(width: this.avatarSize,height: this.avatarSize)
                    .borderRadius(this.avatarSize/2)
                    .clip(true)
                Text(this.data.name)
            }.justifyContent(FlexAlign.Start)

            Text(this.data.message)

            Row(){
                ForEach(this.data.images,itemGeneratorFunc:{imageResource: AppResource,index: Int64
                        =>
                        Image(imageResource).size(width: this.expandImageSize,height: this.expandImageSize)
                        }
                    )
            }
            if(this.isExpand){
                Column(){
                    Text("Comment Section")
                    // Add appearance/disappearance transition effect to the comment section text
                    .transition(TransitionEffect.OPACITY.animation(AnimateParam(duration: 350,curve: Curve.Friction)))
                    .padding(top: 10)
                }.transition(TransitionEffect.asymmetric(TransitionEffect.opacity(0.99).animation(AnimateParam(duration: 350,curve: Curve.Friction)),TransitionEffect.OPACITY.animation(AnimateParam(duration:0))))
                .size(width: 100.percent, height: 20.percent)
            }
        }
        .backgroundColor(Color.WHITE)
        .size(width: 100.percent, height: this.itemHeight)
        .alignItems(HorizontalAlign.Start)
        .padding(left:10,top:10)
        .onClick{
            evt =>
                this.selecteIndex = -1
                this.selecteIndex = this.index
                animateTo(AnimateParam(duration:350,curve:Curve.Friction),{
                    =>
                    // Apply width/height animations to the expanded post, and animations to the avatar and image sizes
                    this.isExpand = !this.isExpand
                    if(this.isExpand){
                        this.itemHeight = 780
                        this.avatarSize = 75
                    }else{
                        this.itemHeight = 250
                        this.avatarSize = 50
                    }

                    if(this.isExpand && this.data.images.size > 0){
                        this.expandImageSize = (360 - (this.data.images.size + 1)*15)/this.data.images.size
                    }else{
                        this.expandImageSize = 100
                    }
                })
        }
    }
}
```

![shared-element-transition](figures/shared-element-transition.gif)

## Using geometryTransition for Shared Element Transition

[geometryTransition](../../../API_Reference/source_zh_cn/arkui-cj/cj-animation-geometrytransition.md) is used for implicit shared element transitions within components, providing a smooth context inheritance transition experience during view state switching.

To use geometryTransition, bind the two components requiring the one-shot effect with the same ID using the geometryTransition interface. When one component disappears and another appears, the system will apply the one-shot effect between them.

The binding of two objects distinguishes geometryTransition from other methods, making it most suitable for achieving the one-shot effect between two different objects.

### Basic Usage of geometryTransition

For a one-shot effect between two elements on the same page, here is a simple example of using the geometryTransition interface:

 <!-- run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.*

@Entry
@Component
class EntryView {
    @State var isShow: Bool = false
    func build() {
        Stack(Alignment.Center) {
            if (this.isShow) {
                Image(@r(app.media.spring))
                    .autoResize(false)
                    .clip(true)
                    .width(200)
                    .height(200)
                    .borderRadius(100)
                    .geometryTransition("picture")
                    .transition(TransitionEffect.OPACITY)
                    .id("item1")
            } else {
                Column() {
                    Column() {
                        Image(@r(app.media.sky))
                            .width(100.percent).height(100.percent)
                    }.width(100.percent).height(100.percent)
                }
                .width(100)
                .height(100)
                // geometryTransition synchronizes borderRadius, but only for the bound container itself,
                // not its child components
                .borderRadius(20)
                .clip(true)
                .position(x:40,y:40)
                .geometryTransition("picture")
                // transition ensures the node is not immediately destroyed upon exit, applying a generic transition effect
                .transition(TransitionEffect.OPACITY)
                .id("item2")
            }
        }
        .onClick({
            event => animateTo(AnimateParam(duration:1000,curve:Curve.Linear), ({=>this.isShow = !this.isShow}))
        })
        .size(width:100.percent,height:100.percent)
    }
}
```

![shared-element-transition1](./figures/shared-element-transition1.gif)

### Combining geometryTransition with Modal Transitions

In more scenarios, a one-shot effect is needed between an element on one page and an element on another page. This can be achieved by combining geometryTransition with modal transition interfaces. Here is an example of clicking an avatar to display a personal information page:

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.AppResource
import ohos.resource_manager.__GenerateResource__
import std.collection.ArrayList
import kit.PerformanceAnalysisKit.Hilog



let storage: LocalStorage = LocalStorage()

class PostData{
    public var avatar: AppResource = @r(app.media.app_foreground)
    public var name: String = ""
    public var message: String = ""
    public var images: Array<AppResource> = []

    public init(avatar: AppResource,name:String,message: String,images: Array<AppResource>) {
        this.avatar = avatar
        this.name = name
        this.message = message
        this.images = images
    }
}

@Entry
@Component
class EntryView {
    @State var isPersonalPageShow: Bool = false;
    @State var selectedIndex: Int = 0
    @State var alphaValue: Int = 1

    private var allPostData: Array<PostData> = [
        PostData(@r(app.media.flower),"Alice","天气晴朗",[@r(app.media.spring), @r(app.media.tree)] ),
        PostData(@r(app.media.sky),"Bob","你好世界",[@r(app.media.island)]),
        PostData(@r(app.media.tree),"Carl","万物生长",[@r(app.media.flower),@r(app.media.sky),@r(app.media.spring)])
        ]

    public func onAppear() {
        AppLog.info("BindContentCover onAppear.")
    }
    public func onDisappear() {
        AppLog.info("BindContentCover onDisappear.")
    }

    private func onAvatarClicked(index: Int):Unit {
        this.selectedIndex = index
        animateTo(
            AnimateParam(duration: 350, curve: Curve.Friction),
            {
                =>
                this.isPersonalPageShow = !this.isPersonalPageShow
                this.alphaValue = 0
            }
        )
    }

    private func onPersonalPageBack(index: Int): Unit {
        animateTo(AnimateParam(duration: 350, curve: Curve.Friction), {
            =>
            this.isPersonalPageShow = !this.isPersonalPageShow;
            this.alphaValue = 1;
        })
    }

    @Builder
    public func PersonalPageBuilder() {
        Column() {
            Image(this.allPostData[this.selectedIndex].avatar)
            .size(width: 200, height: 200)
            .borderRadius(100)
            // Configure shared element transition effect, matching the ID of the clicked avatar
            .geometryTransition(this.selectedIndex.toString())
            .clip(true)
            .transition(TransitionEffect.opacity(0.99))

            Text(this.allPostData[this.selectedIndex].name)
            .font(TextFont(size: 30, weight: FontWeight.W600))
            // Add appearance transition effect to the text
            .transition(TransitionEffect.asymmetric(
                TransitionEffect.OPACITY.combine(TransitionEffect.translate(TranslateOptions(x: 100, y: 100, z: 100))),
                TransitionEffect.OPACITY.animation(AnimateParam(duration: 0))))

            Text("Hello, I'm ${this.allPostData[this.selectedIndex].name}")
            .transition(TransitionEffect.asymmetric(
                TransitionEffect.OPACITY.combine(TransitionEffect.translate(TranslateOptions(x: 100, y: 100, z: 100))),
                TransitionEffect.OPACITY.animation(AnimateParam(duration: 0))))
        }
        .padding(20)
        .size(width: 360, height: 780)
        .backgroundColor(Color.WHITE)
        .onClick {
            evt =>
            this.onPersonalPageBack(this.selectedIndex)
        }
        .transition(TransitionEffect.asymmetric(
            TransitionEffect.opacity(0.99), TransitionEffect.OPACITY
        ))
    }

    func build() {
        Column() {
            ForEach(this.allPostData, itemGeneratorFunc: {postData: PostData, index: Int
                =>
                Column() {
                    Post(data: postData, index: index, postOnAvatarClicked: this.onAvatarClicked)
                    }.width(100.percent)
                }
             )
        }
        .size(width: 100.percent, height: 100.percent)
        .backgroundColor(Color.GREY)
        .bindContentCover(this.isPersonalPageShow, this.PersonalPageBuilder,
            ContentCoverOptions(
            modalTransition: ModalTransition.NONE,
            onAppear: onAppear,
            onDisappear: onDisappear)
            )
        .opacity(this.alphaValue)
    }
}

@Component
class Post {
    @Prop var data: PostData
    @Prop var index: Int

    @State var expandImageSize: Int = 100
    @State var avatarSize: Int = 50

    let postOnAvatarClicked: (Int) -> Unit

    public func build() {
         Column() {
            Row() {
                Image(this.data.avatar)
                .size(width: this.avatarSize, height: this.avatarSize)
                .borderRadius(this.avatarSize/2)
                .clip(true)
                .onClick {
                        evt =>
                        this.postOnAvatarClicked(this.index)
                }
                // Bind shared element transition ID to the avatar
                .geometryTransition(this.index.toString(), followWithoutTransition: true)
                .transition(TransitionEffect.OPACITY.animation(AnimateParam(duration: 350, curve: Curve.Friction)))

                Text(this.data.name)
            }
            .justifyContent(FlexAlign.Center)

            Text(this.data.message)

            Row() {
                ForEach(this.data.images, {imageResource: AppResource, index: Int
                    =>
                    Image(imageResource)
                    .size(width: 100, height: 100)
                    })
            }
         }
        .backgroundColor(Color.WHITE)
        .size(width: 100.percent, height: 250)
        .alignItems(HorizontalAlign.Start)
        .padding(left: 10, top: 10)
    }
}
```

The effect is that clicking the avatar on the homepage pops up a modal page displaying personal information, with a seamless transition animation between the avatars on both pages:

![shared-element-transiton2](./figures/shared-element-transition2.gif)
```