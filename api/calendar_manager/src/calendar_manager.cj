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

import ohos.ability.*
import ohos.base.*
import std.collection.*
import ohos.hilog.*
import ohos.encoding.json.*
import ohos.data_share_predicates.DataSharePredicates as DSPredicates
import ohos.labels.*

const LOG_CORE: UInt32 = 0
const LOG_DOMAIN_CALENDARMANAGER: UInt32 = 0x050a
let CALENDAR_MANAGER_LOG = HilogChannel(LOG_CORE, LOG_DOMAIN_CALENDARMANAGER, "CJ-CalendarManagerKit")
const ERR_NO_PERMISSION: Int32 = 201
const CAPABILITY_NOT_SUPPORTED: Int32 = 801
const ERR_ILLEGAL_INSTANCE: Int32 = -1
const ERR_OUT_OF_MEMORY: Int32 = -2
const CJ_ERR_NULL_PTR: Int32 = -3
let ERR_MESSAGES: HashMap<Int32, String> = HashMap<Int32, String>(
    [
        (CAPABILITY_NOT_SUPPORTED, "Capability not supported."),
        (ERR_NO_PERMISSION, "Permission denied."),
        (ERR_ILLEGAL_INSTANCE, "illegal instance ptr"),
        (ERR_OUT_OF_MEMORY, "Out of memory."),
        (CJ_ERR_NULL_PTR, "the ptr is null")
    ]
)

