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

import std.collection.*
import ohos.labels.*
import ohos.base.*
import ohos.ffi.*

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Emitter"
]
public struct EventData {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public EventData(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Emitter"
        ]
        public var data: HashMap<String, EventDataType>
    ) {}

    static let EMPTY: EventData = EventData(HashMap<String, EventDataType>())

    init(cData: CEventData) {
        data = HashMap<String, EventDataType>()
        for (i in 0..cData.size) {
            let p = unsafe { cData.parameters.read(i) }
            let key = p.key.toString()
            let value = unsafe {
                match {
                    case p.valueType == I64_TYPE => INT64(CPointer<Int64>(p.value).read())
                    case p.valueType == BOOL_TYPE => BOOL(CPointer<Bool>(p.value).read())
                    case _ => // p.valueType == STR_TYPE
                        STRING(CString(CPointer<UInt8>(p.value)).toString())
                }
            }
            data.add(key, value)
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Emitter"
]
public class InnerEvent {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public InnerEvent(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Emitter"
        ]
        public var eventId: UInt32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Emitter"
        ]
        public var priority!: EventPriority = LOW
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Emitter"
]
public struct Options {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public Options(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Emitter"
        ]
        public var priority: EventPriority
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Emitter"
]
public enum EventPriority {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    IMMEDIATE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    HIGH
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    LOW
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    IDLE
    | ...

    func getValue(): Int64 {
        match (this) {
            case IMMEDIATE => 0
            case HIGH => 1
            case LOW => 2
            case IDLE => 3
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Emitter"
]
public enum EventDataType {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    INT64(Int64)
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    BOOL(Bool)
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    STRING(String)
    | ...
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Emitter"
]
public struct EventCallback {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Emitter"
    ]
    public EventCallback(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Emitter"
        ]
        public let name: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Emitter"
        ]
        public let callback: (EventData) -> Unit
    ) {
        if (name.isEmpty()) {
            throw IllegalArgumentException("invalid name")
        }
    }
}

func throwIfOOM(code: Int32): Unit {
    if (code == MEMORY_ERROR) {
        throw IllegalMemoryException("Out of memory.")
    }
}
