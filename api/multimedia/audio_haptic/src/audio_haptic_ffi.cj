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

package ohos.multimedia.audio_haptic

import ohos.base.*

foreign {
    func FfiOHOSAudioHapticGetManager(): Int64

    func FfiOHOSAudioHapticMgrRegRes(id: Int64, aUri: CString, hUri: CString, resId: CPointer<Int32>): Int32

    func FfiOHOSAudioHapticMgrUnregRes(id: Int64, resId: Int32): Int32

    func FfiOHOSAudioHapticMgrSetLatencyMode(id: Int64, resId: Int32, mode: Int32): Int32

    func FfiOHOSAudioHapticMgrSetStreamUsage(id: Int64, resId: Int32, usage: Int32): Int32

    func FfiOHOSAudioHapticMgrCreatePlayer(id: Int64, resId: Int32, muteA: Bool, muteH: Bool, errCode: CPointer<Int32>): Int64

    func FfiOHOSAudioHapticPlayerisMuted(id: Int64, hapticType: Int32, ret: CPointer<Bool>): Int32

    func FfiOHOSAudioHapticPlayerStart(id: Int64): Int32

    func FfiOHOSAudioHapticPlayerStop(id: Int64): Int32

    func FfiOHOSAudioHapticPlayerRelease(id: Int64): Int32

    func FfiOHOSAudioHapticPlayerOn(id: Int64, eventType: CString, callbackId: Int64): Int32

    func FfiOHOSAudioHapticPlayerOff(id: Int64, eventType: CString): Int32
}