/**
 * Returns an instance of CalendarManager.
 *
 * @throws { IllegalMemoryException } - Out of memory.
 * @throws { IllegalArgumentException } - Illegal argument exception.
 * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
 * @relation function getCalendarManager(context: Context) : CalendarManager;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public func getCalendarManager(context: UIAbilityContext): CalendarManager {
    var code = 0i32
    unsafe { FfiOHOSGetCalendarManager(context.getID(), inout code) }
    throwIfError("CalendarManager.getCalendarManager", code)
    return CalendarManager.instance
}

/**
 * Defines the CalendarManager class and provides functions to access the calendar data.
 *
 * @relation export interface CalendarManager;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public class CalendarManager {
    static let instance: CalendarManager = CalendarManager()
    private init() {}

    /**
     * Create calendar instance.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation createCalendar(calendarAccount: CalendarAccount): Promise<Calendar>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func createCalendar(calendarAccount: CalendarAccount): Calendar {
        var code = 0i32
        var calendarId = 0
        let ccalendarAccount = CCalendarAccount(calendarAccount)
        var id = unsafe { FfiOHOSCalendarManagerCreateCalendar(ccalendarAccount, inout calendarId, inout code) }

        ccalendarAccount.free()
        throwIfError("CalendarManager.createCalendar", code)
        let calendar = Calendar(id, calendarId)
        return calendar
    }

    /**
     * Delete calendar instance.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation deleteCalendar(calendar: Calendar): Promise<void>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func deleteCalendar(calendar: Calendar): Unit {
        var code = 0i32
        unsafe { FfiOHOSCalendarManagerdeleteCalendar(calendar.getID(), inout code) }
        throwIfError("CalendarManager.deleteCalendar", code)
    }

    /**
     * Get calendar instance from database.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation getCalendar(calendarAccount?: CalendarAccount): Promise<Calendar>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func getCalendar(calendarAccount!: ?CalendarAccount = None): Calendar {
        var code = 0i32
        let ccalendarAccount: CCalendarAccount
        var calendarId = 0
        if (let Some(v) <- calendarAccount) {
            ccalendarAccount = CCalendarAccount(v)
        } else {
            ccalendarAccount = CCalendarAccount(CalendarAccount("", CalendarType.Local, displayName: ""))
        }
        var id = unsafe { FfiOHOSCalendarManagerGetCalendar(ccalendarAccount, inout calendarId, inout code) }
        ccalendarAccount.free()
        throwIfError("CalendarManager.getCalendar", code)
        return Calendar(id, calendarId)
    }

    /**
     * Get all calendar instance.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation getAllCalendars(): Promise<Calendar[]>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func getAllCalendars(): Array<Calendar> {
        var code = 0i32
        let calendarIds: Array<Int64>
        var calendars: Array<Calendar>
        unsafe {
            let ids = FfiOHOSCalendarManagerGetAllCalendars(inout code)
            let data = ids.head
            let size = ids.size
            calendarIds = Array<Int64>(size, {
                i => data.read(i)
            })
            calendars = Array<Calendar>(size, {
                i => Calendar(id: calendarIds[i])
            })
            LibC.free(data)
        }
        throwIfError("CalendarManager.getAllCalendars", code)
        return calendars
    }

    /**
     * Create a single event,invoking this interface will open the event creation page.
     *
     * @throws { IllegalMemoryException } - Out of memory.
     * @throws { IllegalArgumentException } - Illegal argument exception.
     * @throws { IllegalStateException } - 1.Illegal instance ptr. 2.the ptr is null.
     * @relation editEvent(event: Event): Promise<number>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public func editEvent(event: Event): Int64 {
        var code = 0i32
        let eventstr = event.toString()
        var eventId = 0
        unsafe {
            try (ceventstr = LibC.mallocCString(eventstr).asResource()) {
                eventId = FfiOHOSCalendarManagerEditerEvent(ceventstr.value, inout code)
                throwIfError("CalendarManager.editEvent", code)
            }
        }
        return eventId
    }
}

/**
 * Describes a calendar account.
 *
 * @relation interface CalendarAccount
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public class CalendarAccount {
    /**
     * Name of the calendar
     *
     * @relation readonly name: string;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public let name: String
    /**
     * Type of the calendar
     *
     * @relation type: CalendarType;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var `type`: CalendarType
    /**
     * DisplayName of the calendar
     *
     * @relation displayName?: string
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public var displayName: String

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    public CalendarAccount(name: String, `type`: CalendarType, displayName!: String = "") {
        this.name = name
        this.`type` = `type`
        this.displayName = displayName
    }
}

/**
 * Enum for all calendar type.
 *
 * @relation enum CalendarType
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.CalendarData"
]
public enum CalendarType {
    /**
     * Local calendar
     *
     * @relation LOCAL = 'local'
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    Local
    |
        /**
         * Email calendar
         *
         * @relation EMAIL = 'email'
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    Email
    |
        /**
         * Birthday calendar
         *
         * @relation BIRTHDAY = 'birthday'
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    Birthday
    |
        /**
         * CalDAV calendar
         *
         * @relation CALDAV = 'caldav'
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    CalDAV
    |
        /**
         * Subscribed calendar
         *
         * @relation SUBSCRIBED = 'subscribed'
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.CalendarData"
    ]
    Subscribed
    | ...

    func getValue(): String {
        match (this) {
            case Local => "local"
            case Email => "email"
            case Birthday => "birthday"
            case CalDAV => "caldav"
            case Subscribed => "subscribed"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: String): CalendarType {
        match (value) {
            case "local" => Local
            case "email" => Email
            case "birthday" => Birthday
            case "caldav" => CalDAV
            case "subscribed" => Subscribed
            case _ => throw IllegalArgumentException("CalendarType: unknown value ${value}")
        }
    }
}

func throwIfError(whoFailed: String, errCode: Int32, releaser!: () -> Unit = {=> ()}) {
    releaser()
    if (errCode == ERR_NO_PERMISSION) {
        throw BusinessException(errCode, ERR_MESSAGES[errCode])
    } else if (errCode == CAPABILITY_NOT_SUPPORTED) {
        throw BusinessException(errCode, ERR_MESSAGES[errCode])
    } else if (errCode == ERR_ILLEGAL_INSTANCE) {
        throw IllegalStateException(ERR_MESSAGES[errCode])
    } else if (errCode == ERR_OUT_OF_MEMORY) {
        throw IllegalMemoryException(ERR_MESSAGES[errCode])
    } else if (errCode == CJ_ERR_NULL_PTR) {
        throw IllegalStateException(ERR_MESSAGES[errCode])
    } else if (errCode != 0) {
        throw exceptionForUnexpectedCode(whoFailed, errCode)
    }
}

func exceptionForUnexpectedCode(whoFailed: String, errCode: Int32): BusinessException {
    // log the errCode that comes from ffi
    CALENDAR_MANAGER_LOG.error("${whoFailed} failed with code ${errCode}")
    // but throw it as a parameter error similar to ArkTS
    BusinessException(CAPABILITY_NOT_SUPPORTED, ERR_MESSAGES[errCode])
}
