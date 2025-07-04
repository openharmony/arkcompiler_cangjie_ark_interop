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

package ohos.notification_manager

// enum of this package
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public enum ContentType {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    NOTIFICATION_CONTENT_BASIC_TEXT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    NOTIFICATION_CONTENT_LONG_TEXT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    NOTIFICATION_CONTENT_PICTURE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    NOTIFICATION_CONTENT_CONVERSATION
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    NOTIFICATION_CONTENT_MULTILINE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    NOTIFICATION_CONTENT_LIVE_VIEW
    | ...

    func getValue(): Int32 {
        match (this) {
            case NOTIFICATION_CONTENT_BASIC_TEXT => 0
            case NOTIFICATION_CONTENT_LONG_TEXT => 1
            case NOTIFICATION_CONTENT_PICTURE => 2
            case NOTIFICATION_CONTENT_CONVERSATION => 3
            case NOTIFICATION_CONTENT_MULTILINE => 4
            case NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW => 5
            case NOTIFICATION_CONTENT_LIVE_VIEW => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int32): ContentType {
        match (value) {
            case 0 => NOTIFICATION_CONTENT_BASIC_TEXT
            case 1 => NOTIFICATION_CONTENT_LONG_TEXT
            case 2 => NOTIFICATION_CONTENT_PICTURE
            case 3 => NOTIFICATION_CONTENT_CONVERSATION
            case 4 => NOTIFICATION_CONTENT_MULTILINE
            case 5 => NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW
            case 6 => NOTIFICATION_CONTENT_LIVE_VIEW
            case _ => throw IllegalArgumentException("this value is not ContentType: ${value}")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public enum SlotLevel {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    LEVEL_NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    LEVEL_MIN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    LEVEL_LOW
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    LEVEL_DEFAULT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    LEVEL_HIGH
    | ...

    func getValue(): Int32 {
        match (this) {
            case LEVEL_NONE => 0
            case LEVEL_MIN => 1
            case LEVEL_LOW => 2
            case LEVEL_DEFAULT => 3
            case LEVEL_HIGH => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int32): SlotLevel {
        match (value) {
            case 0 => LEVEL_NONE
            case 1 => LEVEL_MIN
            case 2 => LEVEL_LOW
            case 3 => LEVEL_DEFAULT
            case 4 => LEVEL_HIGH
            case _ => throw IllegalArgumentException("this value is not SlotLevel: ${value}")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public enum SlotType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    UNKNOWN_TYPE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    SOCIAL_COMMUNICATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    SERVICE_INFORMATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    CONTENT_INFORMATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    LIVE_VIEW
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    CUSTOMER_SERVICE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    OTHER_TYPES
    | ...

    func getValue(): Int32 {
        match (this) {
            case UNKNOWN_TYPE => 0
            case SOCIAL_COMMUNICATION => 1
            case SERVICE_INFORMATION => 2
            case CONTENT_INFORMATION => 3
            case LIVE_VIEW => 4
            case CUSTOMER_SERVICE => 5
            case OTHER_TYPES => 0xFFFF
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int32): SlotType {
        match (value) {
            case 0 => UNKNOWN_TYPE
            case 1 => SOCIAL_COMMUNICATION
            case 2 => SERVICE_INFORMATION
            case 3 => CONTENT_INFORMATION
            case 4 => LIVE_VIEW
            case 5 => CUSTOMER_SERVICE
            case _ => OTHER_TYPES
        }
    }
}

enum SourceType {
    | TYPE_NORMAL
    | TYPE_CONTINUOUS
    | TYPE_TIMER

    func getValue(): Int32 {
        match (this) {
            case TYPE_NORMAL => 0
            case TYPE_CONTINUOUS => 1
            case TYPE_TIMER => 2
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public enum NotificationFlagStatus {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    TYPE_NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    TYPE_OPEN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    TYPE_CLOSE
    | ...

    func getValue(): Int32 {
        match (this) {
            case TYPE_NONE => 0
            case TYPE_OPEN => 1
            case TYPE_CLOSE => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int32): NotificationFlagStatus {
        match (value) {
            case 0 => TYPE_NONE
            case 1 => TYPE_OPEN
            case 2 => TYPE_CLOSE
            case _ => throw IllegalArgumentException("this value is not FlagStatus: ${value}")
        }
    }
}

func throwIfNotSuccess(code: Int32): Unit {
    if (code != SUCCESS_CODE) {
        NOTIFICATION_LOG.error("code: ${code}, message: " + getErrorInfo(code))
        throw BusinessException(code, getErrorInfo(code))
    }
}

func throwIfNotSuccess(code: Int32, funcC: () -> Unit): Unit {
    if (code != SUCCESS_CODE) {
        NOTIFICATION_LOG.error("code: ${code}, message: " + getErrorInfo(code))
        funcC()
        throw BusinessException(code, getErrorInfo(code))
    }
}
