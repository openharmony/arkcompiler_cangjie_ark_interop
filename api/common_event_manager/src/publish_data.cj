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

/**
 * The CommonEventPublishData module provides APIs for defining common event content and attributes.
 *
 * @relation export interface CommonEventPublishData
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.CommonEvent"
]
public class CommonEventPublishData {
    /**
     * Bundle name of the subscriber that can receive the common event.
     *
     * @relation bundleName?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var bundleName: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    /**
     * Common event data transferred by the publisher. The data size cannot exceed 64 KB.
     *
     * @relation data?: string
     */
    public var data: String
    /**
     * Common event data transferred by the publisher. The default value is 0.
     *
     * @relation code?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var code: Int32
    /**
     * Permissions required for subscribers to receive the common event.
     *
     * @relation subscriberPermissions?: Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var subscriberPermissions: Array<String> = Array<String>()
    /**
     * Whether the common event is an ordered one.
     *
     * @relation isOrdered?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var isOrdered: Bool = false
    /**
     * Whether the common event is a sticky one. Only system applications and system services are allowed to send sticky events.
     *
     * @relation isSticky?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var isSticky: Bool = false
    /**
     * Additional information about the common event transferred by the publisher.
     *
     * @relation parameters?: { [key: string]: any }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var parameters: HashMap<String, ValueType> = HashMap<String, ValueType>()

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public init(
        bundleName!: String = "",
        data!: String = "",
        code!: Int32 = 0,
        subscriberPermissions!: Array<String> = Array<String>(),
        isOrdered!: Bool = false,
        isSticky!: Bool = false,
        parameters!: HashMap<String, ValueType> = HashMap<String, ValueType>()
    ) {
        this.bundleName = bundleName
        this.data = data
        this.code = code
        this.subscriberPermissions = subscriberPermissions
        this.isOrdered = isOrdered
        this.isSticky = isSticky
        this.parameters = parameters
    }
}

/**
 * Common event data.
 *
 * @relation export interface CommonEventData
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.CommonEvent"
]
public class CommonEventData {
    /**
     * Name of the common event that is being received.
     *
     * @relation event: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var event: String
    /**
     * Bundle name. This parameter is left empty by default.
     *
     * @relation bundleName?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var bundleName: String
    /**
     * Common event data received by the subscriber. The value of this field is the same as that of the code field in
     * CommonEventPublishData when the publisher uses commonEventManager.publish to publish a common event. The default value is 0.
     *
     * @relation code?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var code: Int32
    /**
     * Common event data received by the subscriber. The value of this field is the same as that of the data field in
     * CommonEventPublishData when the publisher uses commonEventManager.publish to publish a common event.
     *
     * @relation data?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var data: String
    /**
     * Additional information about the common event received by the subscriber. The value of this field is the same as
     * that of the parameters field in CommonEventPublishData when the publisher uses commonEventManager.publish to publish a common event.
     *
     * @relation parameters?: { [key: string]: any }
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public var parameters: HashMap<String, ValueType>

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
