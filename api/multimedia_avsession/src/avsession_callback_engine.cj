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
import {std.sync.AtomicBool, std.sync.Mutex}
import ohos.base.*
import ohos.ffi.*

protected interface EventType <: ToString {
    prop value: Int32
    func allowMultiCallback(): Bool
    static func size(): Int64
    static func parse(value: Int32): EventType
}

extend AVSessionEventType {
    protected func getValue(): Int32 {
        return match (this) {
            case Play => 0
            case Pause => 1
            case Stop => 2
            case PlayNext => 3
            case PlayPrevious => 4
            case FastForward => 5
            case Rewind => 6
            case PlayFromAssetId => 7
            case Seek => 8
            case SetSpeed => 9
            case SetLoopMode => 10
            case ToggleFavorite => 11
            case SkipToQueueItem => 12
            case HandleKeyEvent => 13
            case OutputDeviceChange => 14
            case CommonCommand => 15
            case Answer => 16
            case HangUp => 17
            case ToggleCallMute => 18
            case CastDisplayChange => 19
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected prop value: Int32 {
        get() {
            getValue()
        }
    }

    protected static func parse(value: Int32): AVSessionEventType {
        match (value) {
            case 0 => Play
            case 1 => Pause
            case 2 => Stop
            case 3 => PlayNext
            case 4 => PlayPrevious
            case 5 => FastForward
            case 6 => Rewind
            case 7 => PlayFromAssetId
            case 8 => Seek
            case 9 => SetSpeed
            case 10 => SetLoopMode
            case 11 => ToggleFavorite
            case 12 => SkipToQueueItem
            case 13 => HandleKeyEvent
            case 14 => OutputDeviceChange
            case 15 => CommonCommand
            case 16 => Answer
            case 17 => HangUp
            case 18 => ToggleCallMute
            case 19 => CastDisplayChange
            case _ => throw IllegalArgumentException("Unsupported AVSessionEventType")
        }
    }

    protected static func size(): Int64 {
        return 20
    }

    protected func allowMultiCallback(): Bool {
        return match (this) {
            case Play | Pause | Stop | PlayNext | PlayPrevious | FastForward => false
            case _ => true
        }
    }
}

extend AVCastControllerEventType {
    protected prop value: Int32 {
        get() {
            match (this) {
                case CAST_CONTROLLER_PLAYBACK_STATE_CHANGE => 0
                case CAST_CONTROLLER_MEDIA_ITEM_CHANGE => 1
                case CAST_CONTROLLER_PLAY_NEXT => 2
                case CAST_CONTROLLER_PLAY_PREVIOUS => 3
                case CAST_CONTROLLER_REQUEST_PLAY => 4
                case CAST_CONTROLLER_END_OF_STREAM => 5
                case CAST_CONTROLLER_SEEK_DONE => 6
                case CAST_CONTROLLER_VALID_COMMAND_CHANGE => 7
                case CAST_CONTROLLER_ERROR => 8
                case CAST_CONTROLLER_KEY_REQUEST => 9
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    protected static func parse(value: Int32): AVCastControllerEventType {
        match (value) {
            case 0 => CAST_CONTROLLER_PLAYBACK_STATE_CHANGE
            case 1 => CAST_CONTROLLER_MEDIA_ITEM_CHANGE
            case 2 => CAST_CONTROLLER_PLAY_NEXT
            case 3 => CAST_CONTROLLER_PLAY_PREVIOUS
            case 4 => CAST_CONTROLLER_REQUEST_PLAY
            case 5 => CAST_CONTROLLER_END_OF_STREAM
            case 6 => CAST_CONTROLLER_SEEK_DONE
            case 7 => CAST_CONTROLLER_VALID_COMMAND_CHANGE
            case 8 => CAST_CONTROLLER_ERROR
            case 9 => CAST_CONTROLLER_KEY_REQUEST
            case _ => throw IllegalArgumentException("Unsupported AVCastControllerEventType")
        }
    }

    protected static func size(): Int64 {
        return 10
    }

    protected func allowMultiCallback(): Bool {
        true
    }
}

extend AVSessionControllerEventType {
    protected func getValue(): Int32 {
        return match (this) {
            case EVENT_SESSION_DESTROY => 0
            case EVENT_PLAYBACK_STATE_CHANGE => 1
            case EVENT_META_DATA_CHANGE => 2
            case EVENT_ACTIVE_STATE_CHANGE => 3
            case EVENT_VALID_COMMAND_CHANGE => 4
            case EVENT_OUTPUT_DEVICE_CHANGE => 5
            case EVENT_SESSION_EVENT_CHANGE => 6
            case EVENT_QUEUE_ITEMS_CHANGE => 7
            case EVENT_QUEUE_TITLE_CHANGE => 8
            case EVENT_EXTRAS_CHANGE => 9
            case EVENT_AVCALL_META_DATA_CHANGE => 10
            case EVENT_AVCALL_STATE_CHANGE => 11
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected prop value: Int32 {
        get() {
            getValue()
        }
    }

    protected static func parse(value: Int32): AVSessionControllerEventType {
        return match (value) {
            case 0 => EVENT_SESSION_DESTROY
            case 1 => EVENT_PLAYBACK_STATE_CHANGE
            case 2 => EVENT_META_DATA_CHANGE
            case 3 => EVENT_ACTIVE_STATE_CHANGE
            case 4 => EVENT_VALID_COMMAND_CHANGE
            case 5 => EVENT_OUTPUT_DEVICE_CHANGE
            case 6 => EVENT_SESSION_EVENT_CHANGE
            case 7 => EVENT_QUEUE_ITEMS_CHANGE
            case 8 => EVENT_QUEUE_TITLE_CHANGE
            case 9 => EVENT_EXTRAS_CHANGE
            case 10 => EVENT_AVCALL_META_DATA_CHANGE
            case 11 => EVENT_AVCALL_STATE_CHANGE
            case _ => throw IllegalArgumentException("Unsupported AVSessionControllerEventType")
        }
    }

    protected static func size(): Int64 {
        return 12
    }

    protected func allowMultiCallback(): Bool {
        true
    }
}

class AVSessionEventTypeClass <: EventType {
    AVSessionEventTypeClass(private let inner: AVSessionEventType) {}

    public prop value: Int32 {
        get() {
            inner.value
        }
    }

    public func allowMultiCallback(): Bool {
        inner.allowMultiCallback()
    }

    public static func size(): Int64 {
        AVSessionEventType.size()
    }

    public static func parse(value: Int32): EventType {
        AVSessionEventTypeClass(AVSessionEventType.parse(value))
    }

    public func toString(): String {
        inner.toString()
    }
}

class AVSessionControllerEventTypeClass <: EventType {
    AVSessionControllerEventTypeClass(private let inner: AVSessionControllerEventType) {}

    public prop value: Int32 {
        get() {
            inner.value
        }
    }

    public func allowMultiCallback(): Bool {
        inner.allowMultiCallback()
    }

    public static func size(): Int64 {
        AVSessionControllerEventType.size()
    }

    public static func parse(value: Int32): EventType {
        AVSessionControllerEventTypeClass(AVSessionControllerEventType.parse(value))
    }

    public func toString(): String {
        inner.toString()
    }
}

class AVCastControllerEventTypeClass <: EventType {
    AVCastControllerEventTypeClass(private let inner: AVCastControllerEventType) {}

    public prop value: Int32 {
        get() {
            inner.value
        }
    }

    public func allowMultiCallback(): Bool {
        inner.allowMultiCallback()
    }

    public static func size(): Int64 {
        AVCastControllerEventType.size()
    }

    public static func parse(value: Int32): EventType {
        AVCastControllerEventTypeClass(AVCastControllerEventType.parse(value))
    }

    public func toString(): String {
        inner.toString()
    }
}

class CallbackList {
    private let callbackList: ArrayList<CallbackObject>
    private let callbackMutex: Mutex
    let event: String

    init(event: String) {
        callbackList = ArrayList<CallbackObject>()
        callbackMutex = Mutex()
        this.event = event
    }

    func off(target: CallbackObject): Unit {
        synchronized(callbackMutex) {
            let size = callbackList.size
            callbackList.removeIf({callback => refEq(callback, target)})
            if (size == callbackList.size) {
                IllegalArgumentException("Callback is not registered.")
            }
        }
    }

    func on(target: CallbackObject): Unit {
        synchronized(callbackMutex) {
            for (callback in callbackList) {
                if (refEq(callback, target)) {
                    LOGGER.info("The callback of" + event + " has been subscribed.")
                    return
                }
            }
            callbackList.add(target)
        }
    }

    func clear(): Unit {
        synchronized(callbackMutex) {
            callbackList.clear()
        }
    }

    func contains(target: CallbackObject): Bool {
        synchronized(callbackMutex) {
            for (callback in callbackList) {
                if (refEq(callback, target)) {
                    return true
                }
            }
        }
        false
    }

    func isEmpty(): Bool {
        synchronized(callbackMutex) {
            callbackList.isEmpty()
        }
    }

    func size(): Int64 {
        synchronized(callbackMutex) {
            callbackList.size
        }
    }

    func getAllCallbacks(): Array<CallbackObject> {
        synchronized(callbackMutex) {
            return callbackList.toArray()
        }
    }
}

class CallbackMap<T> where T <: EventType {
    private let callbackMap: Array<CallbackList>
    private let callbackMutexArr: Array<Mutex>
    init() {
        callbackMap = Array<CallbackList>(
            T.size(),
            {
                i =>
                let event = T.parse(Int32(i)).toString()
                CallbackList(event)
            }
        )
        callbackMutexArr = Array<Mutex>(T.size(), {_ => Mutex()})
    }

    func off(eventType: T, target: CallbackObject, unsubscribe!: () -> Unit = {=>}): Unit {
        let index = Int64(eventType.value)
        synchronized(callbackMutexArr[index]) {
            if (callbackMap[index].isEmpty()) {
                LOGGER.info("Callback is not registered!")
                return
            }
            callbackMap[index].off(target)
            if (callbackMap[index].isEmpty()) {
                unsubscribe()
            }
        }
    }

    func on(eventType: T, target: CallbackObject, subscribe!: () -> Unit = {=>}): Unit {
        let index = Int64(eventType.value)
        synchronized(callbackMutexArr[index]) {
            subscribe()
            if (eventType.allowMultiCallback()) {
                callbackMap[index].on(target)
            } else {
                callbackMap[index].clear()
                callbackMap[index].on(target)
            }
        }
    }

    func clear(eventType: T, unsubscribe!: () -> Unit = {=>}): Unit {
        let index = Int64(eventType.value)
        synchronized(callbackMutexArr[index]) {
            if (callbackMap[index].isEmpty()) {
                return
            }
            callbackMap[index].clear()
            unsubscribe()
        }
    }

    func isEmpty(eventType: T): Bool {
        let index = Int64(eventType.value)
        synchronized(callbackMutexArr[index]) {
            callbackMap[index].isEmpty()
        }
    }

    func getAllCallbacks(eventType: T): Array<CallbackObject> {
        callbackMap[Int64(eventType.value)].getAllCallbacks()
    }

    func getAllCallbacks(index: Int32): Array<CallbackObject> {
        getAllCallbacks(Int64(index))
    }

    public func getAllCallbacks(index: Int64): Array<CallbackObject> {
        if (index >= 0 && index < T.size()) {
            callbackMap[index].getAllCallbacks()
        } else {
            throw IllegalArgumentException("CallbackMap index is out of bound!")
        }
    }
}

class CallbackEngine<EVENT> where EVENT <: EventType {
    let registry = Array<AtomicBool>(EVENT.size(), {_ => AtomicBool(false)})
    let callbackMap = CallbackMap<EVENT>()

    func subscribeWithFilter<CT, T>(
        eventType: EVENT,
        filter: Array<Int32>,
        callback: CallbackObject,
        ctor: (CT) -> T,
        subscribeToNative: (Int32, Array<Int32>, Int64) -> Unit
    ) where CT <: CType {
        LOGGER.info("subscribe ${eventType}")
        let typeValue = eventType.value
        callbackMap.on(eventType, callback,
            subscribe: {
                => if (registry[Int64(typeValue)].compareAndSwap(false, true)) {
                    subscribeToNative(typeValue, filter, oneArgWrapper<CT, T>(eventType, ctor))
                }
            })
    }

    func subscribeWith0Arg(
        eventType: EVENT,
        callback: CallbackObject,
        subscribeToNative: (Int32, Int64) -> Unit
    ): Unit {
        subscribe(eventType, callback, zeroArgWrapper(eventType), subscribeToNative)
    }

    func subscribeWith1Arg<CT, T>(
        eventType: EVENT,
        callback: CallbackObject,
        ctor: (CT) -> T,
        subscribeToNative: (Int32, Int64) -> Unit
    ): Unit where CT <: CType {
        subscribe(eventType, callback, oneArgWrapper<CT, T>(eventType, ctor), subscribeToNative)
    }

    func subscribeWith2Arg<CT1, T1, CT2, T2>(
        eventType: EVENT,
        callback: CallbackObject,
        ctor1: (CT1) -> T1,
        ctor2: (CT2) -> T2,
        subscribeToNative: (Int32, Int64) -> Unit
    ): Unit where CT1 <: CType, CT2 <: CType {
        subscribe(eventType, callback, twoArgWrapper<CT1, T1, CT2, T2>(eventType, ctor1, ctor2), subscribeToNative)
    }

    private func subscribe(
        eventType: EVENT,
        callback: CallbackObject,
        subscribeCall: Int64,
        subscribeToNative: (Int32, Int64) -> Unit
    ): Unit {
        LOGGER.info("subscribe ${eventType}")
        let typeValue = eventType.value
        callbackMap.on(eventType, callback,
            subscribe: {
                => if (registry[Int64(typeValue)].compareAndSwap(false, true)) {
                    subscribeToNative(typeValue, subscribeCall)
                }
            })
    }

    func unsubscribe(eventType: EVENT, callback: ?CallbackObject, unsubscribeToNative: (Int32) -> Unit): Unit {
        LOGGER.debug("unsubscribe ${eventType}")
        let typeValue = eventType.value
        match (callback) {
            case Some(v) => callbackMap.off(eventType, v,
                unsubscribe: {
                    => if (registry[Int64(typeValue)].compareAndSwap(true, false)) {
                        unsubscribeToNative(typeValue)
                    }
                })
            case None => callbackMap.clear(eventType,
                unsubscribe: {
                    => if (registry[Int64(typeValue)].compareAndSwap(true, false)) {
                        unsubscribeToNative(typeValue)
                    }
                })
        }
    }

    func zeroArgWrapper(eventType: EVENT): Int64 {
        let wrapper = {
            =>
            let cbArray = callbackMap.getAllCallbacks(eventType)
            for (caller in cbArray) {
                (caller as Callback0Argument)?.invoke()
            }
        }
        let registerCall = Callback0Param<Unit>(wrapper)
        registerCall.getID()
    }

    func oneArgWrapper<CT, T>(eventType: EVENT, ctor: (CT) -> T): Int64 where CT <: CType {
        let wrapper = {
            ctype: CT =>
            let cbArray = callbackMap.getAllCallbacks(eventType)
            let cjType = ctor(ctype)
            for (caller in cbArray) {
                if (caller is Callback1Argument<T>) {
                    (caller as Callback1Argument<T>).getOrThrow().invoke(cjType)
                } else if (caller is Callback0Argument) {
                    (caller as Callback0Argument).getOrThrow().invoke()
                }
            }
        }
        let registerCall = Callback1Param<CT, Unit>(wrapper)
        registerCall.getID()
    }

    func twoArgWrapper<CT1, T1, CT2, T2>(
        eventType: EVENT,
        ctor1: (CT1) -> T1,
        ctor2: (CT2) -> T2
    ): Int64 where CT1 <: CType, CT2 <: CType {
        let wrapper = {
            ctype1: CT1, ctype2: CT2 =>
            let cbArray = callbackMap.getAllCallbacks(eventType)
            let cjType1 = ctor1(ctype1)
            let cjType2 = ctor2(ctype2)
            for (caller in cbArray) {
                (caller as Callback2Argument<T1, T2>)?.invoke(cjType1, cjType2)
            }
        }
        let registerCall = Callback2Param<CT1, CT2, Unit>(wrapper)
        registerCall.getID()
    }
}
