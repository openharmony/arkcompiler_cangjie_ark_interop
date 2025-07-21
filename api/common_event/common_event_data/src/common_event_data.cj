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

protected package ohos.common_event_data

import std.collection.HashMap
import ohos.labels.APILevel
import ohos.value_type.{ValueType, CArrParameters, Parameters}

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

    protected init(eventData: CCommonEventData) {
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

@C
protected struct CCommonEventData {
    protected CCommonEventData(
        let event: CString,
        let bundleName: CString,
        let code: Int32,
        let data: CString,
        let parameters: CArrParameters
    ) {}
}
