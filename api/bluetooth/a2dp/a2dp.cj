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

package ohos.bluetooth.a2dp

import std.collection.{ArrayList, HashMap}
import std.deriving.*
import ohos.base.*
import ohos.bluetooth.*
import ohos.bluetooth.baseProfile.*
import ohos.bluetooth.constant.*
import ohos.bluetooth.common_util.*
import ohos.ffi.*
import ohos.labels.*

@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public func createA2dpSrcProfile(): A2dpSourceProfile {
    return A2dpSourceProfile()
}

@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class A2dpSourceProfile <: BaseProfile {
    private var registerState = false
    private let callbackList = ArrayList<CallbackObject>()

    protected init() {}

    private func argWrapper1<CT, T>(ctor: (CT) -> T): Int64 where CT <: CType {
        let wrapper = {
            ctype: CT =>
            let cjType = ctor(ctype)
            for (caller in callbackList) {
                (caller as Callback1Argument<T>)?.invoke(cjType)
            }
        }
        let registerCall = Callback1Param<CT, Unit>(wrapper)
        registerCall.getID()
    }

    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func getPlayingState(deviceId: String): PlayingState {
        var errorCode: Int32 = 0
        var state = STATE_NOT_PLAYING
        unsafe {
            try (cDeviceId = LibC.mallocCString(deviceId).asResource()) {
                state = PlayingState.parse(FfiBluetoothA2dpGetPlayingState(cDeviceId.value, inout errorCode))
            }
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
        return state
    }

    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func getConnectedDevices(): Array<String> {
        var errorCode: Int32 = 0
        var devices = Array<String>()
        unsafe {
            let cDevices = FfiBluetoothA2dpGetConnectedDevices(inout errorCode)
            // MAC address translation does not throw exception.
            devices = cArr2cjArr<CString, String>(cDevices.size, cDevices.head) {str: CString => str.toString()}
            cDevices.free()
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
        return devices
    }

    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func getConnectionState(deviceId: String): ProfileConnectionState {
        var errorCode: Int32 = 0
        var state = STATE_DISCONNECTED
        unsafe {
            try (cDeviceId = LibC.mallocCString(deviceId).asResource()) {
                state = ProfileConnectionState.parse(
                    FfiBluetoothA2dpGetConnectionState(cDeviceId.value, inout errorCode))
            }
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
        return state
    }

    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func on(`type`: ProfileCallbackType, callback: Callback1Argument<StateChangeParam>): Unit {
        BLUETOOTH_LOG.debug("subscribe connectionStateChange")
        if (!registerState) {
            var errorCode: Int32 = 0
            let id = argWrapper1({param: NativeStateChangeParam => param.toObject()})
            unsafe {
                FfiBluetoothA2dpOn(`type`.getValue(), id, inout errorCode)
            }
            if (errorCode != SUCCESS_CODE) {
                throw BusinessException(errorCode, getErrorMsg(errorCode))
            }
            registerState = true
        } else {
            for (idx in 0..callbackList.size) {
                if (refEq(callback, callbackList[idx])) {
                    BLUETOOTH_LOG.info("The connectionStateChange callback is registered, no need to re-registered")
                    return
                }
            }
        }
        callbackList.add(callback)
        return
    }

    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func off(`type`: ProfileCallbackType, callback: CallbackObject): Unit {
        BLUETOOTH_LOG.debug("unsubscribe ${`type`} connectionStateChange")
        for (idx in 0..callbackList.size) {
            if (refEq(callback, callbackList[idx])) {
                callbackList.remove(at: idx)
            }
        }
        return
    }

    @!APILevel[
        19,
        crossplatform: true,
        permission: "ohos.ACCESS_BLUETOOTH",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public func off(`type`: ProfileCallbackType): Unit {
        if (`type` != CONNECTION_STATE_CHANGE) {
            BLUETOOTH_LOG.error("Invalid name ${`type`}, valid name is CONNECTIONSTATECHANGE")
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        BLUETOOTH_LOG.debug("unsubscribe connectionStateChange")
        callbackList.clear()
        return
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum PlayingState {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_NOT_PLAYING
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_PLAYING
    | ...

    static func parse(v: Int32): PlayingState {
        match (v) {
            case 0x0000 => STATE_NOT_PLAYING
            case 0x0001 => STATE_PLAYING
            case _ => throw NoneValueException("Value does not exist!")
        }
    }
}

@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public class CodecInfo {
    CodecInfo(
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var codecType!: CodecType = CODEC_TYPE_SBC,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var codecBitsPerSample!: CodecBitsPerSample = CODEC_BITS_PER_SAMPLE_NONE,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var codecChannelMode!: CodecChannelMode = CODEC_CHANNEL_MODE_NONE,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var codecSampleRate!: CodecSampleRate = CODEC_SAMPLE_RATE_NONE
    ) {}
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum CodecType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_TYPE_INVALID
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_TYPE_SBC
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_TYPE_AAC
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_TYPE_L2HC
    | ...
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum CodecChannelMode {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_CHANNEL_MODE_NONE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_CHANNEL_MODE_MONO
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_CHANNEL_MODE_STEREO
    | ...
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum CodecBitsPerSample {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_BITS_PER_SAMPLE_NONE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_BITS_PER_SAMPLE_16
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_BITS_PER_SAMPLE_24
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_BITS_PER_SAMPLE_32
    | ...
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum CodecSampleRate {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_SAMPLE_RATE_NONE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_SAMPLE_RATE_44100
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_SAMPLE_RATE_48000
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_SAMPLE_RATE_88200
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_SAMPLE_RATE_96000
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_SAMPLE_RATE_176400
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    CODEC_SAMPLE_RATE_192000
    | ...
}
