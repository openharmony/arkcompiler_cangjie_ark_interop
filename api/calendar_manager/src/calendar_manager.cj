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
import std.collection.*
import ohos.labels.*

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
