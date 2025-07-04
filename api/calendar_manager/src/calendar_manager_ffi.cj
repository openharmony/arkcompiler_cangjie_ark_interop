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
import ohos.ability.*

foreign {
    //getCalendarManager
    func FfiOHOSGetCalendarManager(contextID: Int64, code: CPointer<Int32>): Unit
    //class CalendarManager
    func FfiOHOSCalendarManagerCreateCalendar(calendarAccount: CCalendarAccount, calendarId: CPointer<Int64>,
        code: CPointer<Int32>): Int64

    func FfiOHOSCalendarManagerdeleteCalendar(calendarId: Int64, code: CPointer<Int32>): Unit

    func FfiOHOSCalendarManagerGetCalendar(calendarAccount: CCalendarAccount, calendarId: CPointer<Int64>,
        code: CPointer<Int32>): Int64

    func FfiOHOSCalendarManagerGetAllCalendars(code: CPointer<Int32>): CArrI64

    func FfiOHOSCalendarManagerEditerEvent(eventstr: CString, code: CPointer<Int32>): Int64
    //class Calendar
    func FfiOHOSCalendarAddEvent(id: Int64, event: CEvent, code: CPointer<Int32>): Int64

    func FfiOHOSCalendarAddEvents(id: Int64, event: CArrEvents, code: CPointer<Int32>): Unit

    func FfiOHOSCalendarDeleteEvent(id: Int64, eventId: Int64, code: CPointer<Int32>): Unit

    func FfiOHOSCalendarDeleteEvents(id: Int64, eventIds: CArrI64, code: CPointer<Int32>): Unit

    func FfiOHOSCalendarUpdateEvent(id: Int64, event: CEvent, code: CPointer<Int32>): Unit

    func FfiOHOSCalendarGetEvents(id: Int64, eventFilterId: Int64, eventKey: CArrString, code: CPointer<Int32>): CArrEvents

    func FfiOHOSCalendarGetConfig(id: Int64, code: CPointer<Int32>): CCalendarConfig

    func FfiOHOSCalendarSetConfig(id: Int64, cCalendarConfig: CCalendarConfig, code: CPointer<Int32>): Unit

    func FfiOHOSCalendarGetAccount(id: Int64, code: CPointer<Int32>): CCalendarAccount
    //class EventFilter
    func FfiOHOSEventFilterFilterById(idsCArr: CArrI64, code: CPointer<Int32>): Int64

    func FfiOHOSEventFilterFilterByTime(start: Int64, end: Int64, code: CPointer<Int32>): Int64

    func FfiOHOSEventFilterFilterByTitle(title: CString, code: CPointer<Int32>): Int64
}

@C
struct CCalendarAccount {
    var name: CString = CString(CPointer<UInt8>())
    var `type`: CString = CString(CPointer<UInt8>())
    var displayName: CString = CString(CPointer<UInt8>())

    init(account: CalendarAccount) {
        try {
            unsafe {
                this.name = LibC.mallocCString(account.name)
                this.`type` = LibC.mallocCString(account.`type`.getValue())
                this.displayName = LibC.mallocCString(account.displayName)
            }
        } catch (e: Exception) {
            free()
        }
    }

    func free() {
        unsafe {
            LibC.free(this.name)
            LibC.free(this.`type`)
            LibC.free(this.displayName)
        }
    }

    func toCJ(): CalendarAccount {
        CalendarAccount(this.name.toString(), CalendarType.parse(this.`type`.toString()),
            displayName: this.displayName.toString())
    }
}

@C
struct CEvent {
    var `type`: Int64 = 0
    var startTime: Int64 = 0
    var endTime: Int64 = 0
    var id: Int64 = 0
    var title: CString = CString(CPointer<UInt8>())
    var location: CLocation = CLocation(Location())
    var isAllDay: Bool = false
    var attendee: CArrAttendee = CArrAttendee(CPointer<CAttendee>(), 0)
    var timeZone: CString = CString(CPointer<UInt8>())
    var reminderTime: CArrI64 = CArrI64(CPointer<Int64>(), 0)
    var recurrenceRule: CRecurrenceRule = CRecurrenceRule(RecurrenceRule(RecurrenceFrequency.Daily))
    var description: CString = CString(CPointer<UInt8>())
    var service: CEventService = CEventService(EventService(ServiceType.Meeting, ""))
    var identifier: CString = CString(CPointer<UInt8>())
    var isLunar: Bool = false

