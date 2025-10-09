# Video

用于播放视频文件并控制其播放状态的组件。

> **说明：**
>
> Video组件只提供简单的视频播放功能，无法支撑复杂的视频播控场景。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## 需要权限

使用网络视频时，需要申请权限ohos.permission.INTERNET。

## 子组件

不支持子组件。

## 创建组件

### init(ResourceStr, PlaybackSpeed, ResourceStr, VideoController)

```cangjie
public init(
    src!: ResourceStr = "",
    currentProgressRate!: PlaybackSpeed = SpeedForward100X,
    previewUri!: ResourceStr = "",
    controller!: VideoController = VideoController()
)
```

**功能：** 根据视频的数据源，播放倍速，预览图片和视频控制器创建一个 video 组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""|**命名参数。** 视频的数据源，支持本地视频和网络视频。<br/>string格式可用于加载网络视频和本地视频，常用于加载网络视频。<br/>\- 支持网络视频地址。<br/>\- 支持file://路径前缀的字符串，即应用沙箱URI：file://<bundleName>/<sandboxPath>。用于读取应用沙箱路径内的资源。需要保证目录包路径下的文件有可读权限。<br/>视频支持的格式是：mp4、mkv、TS。|
|currentProgressRate|[PlaybackSpeed](#enum-playbackspeed)|否|SpeedForward100X|**命名参数。** 视频播放倍速。<br/>取值仅支持：0.75，1.0，1.25，1.75，2.0。|
|previewUri|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|否|""|**命名参数。** 视频未播放时的预览图片路径。|
|controller|[VideoController](#class-videocontroller)|否|VideoController()|**命名参数。** 设置视频控制器，可以控制视频的播放状态。|

## 通用属性/通用事件

通用属性：全部支持。

通用事件：全部支持。

## 组件属性

### func autoPlay(Bool)

```cangjie
public func autoPlay(value: Bool): This
```

**功能：** 设置是否自动播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否自动播放。<br>初始值：false。|

### func controls(Bool)

```cangjie
public func controls(value: Bool): This
```

**功能：** 设置控制视频播放的控制栏是否显示。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|控制视频播放的控制栏是否显示。<br>初始值：true。|

### func loop(Bool)

```cangjie
public func loop(value: Bool): This
```

**功能：** 设置是否单个视频循环播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否单个视频循环播放。<br>初始值：false。|

### func muted(Bool)

```cangjie
public func muted(value: Bool): This
```

**功能：** 设置是否静音。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否静音。<br>初始值：false。|

### func objectFit(ImageFit)

```cangjie
public func objectFit(value: ImageFit): This
```

**功能：** 设置视频显示模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[ImageFit](./cj-common-types.md#enum-imagefit)|是|-|视频显示模式。<br>初始值：Cover。|

## 组件事件

### func onError(VoidCallback)

```cangjie
public func onError(event: VoidCallback): This
```

**功能：** 播放失败时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|[VoidCallback](../BasicServicesKit/cj-apis-base.md#type-VoidCallback)|是|-|回调函数，播放失败时触发。|

### func onFinish(() -> Unit)

```cangjie
public func onFinish(event: () -> Unit): This
```

**功能：** 播放结束时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|()->Unit|是|-|回调函数，播放结束时触发。|

### func onFullscreenChange(Callback\<FullscreenInfo,Unit>)

```cangjie
public func onFullscreenChange(callback: Callback<FullscreenInfo, Unit>): This
```

**功能：** 在全屏播放与非全屏播放状态之间切换时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[Callback](../BasicServicesKit/cj-apis-base.md#type-Callback)\<[FullscreenInfo](#class-fullscreeninfo),Unit>|是|-|回调函数，在全屏播放与非全屏播放状态之间切换时触发。|

### func onPause(VoidCallback)

```cangjie
public func onPause(event: VoidCallback): This
```

**功能：** 暂停播放时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|[VoidCallback](../BasicServicesKit/cj-apis-base.md#type-VoidCallback)|是|-|回调函数，暂停播放时触发。|

### func onPrepared(Callback\<PreparedInfo,Unit>)

```cangjie
public func onPrepared(callback: Callback<PreparedInfo, Unit>): This
```

**功能：** 视频准备完成时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[Callback](../BasicServicesKit/cj-apis-base.md#type-Callback)\<[PreparedInfo](#class-preparedinfo),Unit>|是|-|回调函数，视频准备完成时触发。|

### func onSeeked(Callback\<PlaybackInfo,Unit>)

```cangjie
public func onSeeked(callback: Callback<PlaybackInfo, Unit>): This
```

**功能：** 操作进度条完成后触发该事件，上报播放时间信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[Callback](../BasicServicesKit/cj-apis-base.md#type-Callback)\<[PlaybackInfo](#class-playbackinfo),Unit>|是|-|回调函数，操作进度条完成后触发。|

### func onSeeking(Callback\<PlaybackInfo,Unit>)

```cangjie
public func onSeeking(callback: Callback<PlaybackInfo, Unit>): This
```

**功能：** 操作进度条过程时触发该事件，上报时间信息。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[Callback](../BasicServicesKit/cj-apis-base.md#type-Callback)\<[PlaybackInfo](#class-playbackinfo),Unit>|是|-|回调函数，操作进度条过程时触发。<br>参数值：当前视频的时长，单位为秒。|

### func onStart(VoidCallback)

```cangjie
public func onStart(event: VoidCallback): This
```

**功能：** 播放时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|[VoidCallback](../BasicServicesKit/cj-apis-base.md#type-VoidCallback)|是|-|回调函数，播放时触发。|

### func onUpdate(Callback\<PlaybackInfo,Unit>)

```cangjie
public func onUpdate(callback: Callback<PlaybackInfo, Unit>): This
```

**功能：** 说明播放进度变化时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|[Callback](../BasicServicesKit/cj-apis-base.md#type-Callback)\<[PlaybackInfo](#class-playbackinfo),Unit>|是|-|回调函数，说明播放进度变化时触发。|

## 基础类型定义

### class FullscreenInfo

```cangjie
public class FullscreenInfo {
    public var fullscreen: Bool
}
```

**功能：** 用于描述当前视频是否进入全屏播放状态。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var fullscreen

```cangjie
public var fullscreen: Bool
```

**功能：**当前视频是否进入全屏播放状态。

**类型：** Bool

**读写能力：** 可读写

### class PlaybackInfo

```cangjie
public class PlaybackInfo {
    public var time: Int32
}
```

**功能：**用于描述当前视频播放的进度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var time

```cangjie
public var time: Int32
```

**功能：**当前视频播放的进度。

**类型：** Int32

**读写能力：** 可读写

### class PreparedInfo

```cangjie
public class PreparedInfo {
    public var duration: Int32
}
```

**功能：** 用于描述当前视频的时长。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### var duration

```cangjie
public var duration: Int32
```

**功能：**当前视频的时长。

**类型：** Int32

**读写能力：** 可读写

### class VideoController

```cangjie
public class VideoController {
    public init()
}
```

**功能：** VideoController对象可以控制一个或多个video。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### init()

```cangjie
public init()
```

**功能：** 创建一个 VideoController 对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func exitFullscreen()

```cangjie
public func exitFullscreen(): Unit
```

**功能：** 退出全屏播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func pause()

```cangjie
public func pause(): Unit
```

**功能：** 暂停播放，显示当前帧，再次播放时从当前位置继续播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func requestFullscreen(Bool)

```cangjie
public func requestFullscreen(value: Bool): Unit
```

**功能：** 请求全屏播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Bool|是|-|是否全屏（填充满应用窗口）播放。|

#### func setCurrentTime(Int32, SeekMode)

```cangjie
public func setCurrentTime(value: Int32, seekMode: SeekMode): Unit
```

**功能：** 指定视频播放的进度位置。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|视频播放进度位置。<br/>单位：s。|
|seekMode|[SeekMode](#enum-seekmode)|是|-|跳转模式。|

#### func start()

```cangjie
public func start(): Unit
```

**功能：** 开始播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func stop()

```cangjie
public func stop(): Unit
```

**功能：** 停止播放，显示当前帧，再次播放时从头开始播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### enum PlaybackSpeed

```cangjie
public enum PlaybackSpeed <: Equatable<PlaybackSpeed> {
    | SpeedForward075X
    | SpeedForward100X
    | SpeedForward125X
    | SpeedForward175X
    | SpeedForward200X
    | ...
}
```

**功能：** 定义播放速度。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<PlaybackSpeed>

#### SpeedForward075X

```cangjie
SpeedForward075X
```

**功能：** 0.75倍速播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### SpeedForward100X

```cangjie
SpeedForward100X
```

**功能：** 1倍速播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### SpeedForward125X

```cangjie
SpeedForward125X
```

**功能：** 1.25倍速播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### SpeedForward175X

```cangjie
SpeedForward175X
```

**功能：** 1.75倍速播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### SpeedForward200X

```cangjie
SpeedForward200X
```

**功能：** 2倍速播放。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func !=(PlaybackSpeed)

```cangjie
public operator func !=(other: PlaybackSpeed): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PlaybackSpeed](#enum-playbackspeed)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

#### func ==(PlaybackSpeed)

```cangjie
public operator func ==(other: PlaybackSpeed): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PlaybackSpeed](#enum-playbackspeed)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### enum SeekMode

```cangjie
public enum SeekMode <: Equatable<SeekMode> {
    | PreviousKeyframe
    | NextKeyframe
    | ClosestKeyframe
    | Accurate
    | ...
}
```

**功能：** 跳转模式。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- Equatable\<SeekMode>

#### Accurate

```cangjie
Accurate
```

**功能：** 精准跳转，不论是否为关键帧。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### ClosestKeyframe

```cangjie
ClosestKeyframe
```

**功能：** 跳转到最近的关键帧。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### NextKeyframe

```cangjie
NextKeyframe
```

**功能：** 跳转到后一个最近的关键帧。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### PreviousKeyframe

```cangjie
PreviousKeyframe
```

**功能：** 跳转到前一个最近的关键帧。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

#### func !=(SeekMode)

```cangjie
public operator func !=(other: SeekMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SeekMode](#enum-seekmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

#### func ==(SeekMode)

```cangjie
public operator func ==(other: SeekMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SeekMode](#enum-seekmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

## 示例代码

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import kit.LocalizationKit.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.AppResource

@Entry
@Component
class EntryView {
    var videoSrc: AppResource = @rawfile("video.mp4")
    var previewUri: AppResource = @r(app.media.preview)
    var controller: VideoController = VideoController()
    @State var curRate: PlaybackSpeed = PlaybackSpeed.SpeedForward100X
    @State var isAutoPlay: Bool = false
    @State var showControls: Bool = true

    func build() {
        Column() {
            Video(
                src: this.videoSrc,
                previewUri: this.previewUri,
                currentProgressRate: this.curRate,
                controller: this.controller
            )
                .width(100.percent)
                .height(600)
                .autoPlay(this.isAutoPlay)
                .controls(this.showControls)

            Row() {
                Button("start")
                    .onClick({ evt
                        => this.controller.start() // 开始播放
                    })
                    .margin(5)
                    .id("start")
                Button("pause")
                    .onClick({ evt
                        => this.controller.pause() // 暂停播放
                    })
                    .margin(5)
                    .id("pause")
                Button("stop")
                    .onClick({ evt
                        => this.controller.stop() // 暂停播放
                           this.controller.exitFullscreen()
                        }
                    )
                    .margin(5)
                    .id("stop")
            }
            Row() {
                Button("Fullscreen")
                    .onClick({ evt
                        => this.controller.requestFullscreen(true)
                    })
                    .margin(5)
                    .id("Fullscreen")
                Button("at 10s")
                    .onClick({ evt
                        => this.controller.setCurrentTime(10, SeekMode.ClosestKeyframe)
                    })
                    .margin(5)
                    .id("at 10s")
                Button("exitFull")
                    .onClick({ evt
                        => this.controller.exitFullscreen()
                    })
                    .margin(5)
                    .id("exitFull")
            }
            Row() {
                Button("rate 0.75")
                    .onClick({ evt
                        => this.curRate = PlaybackSpeed.SpeedForward075X
                    })
                    .margin(5)
                    .id("rate 0.75")
                Button("rate 1")
                    .onClick({ evt
                        => this.curRate = PlaybackSpeed.SpeedForward100X
                    })
                    .margin(5)
                    .id("rate 1")
                Button("rate 2")
                    .onClick({ evt
                        => this.curRate = PlaybackSpeed.SpeedForward200X
                    })
                    .margin(5)
                    .id("rate 2")
            }
        }
    }
}
```
