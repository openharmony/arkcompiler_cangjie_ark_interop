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

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import std.collection.*
import ohos.hilog.*
import std.sync.*
import ohos.multimedia.audio.*

const EVENT_LOAD_COMPLETED: Int8 = 0
const EVENT_PLAY_FINISHED: Int8 = 1
const EVENT_ERROR: Int8 = 2
let ON_OFF_MUTEX = Mutex()
const LOG_DOMAIN_SOUNDPOOL: UInt32 = 0xD002B2F
let SOUND_POLL_LOG = HilogChannel(LOG_CORE, LOG_DOMAIN_SOUNDPOOL, "CJ-SoundPool")

foreign {
    func FfiSoundPoolCreateSoundPool(maxStreams: Int32, audioRenderInfo: CAudioRendererInfo, code: CPointer<Int32>): Int64

    func FfiSoundPoolLoadURI(id: Int64, uri: CString, code: CPointer<Int32>): Int32

    func FfiSoundPoolLoad(id: Int64, fd: Int32, offset: Int64, length: Int64, code: CPointer<Int32>): Int32

    func FfiSoundPoolPlay(id: Int64, soundID: Int32, errorcode: CPointer<Int32>): Int32

    func FfiSoundPoolPlayParam(id: Int64, soundID: Int32, cParams: CPlayParameters, errorcode: CPointer<Int32>): Int32

    func FfiSoundPoolStop(id: Int64, streamID: Int32): Int32

    func FfiSoundPoolSetLoop(id: Int64, streamID: Int32, loop: Int32): Int32

    func FfiSoundPoolSetPriority(id: Int64, streamID: Int32, priority: Int32): Int32

    func FfiSoundPoolSetRate(id: Int64, streamID: Int32, rate: Int32): Int32

    func FfiSoundPoolSetVolume(id: Int64, streamID: Int32, leftVolume: Float32, rightVolume: Float32): Int32

    func FfiSoundPoolUnload(id: Int64, soundID: Int32): Int32

    func FfiSoundPoolRelease(id: Int64): Int32

    func FfiSoundPoolOnLoadCompleted(id: Int64, callbackId: Int64): Unit

    func FfiSoundPoolOnPlayFinished(id: Int64, callbackId: Int64): Unit

    func FfiSoundPoolOnError(id: Int64, callbackId: Int64): Unit

    func FfiSoundPoolOff(id: Int64, soundpoolType: Int8): Unit
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.SoundPool"
]
public enum SoundPoolEvent <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    LoadCompleted
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    PlayFinished
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    EventError
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func toString(): String {
        match (this) {
            case LoadCompleted => "loadComplete"
            case PlayFinished => "playFinished"
            case EventError => "error"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func getValue(): Int8 {
        return match (this) {
            case LoadCompleted => EVENT_LOAD_COMPLETED
            case PlayFinished => EVENT_PLAY_FINISHED
            case EventError => EVENT_ERROR
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.SoundPool"
]
public struct PlayParameters {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public PlayParameters(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.SoundPool"
        ]
        public var loop!: Int32 = 0,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.SoundPool"
        ]
        public var rate!: AudioRendererRate = RENDER_RATE_NORMAL,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.SoundPool"
        ]
        public var leftVolume!: Float32 = 1.0,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.SoundPool"
        ]
        public var rightVolume!: Float32 = 1.0,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.SoundPool"
        ]
        public var priority!: Int32 = 0
    ) {}
}

@C
protected struct CPlayParameters {
    let loop_: Int32
    let rate_: Int32
    let leftVolume_: Float32
    let rightVolume_: Float32
    let priority_: Int32

    init(params: PlayParameters) {
        this.loop_ = params.loop
        this.rate_ = match (params.rate) {
            case RENDER_RATE_NORMAL => 0
            case RENDER_RATE_DOUBLE => 1
            case RENDER_RATE_HALF => 2
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
        this.leftVolume_ = params.leftVolume
        this.rightVolume_ = params.rightVolume
        this.priority_ = params.priority
    }
}

@C
struct CException {
    var errorCode: Int32 = 0
    var msg: CString = CString(CPointer<UInt8>())

    func toException(): BusinessException {
        return BusinessException(errorCode, msg.toString())
    }

    func toExceptionAndFree(): BusinessException {
        let exception = this.toException()
        unsafe {
            LibC.free(msg)
        }
        return exception
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.SoundPool"
]
public func createSoundPool(maxStreams: Int32, audioRenderInfo: AudioRendererInfo): ?SoundPool {
    var code = 0i32
    var id = unsafe { FfiSoundPoolCreateSoundPool(maxStreams, audioRenderInfo.toCAudioRendererInfo(), inout code) }
    if (code != SUCCESS_CODE) {
        if (code == -1) {
            return None
        } else {
            throw BusinessException(code, getErrorMsg(code))
        }
    }
    return SoundPool(id)
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.SoundPool"
]
public class SoundPool <: RemoteDataLite {
    let callbackMap = HashMap<Int8, ArrayList<CallbackObject>>()

