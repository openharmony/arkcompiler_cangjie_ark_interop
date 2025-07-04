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
import ohos.labels.*
import ohos.base.*

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationSlot {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var notificationType: SlotType
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var level: SlotLevel
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var desc: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var badgeFlag: Bool
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var bypassDnd: Bool
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var lockscreenVisibility: Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var vibrationEnabled: Bool
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var sound: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var lightEnabled: Bool
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var lightColor: Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let enabled: Bool
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var vibrationValues: Array<Int64> = []

    init(slot: CNotificationSlotV2) {
        unsafe {
            this.notificationType = SlotType.parse(slot.notificationType)
            this.level = SlotLevel.parse(slot.level)
            this.desc = slot.desc.toString()
            this.badgeFlag = slot.badgeFlag
            this.bypassDnd = slot.bypassDnd
            this.lockscreenVisibility = slot.lockscreenVisibility
            this.vibrationEnabled = slot.vibrationEnabled
            this.sound = slot.sound.toString()
            this.lightEnabled = slot.lightEnabled
            this.lightColor = slot.lightColor
            let size = slot.vibrationValues.size
            let data = slot.vibrationValues.head
            if (!data.isNull()) {
                this.vibrationValues = Array<Int64>(size, {i => data.read(i)})
            }
            this.enabled = slot.enableded
        }
    }
}
