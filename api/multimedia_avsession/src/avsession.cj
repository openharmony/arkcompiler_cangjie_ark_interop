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

package ohos.multimedia_avsession

import std.collection.*
import ohos.ffi.*
import ohos.base.*
import ohos.multimodalInput.keyEvent.*
import ohos.ability.WantAgent
import ohos.labels.*

foreign {
    func FfiMultimediaAVSessionSetAVMetaData(sessionId: Int64, data: CPointer<CAVMetaData>): Int32

    func FfiMultimediaAVSessionSetAVCallMetaData(sessionId: Int64, data: CPointer<CAVCallMetaData>): Int32

    func FfiMultimediaAVSessionSetAVCallState(sessionId: Int64, state: CPointer<CAVCallState>): Int32

    func FfiMultimediaAVSessionSetAVPlaybackState(sessionId: Int64, state: CPointer<CAVPlaybackState>): Int32

    func FfiMultimediaAVSessionSetAVQueueItems(sessionId: Int64, items: CPointer<CAVQueueItemArr>): Int32

    func FfiMultimediaAVSessionSetAVQueueTitle(sessionId: Int64, title: CPointer<CString>): Int32

    func FfiMultimediaAVSessionSetExtras(sessionId: Int64, extras: CPointer<CArrParameters>): Int32

    func FfiMultimediaAVSessionSetLaunchAbility(sessionId: Int64, ability: Int64): Int32

    func FfiMultimediaAVSessionGetController(sessionId: Int64): Int32

    func FfiMultimediaAVSessionGetAVCastController(sessionId: Int64): Int32

    func FfiMultimediaAVSessionGetOutputDevice(sessionId: Int64, outputDevice: CPointer<COutputDeviceInfo>): Int32

    func FfiMultimediaAVSessionGetAllCastDisplays(sessionId: Int64, castDisplayInfo: CPointer<CCastDisplayInfoArr>): Int32

    func FfiMultimediaAVSessionActivate(sessionId: Int64): Int32

    func FfiMultimediaAVSessionDeactivate(sessionId: Int64): Int32

    func FfiMultimediaAVSessionDestroy(sessionId: Int64): Int32

    func FfiMultimediaAVSessionStopCasting(sessionId: Int64): Int32

    func FfiMultimediaAVSessionDispatchSessionEvent(sessionId: Int64, event: CPointer<CString>,
        args: CPointer<CArrParameters>): Int32

    func FfiMultimediaAVSessionOn(sessionId: Int64, callbackType: Int32, callbackId: Int64): Int32

    func FfiMultimediaAVSessionOff(sessionId: Int64, callbackType: Int32): Int32
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public class AVSession <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public let sessionId: String
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public let sessionType: AVSessionType
    private let remoteId: Int64
    private let callbackEngine = CallbackEngine<AVSessionEventTypeClass>()

    protected init(id: Int64, sessionId: String, sessionType: AVSessionType) {
        super(id)
        this.sessionId = sessionId
        this.sessionType = sessionType
        remoteId = id
    }

    ~init() {
        unsafe { FfiMultimediaAVSessionDestroy(remoteId) }
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func setAVMetadata(data: AVMetadata): Unit {
        var metaData = CAVMetaData(data)
        let code = unsafe { FfiMultimediaAVSessionSetAVMetaData(remoteId, inout metaData) }
        metaData.free()
        checkAndReturn(code, "setAVMetadata")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func setCallMetadata(data: CallMetadata): Unit {
        var metaData = CAVCallMetaData(data)
        let code = unsafe { FfiMultimediaAVSessionSetAVCallMetaData(remoteId, inout metaData) }
        metaData.free()
        checkAndReturn(code, "setCallMetadata")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func setAVCallState(state: AVCallState): Unit {
        var callState = CAVCallState(state)
        let code = unsafe { FfiMultimediaAVSessionSetAVCallState(remoteId, inout callState) }
        checkAndReturn(code, "setAVCallState")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func setAVPlaybackState(state: AVPlaybackState): Unit {
        var avPlaybackState = CAVPlaybackState(state)
        let code = unsafe { FfiMultimediaAVSessionSetAVPlaybackState(remoteId, inout avPlaybackState) }
        avPlaybackState.free()
        checkAndReturn(code, "setAVPlaybackState")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func setAVQueueItems(items: Array<AVQueueItem>): Unit {
        if (items.size == 0) {
            throw IllegalArgumentException("Invalid items: Array size must not be 0!")
        }
        for (item in items) {
            if (!item.isValid()) {
                throw IllegalArgumentException("Invalid item(id:${item.itemId}) in Array!")
            }
        }
        var avQueueItemArr = CAVQueueItemArr(items)
        let code = unsafe { FfiMultimediaAVSessionSetAVQueueItems(remoteId, inout avQueueItemArr) }
        avQueueItemArr.free()
        checkAndReturn(code, "setAVQueueItems")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func setAVQueueTitle(title: String): Unit {
        try (
            avQueueTitle = unsafe { LibC.mallocCString(title).asResource() },
            titlePtr = safeMalloc<CString>().asResource() 
        ) {
            unsafe { titlePtr.value.write(avQueueTitle.value) }
            let code = unsafe { FfiMultimediaAVSessionSetAVQueueTitle(remoteId, titlePtr.value) }
            checkAndReturn(code, "setAVQueueTitle")
        }
    }

    /**
     * Set the custom media packets for this session.
     *
     * @throws { BusinessException } 401 - Invalid input parameter.
     * @throws { BusinessException } 6600101 - Session service exception.
     * @throws { BusinessException } 6600102 - The session does not exist.
     * @throws { IllegalArgumentException } - Unsupported ValueType.
     * @relation setExtras(extras: {[key: string]: Object}, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func setExtras(extras: HashMap<String, ValueType>): Unit {
        var arrParams = CArrParameters(extras)
        let code = unsafe { FfiMultimediaAVSessionSetExtras(remoteId, inout arrParams) }
        arrParams.free()
        checkAndReturn(code, "setExtras")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func setLaunchAbility(ability: WantAgent): Unit {
        let code = unsafe { FfiMultimediaAVSessionSetLaunchAbility(remoteId, ability.getID()) }
        checkAndReturn(code, "setLaunchAbility")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func dispatchSessionEvent(event: String, args: HashMap<String, ValueType>): Unit {
        try (
            eventPtr = unsafe { LibC.mallocCString(event).asResource() },
            ptr = safeMalloc<CString>().asResource()
        ) {
            unsafe { ptr.value.write(eventPtr.value) }
            var arrParams = CArrParameters(args)
            let code = unsafe { FfiMultimediaAVSessionDispatchSessionEvent(remoteId, ptr.value, inout arrParams) }
            arrParams.free()
            checkAndReturn(code, "dispatchSessionEvent")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getController(): AVSessionController {
        let code = unsafe { FfiMultimediaAVSessionGetController(remoteId) }
        LOGGER.debug("func getController's code is ${code}")
        checkAndReturn(code, "getController")
        AVSessionController(sessionId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getAVCastController(): AVCastController {
        let code = unsafe { FfiMultimediaAVSessionGetAVCastController(remoteId) }
        checkAndReturn(code, "getAVCastController")
        AVCastController(sessionId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getOutputDevice(): OutputDeviceInfo {
        var outputDeviceInfo = COutputDeviceInfo()
        let code = unsafe { FfiMultimediaAVSessionGetOutputDevice(remoteId, inout outputDeviceInfo) }
        checkAndReturn(code, "getOutputDevice")
        try {
            return outputDeviceInfo.toCJObject()
        } finally {
            outputDeviceInfo.free()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getAllCastDisplays(): Array<CastDisplayInfo> {
        var arrInfo = CCastDisplayInfoArr()
        let code = unsafe { FfiMultimediaAVSessionGetAllCastDisplays(remoteId, inout arrInfo) }
        checkAndReturn(code, "getAllCastDisplays")
        try {
            return arrInfo.toArray()
        } finally {
            arrInfo.free()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func activate(): Unit {
        let code = unsafe { FfiMultimediaAVSessionActivate(remoteId) }
        checkAndReturn(code, "activate")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func deactivate(): Unit {
        let code = unsafe { FfiMultimediaAVSessionDeactivate(remoteId) }
        checkAndReturn(code, "deactivate")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func destroy(): Unit {
        let code = unsafe { FfiMultimediaAVSessionDestroy(remoteId) }
        checkAndReturn(code, "destroy")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func stopCasting(): Unit {
        let code = unsafe { FfiMultimediaAVSessionStopCasting(remoteId) }
        checkAndReturn(code, "stopCasting")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func off(eventType: AVSessionEventType, callback!: ?CallbackObject = None): Unit {
        commonUnSubscribe(eventType, callback: callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionEventType, callback: Callback0Argument): Unit {
        match (eventType) {
            case Play => onPlay(callback)
            case Pause => onPause(callback)
            case Stop => onStop(callback)
            case PlayNext => onPlayNext(callback)
            case PlayPrevious => onPlayPrevious(callback)
            case FastForward => onFastForward(callback)
            case Rewind => onRewind(callback)
            case Answer => onAnswer(callback)
            case HangUp => onHangUp(callback)
            case ToggleCallMute => onToggleCallMute(callback)
            case _ => throw IllegalArgumentException("Callback with 0 argument is not supported for ${eventType}!")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionEventType, callback: Callback1Argument<Int32>): Unit {
        match (eventType) {
            case SkipToQueueItem => onSkipToQueueItem(callback)
            case _ => throw IllegalArgumentException("Callback with Int32 argument is not supported for ${eventType}!")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionEventType, callback: Callback1Argument<Int64>): Unit {
        match (eventType) {
            case FastForward => onFastForward(callback)
            case Rewind => onRewind(callback)
            case Seek => onSeek(callback)
            case PlayFromAssetId => onPlayFromAssetId(callback)
            case _ => throw IllegalArgumentException("Callback with Int64 argument is not supported for ${eventType}!")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionEventType, callback: Callback1Argument<Float64>): Unit {
        match (eventType) {
            case SetSpeed => onSetSpeed(callback)
            case _ => throw IllegalArgumentException(
                "Callback with Float64 argument is not supported for ${eventType}!")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionEventType, callback: Callback1Argument<String>): Unit {
        match (eventType) {
            case ToggleFavorite => onToggleFavorite(callback)
            case _ => throw IllegalArgumentException("Callback with String argument is not supported for ${eventType}!")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionEventType, callback: Callback1Argument<CastDisplayInfo>): Unit {
        match (eventType) {
            case CastDisplayChange => onCastDisplayChange(callback)
            case _ => throw IllegalArgumentException(
                "Callback with CastDisplayInfo argument is not supported for ${eventType}!")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionEventType, callback: Callback1Argument<LoopMode>): Unit {
        match (eventType) {
            case SetLoopMode => onSetLoopMode(callback)
            case _ => throw IllegalArgumentException(
                "Callback with LooMode argument is not supported for ${eventType}!")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionEventType, callback: Callback2Argument<ConnectionState, OutputDeviceInfo>): Unit {
        match (eventType) {
            case OutputDeviceChange => onOutputDeviceChange(callback)
            case _ => throw IllegalArgumentException(
                "Callback with 2 argument of ConnectionState and OutputDeviceInfo is not supported for ${eventType}!")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionEventType, callback: Callback2Argument<String, HashMap<String, ValueType>>): Unit {
        match (eventType) {
            case CommonCommand => onCommonCommand(callback)
            case _ => throw IllegalArgumentException(
                "Callback with 2 argument of String and HashMap<String, ValueType> is not supported for ${eventType}!")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionEventType, callback: Callback1Argument<KeyEvent>): Unit {
        match (eventType) {
            case HandleKeyEvent => onHandleKeyEvent(callback)
            case _ => throw IllegalArgumentException(
                "Callback with KeyEvent argument is not supported for ${eventType}!")
        }
    }

    private func onPlay(callback: Callback0Argument): Unit {
        subscribe(Play, callback)
    }

    private func onPause(callback: Callback0Argument): Unit {
        subscribe(Pause, callback)
    }

    private func onStop(callback: Callback0Argument): Unit {
        subscribe(Stop, callback)
    }

    private func onPlayNext(callback: Callback0Argument): Unit {
        subscribe(PlayNext, callback)
    }

    private func onPlayPrevious(callback: Callback0Argument): Unit {
        subscribe(PlayPrevious, callback)
    }

    private func onAnswer(callback: Callback0Argument): Unit {
        subscribe(Answer, callback)
    }

    private func onHangUp(callback: Callback0Argument): Unit {
        subscribe(HangUp, callback)
    }

    private func onFastForward(callback: Callback0Argument): Unit {
        commonSubscribe<Int64, Int64>(FastForward, callback) {
            time: Int64 => time
        }
    }

    private func onToggleCallMute(callback: Callback0Argument): Unit {
        subscribe(ToggleCallMute, callback)
    }

    private func onRewind(callback: Callback0Argument): Unit {
        commonSubscribe<Int64, Int64>(Rewind, callback) {
            time: Int64 => time
        }
    }

    private func onFastForward(callback: Callback1Argument<Int64>): Unit {
        commonSubscribe<Int64, Int64>(FastForward, callback) {
            time: Int64 => time
        }
    }

    private func onRewind(callback: Callback1Argument<Int64>): Unit {
        commonSubscribe<Int64, Int64>(Rewind, callback) {
            time: Int64 => time
        }
    }

    private func onPlayFromAssetId(callback: Callback1Argument<Int64>): Unit {
        commonSubscribe<Int64, Int64>(PlayFromAssetId, callback) {
            assetId: Int64 => assetId
        }
    }

    private func onSeek(callback: Callback1Argument<Int64>): Unit {
        commonSubscribe<Int64, Int64>(Seek, callback) {
            time: Int64 => time
        }
    }

    private func onSetSpeed(callback: Callback1Argument<Float64>): Unit {
        commonSubscribe<Float64, Float64>(SetSpeed, callback) {
            speed: Float64 => speed
        }
    }

    private func onSetLoopMode(callback: Callback1Argument<LoopMode>): Unit {
        commonSubscribe<Int32, LoopMode>(SetLoopMode, callback) {
            loopMode: Int32 => LoopMode.parse(loopMode)
        }
    }

    private func onSkipToQueueItem(callback: Callback1Argument<Int32>): Unit {
        commonSubscribe<Int32, Int32>(SkipToQueueItem, callback) {
            index: Int32 => index
        }
    }

    private func onToggleFavorite(callback: Callback1Argument<String>): Unit {
        commonSubscribe<CString, String>(ToggleFavorite, callback) {
            ctext: CString => return ctext.toString()
        }
    }

    private func onCastDisplayChange(callback: Callback1Argument<CastDisplayInfo>): Unit {
        commonSubscribe<CCastDisplayInfo, CastDisplayInfo>(CastDisplayChange, callback) {
            c: CCastDisplayInfo => return c.toCJObject()
        }
    }

    private func onOutputDeviceChange(callback: Callback2Argument<ConnectionState, OutputDeviceInfo>): Unit {
        commonSubscribe2Arg<Int32, ConnectionState, COutputDeviceInfo, OutputDeviceInfo>(
            OutputDeviceChange,
            callback,
            {connectionStateValue: Int32 => ConnectionState.parse(connectionStateValue)},
            {c: COutputDeviceInfo => c.toCJObject()}
        )
    }

    private func onCommonCommand(callback: Callback2Argument<String, HashMap<String, ValueType>>): Unit {
        commonSubscribe2Arg<CString, String, CArrParameters, HashMap<String, ValueType>>(
            CommonCommand,
            callback,
            {command: CString => command.toString()},
            {cobject: CArrParameters => cobject.toHashMap()}
        )
    }

    private func onHandleKeyEvent(callback: Callback1Argument<KeyEvent>): Unit {
        commonSubscribe<CKeyEvent, KeyEvent>(HandleKeyEvent, callback) {
            c: CKeyEvent => return c.getCJObject();
        }
    }

    private func on(eventType: Int32, id: Int64): Unit {
        let code: Int32 = unsafe { FfiMultimediaAVSessionOn(remoteId, eventType, id) }
        checkAndReturn(code, "on ${eventType}")
    }

    private func off(eventType: Int32): Unit {
        let code: Int32 = unsafe { FfiMultimediaAVSessionOff(remoteId, eventType) }
        checkAndReturn(code, "off ${eventType}")
    }

    private func subscribe(
        eventType: AVSessionEventType,
        callback: CallbackObject
    ): Unit {
        LOGGER.debug("subscribe ${eventType}")
        let eventWrapper = AVSessionEventTypeClass(eventType)
        callbackEngine.subscribeWith0Arg(eventWrapper, callback, {et, id => on(et, id)})
    }

    private func commonSubscribe<CT, T>(
        eventType: AVSessionEventType,
        callback: CallbackObject,
        ctor: (CT) -> T
    ): Unit where CT <: CType {
        LOGGER.info("subscribe ${eventType}")
        let eventWrapper = AVSessionEventTypeClass(eventType)
        callbackEngine.subscribeWith1Arg<CT, T>(eventWrapper, callback, ctor, {et, id => on(et, id)})
    }

    private func commonSubscribe2Arg<CT1, T1, CT2, T2>(
        eventType: AVSessionEventType,
        callback: CallbackObject,
        ctor1: (CT1) -> T1,
        ctor2: (CT2) -> T2
    ): Unit where CT1 <: CType, CT2 <: CType {
        LOGGER.info("subscribe ${eventType}")
        let eventWrapper = AVSessionEventTypeClass(eventType)
        callbackEngine.subscribeWith2Arg<CT1, T1, CT2, T2>(eventWrapper, callback, ctor1, ctor2, {et, id => on(et, id)})
    }

    private func commonUnSubscribe(eventType: AVSessionEventType, callback!: ?CallbackObject): Unit {
        LOGGER.debug("unsubscribe ${eventType}")
        let eventWrapper = AVSessionEventTypeClass(eventType)
        callbackEngine.unsubscribe(eventWrapper, callback, {typeValue => off(typeValue)})
    }
}
