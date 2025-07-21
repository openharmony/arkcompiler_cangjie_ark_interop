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

import ohos.labels.APILevel
import ohos.ffi.{Callback1Param, INVALID_CODE}
import ohos.base.BusinessException
import ohos.common_event_data.CCommonEventData
import ohos.common_event_publish_data.CCommonEventPublishData
public import ohos.common_event_data.CommonEventData
public import ohos.common_event_publish_data.CommonEventPublishData
public import ohos.common_event_subscribe_info.CommonEventSubscribeInfo
public import ohos.common_event_subscriber.CommonEventSubscriber
public import ohos.value_type.ValueType

/**
 * The CommonEventManager module provides common event capabilities, including the capabilities to publish, subscribe to, and unsubscribe from common events.
 * @relation declare namespace commonEventManager
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.CommonEvent"
]
public class CommonEventManager {
    /**
     * Publishes an ordered, sticky, or standard common event.
     *
     * @param { String } event - name of the common event.
     * @throws { BusinessException } 1500004 - If not System services.
     * @throws { BusinessException } 1500007 - If error sending message to Common Event Service.
     * @throws { BusinessException } 1500008 - If Common Event Service does not complete initialization.
     * @throws { BusinessException } 1500009 - If error obtaining system parameters.
     * @relation publish(event: string, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static func publish(event: String): Unit {
        unsafe {
            let cEvent = LibC.mallocCString(event)
            let retCode = CJ_PublishEvent(cEvent, UNDEFINED_USER)
            LibC.free(cEvent)
            throwIfNotSuccess(retCode, "publish")
        }
    }

    /**
     * Publishes an ordered, sticky, or standard common event.
     *
     * @param { String } event - Name of the common event to publish.
     * @param { CommonEventPublishData } options - Attributes of the common event to publish.
     * @throws { BusinessException } 1500004 - If not System services or System app.
     * @throws { BusinessException } 1500007 - If error sending message to Common Event Service.
     * @throws { BusinessException } 1500008 - If Common Event Service does not complete initialization.
     * @throws { BusinessException } 1500009 - If error obtaining system parameters.
     * @relation publish(event: string, options: CommonEventPublishData, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static func publish(event: String, options: CommonEventPublishData): Unit {
        unsafe {
            try (
                cEvent = LibC.mallocCString(event).asResource(),
                cOptions = CCommonEventPublishData(options).asResource()
            ) {
                let retCode = CJ_PublishEventWithData(cEvent.value, UNDEFINED_USER, cOptions.value)
                throwIfNotSuccess(retCode, "publish")
            }
        }
    }

    /**
     * create the CommonEventSubscriber for the SubscriberInfo.
     *
     * @param { CommonEventSubscribeInfo } subscribeInfo - Indicates the information of the subscriber.
     * @returns { CommonEventSubscriber } CommonEventSubscriber instance.
     * @relation createSubscriber(subscribeInfo: CommonEventSubscribeInfo): Promise<CommonEventSubscriber>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static func createSubscriber(subscribeInfo: CommonEventSubscribeInfo): CommonEventSubscriber {
        let ret = unsafe { CJ_CreateSubscriber(subscribeInfo.getID()) }
        if (ret == Int64(INVALID_CODE)) {
            throw BusinessException(getErrorCode(ERROR_CES_UNINITIALIZED),
                "CommonEventManager: createSubscriber failed: ${getErrorMsg(ERROR_CES_UNINITIALIZED)}")
        }
        return CommonEventSubscriber(ret)
    }

    /**
     * subscribe an ordered, sticky, or standard common event.
     *
     * @param { CommonEventSubscriber } subscriber - Indicate the subscriber of the common event.
     * @throws { BusinessException } 1500007 - If error sending message to Common Event Service.
     * @throws { BusinessException } 1500008 - If Common Event Service does not complete initialization.
     * @relation subscribe(subscriber: CommonEventSubscriber, callback: AsyncCallback<CommonEventData>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static func subscribe(subscriber: CommonEventSubscriber, callback: (CommonEventData) -> Unit): Unit {
        let wrapper = {
            value: CCommonEventData =>
            let commonData = CommonEventData(value)
            callback(commonData)
        }
        let lambdaData = Callback1Param<CCommonEventData, Unit>(wrapper)
        let retCode = unsafe { CJ_Subscribe(subscriber.getID(), lambdaData.getID()) }
        throwIfNotSuccess(retCode, "subscribe")
    }

    /**
     * unsubscribe from an ordered, sticky, or standard common event.
     *
     * @param { CommonEventSubscriber } subscriber - Indicate the subscriber of the common event.
     * @throws { BusinessException } 1500007 - If error sending message to Common Event Service.
     * @throws { BusinessException } 1500008 - If Common Event Service does not complete initialization.
     * @relation unsubscribe(subscriber: CommonEventSubscriber, callback?: AsyncCallback<void>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.CommonEvent"
    ]
    public static func unsubscribe(subscriber: CommonEventSubscriber): Unit {
        let retCode = unsafe { CJ_Unsubscribe(subscriber.getID()) }
        throwIfNotSuccess(retCode, "unsubscribe")
    }
}