    protected init(id: Int64) {
        super(id)
        SOUND_POLL_LOG.debug("[SoundPool] construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func load(uri: String): Int32 {
        let cUri = unsafe { LibC.mallocCString(uri) }
        var errorcode = SUCCESS_CODE
        let ret = unsafe { FfiSoundPoolLoadURI(getID(), cUri, inout errorcode) }
        unsafe { LibC.free(cUri) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
        return ret
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func load(fd: Int32, offset: Int64, length: Int64): Int32 {
        var errorcode = SUCCESS_CODE
        let ret = unsafe { FfiSoundPoolLoad(getID(), fd, offset, length, inout errorcode) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
        return ret
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func play(soundID: Int32, params!: ?PlayParameters = None): Int32 {
        var errorcode = SUCCESS_CODE
        var ret: Int32 = -1
        if (params.isNone()) {
            ret = unsafe { FfiSoundPoolPlay(getID(), soundID, inout errorcode) }
        } else {
            let cParams = CPlayParameters(params.getOrThrow())
            ret = unsafe { FfiSoundPoolPlayParam(getID(), soundID, cParams, inout errorcode) }
        }

        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
        return ret
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func stop(streamID: Int32): Unit {
        let errorcode = unsafe { FfiSoundPoolStop(getID(), streamID) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func setLoop(streamID: Int32, loop: Int32): Unit {
        var errorcode = unsafe { FfiSoundPoolSetLoop(getID(), streamID, loop) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func setPriority(streamID: Int32, priority: Int32): Unit {
        var errorcode = unsafe { FfiSoundPoolSetPriority(getID(), streamID, priority) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func setRate(streamID: Int32, rate: AudioRendererRate): Unit {
        let rateInt = match (rate) {
            case RENDER_RATE_NORMAL => 0i32
            case RENDER_RATE_DOUBLE => 1i32
            case RENDER_RATE_HALF => 2i32
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
        var errorcode = unsafe { FfiSoundPoolSetRate(getID(), streamID, rateInt) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func setVolume(streamID: Int32, leftVolume: Float32, rightVolume: Float32): Unit {
        var errorcode = unsafe { FfiSoundPoolSetVolume(getID(), streamID, leftVolume, rightVolume) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func unload(soundID: Int32): Unit {
        var errorcode = unsafe { FfiSoundPoolUnload(getID(), soundID) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func release(): Unit {
        var errorcode = unsafe { FfiSoundPoolRelease(getID()) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    private func findCallbackObject(eventType: Int8, callback: CallbackObject): Bool {
        let callbackList = callbackMap.get(eventType)
        if (let Some(v) <- callbackList) {
            for (idx in 0..v.size) {
                if (refEq(callback, v[idx])) {
                    return true
                }
            }
        }
        return false
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func on(eventType: SoundPoolEvent, callback: Callback1Argument<Int32>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (eventType) {
                case SoundPoolEvent.LoadCompleted =>
                    let typeValue = eventType.getValue()
                    if (findCallbackObject(typeValue, callback)) {
                        SOUND_POLL_LOG.info("[SoundPool] The callback object already exists.")
                        return
                    }
                    unsafe {
                        let wrapper = {value: Int32 => callback.invoke(value)}
                        let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                        FfiSoundPoolOnLoadCompleted(getID(), lambdaData.getID())
                        callbackMap.addIfAbsent(typeValue, ArrayList<CallbackObject>())
                        callbackMap[typeValue].add(callback)
                    }
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func on(eventType: SoundPoolEvent, callback: Callback0Argument): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (eventType) {
                case SoundPoolEvent.PlayFinished =>
                    let typeValue = eventType.getValue()
                    if (findCallbackObject(typeValue, callback)) {
                        SOUND_POLL_LOG.info("[SoundPool] The callback object already exists.")
                        return
                    }
                    unsafe {
                        let wrapper = {=> callback.invoke()}
                        let lambdaData = Callback0Param<Unit>(wrapper)
                        FfiSoundPoolOnPlayFinished(getID(), lambdaData.getID())
                        callbackMap.addIfAbsent(typeValue, ArrayList<CallbackObject>())
                        callbackMap[typeValue].add(callback)
                    }
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func on(eventType: SoundPoolEvent, callback: Callback1Argument<BusinessException>): Unit {
        synchronized(ON_OFF_MUTEX) {
            match (eventType) {
                case SoundPoolEvent.EventError =>
                    let typeValue = eventType.getValue()
                    if (findCallbackObject(eventType.getValue(), callback)) {
                        SOUND_POLL_LOG.info("[SoundPool] The callback object already exists.")
                        return
                    }
                    unsafe {
                        let wrapper = {
                            value: CException =>
                            var business = value.toExceptionAndFree()
                            callback.invoke(business)
                        }
                        let lambdaData = Callback1Param<CException, Unit>(wrapper)
                        FfiSoundPoolOnError(getID(), lambdaData.getID())
                        callbackMap.addIfAbsent(typeValue, ArrayList<CallbackObject>())
                        callbackMap[typeValue].add(callback)
                    }
                case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.SoundPool"
    ]
    public func off(eventType: SoundPoolEvent): Unit {
        let typeValue = eventType.getValue()
        unsafe { FfiSoundPoolOff(getID(), typeValue) }
        if (!callbackMap.get(typeValue).isNone()) {
            callbackMap.remove(typeValue)
        }
    }
}
