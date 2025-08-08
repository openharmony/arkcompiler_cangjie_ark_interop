# ohos.multimedia_media (Media Service)

The media service module provides developers with a set of simple and easy-to-understand interfaces, enabling convenient access to system media resources.

The media subsystem encompasses audio and video-related media operations, offering the following common functionalities:

- Retrieving audio and video metadata ([AVMetadataExtractor](#class-avmetadataextractor))

## Importing the Module

```cangjie
import kit.MediaKit.*
```

## Permission List

ohos.permission.MICROPHONE

## Usage Instructions

API sample code usage instructions:

- If the first line of the sample code contains a "// index.cj" comment, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details on the aforementioned sample project and configuration template, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#cangjie-sample-code-instructions).

## func createAVImageGenerator()

```cangjie
public func createAVImageGenerator(): AVImageGenerator
```

**Function:** Creates an AVImageGenerator instance.

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [AVImageGenerator](#class-avimagegenerator) | Video thumbnail retrieval class. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Media Error Codes](../../errorcodes/cj-errorcode-multimedia-media.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 5400101 | No memory. |

**Example:**

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

**Function:** Describes audio and video file resources, a special playback method for specific resources. Usage scenario: When audio resources in an application are stored continuously in the same file and need to be played based on offset and length.

**System Capability:** SystemCapability.Multimedia.Media.Core

**Initial Version:** 21

### var fd

```cangjie
public var fd: Int32
```

**Function:** Resource handle.

**Type:** Int32

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Media.Core

**Initial Version:** 21

### var length

```cangjie
public var length:?Int64
```

**Function:** Resource length. The default value is the remaining bytes from the offset in the file. It must be input based on preset resource information; invalid values will cause audio and video resource parsing errors.

**Type:** ?Int64

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Media.Core

**Initial Version:** 21

### var offset

```cangjie
public var offset:?Int64
```

**Function:** Resource offset. The default value is 0. It must be input based on preset resource information; invalid values will cause audio and video resource parsing errors.

**Type:** ?Int64

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Media.Core

**Initial Version:** 21

### AVFileDescriptor(Int32, ?Int64, ?Int64)

```cangjie
public AVFileDescriptor(
    public var fd: Int32,
    public var offset: ?Int64,
    public var length: ?Int64
)
```

**Function:** Constructs an audio and video file resource descriptor type.

**System Capability:** SystemCapability.Multimedia.Media.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | Resource handle, obtained via [resourceManager.getRawFd](../LocalizationKit/cj-apis-resource_manager.md#func-getrawfdstring). |
| offset | ?Int64 | Yes | - | Resource offset. Must be input based on preset resource information; invalid values will cause audio and video resource parsing errors. |
| length | ?Int64 | Yes | - | Resource length. The default value is the remaining bytes from the offset in the file. Must be input based on preset resource information; invalid values will cause audio and video resource parsing errors. |

### init(Int32)

```cangjie
public init(fd: Int32)
```

**Function:** Constructs an audio and video file resource descriptor type.

**System Capability:** SystemCapability.Multimedia.Media.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | Resource handle, obtained via [resourceManager.getRawFd](../LocalizationKit/cj-apis-resource_manager.md#func-getrawfdstring). |

## class AVImageGenerator

```cangjie
public class AVImageGenerator {}
```

**Function:** Video thumbnail retrieval class, used to obtain thumbnails from video resources. Before calling AVImageGenerator methods, an AVImageGenerator instance must be created via [createAVImageGenerator()](#func-createavimagegenerator).

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Initial Version:** 21

### prop fdSrc

```cangjie
public mut prop fdSrc: AVFileDescriptor
```

**Function:** Media file descriptor. Sets the data source via this property.

**Note:**

After passing the resource handle (fd) to an AVImageGenerator instance, do not perform other read/write operations using this handle, including but not limited to passing the same handle to multiple AVPlayer / AVMetadataExtractor / AVImageGenerator / AVTranscoder instances. Concurrent read/write operations via the same handle will cause race conditions, leading to video thumbnail data retrieval exceptions.

**Usage Example:** Assume a continuously stored media file with offset: 0 and byte length: 100. Its file descriptor is AVFileDescriptor(resource handle, offset: 0, length: 100). Sample code:

```cangjie
func testfs() {
    let timeUs = 0
    let queryOption = AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC
    let param = PixelMapParams(300, 300)
    let generator = createAVImageGenerator()
    let abilityContext = Global.getAbilityContext() // Context application context must be obtained; see usage instructions.
    let rawFd = abilityContext.resourceManager.getRawFd("trailer.mp4")
    generator.fdSrc = AVFileDescriptor(rawFd.fd, Some(rawFd.offset), Some(rawFd.length))
    let pic = generator.fetchFrameByTime(timeUs, queryOption, param)
    generator.release()
}
```

**Type:** [AVFileDescriptor](#class-avfiledescriptor)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Initial Version:** 21

### func fetchFrameByTime(Int64, AVImageQueryOptions, PixelMapParams)

```cangjie
public func fetchFrameByTime(timeUs: Int64, option: AVImageQueryOptions, param: PixelMapParams): PixelMap
```

**Function:** Retrieves a video thumbnail.

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| timeUs | Int64 | Yes | - | The timestamp in the video for which the thumbnail is required, in microseconds (μs). |
| option | [AVImageQueryOptions](#enum-avimagequeryoptions) | Yes | - | The relationship between the requested timestamp and the video frame. |
| param | [PixelMapParams](#struct-pixelmapparams) | Yes | - | Format parameters for the requested thumbnail. |

**Return Value:**

| Type | Description |
|:----|:----|
| [PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap) | Video thumbnail. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Media Error Codes](../../errorcodes/cj-errorcode-multimedia-media.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 5400102 | Operation not allowed. |
  | 5400106 | Unsupported format. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.MediaKit.*

let timeUs = 0
let queryOption = AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC
let param = PixelMapParams(300, 300)
let generator = createAVImageGenerator()
let abilityContext = Global.getAbilityContext() // Context application context must be obtained; see usage instructions.
let rawFd = abilityContext.resourceManager.getRawFd("trailer.mp4")
generator.fdSrc = AVFileDescriptor(rawFd.fd, Some(rawFd.offset), Some(rawFd.length))
let pic = generator.fetchFrameByTime(timeUs, queryOption, param)
generator.release()
```

### func release()

```cangjie
public func release(): Unit
```

**Function:** Releases resources.

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Initial Version:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Media Error Codes](../../errorcodes/cj-errorcode-multimedia-media.md).

  | Error Code ID | Error Message |
  |:---|:---|
  |5400102|Operation not allowed.|

**Example:**

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
    let abilityContext = Global.getAbilityContext() // Context application context needs to be obtained, refer to the usage instructions in this document
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

**Function:** Format parameters for output thumbnails when obtaining video thumbnails.

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Since:** 21

### var height

```cangjie
public var height: Int32
```

**Function:** Height of the output thumbnail.

**Type:** Int32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Since:** 21

### var width

```cangjie
public var width: Int32
```

**Function:** Width of the output thumbnail.

**Type:** Int32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Since:** 21

### PixelMapParams(Int32, Int32)

```cangjie
public PixelMapParams(
    public var width: Int32,
    public var height: Int32
)
```

**Function:** Constructs format parameters for thumbnails.

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| width | Int32 | Yes | - | Width of the output thumbnail. Should be greater than 0 and not exceed the original video width. Otherwise, the returned thumbnail will not be scaled. |
| height | Int32 | Yes | - | Height of the output thumbnail. Should be greater than 0 and not exceed the original video height. Otherwise, the returned thumbnail will not be scaled. |

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

**Function:** The correspondence between the desired thumbnail timestamp and the video frame.<br/>When obtaining video thumbnails, the input timestamp may not exactly match the actual video frame timestamp. This enum specifies the relationship between the input timestamp and the actual video frame timestamp.

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Since:** 21

**Parent Types:**

- Equatable\<AVImageQueryOptions>
- ToString

### AV_IMAGE_QUERY_CLOSEST

```cangjie
AV_IMAGE_QUERY_CLOSEST
```

**Function:** Indicates selecting the frame closest to the input timestamp, which may not necessarily be a keyframe.

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Since:** 21

### AV_IMAGE_QUERY_CLOSEST_SYNC

```cangjie
AV_IMAGE_QUERY_CLOSEST_SYNC
```

**Function:** Indicates selecting the keyframe closest to the input timestamp.

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Since:** 21

### AV_IMAGE_QUERY_NEXT_SYNC

```cangjie
AV_IMAGE_QUERY_NEXT_SYNC
```

**Function:** Indicates selecting the keyframe at or after the input timestamp.

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Since:** 21

### AV_IMAGE_QUERY_PREVIOUS_SYNC

```cangjie
AV_IMAGE_QUERY_PREVIOUS_SYNC
```

**Function:** Indicates selecting the keyframe at or before the input timestamp.

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Since:** 21

### func !=(AVImageQueryOptions)

```cangjie
public operator func !=(other: AVImageQueryOptions): Bool
```

**Function:** Compares whether two AVImageQueryOptions are not equal.

**System Capability:** SystemCapability.Multimedia.Media.AVImageGenerator

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [AVImageQueryOptions](#enum-avimagequeryoptions) | Yes | - | Another AVImageQueryOptions instance. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two AVImageQueryOptions are not equal, otherwise returns false. |

### func ==(AVImageQueryOptions)

```cangjie
public operator func ==(other: AVImageQueryOptions): Bool 
```

**Function:** Compares whether two AVImageQueryOptions are equal.

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [AVImageQueryOptions](#enum-avimagequeryoptions) | Yes | - | Another AVImageQueryOptions instance. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two AVImageQueryOptions are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String 
```

**Function:** Returns the string representation of AVImageQueryOptions.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of AVImageQueryOptions. |

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

**Function:** Enumeration describing playback information.

**System Capability:** SystemCapability.Multimedia.Media.Core

**Since:** 21

**Parent Types:**

- ToString
- Hashable
- Equatable\<PlaybackInfoKey>

### AVG_DOWNLOAD_RATE

```cangjie
AVG_DOWNLOAD_RATE
```

**Function:** Represents the average download rate, with a corresponding key-value type of Int32, in bits per second (bps).

**System Capability:** SystemCapability.Multimedia.Media.Core

**Since:** 21

### BUFFER_DURATION

```cangjie
BUFFER_DURATION
```

**Function:** Represents the playable duration of buffered data, with a corresponding key-value type of Int64, in seconds (s).

**System Capability:** SystemCapability.Multimedia.Media.Core

**Since:** 21

### DOWNLOAD_RATE

```cangjie
DOWNLOAD_RATE
```

**Function:** Represents the download rate over 1 second, with a corresponding key-value type of Int64, in bits per second (bps).

**System Capability:** SystemCapability.Multimedia.Media.Core

**Since:** 21

### IS_DOWNLOADING

```cangjie
IS_DOWNLOADING
```

**Function:** Represents the download status, where 1 indicates downloading and 0 indicates not downloading (download complete), with a corresponding key-value type of Int32.

**System Capability:** SystemCapability.Multimedia.Media.Core

**Since:** 21
### SERVER_IP_ADDRESS

```cangjie
SERVER_IP_ADDRESS
```

**Function:** Represents the server IP address, with its corresponding key-value type being String.

**System Capability:** SystemCapability.Multimedia.Media.Core

**Initial Version:** 21

### func !=(PlaybackInfoKey)

```cangjie
public operator func !=(other: PlaybackInfoKey): Bool 
```

**Function:** Determines whether two PlaybackInfoKeys are unequal.

**System Capability:** SystemCapability.Multimedia.Media.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PlaybackInfoKey](#enum-playbackinfokey) | Yes | - | Another PlaybackInfoKey. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two PlaybackInfoKeys are unequal, otherwise returns false. |

### func ==(PlaybackInfoKey)

```cangjie
public operator func ==(other: PlaybackInfoKey): Bool 
```

**Function:** Determines whether two PlaybackInfoKeys are equal.

**System Capability:** SystemCapability.Multimedia.Media.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PlaybackInfoKey](#enum-playbackinfokey) | Yes | - | Another PlaybackInfoKey. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two PlaybackInfoKeys are equal, otherwise returns false. |

### func hashCode()

```cangjie
public func hashCode(): Int64
```

**Function:** Returns the hash value of the PlaybackInfoKey.

**System Capability:** SystemCapability.Multimedia.Media.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | Returns the hash value of the PlaybackInfoKey. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Returns the string representation of the PlaybackInfoKey.

**System Capability:** SystemCapability.Multimedia.Media.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the string representation of the PlaybackInfoKey. |

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

**Function:** Represents the value type of key-value pairs in [PlaybackInfo](#type-playbackinfo) and [MediaDescription](#type-mediadescription).

**Initial Version:** 21

### DOUBLE(Float64)

```cangjie
DOUBLE(Float64)
```

**Function:** Represents Float64 type data.

**Initial Version:** 21

### INT(Int32)

```cangjie
INT(Int32)
```

**Function:** Represents Int32 type data.

**Initial Version:** 21

### INT64(Int64)

```cangjie
INT64(Int64)
```

**Function:** Represents Int64 type data.

**Initial Version:** 21

### STRING(String)

```cangjie
STRING(String)
```

**Function:** Represents String type data.

**Initial Version:** 21

## type MediaDescription

```cangjie
public type MediaDescription = HashMap<String, ValueType>
```

**Function:** [MediaDescription](#type-mediadescription) is an alias for the HashMap\<String, [ValueType](#enum-valuetype)> type.

## type PlaybackInfo

```cangjie
public type PlaybackInfo = HashMap<PlaybackInfoKey, ValueType>
```

**Function:** [PlaybackInfo](#type-playbackinfo) is an alias for the HashMap\<[PlaybackInfo](#type-playbackinfo), [ValueType](#enum-valuetype)> type.

**Initial Version:** 21