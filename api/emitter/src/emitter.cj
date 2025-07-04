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

package ohos.emitter

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import ohos.labels.*

let EMITTER_LOG = HilogChannel(0, 0xD001200, "CJ-Emitter")
const MEMORY_ERROR: Int32 = -1

foreign {
    func CJ_OnWithId(eventId: UInt32, callback: CEventCallback): Int32

    func CJ_OnWithStringId(eventId: CString, callback: CEventCallback): Int32

    func CJ_OnceWithId(eventId: UInt32, callback: CEventCallback): Int32

    func CJ_OnceWithStringId(eventId: CString, callback: CEventCallback): Int32

    func CJ_OffWithId(eventId: UInt32): Unit

    func CJ_OffWithString(eventId: CString): Unit

    func CJ_OffWithIdCallback(eventId: UInt32, callback: CEventCallback): Int32

    func CJ_OffWithStringCallback(eventId: CString, callback: CEventCallback): Int32

    func CJ_EmitWithId(eventId: UInt32, priority: UInt32, data: CEventData): Unit

    func CJ_EmitWithString(eventId: CString, priority: UInt32, data: CEventData): Unit

    func CJ_GetListenerCountById(eventId: UInt32): UInt32

    func CJ_GetListenerCountByString(eventId: CString): UInt32
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Emitter"
]
public struct Emitter {
    /**
     * Subscribes to an event in persistent manner and executes a callback after the event is received.
     *
     * @param { InnerEvent } event - Event to subscribe to in persistent manner. The EventPriority settings do not take effect.
     * @param { EventCallback } callback - Callback to execute after the event is received.
     * @brief on(event: InnerEvent, callback: Callback<EventData>): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public static func on(event: InnerEvent, callback: EventCallback): Unit {
        unsafe {
            let cCallback = CEventCallback(callback)
            let ret = CJ_OnWithId(event.eventId, cCallback)
            cCallback.free()
            throwIfOOM(ret)
        }
    }

    /**
     * Subscribes to an event in persistent manner and executes a callback after the event is received.
     *
     * @param { String } eventId - Event to subscribe to in persistent manner.
     * @param { EventCallback } callback - Callback to execute after the event is received.
     * @brief on(event: string, callback: Callback<EventData>): void
     * @throws { BusinessException } 401 - If eventId is empty.
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public static func on(eventId: String, callback: EventCallback): Unit {
        if (eventId.isEmpty()) {
            throw BusinessException(ERR_PARAMETER_ERROR, "invalid eventId")
        }
        unsafe {
            try (
                id = LibC.mallocCString(eventId).asResource(),
                cCallback = CEventCallback(callback).asResource()
            ) {
                let ret = CJ_OnWithStringId(id.value, cCallback.value)
                throwIfOOM(ret)
            }
        }
    }

    /**
     * Subscribes to an event in one-shot manner and unsubscribes from it after the event callback is executed.
     *
     * @param { InnerEvent } event - Event to subscribe to in one-shot manner. The EventPriority settings do not take effect.
     * @param { EventCallback } callback - Callback to execute after the event is received.
     * @brief on(event: InnerEvent, callback: Callback<EventData>): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public static func once(event: InnerEvent, callback: EventCallback): Unit {
        unsafe {
            let cCallback = CEventCallback(callback)
            let ret = CJ_OnceWithId(event.eventId, CEventCallback(callback))
            cCallback.free()
            throwIfOOM(ret)
        }
    }

    /**
     * Subscribes to an event in one-shot manner and unsubscribes from it after the event callback is executed.
     *
     * @param { String } eventId - Event to subscribe to in one-shot manner.
     * @param { EventCallback } callback - Callback to execute after the event is received.
     * @brief on(event: InnerEvent, callback: Callback<EventData>): void
     * @throws { BusinessException } 401 - If eventId is empty.
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public static func once(eventId: String, callback: EventCallback): Unit {
        if (eventId.isEmpty()) {
            throw BusinessException(ERR_PARAMETER_ERROR, "invalid eventId")
        }
        unsafe {
            try (
                id = LibC.mallocCString(eventId).asResource(),
                cCallback = CEventCallback(callback).asResource()
            ) {
                let ret = CJ_OnceWithStringId(id.value, cCallback.value)
                throwIfOOM(ret)
            }
        }
    }

    /**
     * Unsubscribes from an event.
     *
     * @param { UInt32 } eventId - Event ID.
     * @brief off(eventId: string): void
     * @throws { BusinessException } 401 - If eventId is empty.
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public static func off(eventId: UInt32): Unit {
        unsafe { CJ_OffWithId(eventId) }
    }

    /**
     * Unsubscribes from an event.
     *
     * @param { String } eventId - Event ID.
     * @brief off(eventId: string): void
     * @throws { BusinessException } 401 - If eventId is empty.
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public static func off(eventId: String): Unit {
        if (eventId.isEmpty()) {
            throw BusinessException(ERR_PARAMETER_ERROR, "invalid eventId")
        }
        unsafe {
            let id = LibC.mallocCString(eventId)
            CJ_OffWithString(id)
            LibC.free(id)
        }
    }

    /**
     * Unsubscribes from an event.
     *
     * @param { UInt32 } event - Event ID.
     * @brief off(eventId: string): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public static func off(eventId: UInt32, callback: EventCallback): Unit {
        unsafe {
            let cCallback = CEventCallback(callback)
            let ret = CJ_OffWithIdCallback(eventId, CEventCallback(callback))
            cCallback.free()
            throwIfOOM(ret)
        }
    }

    /**
     * Unsubscribes from an event.
     *
     * @param { String } eventId - Event ID.
     * @brief off(eventId: string): void
     * @throws { BusinessException } 401 - If eventId is empty.
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public static func off(eventId: String, callback: EventCallback): Unit {
        if (eventId.isEmpty()) {
            throw BusinessException(ERR_PARAMETER_ERROR, "invalid eventId")
        }
        unsafe {
            try (
                id = LibC.mallocCString(eventId).asResource(),
                cCallback = CEventCallback(callback).asResource()
            ) {
                let ret = CJ_OffWithStringCallback(id.value, cCallback.value)
                throwIfOOM(ret)
            }
        }
    }

    /**
     * Emits an event.
     *
     * @param { InnerEvent } event - Event to emit, where EventPriority specifies the emit priority of the event.
     * @param { EventData } data - Data carried by the event.
     * @brief emit(event: InnerEvent, data?: EventData): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public static func emit(event: InnerEvent, data!: EventData = EventData.EMPTY): Unit {
        unsafe { CJ_EmitWithId(event.eventId, UInt32(event.priority.getValue()), CEventData(data)) }
    }

    /**
     * Emits an event.
     *
     * @param { String } eventId - Event to emit, where EventPriority specifies the emit priority of the event.
     * @param { Options } options - Event priority.
     * @param { EventData } data - Data carried by the event.
     * @brief emit(event: InnerEvent, data?: EventData): void
     * @throws { BusinessException } 401 - If eventId is empty.
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public static func emit(
        eventId: String,
        options!: Options = Options(LOW),
        data!: EventData = EventData.EMPTY
    ): Unit {
        if (eventId.isEmpty()) {
            throw BusinessException(ERR_PARAMETER_ERROR, "invalid eventId")
        }
        unsafe {
            try (id = LibC.mallocCString(eventId).asResource()) {
                CJ_EmitWithString(id.value, UInt32(options.priority.getValue()), CEventData(data))
            }
        }
    }

    /**
     * Get the number of subscriptions for the specified event.
     *
     * @param { UInt32 } eventId - Event ID.
     * @brief getListenerCount(eventId: number|string): number
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public static func getListenerCount(eventId: UInt32): UInt32 {
        let count = unsafe { CJ_GetListenerCountById(eventId) }
        return count
    }

    /**
     * Get the number of subscriptions for the specified event.
     *
     * @param { String } eventId - Event ID.
     * @brief getListenerCount(eventId: number|string): number
     * @throws { BusinessException } 401 - If eventId is empty.
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public static func getListenerCount(eventId: String): UInt32 {
        if (eventId.isEmpty()) {
            throw BusinessException(ERR_PARAMETER_ERROR, "invalid eventId")
        }
        let count: UInt32
        unsafe {
            let id = LibC.mallocCString(eventId)
            count = CJ_GetListenerCountByString(id)
            LibC.free(id)
        }
        return count
    }
}
