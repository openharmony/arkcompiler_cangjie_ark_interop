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

import std.sync.*
import std.collection.*
import ohos.multimodalInput.keyEvent.*
import ohos.ffi.*
import ohos.base.*
import ohos.ability.WantAgent
import ohos.labels.*

foreign {
    func FfiMultimediaAVSessionControllerDestroy(sessionId: CString): Int32

    func FfiMultimediaAVSessionControllerGetAVCallState(sessionId: CString, avCallState: CPointer<CAVCallState>): Int32

    func FfiMultimediaAVSessionControllerGetAVCallMetaData(sessionId: CString, avCallMetaData: CPointer<CAVCallMetaData>): Int32

    func FfiMultimediaAVSessionControllerGetAVPlaybackState(
        sessionId: CString,
        avPlaybackState: CPointer<CAVPlaybackState>
    ): Int32

    func FfiMultimediaAVSessionControllerGetAVMetaData(sessionId: CString, avMetaData: CPointer<CAVMetaData>): Int32

    func FfiMultimediaAVSessionControllerGetOutputDevice(
        sessionId: CString,
        outputDeviceInfo: CPointer<COutputDeviceInfo>
    ): Int32

    func FfiMultimediaAVSessionControllerGetRealPlaybackPosition(sessionId: CString, position: CPointer<Int64>): Int32

    func FfiMultimediaAVSessionControllerIsActive(sessionId: CString, isActive: CPointer<Bool>): Int32

    func FfiMultimediaAVSessionControllerGetValidCommands(sessionId: CString, cArrI32: CPointer<CArrI32>): Int32

    func FfiMultimediaAVSessionControllerGetAVQueueItems(sessionId: CString, cArrUnit: CPointer<CArrUnit>): Int32

    func FfiMultimediaAVSessionControllerGetAVQueueTitle(sessionId: CString, avQueueTitle: CPointer<CString>): Int32

    func FfiMultimediaAVSessionControllerGetExtras(sessionId: CString, extras: CPointer<CArrParameters>): Int32

    func FfiMultimediaAVSessionControllerGetLaunchAbility(sessionId: CString, ability: CPointer<Int64>): Int32

    func FfiMultimediaAVSessionControllerSendCommonCommand(sessionId: CString, command: CString,
        args: CPointer<CArrParameters>): Int32

    func FfiMultimediaAVSessionControllerSendControlCommand(sessionId: CString, command: CPointer<CAVSessionCommand>): Int32

    func FfiMultimediaAVSessionControllerSendAVKeyEvent(sessionId_: CString, event: CPointer<CKeyEvent>): Int32

    func FfiMultimediaAVSessionControllerSkipToQueueItem(sessionId: CString, itemId: CPointer<Int32>): Int32

    func FfiMultimediaAVSessionQueueTitleChangeOn(id: Int64, mode: CString, funcId: Int64): Int32

    func FfiMultimediaAVSessionControllerOn(sessionId: CString, callbackType: Int32, id: Int64): Int32

    func FfiMultimediaAVSessionControllerOff(sessionId: CString, callbackType: Int32): Int32

    func FfiMultimediaAVSessionControllerOnCallMetadataChange(sessionId: CString, callbackType: Int32,
        filter: CPointer<CParameters>, id: Int64): Int32

    func FfiMultimediaAVSessionControllerOnCallStateChange(sessionId: CString, callbackType: Int32,
        filter: CPointer<CParameters>, id: Int64): Int32

    func FfiMultimediaAVSessionControllerOnPlaybackStateChange(sessionId: CString, callbackType: Int32,
        filter: CPointer<CParameters>, id: Int64): Int32

    func FfiMultimediaAVSessionControllerOnMetaDataChange(sessionId: CString, callbackType: Int32,
        filter: CPointer<CParameters>, id: Int64): Int32
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public class AVSessionController {
    private let sessionId_: CString
    let callbackEngine = CallbackEngine<AVSessionControllerEventTypeClass>()

    init(sessionId: String) {
        sessionId_ = unsafe { LibC.mallocCString(sessionId) }
    }

    ~init() {
        unsafe {
            FfiMultimediaAVSessionControllerDestroy(sessionId_)
            LibC.free(sessionId_)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public prop sessionId: String {
        get() {
            unsafe { sessionId_.toString() }
        }
    }

    //public on callMetadataChange
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionControllerEventType, filter: Array<KeyOfCallMetadata>,
        callback: Callback1Argument<CallMetadata>): Unit {
        match (eventType) {
            case EVENT_AVCALL_META_DATA_CHANGE =>
                let eventWrapper = AVSessionControllerEventTypeClass(eventType)
                let numArray = Array<Int32>(filter.size, {i => filter[i].getValue()})
                callbackEngine.subscribeWithFilter<CAVCallMetaData, CallMetadata>(eventWrapper, numArray, callback,
                    {avCallMetaData: CAVCallMetaData => avCallMetaData.toCJObject()},
                    {eventType, arr, callback => onChangeWithFilter(eventType, arr, callback)})
            case _ => throw IllegalArgumentException(
                "Callback with CallMetadata argument is not supported for ${eventType}!")
        }
    }

    //public on callStateChange
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionControllerEventType, filter: Array<KeyOfCallState>,
        callback: Callback1Argument<AVCallState>): Unit {
        match (eventType) {
            case EVENT_AVCALL_STATE_CHANGE =>
                let eventWrapper = AVSessionControllerEventTypeClass(eventType)
                let numArray = Array<Int32>(filter.size, {i => filter[i].getValue()})
                callbackEngine.subscribeWithFilter<CAVCallState, AVCallState>(eventWrapper, numArray, callback,
                    {avCallState: CAVCallState => avCallState.toCJObject()},
                    {eventType, arr, callback => onChangeWithFilter(eventType, arr, callback)})
            case _ => throw IllegalArgumentException(
                "Callback with AVCallState argument is not supported for ${eventType}!")
        }
    }

    //SessionDestroy null
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionControllerEventType, callback: Callback0Argument): Unit {
        match (eventType) {
            case EVENT_SESSION_DESTROY =>
                let eventWrapper = AVSessionControllerEventTypeClass(eventType)
                callbackEngine.subscribeWith0Arg(eventWrapper, callback, {eventValue, id => on(eventValue, id)})
            case _ => throw IllegalArgumentException("Callback with 0 argument is not supported for ${eventType}!")
        }
    }

    //public on playbackStateChange
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func on(eventType: AVSessionControllerEventType, filter: Array<KeyOfPlaybackState>,
        callback: Callback1Argument<AVPlaybackState>): Unit {
        match (eventType) {
            case EVENT_PLAYBACK_STATE_CHANGE =>
                let eventWrapper = AVSessionControllerEventTypeClass(eventType)
                let numArray = Array<Int32>(filter.size, {i => filter[i].getValue()})
                callbackEngine.subscribeWithFilter<CAVPlaybackState, AVPlaybackState>(eventWrapper, numArray, callback,
                    {state: CAVPlaybackState => state.toCJObject()},
                    {eventType, arr, callback => onChangeWithFilter(eventType, arr, callback)})
            case _ => throw IllegalArgumentException(
                "Callback with AVPlaybackState argument is not supported for ${eventType}!")
        }
    }

    //public on metadataChange
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionControllerEventType, filter: Array<KeyOfMetaData>,
        callback: Callback1Argument<AVMetadata>): Unit {
        match (eventType) {
            case EVENT_META_DATA_CHANGE =>
                let eventWrapper = AVSessionControllerEventTypeClass(eventType)
                let numArray = Array<Int32>(filter.size, {i => filter[i].getValue()})
                callbackEngine.subscribeWithFilter<CAVMetaData, AVMetadata>(eventWrapper, numArray, callback,
                    {data: CAVMetaData => data.toCJObject()},
                    {eventType, arr, callback => onChangeWithFilter(eventType, arr, callback)})
            case _ => throw IllegalArgumentException(
                "Callback with AVMetadata argument is not supported for ${eventType}!")
        }
    }

    //ActiveStateChange Bool
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionControllerEventType, callback: Callback1Argument<Bool>): Unit {
        match (eventType) {
            case EVENT_ACTIVE_STATE_CHANGE =>
                let eventWrapper = AVSessionControllerEventTypeClass(eventType)
                callbackEngine.subscribeWith1Arg<Bool, Bool>(eventWrapper, callback, {isactive: Bool => isactive},
                    {eventValue, id => on(eventValue, id)})
            case _ => throw IllegalArgumentException("Callback with Bool argument is not supported for ${eventType}!")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func on(eventType: AVSessionControllerEventType, callback: Callback1Argument<AVControlCommandType>): Unit {
        match (eventType) {
            case EVENT_VALID_COMMAND_CHANGE =>
                let eventWrapper = AVSessionControllerEventTypeClass(eventType)
                callbackEngine.subscribeWith1Arg<Int32, AVControlCommandType>(eventWrapper, callback,
                    {cmds: Int32 => AVControlCommandType.parse(cmds)}, {eventValue, id => on(eventValue, id)})
            case _ => throw IllegalArgumentException(
                "Callback with AVControlCommandType argument is not supported for ${eventType}!")
        }
    }

    //OutputDeviceChange 2 param
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(
        eventType: AVSessionControllerEventType,
        callback: Callback2Argument<ConnectionState, OutputDeviceInfo>
    ): Unit {
        match (eventType) {
            case EVENT_OUTPUT_DEVICE_CHANGE =>
                let eventWrapper = AVSessionControllerEventTypeClass(eventType)
                callbackEngine.subscribeWith2Arg<Int32, ConnectionState, COutputDeviceInfo, OutputDeviceInfo>(
                    eventWrapper, callback, {connectionStateValue: Int32 => ConnectionState.parse(connectionStateValue)},
                    {c: COutputDeviceInfo => c.toCJObject()}, {eventValue, id => on(eventValue, id)})
            case _ => throw IllegalArgumentException(
                "Callback with 2 argument of ConnectionState and OutputDeviceInfo is not supported for ${eventType}!")
        }
    }

    // sessionEvent object
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(
        eventType: AVSessionControllerEventType,
        callback: Callback2Argument<String, HashMap<String, ValueType>>
    ): Unit {
        match (eventType) {
            case EVENT_SESSION_EVENT_CHANGE =>
                let eventWrapper = AVSessionControllerEventTypeClass(eventType)
                callbackEngine.subscribeWith2Arg<CString, String, CArrParameters, HashMap<String, ValueType>>(
                    eventWrapper, callback, {csessionEvent: CString => csessionEvent.toString()},
                    {cargs: CArrParameters => cargs.toHashMap()}, {eventValue, id => on(eventValue, id)})
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
    public func on(eventType: AVSessionControllerEventType, callback: Callback1Argument<HashMap<String, ValueType>>): Unit {
        match (eventType) {
            case EVENT_EXTRAS_CHANGE =>
                let eventWrapper = AVSessionControllerEventTypeClass(eventType)
                callbackEngine.subscribeWith1Arg<CArrParameters, HashMap<String, ValueType>>(eventWrapper, callback,
                    {cobject: CArrParameters => cobject.toHashMap()}, {eventValue, id => on(eventValue, id)})
            case _ => throw IllegalArgumentException(
                "Callback with HashMap<String, ValueType> argument is not supported for ${eventType}!")
        }
    }

    //queueItemsChange
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionControllerEventType, callback: Callback1Argument<AVQueueItem>): Unit {
        match (eventType) {
            case EVENT_QUEUE_ITEMS_CHANGE =>
                let eventWrapper = AVSessionControllerEventTypeClass(eventType)
                callbackEngine.subscribeWith1Arg<CAVQueueItem, AVQueueItem>(eventWrapper, callback,
                    {cqueueItem: CAVQueueItem => cqueueItem.toCJObject()}, {eventValue, id => on(eventValue, id)})
            case _ => throw IllegalArgumentException(
                "Callback with AVQueueItem argument is not supported for ${eventType}!")
        }
    }

    //QueueTitleChange String
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func on(eventType: AVSessionControllerEventType, callback: Callback1Argument<String>): Unit {
        match (eventType) {
            case EVENT_QUEUE_TITLE_CHANGE =>
                let eventWrapper = AVSessionControllerEventTypeClass(eventType)
                callbackEngine.subscribeWith1Arg<CString, String>(eventWrapper, callback,
                    {ctext: CString => ctext.toString()}, {eventValue, id => on(eventValue, id)})
            case _ => throw IllegalArgumentException("Callback with String argument is not supported for ${eventType}!")
        }
    }
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func off(eventType: AVSessionControllerEventType, callback!: ?CallbackObject = None): Unit {
        let eventWrapper = AVSessionControllerEventTypeClass(eventType)
        callbackEngine.unsubscribe(eventWrapper, callback, {et => off(et)})
    }

    private func off(eventType: Int32) {
        let code: Int32 = unsafe { FfiMultimediaAVSessionControllerOff(sessionId_, eventType) }
        checkAndReturn(code, "off(${eventType})")
    }

    private func onChangeWithFilter(eventType: Int32, filter: Array<Int32>, id: Int64) {
        var arrParams = CParameters("filter", ValueType.ARRAYI32(filter.toArray()))
        try {
            let code: Int32 = match (AVSessionControllerEventType.parse(eventType)) {
                case EVENT_AVCALL_META_DATA_CHANGE => unsafe { FfiMultimediaAVSessionControllerOnCallMetadataChange(
                    sessionId_, eventType, inout arrParams, id) }
                case EVENT_AVCALL_STATE_CHANGE => unsafe { FfiMultimediaAVSessionControllerOnCallStateChange(sessionId_,
                    eventType, inout arrParams, id) }
                case EVENT_PLAYBACK_STATE_CHANGE => unsafe { FfiMultimediaAVSessionControllerOnPlaybackStateChange(
                    sessionId_, eventType, inout arrParams, id) }
                case EVENT_META_DATA_CHANGE => unsafe { FfiMultimediaAVSessionControllerOnMetaDataChange(sessionId_,
                    eventType, inout arrParams, id) }
                case _ => throw IllegalArgumentException(
                    "This is for filter Key related 'on' method, you are using wrong eventType with this!")
            }
            checkAndReturn(code, "on ${eventType}")
        } finally {
            arrParams.free()
        }
    }

    private func on(eventType: Int32, id: Int64) {
        let code: Int32 = unsafe { FfiMultimediaAVSessionControllerOn(sessionId_, eventType, id) }
        checkAndReturn(code, "on(${eventType})")
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getAVCallState(): AVCallState {
        var state = CAVCallState(0, false)
        let code = unsafe { FfiMultimediaAVSessionControllerGetAVCallState(sessionId_, inout state) }
        checkAndReturn(code, "getAVCallState")
        return state.toCJObject()
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getCallMetadata(): CallMetadata {
        var data = CAVCallMetaData()
        let code = unsafe { FfiMultimediaAVSessionControllerGetAVCallMetaData(sessionId_, inout data) }
        checkAndReturn(code, "getCallMetadata")
        return data.toCJObjectAndFree()
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getAVPlaybackState(): AVPlaybackState {
        var state = CAVPlaybackState()
        let code = unsafe { FfiMultimediaAVSessionControllerGetAVPlaybackState(sessionId_, inout state) }
        checkAndReturn(code, "getAVPlaybackState")
        return state.toCJObjectAndFree()
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getAVMetadata(): AVMetadata {
        var data = CAVMetaData()
        let code = unsafe { FfiMultimediaAVSessionControllerGetAVMetaData(sessionId_, inout data) }
        checkAndReturn(code, "getAVMetadata")
        return data.toCJObjectAndFree()
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getOutputDevice(): OutputDeviceInfo {
        var deviceInfo = COutputDeviceInfo()
        let code = unsafe { FfiMultimediaAVSessionControllerGetOutputDevice(sessionId_, inout deviceInfo) }
        checkAndReturn(code, "getOutputDevice")
        try {
            return deviceInfo.toCJObject()
        } finally {
            deviceInfo.free()
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getRealPlaybackPosition(): Int64 {
        var pos = -1i64
        let code = unsafe { FfiMultimediaAVSessionControllerGetRealPlaybackPosition(sessionId_, inout pos) }
        checkAndReturn(code, "getRealPlaybackPosition")
        return pos
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func isActive(): Bool {
        var ret = false
        let code = unsafe { FfiMultimediaAVSessionControllerIsActive(sessionId_, inout ret) }
        checkAndReturn(code, "isActive")
        return ret
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func destroy(): Unit {
        let code = unsafe { FfiMultimediaAVSessionControllerDestroy(sessionId_) }
        checkAndReturn(code, "destroy")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getValidCommands(): Array<AVControlCommandType> {
        var arrI32 = CArrI32(CPointer<Int32>(), 0)
        let code = unsafe { FfiMultimediaAVSessionControllerGetValidCommands(sessionId_, inout arrI32) }
        checkAndReturn(code, "getValidCommands")
        let result = ArrayList<AVControlCommandType>()
        unsafe {
            for (i in 0..arrI32.size) {
                result.add(AVControlCommandType.parse(arrI32.head.read(i)))
            }
            LibC.free(arrI32.head)
        }
        return result.toArray()
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func sendAVKeyEvent(event: KeyEvent): Unit {
        var keyEvent = CKeyEvent(event)
        let code = unsafe { FfiMultimediaAVSessionControllerSendAVKeyEvent(sessionId_, inout keyEvent) }
        unsafe { keyEvent.free() }
        checkAndReturn(code, "sendAVKeyEvent")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func sendCommonCommand(command: String, args: HashMap<String, ValueType>): Unit {
        try (
            cmd = unsafe { LibC.mallocCString(command).asResource() }
        ) {
            var arrParams = CArrParameters(args)
            let code = unsafe { FfiMultimediaAVSessionControllerSendCommonCommand(sessionId_, cmd.value, inout arrParams) }
            arrParams.free()
            checkAndReturn(code, "sendCommonCommand")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func sendControlCommand(command: AVControlCommand): Unit {
        command.checkParameterIsValid()
        var avSessionCommand = CAVSessionCommand(command)
        let code = unsafe { FfiMultimediaAVSessionControllerSendControlCommand(sessionId_, inout avSessionCommand) }
        avSessionCommand.free()
        checkAndReturn(code, "sendCommonCommand")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getAVQueueItems(): Array<AVQueueItem> {
        var arrUnit = CArrUnit(CPointer<Unit>(), 0)
        let code = unsafe { FfiMultimediaAVSessionControllerGetAVQueueItems(sessionId_, inout arrUnit) }
        checkAndReturn(code, "getAVQueueItems")
        let result = ArrayList<AVQueueItem>()
        unsafe {
            try {
                for (i in 0..arrUnit.size) {
                    result.add(CPointer<CAVQueueItem>(arrUnit.head).read(i).toCJObject())
                }
            } finally {
                for (i in 0..arrUnit.size) {
                    CPointer<CAVQueueItem>(arrUnit.head).read(i).free()
                }
                LibC.free(arrUnit.head)
            }
        }
        return result.toArray()
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getAVQueueTitle(): String {
        try (ptr = safeMalloc<CString>().asResource()) {
            let code = unsafe { FfiMultimediaAVSessionControllerGetAVQueueTitle(sessionId_, ptr.value) }
            checkAndReturn(code, "getAVQueueTitle")
            return unsafe { ptr.value.read().toString() }
        }
        throw IllegalMemoryException("Out of Memory!")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func skipToQueueItem(itemId: Int32): Unit {
        var id = itemId
        let code = unsafe { FfiMultimediaAVSessionControllerSkipToQueueItem(sessionId_, inout id) }
        checkAndReturn(code, "skipToQueueItem")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getExtras(): HashMap<String, ValueType> {
        var extras = CArrParameters(CPointer<CParameters>(), 0)
        let code = unsafe { FfiMultimediaAVSessionControllerGetExtras(sessionId_, inout extras) }
        checkAndReturn(code, "getExtras")
        return extras.toHashMap()
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func getLaunchAbility(): WantAgent {
        var id = 0i64
        let code = unsafe { FfiMultimediaAVSessionControllerGetLaunchAbility(sessionId_, inout id) }
        checkAndReturn(code, "getLaunchAbility")
        return WantAgent(id)
    }
}
