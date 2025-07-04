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
import std.deriving.*
import std.sync.*
import ohos.ffi.*
import ohos.base.*
import ohos.labels.*

foreign {
    @When[castplus_cast_engine_enable == "true"]
    func FfiMultimediaAVSessionCastControllerSubscribeCallbackWithExtras(sessionId: CString, `type`: Int32,
        extras: CPointer<CParameters>, lambdaData: Int64): Int32

    @When[castplus_cast_engine_enable == "true"]
    func FfiMultimediaAVSessionCastControllerSubscribeCallback(sessionId: CString, `type`: Int32, lambdaData: Int64): Int32
}

foreign {
    @When[castplus_cast_engine_enable == "true"]
    func FfiMultimediaAVSessionCastControllerStart(sessionId: CString, item: CPointer<CAVQueueItem>): Int32

    @When[castplus_cast_engine_enable == "true"]
    func FfiMultimediaAVSessionCastControllerPrepare(sessionId: CString, item: CPointer<CAVQueueItem>): Int32

    @When[castplus_cast_engine_enable == "true"]
    func FfiMultimediaAVSessionCastControllerSendControlCommand(sessionId: CString, command: CPointer<CAVSessionCommand>): Int32

    @When[castplus_cast_engine_enable == "true"]
    func FfiMultimediaAVSessionCastControllerGetAVPlaybackState(
        sessionId: CString,
        avPlaybackState: CPointer<CAVPlaybackState>
    ): Int32

    @When[castplus_cast_engine_enable == "true"]
    func FfiMultimediaAVSessionCastControllerGetCurrentItem(sessionId: CString, avQueueItem: CPointer<CAVQueueItem>): Int32

    @When[castplus_cast_engine_enable == "true"]
    func FfiMultimediaAVSessionCastControllerGetValidCommands(sessionId: CString, commands: CPointer<CArrI32>): Int32

    @When[castplus_cast_engine_enable == "true"]
    func FfiMultimediaAVSessionCastControllerRelease(sessionId: CString): Int32

    @When[castplus_cast_engine_enable == "true"]
    func FfiMultimediaAVSessionCastControllerProcessMediaKeyResponse(sessionId: CString, assetId: CPointer<CString>,
        response: CPointer<CArrUI8>): Int32
}

@When[castplus_cast_engine_enable == "false"]
@C
func FfiMultimediaAVSessionCastControllerSubscribeCallbackWithExtras(_: CString, _: Int32, _: CPointer<CParameters>,
    _: Int64): Int32 {
    -1
}

@When[castplus_cast_engine_enable == "false"]
@C
func FfiMultimediaAVSessionCastControllerSubscribeCallback(_: CString, _: Int32, _: Int64): Int32 {
    -1
}

@When[castplus_cast_engine_enable == "false"]
@C
func FfiMultimediaAVSessionCastControllerStart(_: CString, _: CPointer<CAVQueueItem>): Int32 {
    -1
}

@When[castplus_cast_engine_enable == "false"]
@C
func FfiMultimediaAVSessionCastControllerPrepare(_: CString, _: CPointer<CAVQueueItem>): Int32 {
    -1
}

@When[castplus_cast_engine_enable == "false"]
@C
func FfiMultimediaAVSessionCastControllerSendControlCommand(_: CString, _: CPointer<CAVSessionCommand>): Int32 {
    -1
}

@When[castplus_cast_engine_enable == "false"]
@C
func FfiMultimediaAVSessionCastControllerGetAVPlaybackState(_: CString, _: CPointer<CAVPlaybackState>): Int32 {
    -1
}

@When[castplus_cast_engine_enable == "false"]
@C
func FfiMultimediaAVSessionCastControllerGetCurrentItem(_: CString, _: CPointer<CAVQueueItem>): Int32 {
    -1
}

@When[castplus_cast_engine_enable == "false"]
@C
func FfiMultimediaAVSessionCastControllerGetValidCommands(_: CString, _: CPointer<CArrI32>): Int32 {
    -1
}

@When[castplus_cast_engine_enable == "false"]
@C
func FfiMultimediaAVSessionCastControllerRelease(_: CString): Int32 {
    -1
}

@When[castplus_cast_engine_enable == "false"]
@C
func FfiMultimediaAVSessionCastControllerProcessMediaKeyResponse(_: CString, _: CPointer<CString>, _: CPointer<CArrUI8>): Int32 {
    -1
}

