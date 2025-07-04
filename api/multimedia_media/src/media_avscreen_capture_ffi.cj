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
import ohos.base.*

@C
struct CAVScreenCaptureConfig {
    CAVScreenCaptureConfig(
        let captureMode: Int32,
        let dataType: Int32,
        let audioInfo: CAudioInfo,
        let videoInfo: CVideoInfo,
        let recorderInfo: CRecorderInfo
    ) {}

    func free() {
        videoInfo.free()
        recorderInfo.free()
    }
}

@C
struct CAudioInfo {
    CAudioInfo(
        let micCapInfo: CAudioCaptureInfo,
        let innerCapInfo: CAudioCaptureInfo,
        let audioEncInfo: CAudioEncInfo
    ) {}
}

@C
struct CAudioCaptureInfo {
    CAudioCaptureInfo(
        let audioSampleRate: Int32,
        let audioChannels: Int32,
        let audioSource: Int32,
        let state: Int32
    ) {}
}

@C
struct CAudioEncInfo {
    CAudioEncInfo(
        let audioBitrate: Int32,
        let audioCodecformat: Int32,
        let state: Int32
    ) {}
}

@C
struct CVideoInfo {
    CVideoInfo(
        let videoCapInfo: CVideoCaptureInfo,
        let videoEncInfo: CVideoEncInfo
    ) {}

    init() {
        videoCapInfo = CVideoCaptureInfo()
        videoEncInfo = CVideoEncInfo()
    }

    func free() {
        videoCapInfo.free()
    }
}

@C
struct CVideoCaptureInfo {
    CVideoCaptureInfo(
        let displayId: UInt64,
        let taskIDs: CArrI32,
        let videoFrameWidth: Int32,
        let videoFrameHeight: Int32,
        let videoSource: Int32,
        let state: Int32
    ) {}

    init() {
        displayId = 0
        taskIDs = CArrI32(CPointer<Int32>(), 0)
        videoFrameWidth = 0
        videoFrameHeight = 0
        videoSource = 0
        state = 0
    }

    func free() {
        unsafe {
            LibC.free<Int32>(taskIDs.head)
        }
    }
}

@C
struct CVideoEncInfo {
    CVideoEncInfo(
        let videoCodec: Int32,
        let videoBitrate: Int32,
        let videoFrameRate: Int32,
        let state: Int32
    ) {}

    init() {
        videoCodec = 0
        videoBitrate = 0
        videoFrameRate = 0
        state = 0
    }
}

@C
struct CRecorderInfo {
    var url: CString = CString(CPointer<UInt8>())
    var fileFormat: CString = CString(CPointer<UInt8>())

    init() {
        url = url
        fileFormat = fileFormat
    }

    init(recorderInfo: RecorderInfo) {
        try {
            unsafe {
                this.url = LibC.mallocCString(recorderInfo.url)
                this.fileFormat = LibC.mallocCString(recorderInfo.fileFormat)
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(this.url)
                LibC.free(this.fileFormat)
            }
        }
    }

    func free() {
        unsafe {
            LibC.free(this.url)
            LibC.free(this.fileFormat)
        }
    }
}
