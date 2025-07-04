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

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import ohos.image.*
import ohos.ability.*
import ohos.labels.*

let NOTIFICATION_LOG = HilogChannel(0, NOTIFICATION_DOMAIN_ID, "CJ-notification")

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func publish(request: NotificationRequest): Unit {
    let cRequest = request.toCNotificationRequest()
    let code = unsafe { FfiOHOSNotificationManagerPublishV2(cRequest) }
    cRequest.free()
    throwIfNotSuccess(code)
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func cancel(id: Int32, label!: String = ""): Unit {
    try (cLabel = unsafe { LibC.mallocCString(label).asResource() }) {
        let code = unsafe { FfiOHOSNotificationManagerCancelV2(id, cLabel.value) }
        throwIfNotSuccess(code)
    }
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func cancelAll(): Unit {
    let code = unsafe { FfiOHOSNotificationManagerCancelAllV2() }
    throwIfNotSuccess(code)
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func addSlot(slotType: SlotType): Unit {
    let cType = slotType.getValue()
    let code = unsafe { FfiOHOSNotificationManagerAddSlotV2(cType) }
    throwIfNotSuccess(code)
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func isNotificationEnabled(): Bool {
    let cValue = unsafe { FfiOHOSNotificationManagerIsNotificationEnabledV2() }
    throwIfNotSuccess(cValue.code)
    let value = cValue.data
    return value
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func setBadgeNumber(badgeNumber: Int32): Unit {
    let code = unsafe { FfiOHOSNotificationManagerSetBadgeNumberV2(badgeNumber) }
    throwIfNotSuccess(code)
}

@!APILevel[
    12,
    crossplatform: true,
    deprecated: 19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func requestEnableNotification(): Unit {
    let code = unsafe { FfiOHOSNotificationManagerRequestEnableNotificationV2() }
    throwIfNotSuccess(code)
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func requestEnableNotification(context: UIAbilityContext): Unit {
    let code = unsafe { FfiOHOSNotificationManagerRequestEnableNotificationWithContextV2(context.getID()) }
    throwIfNotSuccess(code)
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func isDistributedEnabled(): Bool {
    let cValue = unsafe { FfiOHOSNotificationManagerIsDistributedEnabledV2() }
    throwIfNotSuccess(cValue.code)
    let value = cValue.data
    return value
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func getSlot(slotType: SlotType): NotificationSlot {
    var code: Int32 = 0
    let cType = slotType.getValue()
    let slot: CNotificationSlotV2 = unsafe { FfiOHOSNotificationManagerGetSlot(cType, inout code) }
    throwIfNotSuccess(code, slot.free)
    let result = NotificationSlot(slot)
    slot.free()
    result
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func getSlots(): Array<NotificationSlot> {
    unsafe {
        var code: Int32 = 0
        let slots = FfiOHOSNotificationManagerGetSlots(inout code)
        throwIfNotSuccess(code, slots.free)
        let size = slots.size
        let head = slots.head
        let result = Array<NotificationSlot>(size, {i => NotificationSlot(head.read(i))})
        slots.free()
        result
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func removeSlot(slotType: SlotType): Unit {
    let cType = slotType.getValue()
    let code = unsafe { FfiOHOSNotificationManagerRemoveSlot(cType) }
    throwIfNotSuccess(code)
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func removeAllSlots(): Unit {
    var code = unsafe { FfiOHOSNotificationManagerRemoveAllSlots() }
    throwIfNotSuccess(code)
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func getActiveNotificationCount(): UInt32 {
    let cValue = unsafe { FfiOHOSNotificationManagerGetActiveNotificationCount() }
    let code = Int32(cValue.code)
    throwIfNotSuccess(code)
    let value = cValue.data
    return value
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func getActiveNotifications(): Array<NotificationRequest> {
    unsafe {
        var code: Int32 = 0
        let notificationRequests = FfiOHOSNotificationManagerGetActiveNotifications(inout code)
        throwIfNotSuccess(code, notificationRequests.free)
        let size = notificationRequests.size
        let head = notificationRequests.head
        let result = Array<NotificationRequest>(size, {i => NotificationRequest(head.read(i).read())})
        notificationRequests.free()
        result
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func cancelGroup(groupName: String): Unit {
    unsafe {
        try (cGroupName = LibC.mallocCString(groupName).asResource()) {
            let code = FfiOHOSNotificationManagerCancelGroup(cGroupName.value)
            throwIfNotSuccess(code)
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public func isSupportTemplate(templateName: String): Bool {
    var value: Bool = false
    unsafe {
        try (cTemplateName = LibC.mallocCString(templateName).asResource()) {
            let cValue = FfiOHOSNotificationManagerIsSupportTemplate(cTemplateName.value)
            throwIfNotSuccess(cValue.code)
            value = cValue.data
        }
    }
    value
}