@C
struct CallbackData {
    CallbackData(
        let kind: Int32,
        let data: CPointer<Unit>,
        let data2: CPointer<Unit>,
        let error: Int32
    ) {}

    private func cdataToCJOption<CT, T>(cdata: CT): ?T {
        if (cdata is CAVPlaybackState) {
            (cdata as CAVPlaybackState).getOrThrow().toCJObject() as T
        } else if (cdata is CAVQueueItem) {
            (cdata as CAVQueueItem).getOrThrow().toCJObject() as T
        } else if (cdata is Int32) {
            cdata as T
        } else if (cdata is CArrI32) {
            let arr = (cdata as CArrI32).getOrThrow()
            let list = ArrayList<AVCastControlCommandType>()
            for (i in 0..arr.size) {
                list.add(unsafe { AVCastControlCommandType.parse(arr.head.read(i)) })
            }
            list.toArray() as T
        } else if (cdata is CString) {
            (cdata as CString).getOrThrow().toString() as T
        } else if (cdata is CArrUI8) {
            let cArr = (cdata as CArrUI8).getOrThrow()
            let arrlist = ArrayList<UInt8>()
            for (i in 0..cArr.size) {
                arrlist.add(unsafe { cArr.head.read(i) })
            }
            arrlist.toArray() as T
        } else {
            None<T>
        }
    }

    func convertToCJOption<CT, T>(): ?T {
        if (error != AVSESSION_SUCCESS) {
            if (kind != CAST_CONTROLLER_ERROR.value) {
                throwBusinessException(error)
            } else {
                let cdata = unsafe { (data.read() as CT).getOrThrow() }
                if (cdata is CString) {
                    let errMessage = (cdata as CString).getOrThrow().toString()
                    return castControllerErrorCodeToBusinessError(error, errMessage) as T
                } else {
                    throwBusinessException(error)
                }
            }
        }
        if (!data.isNull()) {
            let cdata = unsafe { (data.read() as CT).getOrThrow() }
            cdataToCJOption<CT, T>(cdata)
        } else {
            None<T>
        }
    }

