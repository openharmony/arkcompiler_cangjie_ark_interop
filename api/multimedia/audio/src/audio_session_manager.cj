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

import ohos.ffi.*
import ohos.base.*
import ohos.labels.*
import std.collection.ArrayList
import std.collection.HashMap

@C
struct CAudioSessionDeactivatedEvent {
    CAudioSessionDeactivatedEvent(let deactivatedReason: Int32) {}

    func toAudioSessionDeactivatedEvent(): AudioSessionDeactivatedEvent {
        AudioSessionDeactivatedEvent(AudioSessionDeactivatedReason.parse(deactivatedReason))
    }
}

@C
struct CAudioSessionStrategy {
    CAudioSessionStrategy(let concurrencyMode: Int32) {}
}

/**
 * Audio session deactivated event.
 *
 * @relation interface AudioSessionDeactivatedEvent
 */
@!APILevel[
    20,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public class AudioSessionDeactivatedEvent {

    /**
     * Audio session deactivated reason.
     *
     * @relation reason: AudioSessionDeactivatedReason
     */
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public let reason: AudioSessionDeactivatedReason

    /**
     * Audio session deactivated event.
     */
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public init(reason: AudioSessionDeactivatedReason) {
        this.reason = reason
    }
}

/**
 * Audio session strategy.
 *
 * @relation interface AudioSessionStrategy
 */
@!APILevel[
    20,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public class AudioSessionStrategy {
    /**
     * Audio concurrency mode.
     *
     * @relation concurrencyMode: AudioConcurrencyMode
     */
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public let concurrencyMode: AudioConcurrencyMode

    /**
     * Audio session strategy.
     */
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public init(concurrencyMode: AudioConcurrencyMode) {
        this.concurrencyMode = concurrencyMode
    }

    func toObject(): CAudioSessionStrategy {
        CAudioSessionStrategy(concurrencyMode.value)
    }
}

/**
 * Implements audio session management.
 *
 * @relation interface AudioSessionManager
 */
@!APILevel[
    20,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public class AudioSessionManager <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Listens for audio session deactivated event. When the audio session is deactivated,
     * registered clients will receive the callback.
     *
     * @throws { BusinessException } 6800102 - Memory allocation failure..
     * @throws { IllegalArgumentException } - The type is not supported yet.
     * @relation on(type: 'audioSessionDeactivated', callback: Callback<AudioSessionDeactivatedEvent>): void
     */
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public func on(`type`: AudioSessionManagerCallbackType, callback: Callback1Argument<AudioSessionDeactivatedEvent>): Unit {
        if (`type` != AudioSessionDeactivated) {
            AUDIO_LOG.error("Invalid name ${`type`}, valid name is AudioSessionDeactivated")
            throw IllegalArgumentException("The type is not supported yet.")
        }
        commonSubscribe1Arg(`type`, callback) {
            infos: CAudioSessionDeactivatedEvent => infos.toAudioSessionDeactivatedEvent()
        }
        return
    }

    /**
     * Unsubscribes to audio session deactivated event.
     *
     * @relation off(type: 'audioSessionDeactivated', callback?: Callback<AudioSessionDeactivatedEvent>): void
     */
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public func off(`type`: AudioSessionManagerCallbackType, callback!: ?CallbackObject = None): Unit {
        AUDIO_LOG.debug("unsubscribe AudioSessionCallbackType ${`type`}")
        if (!callbackMap.contains(`type`)) {
            return
        }
        if (let Some(v) <- callback) {
            findCallbackObject(`type`, v, remove: true)
            return
        }
        callbackMap.remove(`type`)
        return
    }

    /**
     * Activate the audio session for the current pid application.
     *
     * @throws { BusinessException } 6800301 - [AudioSessionManager] activateAudioSession:System error.
     * @relation activateAudioSession(strategy: AudioSessionStrategy): Promise<void>
     */
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public func activateAudioSession(strategy: AudioSessionStrategy): Unit {
        var errorCode: Int32 = SUCCESS_CODE
        unsafe { FfiMMAASeMActivateAudioSession(getID(), strategy.toObject(), inout errorCode) }
        checkRet(errorCode, "[AudioSessionManager] activateAudioSession:")
    }

    /**
     * Deactivate the audio session for the current pid application.
     *
     * @throws { BusinessException } 6800301 - [AudioSessionManager] deactivateAudioSession:System error.
     * @relation deactivateAudioSession(): Promise<void>
     */
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public func deactivateAudioSession(): Unit {
        var errorCode: Int32 = SUCCESS_CODE
        unsafe { FfiMMAASeMDeactivateAudioSession(getID(), inout errorCode) }
        checkRet(errorCode, "[AudioSessionManager] deactivateAudioSession:")
    }

    /**
     * Check whether the audio session is activated for the current pid application.
     *
     * @throws { BusinessException } 6800301 - [AudioSessionManager] isAudioSessionActivated:System error.
     * @relation isAudioSessionActivated(): boolean
     */
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    public func isAudioSessionActivated(): Bool {
        var errorCode: Int32 = SUCCESS_CODE
        let ret = unsafe { FfiMMAASeMIsAudioSessionActivated(getID(), inout errorCode) }
        checkRet(errorCode, "[AudioSessionManager] isAudioSessionActivated:")
        return ret
    }

    private func register(callbackType: AudioSessionManagerCallbackType, id: Int64) {
        var errorCode: Int32 = SUCCESS_CODE
        unsafe {
            try (t = LibC.mallocCString(callbackType.getValue()).asResource()) {
                FfiMMAASeMOn(getID(), t.value, id, inout errorCode)
            }
        }
        checkRet(errorCode, "[AudioSessionManager] on:")
    }

    private func findCallbackObject(callbackType: AudioSessionManagerCallbackType, callback: CallbackObject,
        remove!: Bool = false): Bool {
        let callback_ = callbackMap.get(callbackType) ?? return false
        let ret = refEq(callback_, callback)
        if (remove && ret) {
            callbackMap.remove(callbackType)
        }
        return ret
    }

    private func argWrapper1<CT, T>(callbackType: AudioSessionManagerCallbackType, ctor: (CT) -> T): Int64 where CT <: CType {
        let wrapper = {
            ctype: CT =>
            let cjType = ctor(ctype)
            let callback = callbackMap.get(callbackType)
            if (let Some(cb) <- callback) {
                (cb as Callback1Argument<T>)?.invoke(cjType)
            }
        }
        let registerCall = Callback1Param<CT, Unit>(wrapper)
        registerCall.getID()
    }

    private func commonSubscribe1Arg<CT, T>(callbackType: AudioSessionManagerCallbackType, callback: CallbackObject,
        ctor: (CT) -> T) where CT <: CType {
        AUDIO_LOG.debug("subscribe AudioSessionManagerCallbackType ${callbackType}")
        if (!registerState) {
            register(callbackType, argWrapper1<CT, T>(callbackType, ctor))
            registerState = true
        } else {
            if (findCallbackObject(callbackType, callback)) {
                AUDIO_LOG.info(
                    "The ${callbackType} AudioSessionManagerCallbackType is registered, no need to re-registered")
                return
            }
        }
        callbackMap[callbackType] = callback
    }

    private let callbackMap = HashMap<AudioSessionManagerCallbackType, CallbackObject>()
    private var registerState = false
}
