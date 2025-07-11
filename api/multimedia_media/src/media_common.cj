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

import ohos.ffi.*
import ohos.hilog.HilogChannel
import ohos.base.*
import std.deriving.*
import std.collection.*
import ohos.image.PixelMap
import ohos.labels.APILevel

const LOG_CORE: UInt32 = 3
const LOG_DOMAIN_PLAYER: UInt32 = 0xD002B2B
const MEDIA_MEMORY_ERROR: Int32 = 5400101
let AV_PLAYER_LOG = HilogChannel(LOG_CORE, LOG_DOMAIN_PLAYER, "CJ-AVPlayer")
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (5400101, "No memory."),
        (5400102, "Operation not allowed."),
        (5400103, "I/O error."),
        (5400104, "Operation timeout."),
        (5400105, "Service died."),
        (5400106, "Unsupported format."),
        (5400107, "Audio interrupted."),
        (5411001, "Can not find host."),
        (5411002, "Connection time out."),
        (5411003, "NetWork abnormal."),
        (5411004, "NetWork unavailable."),
        (5411005, "No permission."),
        (5411006, "Network access denied."),
        (5411007, "Cannot find available network resources."),
        (5411008, "SSL client cert needed."),
        (5411009, "SSL connection failed."),
        (5411010, "SSL server cert needed."),
        (5411011, "Unsupportted request.")
    ]
)

/**
 * Provides the container definition for media description key-value pairs.
 *
 * @typedef MediaDescription
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 * @atomicservice
 */
public type MediaDescription = HashMap<String, ValueType>

/**
 * Provides player statistic info.
 *
 * @typedef PlaybackInfo
 * @syscap SystemCapability.Multimedia.Media.Core
 */
public type PlaybackInfo = HashMap<PlaybackInfoKey, ValueType>

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error"
    }
}

func throwIfNotSuccess(code: Int32, className: String, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        throw BusinessException(code, "${className} ${funcName} failed: ${getErrorMsg(code)}")
    }
}

/**
 * Media file descriptor. The caller needs to ensure that the fd is valid and
 * the offset and length are correct.
 *
 * @relation interface AVFileDescriptor
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public class AVFileDescriptor {
    /**
     * The file descriptor of audio or video source from file system. The caller
     * is responsible to close the file descriptor.
     *
     * @relation fd: number
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public var fd: Int32
    /**
     * The offset into the file where the data to be read, in bytes. By default,
     * the offset is zero.
     *
     * @relation offset?: number
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public var offset: ?Int64
    /**
     * The length in bytes of the data to be read. By default, the length is the
     * rest of bytes in the file from the offset.
     *
     * @relation length?: number
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public var length: ?Int64

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public init(
        fd: Int32,
        offset: ?Int64,
        length: ?Int64
    ) {
        this.fd = fd
        this.offset = offset
        this.length = length
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public init(fd: Int32) {
        this.fd = fd
        this.offset = None
        this.length = None
    }
}

/**
 * Enumerates statistics info keys for player.
 *
 * @enum { string }
 * @syscap SystemCapability.Multimedia.Media.Core
 */
@Derive[Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public enum PlaybackInfoKey <: ToString & Hashable {
    /**
     * IP address of current network stream.
     * @syscap SystemCapability.Multimedia.Media.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    ServerIPAddress
    |
        /**
         * Average download rate during playing except for suspend downloading.
         * @syscap SystemCapability.Multimedia.Media.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AvgDownloadRate
    |
        /**
         * Current download rate of the last second except for suspend downloading.
         * @syscap SystemCapability.Multimedia.Media.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    DownloadRate
    |
        /**
         * Boolean value, true for current is downloading, false for suspend downloading.
         * @syscap SystemCapability.Multimedia.Media.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    IsDownloading
    |
        /**
         * Cached duration in milliseconds.
         * @syscap SystemCapability.Multimedia.Media.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    BufferDuration
    | ...

    static func parse(val: Int32): PlaybackInfoKey {
        match (val) {
            case 0 => SERVER_IP_ADDRESS
            case 1 => AVG_DOWNLOAD_RATE
            case 2 => DOWNLOAD_RATE
            case 3 => IS_DOWNLOADING
            case 4 => BUFFER_DURATION
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func toString(): String {
        match (this) {
            case ServerIPAddress => "server_ip_address"
            case AvgDownloadRate => "average_download_rate"
            case DownloadRate => "download_rate"
            case IsDownloading => "is_downloading"
            case BufferDuration => "buffer_duration"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func hashCode(): Int64 {
        return this.toString().hashCode()
    }
}

@!APILevel[
    19,
    stagemodelonly: true
]
public enum ValueType {
    @!APILevel[
        19,
        stagemodelonly: true
    ]
    Int32Value(Int32)
    | @!APILevel[
        19,
        stagemodelonly: true
    ]
    Int64Value(Int64)
    | @!APILevel[
        19,
        stagemodelonly: true
    ]
    Float64Value(Float64)
    | @!APILevel[
        19,
        stagemodelonly: true
    ]
    StringValue(String)
    | ...
}

/**
 * Defines the format parameters of the video thumbnail to be obtained.
 *
 * @relation interface PixelMapParams
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
]
public class PixelMapParams {
    /**
     * Width of the thumbnail. The value must be greater than 0 and less than or equal to the width of the original
     * video. Otherwise, the returned thumbnail will not be scaled.
     *
     * @relation width?: number
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    public var width: Int32
    /**
     * Height of the thumbnail. The value must be greater than 0 and less than or equal to the height of the original
     * video. Otherwise, the returned thumbnail will not be scaled.
     *
     * @relation height?: number
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    public var height: Int32

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    public init(width!: Int32 = -1, height!: Int32 = -1) {
        this.width = width
        this.height = height
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
]
public enum AVImageQueryOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    AVImageQueryNextSync
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    AVImageQueryPreviousSync
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    AVImageQueryClosestSync
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    AVImageQueryClosest
    | ...

    func getValue(): Int32 {
        match (this) {
            case AVImageQueryNextSync => 0
            case AVImageQueryPreviousSync => 1
            case AVImageQueryClosestSync => 2
            case AVImageQueryClosest => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