    func convertToCJOptionTuple<CT, T, CT2, T2>(): ?(T, T2) {
        var first: ?T
        var second: ?T2
        if (!data.isNull()) {
            let cdata = unsafe { (data.read() as CT).getOrThrow() }
            first = cdataToCJOption<CT, T>(cdata) ?? return None<(T, T2)>
            let cdata2 = unsafe { (data2.read() as CT2).getOrThrow() }
            second = cdataToCJOption<CT2, T2>(cdata2) ?? return None<(T, T2)>
            return (first.getOrThrow(), second.getOrThrow()) as (T, T2)
        } else {
            return None<(T, T2)>
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.AVCast"
]
public class AVCastController {
    private let callbackMap = CallbackMap<AVCastControllerEventTypeClass>()
    private let sessionId: CString

    init(sessionId: String) {
        this.sessionId = unsafe { LibC.mallocCString(sessionId) }
    }

    ~init() {
        unsafe { LibC.free(sessionId) }
    }

    private func doCall(dataPtr: CPointer<CallbackData>): Unit {
        if (dataPtr.isNull()) {
            LOGGER.error("Data returned by native is null!")
            throwBusinessException(EXCEPTION_SESSION_SERVICE)
        }
        let callbackData = unsafe { dataPtr.read() }
        if (callbackData.data.isNull()) {
            LOGGER.error("The 'data' field of CallbackData returned by native is null!")
            throwBusinessException(EXCEPTION_SESSION_SERVICE)
        }
        match (AVCastControllerEventType.parse(callbackData.kind)) {
            case CAST_CONTROLLER_PLAYBACK_STATE_CHANGE => realCallbackImplement<PlaybackState, CAVPlaybackState>(
                callbackData)
            case CAST_CONTROLLER_MEDIA_ITEM_CHANGE => realCallbackImplement<AVQueueItem, CAVQueueItem>(callbackData)
            case CAST_CONTROLLER_PLAY_NEXT => realCallbackImplementNoArg(callbackData)
            case CAST_CONTROLLER_PLAY_PREVIOUS => realCallbackImplementNoArg(callbackData)
            case CAST_CONTROLLER_REQUEST_PLAY => realCallbackImplement<AVQueueItem, CAVQueueItem>(callbackData)
            case CAST_CONTROLLER_END_OF_STREAM => realCallbackImplementNoArg(callbackData)
            case CAST_CONTROLLER_SEEK_DONE => realCallbackImplement<Int32, Int32>(callbackData)
            case CAST_CONTROLLER_VALID_COMMAND_CHANGE => realCallbackImplement<Array<AVCastControlCommandType>, CArrI32>(
                callbackData)
            case CAST_CONTROLLER_ERROR => realCallbackImplement<BusinessException, Int32>(callbackData)
            case CAST_CONTROLLER_KEY_REQUEST => realCallbackImplement2Args<String, CString, Array<UInt8>, CArrUI8>(
                callbackData)
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    private func realCallbackImplementNoArg(callbackData: CallbackData): Unit {
        let onCallbackList = callbackMap.getAllCallbacks(Int64(callbackData.kind))
        if (onCallbackList.size == 0) {
            LOGGER.info("callbackList is empty.")
            return
        }
        for (callback in onCallbackList) {
            let callbackInstOpt = (callback as Callback0Argument)
            if (let Some(callbackInst) <- callbackInstOpt) {
                callbackInst.invoke()
            }
        }
    }

    private func realCallbackImplement<T, CT>(callbackData: CallbackData): Unit {
        let responseData = match (callbackData.convertToCJOption<CT, T>()) {
            case None =>
                LOGGER.error("convertToCJOption error")
                throwBusinessException(EXCEPTION_SESSION_SERVICE)
            case Some(v) => v
        }
        var onCallbackList = callbackMap.getAllCallbacks(Int64(callbackData.kind))
        emitCallback<T>(callbackData.kind, onCallbackList, responseData)
    }

    private func realCallbackImplement2Args<T, CT, T2, CT2>(callbackData: CallbackData): Unit {
        let responseData = match (callbackData.convertToCJOptionTuple<CT, T, CT2, T2>()) {
            case None =>
                LOGGER.error("convertToCJOption error")
                throwBusinessException(EXCEPTION_SESSION_SERVICE)
            case Some(v) => v
        }
        var onCallbackList = callbackMap.getAllCallbacks(Int64(callbackData.kind))
        emitCallback<T, T2>(callbackData.kind, onCallbackList, responseData)
    }

    private func emitCallback<T>(kind: Int32, callbackList: Array<CallbackObject>, responseData: ?T): Unit {
        if (callbackList.size == 0) {
            LOGGER.info("callbackList is empty.")
            return
        }
        if (let Some(data) <- responseData) {
            for (callback in callbackList) {
                let callbackInstOpt = (callback as Callback1Argument<T>)
                if (let Some(callbackInst) <- callbackInstOpt) {
                    callbackInst.invoke(data)
                }
            }
        } else {
            LOGGER.error("convertToResponse error, callback Type: " + AVCastControllerEventType.parse(kind).toString())
        }
    }

    private func emitCallback<T, T2>(kind: Int32, callbackList: Array<CallbackObject>, responseData: ?(T, T2)): Unit {
        if (callbackList.size == 0) {
            LOGGER.info("callbackList is empty.")
            return
        }
        if (let Some(data) <- responseData) {
            for (callback in callbackList) {
                let callbackInstOpt = (callback as Callback2Argument<T, T2>)
                if (let Some(callbackInst) <- callbackInstOpt) {
                    callbackInst.invoke(data[0], data[1])
                }
            }
        } else {
            LOGGER.error("convertToResponse error, callback Type: " + AVCastControllerEventType.parse(kind).toString())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func on(`type`: AVCastControllerEventType, filter: Array<AVPlaybackStateFilter>,
        callback: Callback1Argument<AVPlaybackState>): Unit {
        if (`type` != AVCastControllerEventType.CAST_CONTROLLER_PLAYBACK_STATE_CHANGE) {
            throw IllegalArgumentException("Type must be CAST_CONTROLLER_PLAYBACK_STATE_CHANGE!")
        }
        let lambdaData = Callback1Param<CPointer<CallbackData>, Unit>(doCall)
        let numArray = ArrayList<Int32>()
        for (i in 0..filter.size) {
            numArray.add(filter[i].value)
        }
        callbackMap.on(
            AVCastControllerEventTypeClass(`type`),
            callback,
            subscribe: {
                =>
                var arrFilter = CParameters("filter", ValueType.ARRAYI32(numArray.toArray()))
                let code: Int32 = unsafe {
                    FfiMultimediaAVSessionCastControllerSubscribeCallbackWithExtras(sessionId, `type`.value,
                        inout arrFilter, lambdaData.getID())
                }
                arrFilter.free()
                checkAndReturn(code, "on(type: AVCastControllerEventType.${`type`})")
            }
        )
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func off(`type`: AVCastControllerEventType, callback!: ?Callback1Argument<AVPlaybackState> = None): Unit {
        offEventWith<Callback1Argument<AVPlaybackState>>(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func on(`type`: AVCastControllerEventType, callback: Callback1Argument<AVQueueItem>): Unit {
        onEventWith(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func off(`type`: AVCastControllerEventType, callback!: ?Callback1Argument<AVQueueItem> = None): Unit {
        offEventWith<Callback1Argument<AVQueueItem>>(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func on(`type`: AVCastControllerEventType, callback: Callback0Argument): Unit {
        onEventWith(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func off(`type`: AVCastControllerEventType, callback!: ?Callback0Argument = None): Unit {
        offEventWith<Callback0Argument>(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func on(`type`: AVCastControllerEventType, callback: Callback1Argument<Int32>): Unit {
        onEventWith(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func off(`type`: AVCastControllerEventType, callback!: ?Callback1Argument<Int32> = None): Unit {
        offEventWith<Callback1Argument<Int32>>(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func on(`type`: AVCastControllerEventType, callback: Callback1Argument<Array<AVCastControlCommandType>>): Unit {
        onEventWith(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func off(
        `type`: AVCastControllerEventType,
        callback!: ?Callback1Argument<Array<AVCastControlCommandType>> = None
    ): Unit {
        offEventWith<Callback1Argument<Array<AVCastControlCommandType>>>(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func on(`type`: AVCastControllerEventType, callback: Callback1Argument<BusinessException>): Unit {
        onEventWith(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func off(`type`: AVCastControllerEventType, callback!: ?Callback1Argument<BusinessException> = None): Unit {
        offEventWith<Callback1Argument<BusinessException>>(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func on(`type`: AVCastControllerEventType, callback: Callback2Argument<String, Array<UInt8>>): Unit {
        onEventWith(`type`, callback)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func off(`type`: AVCastControllerEventType, callback!: ?Callback2Argument<String, Array<UInt8>> = None): Unit {
        offEventWith<Callback2Argument<String, Array<UInt8>>>(`type`, callback)
    }

    private func onEventWith(`type`: AVCastControllerEventType, callback: CallbackObject): Unit {
        checkIsTypeAndCallbackMatch(`type`, callback)
        let lambdaData = Callback1Param<CPointer<CallbackData>, Unit>(doCall)
        callbackMap.on(
            AVCastControllerEventTypeClass(`type`),
            callback,
            subscribe: {
                =>
                let code: Int32 = unsafe {
                    FfiMultimediaAVSessionCastControllerSubscribeCallback(sessionId, `type`.value, lambdaData.getID())
                }
                checkAndReturn(code, "on(type: AVCastControllerEventType.${`type`})")
            }
        )
    }

    private func offEventWith<T>(`type`: AVCastControllerEventType, callback: ?T): Unit where T <: CallbackObject {
        if (let Some(call) <- callback) {
            checkIsTypeAndCallbackMatch(`type`, call)
            callbackMap.off(AVCastControllerEventTypeClass(`type`), call)
        } else {
            callbackMap.clear(AVCastControllerEventTypeClass(`type`))
        }
    }

    private func checkIsTypeAndCallbackMatch(`type`: AVCastControllerEventType, callback: CallbackObject): Unit {
        if (`type` == AVCastControllerEventType.CAST_CONTROLLER_MEDIA_ITEM_CHANGE || `type` == AVCastControllerEventType
            .CAST_CONTROLLER_REQUEST_PLAY) {
            try {
                (callback as Callback1Argument<AVQueueItem>).getOrThrow()
            } catch (e: NoneValueException) {
                throw IllegalArgumentException("Please Use Callback1Argument<AVQueueItem> with OnEvent:${`type`}!")
            }
        } else if (`type` == AVCastControllerEventType.CAST_CONTROLLER_PLAY_NEXT || `type` == AVCastControllerEventType
            .CAST_CONTROLLER_PLAY_PREVIOUS || `type` == AVCastControllerEventType.CAST_CONTROLLER_END_OF_STREAM) {
            try {
                (callback as Callback0Argument).getOrThrow()
            } catch (e: NoneValueException) {
                throw IllegalArgumentException("Please Use Callback0Argument with OnEvent:${`type`}!")
            }
        } else if (`type` == AVCastControllerEventType.CAST_CONTROLLER_SEEK_DONE) {
            try {
                (callback as Callback1Argument<Int32>).getOrThrow()
            } catch (e: NoneValueException) {
                throw IllegalArgumentException("Please Use Callback1Argument<Int32> with OnEvent:${`type`}!")
            }
        } else if (`type` == AVCastControllerEventType.CAST_CONTROLLER_VALID_COMMAND_CHANGE) {
            try {
                (callback as Callback1Argument<Array<AVCastControlCommandType>>).getOrThrow()
            } catch (e: NoneValueException) {
                throw IllegalArgumentException(
                    "Please Use Callback1Argument<Array<AVCastControlCommandType>> with OnEvent:${`type`}!")
            }
        } else if (`type` == AVCastControllerEventType.CAST_CONTROLLER_ERROR) {
            try {
                (callback as Callback1Argument<BusinessException>).getOrThrow()
            } catch (e: NoneValueException) {
                throw IllegalArgumentException(
                    "Please Use Callback1Argument<BusinessException> with OnEvent:${`type`}!")
            }
        } else if (`type` == AVCastControllerEventType.CAST_CONTROLLER_KEY_REQUEST) {
            try {
                (callback as Callback2Argument<String, Array<UInt8>>).getOrThrow()
            } catch (e: NoneValueException) {
                throw IllegalArgumentException(
                    "Please Use Callback2Argument<String, Array<UInt8>> with OnEvent:${`type`}!")
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func start(item: AVQueueItem): Unit {
        var avQueueItem = CAVQueueItem(item)
        let code = unsafe { FfiMultimediaAVSessionCastControllerStart(sessionId, inout avQueueItem) }
        avQueueItem.free()
        checkAndReturn(code, "start")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func prepare(item: AVQueueItem): Unit {
        var avQueueItem = CAVQueueItem(item)
        let code = unsafe { FfiMultimediaAVSessionCastControllerPrepare(sessionId, inout avQueueItem) }
        avQueueItem.free()
        checkAndReturn(code, "prepare")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func sendControlCommand(command: AVCastControlCommand): Unit {
        command.checkParameterIsValid()
        var avSessionCommand = CAVSessionCommand(command)
        let code = unsafe { FfiMultimediaAVSessionCastControllerSendControlCommand(sessionId, inout avSessionCommand) }
        avSessionCommand.free()
        checkAndReturn(code, "sendControlCommand")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func getAVPlaybackState(): AVPlaybackState {
        var state = CAVPlaybackState()
        let code = unsafe { FfiMultimediaAVSessionCastControllerGetAVPlaybackState(sessionId, inout state) }
        checkAndReturn(code, "getAVPlaybackState")
        return state.toCJObjectAndFree()
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func getCurrentItem(): AVQueueItem {
        var avQueueItem = CAVQueueItem()
        let code = unsafe { FfiMultimediaAVSessionCastControllerGetCurrentItem(sessionId, inout avQueueItem) }
        checkAndReturn(code, "getCurrentItem")
        return avQueueItem.toCJObjectAndFree()
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func getValidCommands(): Array<AVCastControlCommandType> {
        var arrI32 = CArrI32(CPointer<Int32>(), 0)
        let code = unsafe { FfiMultimediaAVSessionCastControllerGetValidCommands(sessionId, inout arrI32) }
        checkAndReturn(code, "getValidCommands")
        let array = ArrayList<AVCastControlCommandType>()
        try {
            for (i in 0..arrI32.size) {
                unsafe { array.add(AVCastControlCommandType.parse(arrI32.head.read(i))) }
            }
        } finally {
            unsafe { LibC.free(arrI32.head) }
        }
        return array.toArray()
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func release(): Unit {
        let code = unsafe { FfiMultimediaAVSessionCastControllerRelease(sessionId) }
        checkAndReturn(code, "release")
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func processMediaKeyResponse(assetId: String, response: Array<UInt8>): Unit {
        try (
            idPtr = safeMalloc<CString>().asResource(),
            id = unsafe { LibC.mallocCString(assetId).asResource() }
        ) {
            unsafe { idPtr.value.write(id.value) }
            var rps = CArrUI8(unsafe { cjArr2CArr<UInt8>(response) }, response.size)
            let code = unsafe { FfiMultimediaAVSessionCastControllerProcessMediaKeyResponse(sessionId, idPtr.value,
                inout rps) }
            unsafe { LibC.free(rps.head) }
            checkAndReturn(code, "processMediaKeyResponse")
        }
    }
}
