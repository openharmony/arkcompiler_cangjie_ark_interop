/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos.multimedia_media

import std.deriving.*
import ohos.ffi.*
import ohos.labels.APILevel
import ohos.base.*

/**
 * Provides the video transcode configuration definitions
 * @relation interface AVTranscoderConfig
 */
@!APILevel[
    20,
    syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
]
public class AVTranscoderConfig {
    /**
     * Indicates the audio bitrate.
     * @relation audioBitrate?: number;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public var audioBitrate: Int32
    /**
     * Indicates the audio encoding format.
     * @relation audioCodec?: CodecMimeType;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public var audioCodec: ?CodecMimeType
    /**
     * Indicates the output file format.
     * @relation fileFormat: ContainerFormatType;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public var fileFormat: ?ContainerFormatType
    /**
     * Indicates the video bitrate.
     * @relation videoBitrate?: number;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public var videoBitrate: Int32
    /**
     * Indicates the video encoding foramt.
     * @relation videoCodec?: CodecMimeType;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public var videoCodec: ?CodecMimeType
    /**
     * Indicates the video width.
     * @relation videoFrameWidth?: number;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public var videoFrameWidth: Int32
    /**
     * Indicates the video height.
     * @relation videoFrameHeight?: number;
     */
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public var videoFrameHeight: Int32

    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    public init(
        audioBitrate!: Int32 = 48000,
        audioCodec!: ?CodecMimeType = None,
        fileFormat!: ?ContainerFormatType,
        videoBitrate!: Int32 = -1,
        videoCodec!: ?CodecMimeType = None,
        videoFrameWidth!: Int32 = -1,
        videoFrameHeight!: Int32 = -1
    ) {
        this.audioBitrate = audioBitrate
        this.audioCodec = audioCodec
        this.fileFormat = fileFormat
        this.videoBitrate = videoBitrate
        this.videoCodec = videoCodec
        this.videoFrameWidth = videoFrameWidth
        this.videoFrameHeight = videoFrameHeight
    }
}

@C
struct CAVTranscoderConfig {
    var audioBitrate: Int32 = -1
    var audioCodec: CString = CString(CPointer())
    var fileFormat: CString = CString(CPointer())
    var videoBitrate: Int32 = -1
    var videoCodec: CString = CString(CPointer())
    var videoFrameWidth: Int32 = -1
    var videoFrameHeight: Int32 = -1

    init(config: AVTranscoderConfig) {
        try {
            unsafe {
                this.audioBitrate = config.audioBitrate
                var str = match (config.audioCodec) {
                    case Some(v) => v.get()
                    case None => ""
                }
                this.audioCodec = LibC.mallocCString(str)
                str = match (config.fileFormat) {
                    case Some(v) => v.get()
                    case None => ""
                }
                this.fileFormat = LibC.mallocCString(str)
                this.videoBitrate = config.videoBitrate
                str = match (config.videoCodec) {
                    case Some(v) => v.get()
                    case None => ""
                }
                this.videoCodec = LibC.mallocCString(str)
                this.videoFrameWidth = config.videoFrameWidth
                this.videoFrameHeight = config.videoFrameHeight
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(fileFormat)
                LibC.free(audioCodec)
                LibC.free(videoCodec)
            }
        }
    }

    func free() {
        unsafe {
            LibC.free(fileFormat)
            LibC.free(audioCodec)
            LibC.free(videoCodec)
        }
    }
}

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    20,
    syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
]
public enum AVTranscoderCallbackType {
    @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    ProgressUpdate
    | @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    Complete
    | @!APILevel[
        20,
        syscap: "SystemCapability.Multimedia.Media.AVTranscoder"
    ]
    Error
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case ProgressUpdate => 0
            case Complete => 1
            case Error => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
