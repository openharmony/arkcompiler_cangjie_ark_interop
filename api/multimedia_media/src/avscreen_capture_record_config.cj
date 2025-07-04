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

import std.collection.*
import std.deriving.*
import ohos.ffi.*
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

struct AVScreenCaptureConfig {
    AVScreenCaptureConfig(
        let captureMode: CaptureMode,
        let dataType: DataType,
        let audioInfo: AudioInfo,
        let videoInfo: VideoInfo,
        let recorderInfo: RecorderInfo
    ) {}

    func toNative(): CAVScreenCaptureConfig {
        var cvideoInfo = CVideoInfo()
        var crecorderInfo = CRecorderInfo()
        unsafe {
            try {
                cvideoInfo = videoInfo.toNative()
                crecorderInfo = recorderInfo.toNative()
                CAVScreenCaptureConfig(
                    captureMode.toInt32(),
                    dataType.toInt32(),
                    audioInfo.toNative(),
                    cvideoInfo,
                    crecorderInfo
                )
            } catch (e: Exception) {
                cvideoInfo.free()
                crecorderInfo.free()
                throw e
            }
        }
    }
}

enum CaptureMode {
    | CAPTURE_HOME_SCREEN
    | CAPTURE_SPECIFIED_SCREEN
    | CAPTURE_SPECIFIED_WINDOW
    | CAPTURE_INVAILD

    func toInt32(): Int32 {
        match (this) {
            case CAPTURE_HOME_SCREEN => return 0
            case CAPTURE_SPECIFIED_SCREEN => return 1
            case CAPTURE_SPECIFIED_WINDOW => return 2
            case CAPTURE_INVAILD => return -1
        }
    }
}

enum DataType {
    | ORIGINAL_STREAM
    | ENCODED_STREAM
    | CAPTURE_FILE
    | INVAILD

    func toInt32(): Int32 {
        match (this) {
            case ORIGINAL_STREAM => return 0
            case ENCODED_STREAM => return 1
            case CAPTURE_FILE => return 2
            case INVAILD => return -1
        }
    }
}

struct AudioInfo {
    AudioInfo(
        let micCapInfo: AudioCaptureInfo,
        let innerCapInfo: AudioCaptureInfo,
        let audioEncInfo: AudioEncInfo
    ) {}

    func toNative(): CAudioInfo {
        CAudioInfo(micCapInfo.toNative(), innerCapInfo.toNative(), audioEncInfo.toNative())
    }
}

struct VideoInfo {
    VideoInfo(
        let videoCapInfo: VideoCaptureInfo,
        let videoEncInfo: VideoEncInfo
    ) {}

    func toNative(): CVideoInfo {
        var cvideoCapInfo = videoCapInfo.toNative()
        unsafe {
            try {
                cvideoCapInfo = videoCapInfo.toNative()
                CVideoInfo(
                    cvideoCapInfo,
                    videoEncInfo.toNative()
                )
            } catch (e: Exception) {
                cvideoCapInfo.free()
                throw e
            }
        }
    }
}

struct AudioCaptureInfo {
    AudioCaptureInfo(
        let audioSampleRate: Int32,
        let audioChannels: Int32,
        let audioSource: AudioCaptureSourceType,
        let state: AVScreenCaptureParamValidationState
    ) {}

    func toNative(): CAudioCaptureInfo {
        CAudioCaptureInfo(audioSampleRate, audioChannels, audioSource.toInt32(), state.toInt32())
    }
}

struct AudioEncInfo {
    AudioEncInfo(
        let audioBitrate: Int32,
        let audioCodecformat: AudioCodecFormat,
        let state: AVScreenCaptureParamValidationState
    ) {}

    func toNative(): CAudioEncInfo {
        CAudioEncInfo(audioBitrate, audioCodecformat.toInt32(), state.toInt32())
    }
}

enum AudioCaptureSourceType {
    | SOURCE_INVALID
    | SOURCE_DEFAULT
    | MIC
    | ALL_PLAYBACK
    | APP_PLAYBACK

    func toInt32(): Int32 {
        match (this) {
            case SOURCE_INVALID => return -1
            case SOURCE_DEFAULT => return 0
            case MIC => return 1
            case ALL_PLAYBACK => return 2
            case APP_PLAYBACK => return 3
        }
    }
}

enum AVScreenCaptureParamValidationState {
    | VALIDATION_IGNORE
    | VALIDATION_VALID
    | VALIDATION_INVALID

    func toInt32(): Int32 {
        match (this) {
            case VALIDATION_IGNORE => return 0
            case VALIDATION_VALID => return 1
            case VALIDATION_INVALID => return -1
        }
    }
}

enum AudioCodecFormat {
    | AUDIO_DEFAULT
    | AAC_LC
    | AUDIO_MPEG
    | AUDIO_G711MU
    | AUDIO_CODEC_FORMAT_BUTT

    func toInt32(): Int32 {
        match (this) {
            case AUDIO_DEFAULT => return 0
            case AAC_LC => return 3
            case AUDIO_MPEG => return 4
            case AUDIO_G711MU => return 5
            case AUDIO_CODEC_FORMAT_BUTT => return -1
        }
    }
}

struct VideoCaptureInfo {
    VideoCaptureInfo(
        let displayId: UInt64,
        let taskIDs: Array<Int32>,
        let videoFrameWidth: Int32,
        let videoFrameHeight: Int32,
        let videoSource: VideoCaptureSourceType,
        let state: AVScreenCaptureParamValidationState
    ) {}

