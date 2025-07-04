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

package ohos.vibrator

import ohos.base.*
import ohos.ffi.*

@C
struct RetVibrateTime {
    let timeType: CString
    let duration: Int32

    init(ret: VibrateTime) {
        unsafe { this.timeType = LibC.mallocCString(ret.timeType) }
        this.duration = ret.duration
    }

    func free(): Unit {
        unsafe { LibC.free(this.timeType) }
    }
}

@C
struct RetVibratePreset {
    let presetType: CString
    let effectId: CString
    let count: Int32
    let intensity: Int32

    init(ret: VibratePreset) {
        this.presetType = unsafe { LibC.mallocCString(ret.presetType) }
        try {
            this.effectId = unsafe { LibC.mallocCString(ret.effectId) }
        } catch (e: Exception) {
            if (!this.presetType.isNull()) {
                unsafe { LibC.free(this.presetType) }
            }
            throw e
        }
        this.count = ret.count
        this.intensity = ret.intensity
    }

    func free(): Unit {
        unsafe { LibC.free(this.presetType) }
        unsafe { LibC.free(this.effectId) }
    }
}

@C
struct RetVibrateFromFile {
    let fileType: CString
    let hapticFd: RetHapticFileDescriptor

    init(ret: VibrateFromFile) {
        unsafe {
            this.fileType = LibC.mallocCString(ret.fileType)
            this.hapticFd = RetHapticFileDescriptor(ret.hapticFd)
        }
    }

    func free(): Unit {
        unsafe { LibC.free(this.fileType) }
    }
}

@C
struct RetHapticFileDescriptor {
    let fd: Int32
    let offSet: Int64
    let length: Int64

    init(ret: HapticFileDescriptor) {
        this.fd = ret.fd
        this.offSet = ret.offSet
        this.length = ret.length
    }
}

@C
struct RetVibrateAttribute {
    let id: Int32
    let usage: CString

    init(ret: VibrateAttribute) {
        this.id = ret.id
        unsafe { this.usage = LibC.mallocCString(ret.usage.toString()) }
    }

    func free(): Unit {
        unsafe { LibC.free(this.usage) }
    }
}

foreign {
    func FfiVibratorStartVibrationTime(effect: RetVibrateTime, attribute: RetVibrateAttribute, code: CPointer<Int32>): Unit

    func FfiVibratorStartVibrationPreset(effect: RetVibratePreset, attribute: RetVibrateAttribute, code: CPointer<Int32>): Unit

    func FfiVibratorStartVibrationFile(effect: RetVibrateFromFile, attribute: RetVibrateAttribute, code: CPointer<Int32>): Unit

    func FfiVibratorStopVibrationMode(cStr: CString, code: CPointer<Int32>): Unit

    func FfiVibratorStopVibration(code: CPointer<Int32>): Unit

    func FfiVibratorSupportEffect(cStr: CString, code: CPointer<Int32>): Bool

    func FfiVibratorIsHdHapticSupported(): Bool
}
