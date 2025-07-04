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

package ohos.displaySync

import ohos.base.*
import ohos.component.*
import ohos.ffi.*
import ohos.hilog.*
import ohos.labels.*
import std.collection.*
import std.sync.*

let DISPLAY_SYNC_LOG = HilogChannel(0, 0xD004201, "CJ-DisplaySync")

class RequestEvent {
    let callbackList: ArrayList<(Callback1Argument<IntervalInfo>, Int64)>
    let callBackMutex: Mutex

    init() {
        callbackList = ArrayList<(Callback1Argument<IntervalInfo>, Int64)>()
        callBackMutex = Mutex()
    }

    func off(target: Callback1Argument<IntervalInfo>): Unit {
        synchronized(callBackMutex) {
            callbackList.removeIf({callback => refEq(callback[0], target)})
        }
    }

    func on(callback: Callback1Argument<IntervalInfo>, id: Int64): Unit {
        synchronized(callBackMutex) {
            callbackList.add((callback, id))
        }
    }

    func clear(): Unit {
        synchronized(callBackMutex) {
            callbackList.clear()
        }
    }

    func contains(target: Callback1Argument<IntervalInfo>): Bool {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback[0], target)) {
                    return true
                }
            }
        }
        false
    }

    func getId(target: Callback1Argument<IntervalInfo>): Option<Int64> {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback[0], target)) {
                    return callback[1]
                }
            }
        }
        None
    }
}

class EventManage {
    let eventMap: HashMap<String, RequestEvent>
    let mutex: Mutex

    init() {
        eventMap = HashMap<String, RequestEvent>()
        mutex = Mutex()
    }

    func getOrCreate(eventName: String): RequestEvent {
        synchronized(mutex) {
            if (let Some(v) <- eventMap.get(eventName)) {
                return v
            }
            let event = RequestEvent()
            eventMap.add(eventName, event)
            event
        }
    }

