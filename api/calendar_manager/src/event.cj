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
import ohos.labels.*

/**
 * Describes an event information.
 *
 * @relation interface Event
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public class Event {
    /**
     * Type of the event
     *
     * @relation type: EventType;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var `type`: EventType
    /**
     * start time of the event
     *
     * @relation startTime: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var startTime: Int64
    /**
     * end time of the event
     *
     * @relation endTime: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var endTime: Int64
    /**
     * Id of the event
     *
     * @relation id?: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var id: ?Int64
    /**
     * Title of the event
     *
     * @relation title?: string;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var title: String
    /**
     * Location of the event
     *
     * @relation location?: Location;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var location: ?Location
    /**
     * Whether the event is allDay
     *
     * @relation isAllDay?: boolean;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var isAllDay: Bool
    /**
     * Attendees of the event
     *
     * @relation attendee?: Attendee[];
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var attendee: ?Array<Attendee>
    /**
     * TimeZone of the event
     *
     * @relation timeZone?: string;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var timeZone: String
    /**
     * Reminder time of the event
     *
     * @relation reminderTime?: number[];
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var reminderTime: Array<Int64>
    /**
     * RecurrenceRule of the event
     *
     * @relation recurrenceRule?: RecurrenceRule;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var recurrenceRule: ?RecurrenceRule
    /**
     * Description of the event
     *
     * @relation description?: string;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var description: String
    /**
     * Service of the event
     *
     * @relation service?: EventService;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var service: ?EventService
    /**
     * Unique identifier of the event
     *
     * @relation identifier?: string;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var identifier: ?String
    /**
     * Whether the event is lunar.
     *
     * @relation isLunar?: boolean;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var isLunar: Bool

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public Event(`type`: EventType, startTime: Int64, endTime: Int64, id!: Int64 = 0, title!: String = "",
        location!: ?Location = None, isAllDay!: Bool = false, attendee!: ?Array<Attendee> = None,
        timeZone!: String = "", reminderTime!: Array<Int64> = [], recurrenceRule!: ?RecurrenceRule = None,
        description!: String = "", service!: ?EventService = None, identifier!: String = "", isLunar!: Bool = false) {
        this.`type` = `type`
        this.startTime = startTime
        this.endTime = endTime
        this.id = id
        this.title = title
        if (let Some(v) <- location) {
            this.location = v
        } else {
            this.location = Location()
        }
        this.isAllDay = isAllDay
        if (let Some(v) <- attendee) {
            this.attendee = v
        } else {
            this.attendee = Array<Attendee>()
        }
        this.timeZone = timeZone
        this.reminderTime = reminderTime
        if (let Some(v) <- recurrenceRule) {
            this.recurrenceRule = v
        } else {
            this.recurrenceRule = RecurrenceRule(RecurrenceFrequency.Yearly)
        }
        this.description = description
        if (let Some(v) <- service) {
            this.service = v
        } else {
            this.service = EventService(ServiceType.Meeting, "")
        }
        this.identifier = identifier
        this.isLunar = isLunar
    }
}

/**
 * Enum for supported events type.
 *
 * @relation enum EventType
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public enum EventType {
    /**
     * normal event.
     *
     * @relation NORMAL = 0,
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    Normal
    |
        /**
         * important event.
         *
         * @relation IMPORTANT = 1
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    Important
    | ...

    func getValue(): Int64 {
        match (this) {
            case Normal => 0
            case Important => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int64): EventType {
        match (value) {
            case 0 => Normal
            case 1 => Important
            case _ => throw IllegalArgumentException("EventType: unknown value ${value}")
        }
    }
}

/**
 * Location of an event.
 *
 * @relation interface Location
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public class Location {
    /**
     * Location of the event
     *
     * @relation location?: string;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var location: String
    /**
     * Longitude of the location
     *
     * @relation longitude?: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var longitude: Float64
    /**
     * Latitude of the location
     *
     * @relation latitude?: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var latitude: Float64

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public Location(location!: String = "", longitude!: Float64 = 0.0, latitude!: Float64 = 0.0) {
        this.location = location
        this.latitude = latitude
        this.longitude = longitude
    }
}

/**
 * Defines the attendee information
 *
 * @relation export interface Attendee
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public class Attendee {
    /**
     * Name of the Attendee.
     *
     * @relation name: string;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var name: String
    /**
     * Email of the Attendee.
     *
     * @relation email: string;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var email: String
    /**
     * Role of the Attendee.
     *
     * @relation role?: AttendeeRole;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var role: ?AttendeeRole

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public Attendee(name: String, email: String, role!: ?AttendeeRole = None) {
        this.name = name
        this.email = email
        if (let Some(v) <- role) {
            this.role = v
        } else {
            this.role = AttendeeRole.Organizer
        }
    }

    func toString(): String {
        var str = "attendee:{name:${this.name},email:${this.email}"
        if (let Some(v) <- this.role) {
            str = str + "role:${v.getValue()}"
        }
        str = str + "}"
        return str
    }
}

/**
 * Enum for the attendee role
 *
 * @relation export enum AttendeeRole
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public enum AttendeeRole {
    /**
     * The organizer of a meeting.
     *
     * @relation ORGANIZER = 'organizer',
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    Organizer
    |
        /**
         * The participant of a meeting.
         *
         * @relation PARTICIPANT = 'participant'
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    Participant
    | ...

    func getValue(): Int64 {
        match (this) {
            case Organizer => 1
            case Participant => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int64): AttendeeRole {
        match (value) {
            case 1 => Organizer
            case 2 => Participant
            case _ => throw IllegalArgumentException("ServiceType: unknown value ${value}")
        }
    }
}

/**
 * Defines the recurrence rule of event
 *
 * @relation export interface RecurrenceRule
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public class RecurrenceRule {
    /**
     * RecurrenceFrequency of recurrence event.
     *
     * @relation recurrenceFrequency: RecurrenceFrequency;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var recurrenceFrequency: RecurrenceFrequency
    /**
     * Expiration time of recurrence event.
     *
     * @relation expire?: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var expire: Int64
    /**
     * Repetition count of recurrence event.
     *
     * @relation count?: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var count: Int64
    /**
     * Repeat interval of recurrence event.
     *
     * @relation interval?: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var interval: Int64
    /**
     * Excluded dates of recurrence event.
     *
     * @relation excludedDates?: number[];
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var excludedDates: Array<Int64>
    /**
     * The days of the week associated with the recurrence event.
     *
     * @relation daysOfWeek?: number[];
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var daysOfWeek: Array<Int64>
    /**
     * The days of the month associated with the recurrence event.
     *
     * @relation daysOfMonth?: number[];
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var daysOfMonth: Array<Int64>
    /**
     * The days of the year associated with the recurrence event.
     *
     * @relation daysOfYear?: number[];
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var daysOfYear: Array<Int64>
    /**
     * The weeks of the month associated with the recurrence event.
     *
     * @relation weeksOfMonth?: number[];
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var weeksOfMonth: Array<Int64>
    /**
     * The weeks of the year associated with the recurrence event.
     *
     * @relation weeksOfYear?: number[];
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var weeksOfYear: Array<Int64>
    /**
     * The months of the year associated with the recurrence event.
     *
     * @relation monthsOfYear?: number[];
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var monthsOfYear: Array<Int64>

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public RecurrenceRule(
        recurrenceFrequency: RecurrenceFrequency,
        expire!: Int64 = 0,
        count!: Int64 = 0,
        interval!: Int64 = 0,
        excludedDates!: Array<Int64> = [],
        daysOfWeek!: Array<Int64> = [],
        daysOfMonth!: Array<Int64> = [],
        daysOfYear!: Array<Int64> = [],
        weeksOfMonth!: Array<Int64> = [],
        weeksOfYear!: Array<Int64> = [],
        monthsOfYear!: Array<Int64> = []
    ) {
        this.recurrenceFrequency = recurrenceFrequency
        this.expire = expire
        this.count = count
        this.interval = interval
        this.excludedDates = excludedDates
        this.daysOfWeek = daysOfWeek
        this.daysOfMonth = daysOfMonth
        this.daysOfYear = daysOfYear
        this.weeksOfMonth = weeksOfMonth
        this.weeksOfYear = weeksOfYear
        this.monthsOfYear = monthsOfYear
    }
}

/**
 * Enum for the recurrence type by different period
 *
 * @relation export enum RecurrenceFrequency
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public enum RecurrenceFrequency {
    /**
     * The event repeats every year.
     *
     * @relation YEARLY = 0
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    Yearly
    |
        /**
         * The event repeats every month.
         *
         * @relation MONTHLY = 1
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    Monthly
    |
        /**
         * The event repeats every week.
         *
         * @relation WEEKLY = 2
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    Weekly
    |
        /**
         * The event repeats every day.
         *
         * @relation DAILY = 3
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    Daily
    | ...

    func getValue(): Int64 {
        match (this) {
            case Yearly => 0
            case Monthly => 1
            case Weekly => 2
            case Daily => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int64): RecurrenceFrequency {
        match (value) {
            case 0 => Yearly
            case 1 => Monthly
            case 2 => Weekly
            case 3 => Daily
            case _ => throw IllegalArgumentException("ServiceType: unknown value ${value}")
        }
    }
}