    init(event: Event) {
        this.`type` = event.`type`.getValue()
        this.startTime = event.startTime
        this.endTime = event.endTime
        if (let Some(eventid) <- event.id) {
            this.id = eventid
        }
        this.isAllDay = event.isAllDay

        this.isLunar = event.isLunar
        unsafe {
            try {
                if (let Some(v) <- event.location) {
                    this.location = CLocation(v)
                }
                if (let Some(v) <- event.attendee) {
                    this.attendee = CArrAttendee(
                        unsafe { cjArr2CArr<Attendee, CAttendee>(
                            v,
                            {
                                attendee: Attendee =>
                                let cattendee: CAttendee = CAttendee(attendee)
                                cattendee
                            },
                            {cattendee: CAttendee => cattendee.free()}
                        ) }, v.size)
                }
                if (let Some(v) <- event.recurrenceRule) {
                    this.recurrenceRule = CRecurrenceRule(v)
                }
                if (let Some(v) <- event.service) {
                    this.service = CEventService(v)
                }
                this.reminderTime = CArrI64(unsafe { cjArr2CArr(event.reminderTime) }, event.reminderTime.size)
                this.title = LibC.mallocCString(event.title)
                this.timeZone = LibC.mallocCString(event.timeZone)
                this.description = LibC.mallocCString(event.description)
                if (let Some(v) <- event.identifier) {
                    this.identifier = LibC.mallocCString(v)
                }
            } catch (e: Exception) {
                free()
            }
        }
    }

    func free() {
        unsafe {
            LibC.free(title)
            LibC.free(timeZone)
            LibC.free(description)
            LibC.free(identifier)
            location.free()
            recurrenceRule.free()
            service.free()
            attendee.free()
            LibC.free(reminderTime.head)
            LibC.free(identifier)
        }
    }

    func toCJ(): Event {
        unsafe {
            let ttype = EventType.parse(`type`)
            var tattendee: Array<Attendee> = []
            if (attendee.size > 0 && attendee.size < Int64(Int32.Max)) {
                let attendeeSize = attendee.size
                let attendeeHead = attendee.head
                tattendee = Array<Attendee>(attendeeSize, {i => attendeeHead.read(i).toCJ()})
            }

            var treminderTime: Array<Int64> = []
            if (reminderTime.size > 0 && reminderTime.size < Int64(Int32.Max)) {
                let reminderTimeSize = reminderTime.size
                let reminderTimeHead = reminderTime.head
                treminderTime = Array<Int64>(reminderTimeSize, {i => reminderTimeHead.read(i)})
            }

            return Event(ttype, startTime, endTime, id: id, title: this.title.toString(), location: location.toCJ(),
                isAllDay: isAllDay, attendee: tattendee, timeZone: this.timeZone.toString(), reminderTime: treminderTime,
                recurrenceRule: recurrenceRule.toCJ(), description: this.description.toString(), service: service.toCJ(),
                identifier: this.identifier.toString(), isLunar: isLunar)
        }
    }
}

@C
struct CArrEvents {
    CArrEvents(
        let head: CPointer<CEvent>,
        let size: Int64
    ) {}

    func free() {
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free(head)
        }
    }

    func toCJ(): Array<Event> {
        unsafe {
            Array<Event>(size, {i => head.read(i).toCJ()})
        }
    }
}

@C
struct CArrAttendee {
    CArrAttendee(
        let head: CPointer<CAttendee>,
        let size: Int64
    ) {}

    func free() {
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free(head)
        }
    }
}

@C
struct CCalendarConfig {
    var enableReminder: Bool = false
    var color: Int64 = 0

    init(config: CalendarConfig) {
        this.enableReminder = config.enableReminder
        this.color = Int64(config.color.toUInt32())
    }
}

