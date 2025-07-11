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

package ohos.common_event_manager

import std.collection.*
import ohos.base.*
import ohos.labels.*

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.CommonEvent"
]
public class CommonEventPublishData {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public CommonEventPublishData(
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.CommonEvent"
        ]
        public let bundleName: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.CommonEvent"
        ]
        public let data: String,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.CommonEvent"
        ]
        public let code: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.CommonEvent"
        ]
        public let subscriberPermissions!: Array<String> = Array<String>(),
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.CommonEvent"
        ]
        public let isOrdered!: Bool = false,
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.CommonEvent"
        ]
        public let isSticky!: Bool = false,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.CommonEvent"
        ]
        public let parameters!: HashMap<String, ValueType> = HashMap<String, ValueType>()
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.CommonEvent"
]
public class CommonEventData {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public let event: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public let bundleName: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public let code: Int32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public let data: String
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public let parameters: HashMap<String, ValueType>
    init(eventData: CCommonEventData) {
        event = eventData.event.toString()
        bundleName = eventData.bundleName.toString()
        code = eventData.code
        data = eventData.data.toString()
        let size = eventData.parameters.size
        let dataPtr = eventData.parameters.head
        parameters = HashMap<String, ValueType>()
        for (i in 0..size) {
            let cp = unsafe { dataPtr.read(i) }
            let parameter = Parameters(cp)
            parameters.add(parameter.key, parameter.value)
        }
    }
}
