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

package ohos.multimedia.audio

import ohos.base.*
import ohos.ffi.*

foreign {
    /**
     * MMA is the abbreviation of MultimediaAudio
     * AudioCapturer
     */
    func FfiMMACreateAudioCapturer(option: CAudioCapturerOptions, errorCode: CPointer<Int32>): Int64

    func FfiMMAAudioCapturerGetState(id: Int64, errorCode: CPointer<Int32>): Int32

    func FfiMMAAudioCapturerGetCapturerInfo(id: Int64, errorCode: CPointer<Int32>): CAudioCapturerInfo

    func FfiMMAAudioCapturerGetStreamInfo(id: Int64, errorCode: CPointer<Int32>): CAudioStreamInfo

    func FfiMMAAudioCapturerGetStreamId(id: Int64, errorCode: CPointer<Int32>): UInt32

    func FfiMMAAudioCapturerGetAudioTime(id: Int64, errorCode: CPointer<Int32>): Int64

    func FfiMMAAudioCapturerGetBufferSize(id: Int64, errorCode: CPointer<Int32>): UInt32

    func FfiMMAAudioCapturerGetOverflowCount(id: Int64, errorCode: CPointer<Int32>): UInt32

    func FfiMMAAudioCapturerStart(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiMMAAudioCapturerStop(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiMMAAudioCapturerRelease(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiMMAAudioCapturerGetAudioCapturerChangeInfo(id: Int64, errorCode: CPointer<Int32>): CAudioCapturerChangeInfo

    func FfiMMAAudioCapturerGetInputDevices(id: Int64, errorCode: CPointer<Int32>): CArrDeviceDescriptor

    func FfiMMAAudioCapturerOn(id: Int64, callbackType: Int32, callbackId: Int64, errCode: CPointer<Int32>): Unit

    func FfiMMAAudioCapturerOnWithFrame(id: Int64, callbackType: Int32, callbackId: Int64, frame: Int64,
        errCode: CPointer<Int32>): Unit

    /**
     * AudioManager
     */
    func FfiMMAAudioManagerGetVolumeManager(id: Int64, errorCode: CPointer<Int32>): Int64

    func FfiMMACreateAudioManager(errorCode: CPointer<Int32>): Int64

    func FfiMMAAudioManagerGetRoutingManager(id: Int64, errorCode: CPointer<Int32>): Int64

    func FfiMMAAudioManagerGetStreamManager(id: Int64, errorCode: CPointer<Int32>): Int64

    func FfiMMAAudioManagerGetSessionManager(id: Int64, errorCode: CPointer<Int32>): Int64

    func FfiMMAAudioManagerGetAudioScene(id: Int64, errorCode: CPointer<Int32>): Int32

    /**
     * AudioStreamManager
     * ASM is the abbreviation of AudioStreamManager
     */
    func FfiMMAASMIsActive(id: Int64, volumeType: Int32, errorCode: CPointer<Int32>): Bool

    func FfiMMAASMGetCurrentAudioRendererInfoArray(id: Int64, errorCode: CPointer<Int32>): CArrAudioRendererChangeInfo

    func FfiMMAASMGetCurrentAudioCapturerInfoArray(id: Int64, errorCode: CPointer<Int32>): CArrAudioCapturerChangeInfo

    func FfiMMAASMGetAudioEffectInfoArray(id: Int64, usage: Int32, errorCode: CPointer<Int32>): CArrI32

    func FfiMMAASMOn(id: Int64, callbackType: Int32, callbackId: Int64, errCode: CPointer<Int32>): Unit

    /**
     * AudioRoutingManager
     * ARM is the abbreviation of AudioRoutingManager
     */
    func FfiMMAARMSetCommunicationDevice(id: Int64, deviceType: Int32, active: Bool, errorCode: CPointer<Int32>): Unit

    func FfiMMAARMIsCommunicationDeviceActive(id: Int64, deviceType: Int32, errorCode: CPointer<Int32>): Bool

    func FfiMMAARMGetDevices(id: Int64, deviceFlag: Int32, errorCode: CPointer<Int32>): CArrDeviceDescriptor

    func FfiMMAARMGetAvailableDevices(id: Int64, deviceUsage: UInt32, errorCode: CPointer<Int32>): CArrDeviceDescriptor

    func FfiMMAARMFreeCArrDeviceDescriptor(deviceDescriptors: CArrDeviceDescriptor): Unit

    func FfiMMAARMGetPreferredInputDeviceForCapturerInfo(id: Int64, capturerInfo: CAudioCapturerInfo,
        errorCode: CPointer<Int32>): CArrDeviceDescriptor

    func FfiMMAARMGetPreferredOutputDeviceForRendererInfo(id: Int64, rendererInfo: CAudioRendererInfo,
        errorCode: CPointer<Int32>): CArrDeviceDescriptor

    func FfiMMAARMOn(id: Int64, callbackType: Int32, deviceUsage: UInt32, callbackId: Int64, errCode: CPointer<Int32>): Unit

    func FfiMMAARMOnWithFlags(id: Int64, callbackType: Int32, callbackId: Int64, flags: Int32, errCode: CPointer<Int32>): Unit

    func FfiMMAARMOnWithCapturerInfo(id: Int64, callbackType: Int32, callbackId: Int64, Info: CAudioCapturerInfo,
        errorCode: CPointer<Int32>): Unit

    func FfiMMAARMOnWithRendererInfo(id: Int64, callbackType: Int32, callbackId: Int64, Info: CAudioRendererInfo,
        errorCode: CPointer<Int32>): Unit

    func FfiMMAGetVolumeManager(id: Int64, errorCode: CPointer<Int32>): Int64

    /**
     * AudioSessionManager
     */
    func FfiMMAASeMActivateAudioSession(id: Int64, strategy: CAudioSessionStrategy, errorCode: CPointer<Int32>): Unit

    func FfiMMAASeMDeactivateAudioSession(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiMMAASeMIsAudioSessionActivated(id: Int64, errorCode: CPointer<Int32>): Bool

    func FfiMMAASeMOn(id: Int64, `type`: CString, callback: Int64, errorCode: CPointer<Int32>): Unit

    /**
     * AudioVolumeManager
     */
    func FfiMMAAVMGetVolumeGroupManager(id: Int64, groupId: Int32, ret: CPointer<Int32>): Int64

    func FfiMMAAVMOn(id: Int64, callbackType: Int32, callbackId: Int64, errorCode: CPointer<Int32>): Unit
    /**
     * AudioVolumeGroupManager
     */
    func FfiMMAAVGMGetMaxVolume(id: Int64, volumeType: Int32, ret: CPointer<Int32>): Int32

    func FfiMMAAVGMGetMinVolume(id: Int64, volumeType: Int32, ret: CPointer<Int32>): Int32

    func FfiMMAAVGMGetRingerMode(id: Int64, ret: CPointer<Int32>): Int32

    func FfiMMAAVGMGetSystemVolumeInDb(id: Int64, volumeType: Int32, volumeLevel: Int32, device: Int32,
        ret: CPointer<Int32>): Float32

    func FfiMMAAVGMGetVolume(id: Int64, volumeType: Int32, ret: CPointer<Int32>): Int32

    func FfiMMAAVGMIsMicrophoneMute(id: Int64, ret: CPointer<Int32>): Bool

    func FfiMMAAVGMIsMute(id: Int64, volumeType: Int32, ret: CPointer<Int32>): Bool

    func FfiMMAAVGMIsVolumeUnadjustable(id: Int64, ret: CPointer<Int32>): Bool

    func FfiMMAAVGMGetMaxAmplitudeForOutputDevice(id: Int64, desc: CAudioDeviceDescriptor, ret: CPointer<Int32>): Float32

    func FfiMMAAVGMGetMaxAmplitudeForInputDevice(id: Int64, desc: CAudioDeviceDescriptor, ret: CPointer<Int32>): Float32

    func FfiMMAAVGMOn(id: Int64, callbackType: Int32, callbackId: Int64, errorCode: CPointer<Int32>): Unit

    func FfiMMAGetMaxVolume(id: Int64, volumeType: Int32, ret: CPointer<Int32>): Int32

    func FfiMMAGetMinVolume(id: Int64, volumeType: Int32, ret: CPointer<Int32>): Int32

    func FfiMMAGetRingerMode(id: Int64, ret: CPointer<Int32>): Int32

    func FfiMMAGetSystemVolumeInDb(id: Int64, volumeType: Int32, volumeLevel: Int32, device: Int32, ret: CPointer<Int32>): Float32

    func FfiMMAGetVolume(id: Int64, volumeType: Int32, ret: CPointer<Int32>): Int32

    func FfiMMAIsMicrophoneMute(id: Int64, ret: CPointer<Int32>): Bool

    func FfiMMAIsMute(id: Int64, volumeType: Int32, ret: CPointer<Int32>): Bool

    func FfiMMAIsVolumeUnadjustable(id: Int64, ret: CPointer<Int32>): Bool

    /**
     * AudioRenderer
     * AR is the abbreviation of AudioRenderer
     */
    func FfiMMACreateAudioRenderer(option: CAudioRendererOptions, errorCode: CPointer<Int32>): Int64

    func FfiMMAARGetState(id: Int64, errorCode: CPointer<Int32>): Int32

    func FfiMMAARGetStreamId(id: Int64, errorCode: CPointer<Int32>): UInt32

    func FfiMMAARGetAudioTime(id: Int64, errorCode: CPointer<Int32>): Int64

    func FfiMMAARGetBufferSize(id: Int64, errorCode: CPointer<Int32>): UInt32

    func FfiMMAARGetStreamInfo(id: Int64, errorCode: CPointer<Int32>): CAudioStreamInfo

    func FfiMMAARStart(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiMMAARStop(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiMMAARRelease(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiMMAARFlush(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiMMAARPause(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiMMAARDrain(id: Int64, errorCode: CPointer<Int32>): Unit

    func FfiMMAARGetAudioEffectMode(id: Int64, errorCode: CPointer<Int32>): Int32

    func FfiMMAARGetCurrentOutputDevices(id: Int64, errorCode: CPointer<Int32>): CArrDeviceDescriptor

    func FfiMMAARGetMaxStreamVolume(id: Int64, errorCode: CPointer<Int32>): Float64

    func FfiMMAARGetMinStreamVolume(id: Int64, errorCode: CPointer<Int32>): Float64

    func FfiMMAARGetRendererInfo(id: Int64, errorCode: CPointer<Int32>): CAudioRendererInfo

    func FfiMMAARGetSpeed(id: Int64, errorCode: CPointer<Int32>): Float64

    func FfiMMAARGetSilentModeAndMixWithOthers(id: Int64, errorCode: CPointer<Int32>): Bool

    func FfiMMAARGetVolume(id: Int64, errorCode: CPointer<Int32>): Float64

    func FfiMMAARGetUnderflowCount(id: Int64, errorCode: CPointer<Int32>): UInt32

    func FfiMMAARSetVolumeWithRamp(id: Int64, volume: Float64, duration: Int32, errorCode: CPointer<Int32>): Unit

    func FfiMMAARSetSpeed(id: Int64, speed: Float64, errorCode: CPointer<Int32>): Unit

    func FfiMMAARSetVolume(id: Int64, volume: Float64, errorCode: CPointer<Int32>): Unit

    func FfiMMAARSetSilentModeAndMixWithOthers(id: Int64, on: Bool, errorCode: CPointer<Int32>): Unit

    func FfiMMAARSetInterruptMode(id: Int64, mode: Int32, errorCode: CPointer<Int32>): Unit

    func FfiMMAARSetAudioEffectMode(id: Int64, mode: Int32, errorCode: CPointer<Int32>): Unit

    func FfiMMAARSetChannelBlendMode(id: Int64, mode: Int32, errorCode: CPointer<Int32>): Unit

    func FfiMMAARSetDefaultOutputDevice(id: Int64, deviceType: Int32, errorCode: CPointer<Int32>): Unit

    func FfiMMAAROnWithFrame(id: Int64, callbackType: Int32, callbackId: Int64, frame: Int64, errCode: CPointer<Int32>): Unit

    func FfiMMAAROn(id: Int64, callbackType: Int32, callbackId: Int64, errCode: CPointer<Int32>): Unit
}