@C
struct CLocation {
    var location: CString
    var longitude: Float64
    var latitude: Float64

    init(location: Location) {
        unsafe {
            this.location = LibC.mallocCString(location.location)
        }
        this.longitude = location.longitude
        this.latitude = location.latitude
    }

    func free() {
        unsafe {
            LibC.free(location)
        }
    }

    func toCJ(): Location {
        Location(location: this.location.toString(), longitude: longitude, latitude: latitude)
    }
}

@C
struct CAttendee {
    var name: CString = CString(CPointer<UInt8>())
    var email: CString = CString(CPointer<UInt8>())
    var role: Int64 = 0

    init(attendee: Attendee) {
        unsafe {
            try {
                this.name = LibC.mallocCString(attendee.name)
                this.email = LibC.mallocCString(attendee.email)
            } catch (e: Exception) {
                LibC.free(name)
                LibC.free(email)
            }
        }
    }

    func free() {
        unsafe {
            LibC.free(name)
            LibC.free(email)
        }
    }

    func toCJ(): Attendee {
        Attendee(this.name.toString(), this.email.toString(), role: AttendeeRole.parse(this.role))
    }
}

@C
struct CRecurrenceRule {
    var recurrenceFrequency: Int64 = 0
    var expire: Int64 = 0
    var count: Int64 = 0
    var interval: Int64 = 0
    var excludedDates: CArrI64 = CArrI64(CPointer<Int64>(), 0)
    var daysOfWeek: CArrI64 = CArrI64(CPointer<Int64>(), 0)
    var daysOfMonth: CArrI64 = CArrI64(CPointer<Int64>(), 0)
    var daysOfYear: CArrI64 = CArrI64(CPointer<Int64>(), 0)
    var weeksOfMonth: CArrI64 = CArrI64(CPointer<Int64>(), 0)
    var weeksOfYear: CArrI64 = CArrI64(CPointer<Int64>(), 0)
    var monthsOfYear: CArrI64 = CArrI64(CPointer<Int64>(), 0)

    init(recurrenceRule: RecurrenceRule) {
        this.recurrenceFrequency = recurrenceRule.recurrenceFrequency.getValue()
        this.expire = recurrenceRule.expire
        this.count = recurrenceRule.count
        this.interval = recurrenceRule.interval
        try {
            this.excludedDates = CArrI64(unsafe { cjArr2CArr(recurrenceRule.excludedDates) },
                recurrenceRule.excludedDates.size)
            this.daysOfWeek = CArrI64(unsafe { cjArr2CArr(recurrenceRule.daysOfWeek) }, recurrenceRule.daysOfWeek.size)
            this.daysOfMonth = CArrI64(unsafe { cjArr2CArr(recurrenceRule.daysOfMonth) },
                recurrenceRule.daysOfMonth.size)
            this.daysOfYear = CArrI64(unsafe { cjArr2CArr(recurrenceRule.daysOfYear) }, recurrenceRule.daysOfYear.size)
            this.weeksOfMonth = CArrI64(unsafe { cjArr2CArr(recurrenceRule.weeksOfMonth) },
                recurrenceRule.weeksOfMonth.size)
            this.weeksOfYear = CArrI64(unsafe { cjArr2CArr(recurrenceRule.weeksOfYear) },
                recurrenceRule.weeksOfYear.size)
            this.monthsOfYear = CArrI64(unsafe { cjArr2CArr(recurrenceRule.monthsOfYear) },
                recurrenceRule.monthsOfYear.size)
        } catch (e: Exception) {
            free()
        }
    }

    func free() {
        unsafe {
            LibC.free(excludedDates.head)
            LibC.free(daysOfWeek.head)
            LibC.free(daysOfMonth.head)
            LibC.free(daysOfYear.head)
            LibC.free(weeksOfMonth.head)
            LibC.free(weeksOfYear.head)
            LibC.free(monthsOfYear.head)
        }
    }

