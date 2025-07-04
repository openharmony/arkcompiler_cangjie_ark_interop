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

package ohos.calendar_manager

import ohos.base.*
import ohos.ffi.*
import std.collection.*
import std.time.*
import ohos.encoding.json.*
import ohos.data_share_predicates.DataSharePredicates as DSPredicates
import ohos.labels.*

/**
 * Describes a calendar instance.
 *
 * @relation export interface Calendar
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public class Calendar <: RemoteDataLite {
    /**
     * Id of the calendar
     *
     * @relation readonly id: number
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public let calendarId: Int64
    private let map: HashMap<Int64, Int64> = HashMap<Int64, Int64>()
    private let keyofEvent = ["type", "title", "startTime", "endTime", "isAllDay", "description", "timeZone", "location",
        "service", "attendee", "reminderTime"]

    init(dataId: Int64, calendarId: Int64) {
        super(dataId)
        this.calendarId = calendarId
        map.add(calendarId, dataId)
        CALENDAR_MANAGER_LOG.info("[Calendar] construct success")
    }

    init(calendarId: Int64) {
        super(map[calendarId])
        this.calendarId = calendarId
    }

    init(id!: ?Int64 = 0) {
        super(id.getOrThrow())
        var vid = 0
        if (let Some(v) <- id) {
            vid = v
        }
        var cid = 0
        for ((k, v) in map) {
            if (v == vid) {
                cid = k
            }
        }
        this.calendarId = cid
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Add a single event.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation addEvent(event: Event): Promise<number>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func addEvent(event: Event): Int64 {
        var code = 0i32
        CALENDAR_MANAGER_LOG.info("start add event")
        var eventId = unsafe { FfiOHOSCalendarAddEvent(getID(), CEvent(event), inout code) }
        throwIfError("Calendar.addEvent", code)
        return eventId
    }

    /**
     * Add multiple events.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation addEvents(events: Event[]): Promise<void>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func addEvents(events: Array<Event>): Unit {
        var code = 0i32
        let eventCArr = CArrEvents(
            unsafe { cjArr2CArr<Event, CEvent>(
                events,
                {
                    event: Event =>
                    let cevent: CEvent = CEvent(event)
                    cevent
                },
                {cevent: CEvent => cevent.free()}
            ) }, events.size)
        var eventId = unsafe { FfiOHOSCalendarAddEvents(getID(), eventCArr, inout code) }
        eventCArr.free()
        throwIfError("Calendar.addEvents", code)
    }

    /**
     * Delete a single event.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation deleteEvent(id: number): Promise<void>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func deleteEvent(id: Int64): Unit {
        var code = 0i32
        unsafe {
            FfiOHOSCalendarDeleteEvent(getID(), id, inout code)
        }
        throwIfError("Calendar.deleteEvent", code)
    }

    /**
     * Delete multiple events.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation deleteEvents(ids: number[]): Promise<void>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func deleteEvents(ids: Array<Int64>): Unit {
        var code = 0i32
        let idsCArr = CArrI64(unsafe { cjArr2CArr(ids) }, ids.size)
        unsafe {
            FfiOHOSCalendarDeleteEvents(getID(), idsCArr, inout code)
            LibC.free(idsCArr.head)
        }
        throwIfError("Calendar.deleteEvents", code)
    }

    /**
     * Update a single event.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation updateEvent(event: Event): Promise<void>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func updateEvent(event: Event): Unit {
        var code = 0i32
        let cevent = CEvent(event)
        unsafe { FfiOHOSCalendarUpdateEvent(getID(), cevent, inout code) }
        cevent.free()
        throwIfError("Calendar.updateEvent", code)
    }

    /**
     * Query events based on filter conditions.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation getEvents(eventFilter?: EventFilter, eventKey?: (keyof Event)[]): Promise<Event[]>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func getEvents(eventFilter!: ?EventFilter = None, eventKey!: ?Array<String> = None): Array<Event> {
        var code = 0i32
        var keyArray: Array<String> = []
        if (let Some(v) <- eventKey) {
            keyArray = v
        }

        if (keyArray.size > 0) {
            for (key in keyArray) {
                if (!keyofEvent.contains(key)) {
                    throw IllegalArgumentException("event key is invalid")
                }
            }
        }
        var filterid = -1
        var ceventKey = CArrString(CPointer(), 0)
        let cArrEvents = unsafe {
            match ((eventFilter, eventKey)) {
                case (Some(v), Some(y)) =>
                    filterid = v.getID()
                    ceventKey = toArrayCString(y)
                case (Some(v), _) => filterid = v.getID()
                case (_, Some(y)) => ceventKey = toArrayCString(y)
                case _ =>
                    filterid = -1
                    ceventKey = CArrString(CPointer(), 0)
            }
            FfiOHOSCalendarGetEvents(getID(), filterid, ceventKey, inout code)
        }
        unsafe { freeArrCString(ceventKey) }
        throwIfError("Calendar.getEvents", code)
        let arrEvent = cArrEvents.toCJ()
        cArrEvents.free()
        return arrEvent
    }

    /**
     * Get calendar configure.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation getConfig(): CalendarConfig;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func getConfig(): CalendarConfig {
        var code = 0i32
        let cconfig = unsafe { FfiOHOSCalendarGetConfig(getID(), inout code) }

        throwIfError("Calendar.getConfig", code)
        return CalendarConfig(enableReminder: cconfig.enableReminder, color: Color(UInt32(cconfig.color)))
    }

    /**
     * Set calendar configure.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation setConfig(config: CalendarConfig): Promise<void>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func setConfig(config: CalendarConfig): Unit {
        var code = 0i32
        unsafe { FfiOHOSCalendarSetConfig(getID(), CCalendarConfig(config), inout code) }

        throwIfError("Calendar.setConfig", code)
    }

    /**
     * Get calendar account.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation getAccount(): CalendarAccount;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func getAccount(): CalendarAccount {
        var code = 0i32
        let caccount = unsafe { FfiOHOSCalendarGetAccount(getID(), inout code) }

        throwIfError("Calendar.getAccount", code)
        let account = caccount.toCJ()
        caccount.free()
        return account
    }
}

/**
 * Describes a calendar configuration.
 *
 * @relation interface CalendarConfig
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public class CalendarConfig {
    /**
     *  Whether the calendar provides a reminder
     *
     * @relation enableReminder?: boolean;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var enableReminder: Bool
    /**
     *  Color of the calendar
     *
     * @relation color?: number | string;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var color: Color

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public CalendarConfig(enableReminder!: Bool = false, color!: Color = Color(0x0a59f7)) {
        this.enableReminder = enableReminder
        this.color = color
    }
}
