# ohos.multimedia_media（媒体服务）

媒体服务模块为开发者提供一套简单且易于理解的接口，使得开发者能够方便接入系统并使用系统的媒体资源。

媒体子系统包含了音视频相关媒体业务，提供以下常用功能：

- 获取音视频元数据（[AVMetadataExtractor](#class-avmetadataextractor)）

## 导入模块

```cangjie
import kit.MediaKit.*
```

## 权限列表

ohos.permission.MICROPHONE

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func createAVImageGenerator()

```cangjie
public func createAVImageGenerator(): AVImageGenerator
```

**功能：** 创建AVImageGenerator实例。

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[AVImageGenerator](#class-avimagegenerator)|视频缩略图获取类。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Media错误码](../../errorcodes/cj-errorcode-multimedia-media.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |5400101|No memory.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.MediaKit.*

try {
    let generator = createAVImageGenerator()
} catch (e: BusinessException) {
    AppLog.error(e.message)
}
```

## class AVFileDescriptor

```cangjie
public class AVFileDescriptor {
    public AVFileDescriptor(
        public var fd: Int32,
        public var offset: ?Int64,
        public var length: ?Int64
    )
    public init(fd: Int32)
}
```

**功能：** 音视频文件资源描述，一种特殊资源的播放方式，使用场景：应用中的音频资源被连续存储在同一个文件中，需要根据偏移量和长度进行播放。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

### var fd

```cangjie
public var fd: Int32
```

**功能：** 资源句柄。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

### var length

```cangjie
public var length:?Int64
```

**功能：** 资源长度，默认值为文件中从偏移量开始的剩余字节，需要基于预置资源的信息输入，非法值会造成音视频资源解析错误。

**类型：** ?Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

### var offset

```cangjie
public var offset:?Int64
```

**功能：** 资源偏移量，默认值为0，需要基于预置资源的信息输入，非法值会造成音视频资源解析错误。

**类型：** ?Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

### AVFileDescriptor(Int32, ?Int64, ?Int64)

```cangjie
public AVFileDescriptor(
    public var fd: Int32,
    public var offset: ?Int64,
    public var length: ?Int64
)
```

**功能：** 构造音视频文件资源描述类型。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|资源句柄，通过[resourceManager.getRawFd](../LocalizationKit/cj-apis-resource_manager.md#func-getrawfdstring)获取。|
|offset|?Int64|是|-|资源偏移量，需要基于预置资源的信息输入，非法值会造成字幕频资源解析错误。|
|length|?Int64|是|-|资源长度，默认值为文件中从偏移量开始的剩余字节，需要基于预置资源的信息输入，非法值会造成字幕频资源解析错误。|

### init(Int32)

```cangjie
public init(fd: Int32)
```

**功能：** 构造音视频文件资源描述类型。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|资源句柄，通过[resourceManager.getRawFd](../LocalizationKit/cj-apis-resource_manager.md#func-getrawfdstring)获取。|

## class AVImageGenerator

```cangjie
public class AVImageGenerator {}
```

**功能：** 视频缩略图获取类，用于从视频资源中获取缩略图。在调用AVImageGenerator的方法前，需要先通过[createAVImageGenerator()](#func-createavimagegenerator)构建一个AVImageGenerator实例。


**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

### prop fdSrc

```cangjie
public mut prop fdSrc: AVFileDescriptor
```

**功能：** 媒体文件描述，通过该属性设置数据源。

**说明：**

将资源句柄（fd）传递给AVImageGenerator 实例之后，请不要通过该资源句柄做其他读写操作，包括但不限于将同一个资源句柄传递给多个AVPlayer / AVMetadataExtractor / AVImageGenerator / AVTranscoder。同一时间通过同一个资源句柄读写文件时存在竞争关系，将导致视频缩略图数据获取异常。

**使用示例**：假设一个连续存储的媒体文件，地址偏移:0，字节长度:100。其文件描述为AVFileDescriptor(资源句柄, offset: 0, length: 100)，示例代码如下：

```cangjie
func testfs() {
    let timeUs = 0
    let queryOption = AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC
    let param = PixelMapParams(300, 300)
    let generator = createAVImageGenerator()
    let abilityContext = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
    let rawFd = abilityContext.resourceManager.getRawFd("trailer.mp4")
    generator.fdSrc = AVFileDescriptor(rawFd.fd, Some(rawFd.offset), Some(rawFd.length))
    let pic = generator.fetchFrameByTime(timeUs, queryOption, param)
    generator.release()
}
```

**类型：** [AVFileDescriptor](#class-avfiledescriptor)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

### func fetchFrameByTime(Int64, AVImageQueryOptions, PixelMapParams)

```cangjie
public func fetchFrameByTime(timeUs: Int64, option: AVImageQueryOptions, param: PixelMapParams): PixelMap
```

**功能：** 获取视频缩略图。

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|timeUs|Int64|是|-|需要获取的缩略图在视频中的时间点，单位为微秒（μs）。|
|option|[AVImageQueryOptions](#enum-avimagequeryoptions)|是|-|需要获取的缩略图时间点与视频帧的对应关系。|
|param|[PixelMapParams](#struct-pixelmapparams)|是|-|需要获取的缩略图的格式参数。|

**返回值：**

|类型|说明|
|:----|:----|
|[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)|视频缩略图。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Media错误码](../../errorcodes/cj-errorcode-multimedia-media.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |5400102|Operation not allowed.|
  |5400106|Unsupported format.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaKit.*

let timeUs = 0
let queryOption = AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC
let param = PixelMapParams(300, 300)
let generator = createAVImageGenerator()
let abilityContext = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let rawFd = abilityContext.resourceManager.getRawFd("trailer.mp4")
generator.fdSrc = AVFileDescriptor(rawFd.fd, Some(rawFd.offset), Some(rawFd.length))
let pic = generator.fetchFrameByTime(timeUs, queryOption, param)
generator.release()
```

### func release()

```cangjie
public func release(): Unit
```

**功能：** 释放资源。

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Media错误码](../../errorcodes/cj-errorcode-multimedia-media.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |5400102|Operation not allowed.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaKit.*
import ohos.base.*

try {
    let timeUs = 0
    let queryOption = AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC
    let param = PixelMapParams(300, 300)
    let generator = createAVImageGenerator()
    let abilityContext = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
    let rawFd = abilityContext.resourceManager.getRawFd("demo.mp4")
    generator.fdSrc = AVFileDescriptor(rawFd.fd, rawFd.offset, rawFd.length)
    generator.release()
} catch (e: BusinessException) {
    AppLog.error(e.message)
}
```

## class PixelMapParams

```cangjie
public class PixelMapParams {
    public PixelMapParams(
        public var width: Int32,
        public var height: Int32
    )
}
```

**功能：** 获取视频缩略图时，输出缩略图的格式参数。

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

### var height

```cangjie
public var height: Int32
```

**功能：** 输出的缩略图高度。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

### var width

```cangjie
public var width: Int32
```

**功能：** 输出的缩略图宽度。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

### PixelMapParams(Int32, Int32)

```cangjie
public PixelMapParams(
    public var width: Int32,
    public var height: Int32
)
```

**功能：** 构造缩略图的格式参数。

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|width|Int32|是|-|输出的缩略图宽度。应保证大于0且不大于原始视频宽度。否则返回的缩略图不会进行缩放。|
|height|Int32|是|-|输出的缩略图高度。应保证大于0且不大于原始视频高度。否则返回的缩略图不会进行缩放。|

## enum AVImageQueryOptions

```cangjie
public enum AVImageQueryOptions <: Equatable<AVImageQueryOptions> & ToString {
    | AV_IMAGE_QUERY_NEXT_SYNC
    | AV_IMAGE_QUERY_PREVIOUS_SYNC
    | AV_IMAGE_QUERY_CLOSEST_SYNC
    | AV_IMAGE_QUERY_CLOSEST
    | ...
}
```

**功能：** 需要获取的缩略图时间点与视频帧的对应关系。<br/>在获取视频缩略图时，传入的时间点与实际取得的视频帧所在时间点不一定相等，需要指定传入的时间点与实际取得的视频帧的时间关系。

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

**父类型：**

- Equatable\<AVImageQueryOptions>
- ToString

### AV_IMAGE_QUERY_CLOSEST

```cangjie
AV_IMAGE_QUERY_CLOSEST
```

**功能：** 表示选取离传入时间点最近的帧，该帧不一定是关键帧。

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

### AV_IMAGE_QUERY_CLOSEST_SYNC

```cangjie
AV_IMAGE_QUERY_CLOSEST_SYNC
```

**功能：** 表示选取离传入时间点最近的关键帧。

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

### AV_IMAGE_QUERY_NEXT_SYNC

```cangjie
AV_IMAGE_QUERY_NEXT_SYNC
```

**功能：** 表示选取传入时间点或之后的关键帧。

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

### AV_IMAGE_QUERY_PREVIOUS_SYNC

```cangjie
AV_IMAGE_QUERY_PREVIOUS_SYNC
```

**功能：** 表示选取传入时间点或之前的关键帧。

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

### func !=(AVImageQueryOptions)

```cangjie
public operator func !=(other: AVImageQueryOptions): Bool
```

**功能：** 比较两个AVImageQueryOptions是否不等。

**系统能力：** SystemCapability.Multimedia.Media.AVImageGenerator

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AVImageQueryOptions](#enum-avimagequeryoptions)|是|-|另一AVImageQueryOptions实例。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个AVImageQueryOptions不等返回true，否则返回false。|

### func ==(AVImageQueryOptions)

```cangjie
public operator func ==(other: AVImageQueryOptions): Bool 
```

**功能：** 比较两个AVImageQueryOptions是否相等。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AVImageQueryOptions](#enum-avimagequeryoptions)|是|-|另一AVImageQueryOptions实例。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个AVImageQueryOptions相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 返回AVImageQueryOptions的字符串表示。

**返回值：**

|类型|说明|
|:----|:----|
|String|AVImageQueryOptions的字符串表示。|

## enum PlaybackInfoKey

```cangjie
public enum PlaybackInfoKey <: ToString & Hashable & Equatable<PlaybackInfoKey> {
    | SERVER_IP_ADDRESS
    | AVG_DOWNLOAD_RATE
    | DOWNLOAD_RATE
    | IS_DOWNLOADING
    | BUFFER_DURATION
    | ...
}
```

**功能：** 播放信息描述枚举。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

**父类型：**

- ToString
- Hashable
- Equatable\<PlaybackInfoKey>

### AVG_DOWNLOAD_RATE

```cangjie
AVG_DOWNLOAD_RATE
```

**功能：** 表示平均下载速率，其对应键值类型为Int32，单位为比特率（bps）。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

### BUFFER_DURATION

```cangjie
BUFFER_DURATION
```

**功能：** 表示缓存数据的可播放时长，其对应键值类型为Int64，单位为秒（s）。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

### DOWNLOAD_RATE

```cangjie
DOWNLOAD_RATE
```

**功能：** 表示1s的下载速率，其对应键值类型为Int64，单位为比特率（bps）。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

### IS_DOWNLOADING

```cangjie
IS_DOWNLOADING
```

**功能：** 表示下载状态，1表示在下载状态，0表示非下载状态（下载完成），其对应键值类型为Int32。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

### SERVER_IP_ADDRESS

```cangjie
SERVER_IP_ADDRESS
```

**功能：** 表示服务器IP地址，其对应键值类型为String。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

### func !=(PlaybackInfoKey)

```cangjie
public operator func !=(other: PlaybackInfoKey): Bool 
```

**功能：** 判断两个PlaybackInfoKey是否不等。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PlaybackInfoKey](#enum-playbackinfokey)|是|-|另一PlaybackInfoKey。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个PlaybackInfoKey不等返回true，否则返回false。|

### func ==(PlaybackInfoKey)

```cangjie
public operator func ==(other: PlaybackInfoKey): Bool 
```

**功能：** 判断两个PlaybackInfoKey是否相等。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PlaybackInfoKey](#enum-playbackinfokey)|是|-|另一PlaybackInfoKey。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个PlaybackInfoKey相等返回true，否则返回false。|

### func hashCode()

```cangjie
public func hashCode(): Int64
```

**功能：** 返回PlaybackInfoKey哈希值。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|返回PlaybackInfoKey哈希值。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 返回PlaybackInfoKey的字符串表示。

**系统能力：** SystemCapability.Multimedia.Media.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回PlaybackInfoKey的字符串表示。|

## enum ValueType

```cangjie
public enum ValueType {
    | INT(Int32)
    | INT64(Int64)
    | DOUBLE(Float64)
    | STRING(String)
    | ...
}
```

**功能：** 表示[PlaybackInfo](#type-playbackinfo)和[MediaDescription](#type-mediadescription)键值对的值类型。

**起始版本：** 21

### DOUBLE(Float64)

```cangjie
DOUBLE(Float64)
```

**功能：** 表示Float64类型数据。

**起始版本：** 21

### INT(Int32)

```cangjie
INT(Int32)
```

**功能：** 表示Int32类型数据。

**起始版本：** 21

### INT64(Int64)

```cangjie
INT64(Int64)
```

**功能：** 表示Int64类型数据。

**起始版本：** 21

### STRING(String)

```cangjie
STRING(String)
```

**功能：** 表示String类型数据。

**起始版本：** 21

## type MediaDescription

```cangjie
public type MediaDescription = HashMap<String, ValueType>
```

**功能：** [MediaDescription](#type-mediadescription)是HashMap\<String, [ValueType](#enum-valuetype)>类型的别名。

## type PlaybackInfo

```cangjie
public type PlaybackInfo = HashMap<PlaybackInfoKey, ValueType>
```

**功能：** [PlaybackInfo](#type-playbackinfo)是HashMap\<[PlaybackInfo](#type-playbackinfo), [ValueType](#enum-valuetype)>类型的别名。

**起始版本：** 21
