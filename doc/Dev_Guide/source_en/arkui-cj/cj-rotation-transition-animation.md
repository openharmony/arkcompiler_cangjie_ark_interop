# Rotation Screen Animation

Rotation screen animations are primarily categorized into two types: [Layout Transition Rotation Animation](#layout-transition-rotation-animation) and [Opacity Transition Rotation Animation](#opacity-transition-rotation-animation), designed to achieve natural transitions during screen orientation changes. The layout transition rotation animation is relatively straightforward to implement, such as configuring auto-rotation in module.json5 (or setting window display orientation). The opacity transition rotation animation, however, requires preparing two sets of views in addition to the module.json5 configuration. During screen rotation, the disappearing view gradually fades out while the new view gradually fades in, creating a smooth visual experience.

## Layout Transition Rotation Animation

The layout transition rotation animation is designed to synchronize window and application view rotations during screen orientation changes, featuring size and position transition animations. This type of rotation animation is system-default and developer-friendly. When the screen orientation changes, the system generates a window rotation animation and automatically adjusts the window size to match the rotated dimensions. During this process, the window notifies the corresponding application to re-layout based on the new window size, producing a layout animation with parameters identical to the window rotation animation.

Switching the screen orientation achieves the layout transition rotation animation effect.

 <!--run-->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.__GenerateResource__

@Entry
@Component
class EntryView{
    func build(){
        Column(){
            Image(@r(app.media.foreground))
                .position(x: 0,y: 0)
                .size(width: 100,height: 100)
                .id('image1')
                .backgroundColor(Color.BLUE)
        }
    }
}
```

Add "orientation" to the abilities list in the project's module.json5 file and set it to "auto_rotation".

```json
"orientation": "auto_rotation",
```

The layout transition rotation animation applies size and position transitions to synchronously rotating windows and application views.

![Alt text](./figures/rotation-transition1.gif)

## Opacity Transition Rotation Animation

The opacity transition rotation animation activates during screen orientation changes. When the window performs a rotation animation, it adds default opacity transitions to newly added or removed components for graceful appearance and disappearance. This functionality listens for window rotation events and switches component view effects during these events. If the root nodes of disappearing and newly appearing views have no transition effects set, the system automatically applies a default opacity transition (i.e., [TransitionEffect](../../../API_Reference/source_zh_cn/arkui-cj/cj-animation-transition.md#class-transitioneffect).OPACITY), creating fade-out and fade-in effects.

 <!-- run -example1 -->

```cangjie
package ohos_app_cangjie_entry

import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.*
import ohos.display.*
import ohos.display.{Orientation as DisplayOrientation}

func matchor(orientation: DisplayOrientation): String {
    match(orientation){
        case PORTRAIT => "PORTRAIT"
        case LANDSCAPE => "LANDSCAPE"
        case PORTRAIT_INVERTED => "PORTRAIT_INVERTED"
        case LANDSCAPE_INVERTED => "LANDSCAPE_INVERTED"
        case _ => throw IllegalArgumentException("The type is not supported yet.")
    }
}

@Entry
@Component
class EntryView{
    // Get screen orientation by listening to the windowsSizeChange event of the window
    @StorageLink["orientation"] var orientation: DisplayOrientation  = DisplayOrientation.PORTRAIT

    func build(){
        Stack() {
            if(matchor(orientation) == "PORTRAIT"|| matchor(orientation) == "PORTRAIT_INVERTED"){
                Image(@r(app.media.img_1))
                    .size(width: 100, height: 100 )
                    .id('image1')
                  // Developers can also manually set TransitionEffect.OPACITY for transition effects to achieve opacity changes in rotation animations
//                   .transition(TransitionEffect.OPACITY)
            }else{
                Image(@r(app.media.img_2))
                    .position(x: 0, y: 0 )
                    .size( width: 200, height: 200)
                    .id('image2')
                    // Developers can also manually set TransitionEffect.OPACITY for transition effects to achieve opacity changes in rotation animations
//                    .transition(TransitionEffect.OPACITY)
            }
        }.backgroundColor(Color.WHITE).size(width: 100.percent, height: 100.percent)
    }
}
```

Listen to the synchronous windowsSizeChange event of window rotation to implement view switching. For example, add processing logic in the onWindowStageCreate method of main_ability.cj to obtain the screen orientation.

 <!-- run -example1 -->

```cangjie
package ohos_app_cangjie_entry

internal import ohos.base.AppLog
internal import ohos.ability.AbilityStage
internal import ohos.ability.LaunchReason
import ohos.display.getDefaultDisplaySync
import ohos.window.*
import ohos.state_manage.*
import ohos.base.Callback1Argument
import ohos.window.{Size as WindowSize}
import ohos.display.{Orientation as DisplayOrientation}
import ohos.display.Display

class Callback1ArgumentImpl<WindowSize> <: Callback1Argument<WindowSize> {
    public Callback1ArgumentImpl(let callback: (WindowSize) -> Unit) {}

    public open func invoke(arg1: WindowSize) {
        callback(arg1)
    }
}

class MainAbility <: Ability {
    public init() {
        super()
        registerSelf()
    }

    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        AppLog.info("MainAbility OnCreated.${want.abilityName}")
        match (launchParam.launchReason) {
            case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
            case _ => ()
        }
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        AppLog.info("MainAbility onWindowStageCreate.")
        let callback: Callback1Argument<WindowSize> = Callback1ArgumentImpl<WindowSize>({
                size: WindowSize =>
                    let displayClass = getDefaultDisplaySync()
                    AppStorage.set<DisplayOrientation>("orientation", displayClass.orientation)
            })

        let mainWindow: Window = windowStage.getMainWindow()
        let display: Display = getDefaultDisplaySync()
        AppStorage.setOrCreate<DisplayOrientation>("orientation", display.orientation)
        mainWindow.on(WindowCallbackType.WindowSizeChange, callback)

        windowStage.loadContent("EntryView")
    }
}
```

Add "orientation" to the abilities list in the project's module.json5 file and set it to "auto_rotation".

```json
"orientation": "auto_rotation",
```

The opacity transition rotation animation applies size and position transitions to the window while simultaneously transitioning application views, with fading effects for disappearing views and appearing effects for new views.

![rotation-opacity](figures/rotation-opacity.gif)