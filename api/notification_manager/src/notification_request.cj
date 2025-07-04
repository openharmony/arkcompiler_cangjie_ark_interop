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

import ohos.image.*
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationRequest {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var content: NotificationContent

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var id: Int32 = 0

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var notificationSlotType: SlotType = OTHER_TYPES

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isOngoing: Bool = false

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isUnremovable: Bool = false

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var deliveryTime: Int64 = 0

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var tapDismissed: Bool = true

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var autoDeletedTime: Int64 = -1

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var color: UInt32 = 0

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var colorEnabled: Bool = false

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isAlertOnce: Bool = false

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isStopwatch: Bool = false

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isCountDown: Bool = false

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var isFloatingIcon: Bool = false

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var label: String = ""

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var badgeIconStyle: Int32 = 0

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var showDeliveryTime: Bool = false

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var smallIcon: Option<PixelMap> = None

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var largeIcon: Option<PixelMap> = None

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let creatorBundleName: String

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let creatorUid: Int32

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let creatorPid: Int32

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let creatorUserId: Int32

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let hashCode: String

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var groupName: String = ""

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var distributedOption: Option<DistributedOptions> = None

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public let notificationFlags: Option<NotificationFlags>

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var badgeNumber: UInt32 = 0

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var appMessageId: String = ""

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        content: NotificationContent,
        id!: Int32 = 0,
        label!: String = ""
    ) {
        this.content = content
        this.id = id
        this.label = label

        // Used to adapt to the new member variables of API19
        this.creatorBundleName = ""
        this.creatorUid = 0
        this.creatorPid = 0
        this.creatorUserId = 0
        this.hashCode = ""
        this.notificationFlags = None
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        content: NotificationContent,
        creatorBundleName: String,
        creatorUid: Int32,
        creatorPid: Int32,
        creatorUserId: Int32,
        hashCode: String,
        notificationFlags: ?NotificationFlags
    ) {
        this.content = content
        this.creatorBundleName = creatorBundleName
        this.creatorUid = creatorUid
        this.creatorPid = creatorPid
        this.creatorUserId = creatorUserId
        this.hashCode = hashCode
        this.notificationFlags = notificationFlags
    }

    init(request: CNotificationRequestV2) {
        content = request.content.parse()
        id = request.id
        notificationSlotType = SlotType.parse(request.notificationSlotType)
        isOngoing = request.isOngoing
        isUnremovable = request.isUnremovable
        deliveryTime = request.deliveryTime
        tapDismissed = request.tapDismissed
        autoDeletedTime = request.autoDeletedTime
        color = request.color
        colorEnabled = request.colorEnabled
        isAlertOnce = request.isAlertOnce
        isStopwatch = request.isStopwatch
        isCountDown = request.isCountDown
        isFloatingIcon = request.isFloatingIcon
        label = request.label.toString()
        badgeIconStyle = request.badgeIconStyle
        showDeliveryTime = request.showDeliveryTime
        smallIcon = if (request.smallIcon == -1) {
            None
        } else {
            Some(PixelMap(request.smallIcon))
        }
        largeIcon = if (request.largeIcon == -1) {
            None
        } else {
            Some(PixelMap(request.largeIcon))
        }
        creatorBundleName = request.creatorBundleName.toString()
        groupName = request.groupName.toString()
        distributedOption = if (request.distributedOption.isNull()) {
            None
        } else {
            unsafe { Some(DistributedOptions(request.distributedOption.read())) }
        }
        notificationFlags = Some(NotificationFlags(request.notificationFlags))
        badgeNumber = request.badgeNumber
        creatorUid = request.creatorUid
        creatorPid = request.creatorPid
        creatorUserId = request.creatorUserId
        hashCode = request.hashCode.toString()
        appMessageId = request.appMessageId.toString()
    }

    func toCNotificationRequest(): CNotificationRequestV2 {
        var request = CNotificationRequestV2(CNotificationContent(), id, notificationSlotType.getValue(), isOngoing,
            isUnremovable, deliveryTime, tapDismissed, autoDeletedTime, color, colorEnabled, isAlertOnce, isStopwatch,
            isCountDown, isFloatingIcon, CString(CPointer()), badgeIconStyle, showDeliveryTime, -1, -1,
            CString(CPointer()), creatorUid, creatorPid, creatorUserId, CString(CPointer()), CString(CPointer()),
            CPointer<CDistributedOptions>(), CNotificationFlags(0, 0), badgeNumber, CString(CPointer()))
        unsafe {
            try {
                request.content = content.toCNotificationContent()
                request.label = LibC.mallocCString(label)
                request.groupName = LibC.mallocCString(groupName)
                request.creatorBundleName = LibC.mallocCString(creatorBundleName)
                request.hashCode = LibC.mallocCString(hashCode)
                request.appMessageId = LibC.mallocCString(appMessageId)
                if (let Some(opt) <- distributedOption) {
                    let convert = {p: DistributedOptions => p.toCDistributedOptions()}
                    request.distributedOption = toCPointer<DistributedOptions, CDistributedOptions>(opt, convert)
                }
            } catch (e: Exception) {
                request.free()
                throw e
            }
        }
        if (let Some(icon) <- smallIcon) {
            request.smallIcon = icon.getID()
        }
        if (let Some(icon) <- largeIcon) {
            request.largeIcon = icon.getID()
        }
        if (let Some(flags) <- notificationFlags) {
            request.notificationFlags = flags.toCNotificationFlags()
        }
        return request
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public struct DistributedOptions {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public DistributedOptions(
        let isDistributed!: Bool = true,
        let supportDisplayDevices!: Array<String> = Array<String>(),
        let supportOperateDevices!: Array<String> = Array<String>()
    ) {}

    init(options: CDistributedOptions) {
        isDistributed = options.isDistributed
        let displaySize = options.supportDisplayDevices.size
        let displayHead = options.supportDisplayDevices.head
        supportDisplayDevices = unsafe { Array<String>(displaySize, {i => displayHead.read(i).toString()}) }
        let operateSize = options.supportOperateDevices.size
        let operateHead = options.supportOperateDevices.head
        supportOperateDevices = unsafe { Array<String>(operateSize, {i => operateHead.read(i).toString()}) }
    }

    unsafe func toCDistributedOptions(): CDistributedOptions {
        var options = CDistributedOptions()
        options.isDistributed = isDistributed
        try {
            options.supportDisplayDevices = toArrayCString(supportDisplayDevices)
            options.supportOperateDevices = toArrayCString(supportOperateDevices)
        } catch (e: Exception) {
            options.free()
            throw e
        }

        return options
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationFlags {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public NotificationFlags(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public let soundEnabled!: NotificationFlagStatus = TYPE_NONE,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public let vibrationEnabled!: NotificationFlagStatus = TYPE_NONE
    ) {}

    init(flags: CNotificationFlags) {
        soundEnabled = NotificationFlagStatus.parse(flags.soundEnabled)
        vibrationEnabled = NotificationFlagStatus.parse(flags.vibrationEnabled)
    }

    func toCNotificationFlags(): CNotificationFlags {
        return CNotificationFlags(
            soundEnabled.getValue(),
            vibrationEnabled.getValue()
        )
    }
}