    func remove(eventName: String) {
        synchronized(mutex) {
            eventMap.remove(eventName)
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public enum OnOffType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    FRAME | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func toString(): String {
        match (this) {
            case FRAME => "frame"
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Provides the IntervalInfo interface, which includes timestamp and targetTimestamp.
 * @interface IntervalInfo
 * @syscap SystemCapability.ArkUI.ArkUI.Full
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class IntervalInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public IntervalInfo(
        /**
         * The timestamp means the current drawing frame time.
         * @type { Int64 }
         * @syscap SystemCapability.ArkUI.ArkUI.Full
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var timestamp: Int64,

        /**
         * The timestamp means the next drawing frame time.
         * @type { Int64 }
         * @syscap SystemCapability.ArkUI.ArkUI.Full
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.ArkUI.ArkUI.Full"
        ]
        public var targetTimestamp: Int64
    ) {}

    init(intervalInfo: CIntervalInfo) {
        this.timestamp = intervalInfo.timestamp
        this.targetTimestamp = intervalInfo.targetTimestamp
    }
}

/**
 * Provides the DisplaySync interface, which can be used to control
 * the frequency of triggering callback function.
 * @interface DisplaySync
 * @syscap SystemCapability.ArkUI.ArkUI.Full
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DisplaySync <: RemoteDataLite {
    init() {
        super(
            unsafe {
                var id: Int64 = 0
                var errCode: Int32 = 0
                id = FfiDisplaySyncCreate(inout errCode)
                throwIfNotSuccess(errCode)
                id
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    private let eventMng_: EventManage = EventManage()

    /**
     * Create a new DisplaySync object.
     * @returns { DisplaySync } DisplaySync
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @brief create(): DisplaySync
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public static func create(): DisplaySync {
        return DisplaySync()
    }

    /**
     * The expected frame rate of dynamical rate range.
     * If the function isn't be called. The DisplaySync's
     * minimum/maximum/expected rate default value is 60.
     * @param { ExpectedFrameRateRange } rateRange - Indicates ExpectedFrameRateRange.
     * @throws { BusinessException } 401 - Parameter error. Possible causes:
     * <br> 1. Mandatory parameters are left unspecified.
     * <br> 2. Incorrect parameters types.
     * <br> 3. Parameter verification failed.
     * or check ExpectedFrameRateRange if valid.
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @brief setExpectedFrameRateRange(rateRange: ExpectedFrameRateRange) : void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func setExpectedFrameRateRange(rateRange: ExpectedFrameRateRange): Unit {
        unsafe {
            let cRateRange = CExpectedFrameRateRange(rateRange)
            let errCode = FfiDisplaySyncSetExpectedFrameRateRange(getID(), cRateRange)
            throwIfNotSuccess(errCode)
        }
    }

    /**
     * Add DisplaySync to Pipeline. It means that
     * the callback function be enabled.
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @brief start(): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func start(): Unit {
        unsafe {
            let errCode = FfiDisplaySyncStart(getID())
            throwIfNotSuccess(errCode)
        }
    }

    /**
     * Delete DisplaySync from Pipeline. It means that
     * the callback function be disabled.
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @brief stop(): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func stop(): Unit {
        unsafe {
            let errCode = FfiDisplaySyncStop(getID())
            throwIfNotSuccess(errCode)
        }
    }

    /**
     * Registers a callback with the corresponding query condition by using the handle.
     * This callback is triggered when DisplaySync dispatching.
     * @param { OnOffType } type - The type of event to remove the listener for. Must be 'frame'.
     * @param { Callback1Argument<IntervalInfo> } callback - The callback function to be called when DisplaySync dispatching.
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @brief on(type: 'frame', callback: Callback<IntervalInfo>): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func on(`type`: OnOffType, callback: Callback1Argument<IntervalInfo>): Unit {
        let ty = `type`.toString()
        if (ty != "frame") {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }

        DISPLAY_SYNC_LOG.info("onChange start register")
        if (eventMng_.getOrCreate(ty).contains(callback)) {
            return
        }
        let wrapper = {
            info: CIntervalInfo => callback.invoke(IntervalInfo(info))
        }
        unsafe {
            let registerCall = Callback1Param<CIntervalInfo, Unit>(wrapper)
            try (cTy = LibC.mallocCString(ty).asResource()) {
                let ret = FfiDisplaySyncOn(getID(), cTy.value, registerCall.getID())
                throwIfNotSuccess(ret)
            }
            eventMng_.getOrCreate(ty).on(callback, registerCall.getID())
        }
        DISPLAY_SYNC_LOG.info("onChange register success")
    }

    /**
     * Deregisters a callback with the corresponding query condition by using the handle.
     * This callback is triggered when DisplaySync dispatching.
     * @param { OnOffType } type - The type of event to remove the listener for. Must be 'frame'.
     * @param { ?Callback1Argument<IntervalInfo> } [callback] - The callback function to remove. If not provided, all callbacks for the given event type
     *                                                will be removed.
     * @syscap SystemCapability.ArkUI.ArkUI.Full
     * @brief off(type: 'frame', callback?: Callback<IntervalInfo>): void;
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.ArkUI.ArkUI.Full"
    ]
    public func off(`type`: OnOffType, callback!: ?Callback1Argument<IntervalInfo> = None): Unit {
        let ty = `type`.toString()
        if (ty != "frame") {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }

        let id: Int64 = match (callback) {
            case Some(v) =>
                if (let Some(v) <- eventMng_.getOrCreate(ty).getId(v)) {
                    v
                } else {
                    return
                }
            case None => 0 // 0 is off all
        }

        unsafe {
            try (cTy = LibC.mallocCString(ty).asResource()) {
                let ret = FfiDisplaySyncOff(getID(), cTy.value, id)
                throwIfNotSuccess(ret)
            }
        }

        if (let Some(v) <- callback) {
            eventMng_.getOrCreate(ty).off(v)
        } else {
            eventMng_.remove(ty)
        }
    }
}