    func toNative(): CVideoCaptureInfo {
        CVideoCaptureInfo(
            displayId,
            CArrI32(unsafe { cjArr2CArr<Int32, Int32>(taskIDs, {i => i}) }, taskIDs.size),
            videoFrameWidth,
            videoFrameHeight,
            videoSource.toInt32(),
            state.toInt32()
        )
    }
}

struct VideoEncInfo {
    VideoEncInfo(
        let videoCodec: VideoCodecFormat,
        let videoBitrate: Int32,
        let videoFrameRate: Int32,
        let state: AVScreenCaptureParamValidationState
    ) {}

    func toNative(): CVideoEncInfo {
        CVideoEncInfo(videoCodec.toInt32(), videoBitrate, videoFrameRate, state.toInt32())
    }
}

struct RecorderInfo {
    RecorderInfo(
        let url: String,
        let fileFormat: String
    ) {}

    func toNative(): CRecorderInfo {
        CRecorderInfo(this)
    }
}

enum VideoCaptureSourceType {
    | VIDEO_SOURCE_SURFACE_YUV
    | VIDEO_SOURCE_SURFACE_ES
    | VIDEO_SOURCE_SURFACE_RGBA
    | VIDEO_SOURCE_BUTT

    func toInt32(): Int32 {
        match (this) {
            case VIDEO_SOURCE_SURFACE_YUV => return 0
            case VIDEO_SOURCE_SURFACE_ES => return 1
            case VIDEO_SOURCE_SURFACE_RGBA => return 2
            case VIDEO_SOURCE_BUTT => return -1
        }
    }
}

enum VideoCodecFormat {
    | VIDEO_DEFAULT
    | H264
    | MPEG4
    | H265
    | VIDEO_CODEC_FORMAT_BUTT

    func toInt32(): Int32 {
        match (this) {
            case VIDEO_DEFAULT => return 0
            case H264 => return 2
            case MPEG4 => return 6
            case H265 => return 8
            case VIDEO_CODEC_FORMAT_BUTT => return -1
        }
    }
}

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
]
public enum ProfileCallbackType {
    | CONNECTION_STATE_CHANGE
    | CONNECTION_ERROR
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case CONNECTION_STATE_CHANGE => 0
            case CONNECTION_ERRPR => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

let AV_SCREEN_CAPTURE_STATE_CODE_MAP = HashMap<Int32, AVScreenCaptureStateCode>(
    [
        (-1, SCREEN_CAPTURE_STATE_INVALID),
        (0, SCREEN_CAPTURE_STATE_STARTED),
        (1, SCREEN_CAPTURE_STATE_CANCELED),
        (2, SCREEN_CAPTURE_STATE_STOPPED_BY_USER),
        (3, SCREEN_CAPTURE_STATE_INTERRUPTED_BY_OTHER),
        (4, SCREEN_CAPTURE_STATE_STOPPED_BY_CALL),
        (5, SCREEN_CAPTURE_STATE_MIC_UNAVAILABLE),
        (6, SCREEN_CAPTURE_STATE_MIC_MUTED_BY_USER),
        (7, SCREEN_CAPTURE_STATE_MIC_UNMUTED_BY_USER),
        (8, SCREEN_CAPTURE_STATE_ENTER_PRIVATE_SCENE),
        (9, SCREEN_CAPTURE_STATE_EXIT_PRIVATE_SCENE),
        (10, SCREEN_CAPTURE_STATE_STOPPED_BY_USER_SWITCHES)
    ]
)

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
]
public enum AVScreenCaptureStateCode {
    | SCREEN_CAPTURE_STATE_INVALID
    | SCREEN_CAPTURE_STATE_STARTED
    | SCREEN_CAPTURE_STATE_CANCELED
    | SCREEN_CAPTURE_STATE_STOPPED_BY_USER
    | SCREEN_CAPTURE_STATE_INTERRUPTED_BY_OTHER
    | SCREEN_CAPTURE_STATE_STOPPED_BY_CALL
    | SCREEN_CAPTURE_STATE_MIC_UNAVAILABLE
    | SCREEN_CAPTURE_STATE_MIC_MUTED_BY_USER
    | SCREEN_CAPTURE_STATE_MIC_UNMUTED_BY_USER
    | SCREEN_CAPTURE_STATE_ENTER_PRIVATE_SCENE
    | SCREEN_CAPTURE_STATE_EXIT_PRIVATE_SCENE
    | SCREEN_CAPTURE_STATE_STOPPED_BY_USER_SWITCHES
    | ...

    static func parse(state: Int32): AVScreenCaptureStateCode {
        AV_SCREEN_CAPTURE_STATE_CODE_MAP.get(state) ?? throw NoneValueException("Unknown value")
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
]
public class AVScreenCaptureRecordConfig {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
    ]
    public AVScreenCaptureRecordConfig(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
        ]
        public var fd: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
        ]
        public var frameWidth: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
        ]
        public var frameHeight: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
        ]
        public var videoBitrate!: Int32 = 10000000,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
        ]
        public var audioSampleRate!: Int32 = 48000,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
        ]
        public var audioChannelCount!: Int32 = 2,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
        ]
        public var audioBitrate!: Int32 = 96000,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
        ]
        public var preset!: AVScreenCaptureRecordPreset = AVScreenCaptureRecordPreset.SCREEN_RECORD_PRESET_H264_AAC_MP4
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
]
public enum AVScreenCaptureRecordPreset {
    | SCREEN_RECORD_PRESET_H264_AAC_MP4
    | SCREEN_RECORD_PRESET_H265_AAC_MP4
    | ...

    func toInt32(): Int32 {
        match (this) {
            case SCREEN_RECORD_PRESET_H264_AAC_MP4 => return 0
            case SCREEN_RECORD_PRESET_H265_AAC_MP4 => return 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