    func toCJ(): RecurrenceRule {
        unsafe {
            var texcludedDates: Array<Int64> = []
            var tdaysOfWeek: Array<Int64> = []
            var tdaysOfMonth: Array<Int64> = []
            var tdaysOfYear: Array<Int64> = []
            var tweeksOfMonth: Array<Int64> = []
            var tweeksOfYear: Array<Int64> = []
            var tmonthsOfYear: Array<Int64> = []
            if (excludedDates.size > 0 && excludedDates.size < Int64(Int32.Max)) {
                let excludedDatesSize = excludedDates.size
                let excludedDatesHead = excludedDates.head
                texcludedDates = Array<Int64>(excludedDatesSize, {i => excludedDatesHead.read(i)})
            }
            if (daysOfWeek.size > 0 && daysOfWeek.size < Int64(Int32.Max)) {
                let daysOfWeekSize = daysOfWeek.size
                let daysOfWeekHead = daysOfWeek.head
                tdaysOfWeek = Array<Int64>(daysOfWeekSize, {i => daysOfWeekHead.read(i)})
            }
            if (daysOfMonth.size > 0 && daysOfMonth.size < Int64(Int32.Max)) {
                let daysOfMonthSize = daysOfMonth.size
                let daysOfMonthHead = daysOfMonth.head
                tdaysOfMonth = Array<Int64>(daysOfMonthSize, {i => daysOfMonthHead.read(i)})
            }
            if (daysOfYear.size > 0 && daysOfYear.size < Int64(Int32.Max)) {
                let daysOfYearSize = daysOfYear.size
                let daysOfYearHead = daysOfYear.head
                tdaysOfYear = Array<Int64>(daysOfYearSize, {i => daysOfYearHead.read(i)})
            }
            if (weeksOfMonth.size > 0 && weeksOfMonth.size < Int64(Int32.Max)) {
                let weeksOfMonthSize = weeksOfMonth.size
                let weeksOfMonthHead = weeksOfMonth.head
                tweeksOfMonth = Array<Int64>(weeksOfMonthSize, {i => weeksOfMonthHead.read(i)})
            }
            if (weeksOfYear.size > 0 && weeksOfYear.size < Int64(Int32.Max)) {
                let weeksOfYearSize = weeksOfYear.size
                let weeksOfYearHead = weeksOfYear.head
                tweeksOfYear = Array<Int64>(weeksOfYearSize, {i => weeksOfYearHead.read(i)})
            }
            if (monthsOfYear.size > 0 && monthsOfYear.size < Int64(Int32.Max)) {
                let monthsOfYearSize = monthsOfYear.size
                let monthsOfYearHead = monthsOfYear.head
                tmonthsOfYear = Array<Int64>(monthsOfYearSize, {i => monthsOfYearHead.read(i)})
            }
            return RecurrenceRule(RecurrenceFrequency.parse(recurrenceFrequency), expire: expire, count: count,
                interval: interval, excludedDates: texcludedDates, daysOfWeek: tdaysOfWeek, daysOfMonth: tdaysOfMonth,
                daysOfYear: tdaysOfYear, weeksOfMonth: tweeksOfMonth, weeksOfYear: tweeksOfYear,
                monthsOfYear: tmonthsOfYear)
        }
    }
}

@C
struct CEventService {
    var `type`: CString = CString(CPointer<UInt8>())
    var uri: CString = CString(CPointer<UInt8>())
    var description: CString = CString(CPointer<UInt8>())

    init(eventService: EventService) {
        unsafe {
            try {
                this.`type` = LibC.mallocCString(eventService.`type`.getValue())
                this.uri = LibC.mallocCString(eventService.uri)
                this.description = LibC.mallocCString(eventService.description)
            } catch (e: Exception) {
                LibC.free(`type`)
                LibC.free(uri)
                LibC.free(description)
            }
        }
    }

    func free() {
        unsafe {
            LibC.free(`type`)
            LibC.free(uri)
            LibC.free(description)
        }
    }

    func toCJ(): EventService {
        EventService(ServiceType.parse(this.`type`.toString()), this.uri.toString(),
            description: this.description.toString())
    }
}
