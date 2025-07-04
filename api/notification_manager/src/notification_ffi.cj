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
import ohos.image.*
import ohos.base.*

foreign {
    func FfiOHOSNotificationManagerPublishV2(request: CNotificationRequestV2): Int32

    func FfiOHOSNotificationManagerCancelV2(id: Int32, label: CString): Int32

    func FfiOHOSNotificationManagerCancelAllV2(): Int32

    func FfiOHOSNotificationManagerAddSlotV2(cType: Int32): Int32

    func FfiOHOSNotificationManagerIsNotificationEnabledV2(): RetDataBool

    func FfiOHOSNotificationManagerSetBadgeNumberV2(badgeNumber: Int32): Int32

    func FfiOHOSNotificationManagerRequestEnableNotificationV2(): Int32

    func FfiOHOSNotificationManagerRequestEnableNotificationWithContextV2(id: Int64): Int32

    func FfiOHOSNotificationManagerIsDistributedEnabledV2(): RetDataBool

    func FfiOHOSNotificationManagerGetSlot(cType: Int32, errCode: CPointer<Int32>): CNotificationSlotV2

    func FfiOHOSNotificationManagerGetSlots(errCode: CPointer<Int32>): CArrayNotificationSlotsV2

    func FfiOHOSNotificationManagerRemoveSlot(cType: Int32): Int32

    func FfiOHOSNotificationManagerRemoveAllSlots(): Int32

    func FfiOHOSNotificationManagerGetActiveNotificationCount(): RetDataUI32

    func FfiOHOSNotificationManagerGetActiveNotifications(errCode: CPointer<Int32>): CArrayNotificationRequestV2

    func FfiOHOSNotificationManagerCancelGroup(cGroupName: CString): Int32

    func FfiOHOSNotificationManagerIsSupportTemplate(cTemplateName: CString): RetDataBool
}

@C
struct CNotificationContent {
    var notificationContentType: Int32
    var normal: CPointer<CNotificationBasicContent>
    var longText: CPointer<CNotificationLongTextContent>
    var multiLine: CPointer<CNotificationMultiLineContent>
    var picture: CPointer<CNotificationPictureContent>
    var systemLiveView: CPointer<CNotificationSystemLiveViewContent>

    init() {
        notificationContentType = 0
        normal = CPointer<CNotificationBasicContent>()
        longText = CPointer<CNotificationLongTextContent>()
        multiLine = CPointer<CNotificationMultiLineContent>()
        picture = CPointer<CNotificationPictureContent>()
        systemLiveView = CPointer<CNotificationSystemLiveViewContent>()
    }

    func free() {
        unsafe {
            if (normal.isNotNull()) {
                let normalContent = normal.read()
                normalContent.free()
            }
            LibC.free<CNotificationBasicContent>(normal)
            if (longText.isNotNull()) {
                let longTextContent = longText.read()
                longTextContent.free()
            }
            LibC.free<CNotificationLongTextContent>(longText)
            if (multiLine.isNotNull()) {
                let multiLineContent = multiLine.read()
                multiLineContent.free()
            }
            LibC.free<CNotificationMultiLineContent>(multiLine)
            if (picture.isNotNull()) {
                let pictureContent = picture.read()
                pictureContent.free()
            }
            LibC.free<CNotificationPictureContent>(picture)
            if (systemLiveView.isNotNull()) {
                let systemLiveViewContent = systemLiveView.read()
                systemLiveViewContent.free()
            }
            LibC.free<CNotificationSystemLiveViewContent>(systemLiveView)
        }
    }

    func parse(): NotificationContent {
        let _notificationContentType = ContentType.parse(notificationContentType)
        let _normal: Option<NotificationBasicContent> = if (normal.isNull()) {
            None
        } else {
            unsafe {
                let normalContent = normal.read()
                Some(normalContent.parse())
            }
        }
        let _longText: Option<NotificationLongTextContent> = if (longText.isNull()) {
            None
        } else {
            unsafe { Some(longText.read().parse()) }
        }
        let _multiLine: Option<NotificationMultiLineContent> = if (multiLine.isNull()) {
            None
        } else {
            unsafe { Some(multiLine.read().parse()) }
        }
        let _picture: Option<NotificationPictureContent> = if (picture.isNull()) {
            None
        } else {
            unsafe { Some(picture.read().parse()) }
        }
        let _systemLiveView: Option<NotificationSystemLiveViewContent> = if (systemLiveView.isNull()) {
            None
        } else {
            unsafe { Some(systemLiveView.read().parse()) }
        }

        let content = NotificationContent(_notificationContentType)
        content.normal = _normal
        content.longText = _longText
        content.multiLine = _multiLine
        content.picture = _picture
        content.systemLiveView = _systemLiveView

        return content
    }
}

@C
struct CNotificationBasicContent {
    var title: CString
    var text: CString
    var additionalText: CString
    var lockscreenPicture: Int64

    init() {
        title = CString(CPointer<UInt8>())
        text = CString(CPointer<UInt8>())
        additionalText = CString(CPointer<UInt8>())
        lockscreenPicture = -1
    }

    func free() {
        unsafe {
            LibC.free(title)
            LibC.free(text)
            LibC.free(additionalText)
        }
    }

    func parse(): NotificationBasicContent {
        let _title = this.title.toString()
        let _text = text.toString()
        let _additionalText = additionalText.toString()
        let _lockscreenPicture: Option<PixelMap> = if (lockscreenPicture == -1) {
            None
        } else {
            Some(PixelMap(lockscreenPicture))
        }
        let content = NotificationBasicContent(_title, _text)
        content.additionalText = _additionalText
        content.lockscreenPicture = _lockscreenPicture
        return content
    }
}

@C
struct CNotificationLongTextContent {
    var title: CString
    var text: CString
    var additionalText: CString
    var lockscreenPicture: Int64
    var longText: CString
    var briefText: CString
    var expandedTitle: CString

    init() {
        title = CString(CPointer<UInt8>())
        text = CString(CPointer<UInt8>())
        additionalText = CString(CPointer<UInt8>())
        lockscreenPicture = -1
        longText = CString(CPointer<UInt8>())
        briefText = CString(CPointer<UInt8>())
        expandedTitle = CString(CPointer<UInt8>())
    }

    func free() {
        unsafe {
            LibC.free(title)
            LibC.free(text)
            LibC.free(additionalText)
            LibC.free(longText)
            LibC.free(briefText)
            LibC.free(expandedTitle)
        }
    }

    func parse(): NotificationLongTextContent {
        let contentTitle = title.toString()
        let contentText = text.toString()
        let contentAdditionalText = additionalText.toString()
        let contentLongText = longText.toString()
        let contentBriefText = briefText.toString()
        let contentExpandedTitle = expandedTitle.toString()
        let contentLockscreenPicture: Option<PixelMap> = if (lockscreenPicture == -1) {
            None
        } else {
            Some(PixelMap(lockscreenPicture))
        }
        let content = NotificationLongTextContent(
            contentTitle,
            contentText,
            contentLongText,
            contentBriefText,
            contentExpandedTitle
        )
        content.lockscreenPicture = contentLockscreenPicture
        content.additionalText = contentAdditionalText
        return content
    }
}

@C
struct CNotificationMultiLineContent {
    var title: CString
    var text: CString
    var additionalText: CString
    var lockscreenPicture: Int64
    var briefText: CString
    var longTitle: CString
    var lines: CArrString

    init() {
        title = CString(CPointer<UInt8>())
        text = CString(CPointer<UInt8>())
        additionalText = CString(CPointer<UInt8>())
        lockscreenPicture = -1
        briefText = CString(CPointer<UInt8>())
        longTitle = CString(CPointer<UInt8>())
        lines = CArrString(CPointer<CString>(), 0)
    }

    func free() {
        unsafe {
            LibC.free(title)
            LibC.free(text)
            LibC.free(additionalText)
            LibC.free(briefText)
            LibC.free(longTitle)
        }
        lines.free()
    }

    func parse(): NotificationMultiLineContent {
        let _title = title.toString()
        let _text = text.toString()
        let _additionalText = additionalText.toString()
        let _briefText = briefText.toString()
        let _longTitle = longTitle.toString()
        let head = lines.head
        let size = lines.size
        let _lines = unsafe { Array<String>(size, {i => head.read(i).toString()}) }
        let _lockscreenPicture: Option<PixelMap> = if (lockscreenPicture == -1) {
            None
        } else {
            Some(PixelMap(lockscreenPicture))
        }
        let content = NotificationMultiLineContent(
            _title,
            _text,
            _briefText,
            _longTitle,
            _lines
        )
        content.lockscreenPicture = _lockscreenPicture
        content.additionalText = _additionalText
        return content
    }
}

@C
struct CNotificationPictureContent {
    var title: CString
    var text: CString
    var additionalText: CString
    var lockscreenPicture: Int64
    var briefText: CString
    var expandedTitle: CString
    var picture: Int64

    init() {
        title = CString(CPointer<UInt8>())
        text = CString(CPointer<UInt8>())
        additionalText = CString(CPointer<UInt8>())
        lockscreenPicture = -1
        briefText = CString(CPointer<UInt8>())
        expandedTitle = CString(CPointer<UInt8>())
        picture = -1
    }

    func free() {
        unsafe {
            LibC.free(title)
            LibC.free(text)
            LibC.free(additionalText)
            LibC.free(briefText)
            LibC.free(expandedTitle)
        }
    }

    func parse(): NotificationPictureContent {
        let _title = title.toString()
        let _text = text.toString()
        let _additionalText = additionalText.toString()
        let _briefText = briefText.toString()
        let _expandedTitle = expandedTitle.toString()
        let _picture = PixelMap(picture)
        let _lockscreenPicture: Option<PixelMap> = if (lockscreenPicture == -1) {
            None
        } else {
            Some(PixelMap(lockscreenPicture))
        }
        let content = NotificationPictureContent(
            _title,
            _text,
            _briefText,
            _expandedTitle,
            _picture
        )
        content.lockscreenPicture = _lockscreenPicture
        content.additionalText = _additionalText
        return content
    }
}

@C
struct CNotificationCapsule {
    var title: CString
    var icon: Int64
    var backgroundColor: CString

    init() {
        title = CString(CPointer<UInt8>())
        icon = -1
        backgroundColor = CString(CPointer<UInt8>())
    }

    func free() {
        unsafe {
            LibC.free(title)
            LibC.free(backgroundColor)
        }
    }

    func parse(): NotificationCapsule {
        let capsuleTitle = title.toString()
        let capsuleIcon: Option<PixelMap> = if (icon <= 0) {
            None
        } else {
            Some(PixelMap(icon))
        }
        let capsuleBackgroundColor = backgroundColor.toString()
        NotificationCapsule(title: capsuleTitle, icon: capsuleIcon, backgroundColor: capsuleBackgroundColor)
    }
}

@C
struct CNotificationButton {
    var names: CArrString
    var icons: CArrI64

    init() {
        names = CArrString(CPointer<CString>(), 0)
        icons = CArrI64(CPointer<Int64>(), 0)
    }

    func free() {
        unsafe {
            LibC.free(icons.head)
        }
        names.free()
    }

    func parse(): NotificationButton {
        unsafe {
            let nameSize = names.size
            let nameHead = names.head
            let names = Array<String>(nameSize, {i => nameHead.read(i).toString()})
            let iconSize = icons.size
            let iconHead = icons.head
            let icons = Array<PixelMap>(iconSize, {i => PixelMap(iconHead.read(i))})
            NotificationButton(names: names, icons: icons)
        }
    }
}

@C
struct CNotificationTime {
    CNotificationTime(
        let initialTime: Int32,
        let isCountDown: Bool,
        let isPaused: Bool,
        let isInTitle: Bool
    ) {}

    init() {
        this.initialTime = 0
        isCountDown = false
        isPaused = false
        isInTitle = false
    }

    func parse(): NotificationTime {
        NotificationTime(
            initialTime: initialTime,
            isCountDown: isCountDown,
            isPaused: isPaused,
            isInTitle: isInTitle
        )
    }
}

@C
struct CNotificationProgress {
    CNotificationProgress(
        let maxValue: Int32,
        let currentValue: Int32,
        let isPercentage: Bool
    ) {}

    init() {
        maxValue = 0
        currentValue = 0
        isPercentage = false
    }

    func parse(): NotificationProgress {
        NotificationProgress(
            maxValue: maxValue,
            currentValue: currentValue,
            isPercentage: isPercentage
        )
    }
}

@C
struct CNotificationSystemLiveViewContent {
    var title: CString
    var text: CString
    var additionalText: CString
    var lockscreenPicture: Int64
    var typeCode: Int32
    var capsule: CNotificationCapsule
    var button: CNotificationButton
    var time: CNotificationTime
    var progress: CNotificationProgress

    init() {
        title = CString(CPointer<UInt8>())
        text = CString(CPointer<UInt8>())
        additionalText = CString(CPointer<UInt8>())
        lockscreenPicture = -1
        typeCode = 0
        capsule = CNotificationCapsule()
        button = CNotificationButton()
        time = CNotificationTime()
        progress = CNotificationProgress()
    }

    func free() {
        unsafe {
            LibC.free(title)
            LibC.free(text)
            LibC.free(additionalText)
            capsule.free()
            button.free()
        }
    }

    func parse(): NotificationSystemLiveViewContent {
        let contentTitle = title.toString()
        let contentText = text.toString()
        let contentAdditionalText = additionalText.toString()
        let contentCapsule = capsule.parse()
        let contentButton = button.parse()
        let contentTime = time.parse()
        let contentProgress = progress.parse()
        let contentLockscreenPicture: Option<PixelMap> = if (lockscreenPicture == -1) {
            None
        } else {
            Some(PixelMap(lockscreenPicture))
        }
        let content = NotificationSystemLiveViewContent(
            contentTitle,
            contentText,
            typeCode
        )
        content.additionalText = contentAdditionalText
        content.lockscreenPicture = contentLockscreenPicture
        content.capsule = contentCapsule
        content.button = contentButton
        content.time = contentTime
        content.progress = contentProgress
        return content
    }
}

@C
struct CNotificationRequestV2 {
    CNotificationRequestV2(
        var content: CNotificationContent,
        let id: Int32,
        let notificationSlotType: Int32,
        let isOngoing: Bool,
        let isUnremovable: Bool,
        let deliveryTime: Int64,
        let tapDismissed: Bool,
        let autoDeletedTime: Int64,
        let color: UInt32,
        let colorEnabled: Bool,
        let isAlertOnce: Bool,
        let isStopwatch: Bool,
        let isCountDown: Bool,
        let isFloatingIcon: Bool,
        var label: CString,
        let badgeIconStyle: Int32,
        let showDeliveryTime: Bool,
        var smallIcon: Int64,
        var largeIcon: Int64,
        var creatorBundleName: CString,
        let creatorUid: Int32,
        let creatorPid: Int32,
        let creatorUserId: Int32,
        var hashCode: CString,
        var groupName: CString,
        var distributedOption: CPointer<CDistributedOptions>,
        var notificationFlags: CNotificationFlags,
        let badgeNumber: UInt32,
        var appMessageId: CString
    ) {}

    func free() {
        content.free()
        unsafe {
            LibC.free(label)
            LibC.free(creatorBundleName)
            LibC.free(groupName)
            LibC.free(appMessageId)
            LibC.free(hashCode)
            if (!distributedOption.isNull()) {
                let cDistributedOption = distributedOption.read()
                cDistributedOption.free()
            }
            LibC.free<CDistributedOptions>(distributedOption)
        }
    }
}

@C
struct CArrayNotificationRequestV2 {
    CArrayNotificationRequestV2(
        let head: CPointer<CPointer<CNotificationRequestV2>>,
        let size: Int64
    ) {}

    func free() {
        if (head.isNotNull()) {
            unsafe {
                for (i in 0..size) {
                    head.read(i).read().free()
                }
                LibC.free<CPointer<CNotificationRequestV2>>(head)
            }
        }
    }
}

@C
struct CDistributedOptions {
    var isDistributed: Bool
    var supportDisplayDevices: CArrString
    var supportOperateDevices: CArrString

    init() {
        isDistributed = false
        supportDisplayDevices = CArrString(CPointer<CString>(), 0)
        supportOperateDevices = CArrString(CPointer<CString>(), 0)
    }

    func free() {
        supportDisplayDevices.free()
        supportOperateDevices.free()
    }
}

@C
struct CNotificationFlags {
    CNotificationFlags(
        let soundEnabled: Int32,
        let vibrationEnabled: Int32
    ) {}
}

@C
struct CNotificationSlotV2 {
    CNotificationSlotV2(
        let notificationType: Int32,
        let level: Int32,
        let desc: CString,
        let badgeFlag: Bool,
        let bypassDnd: Bool,
        let lockscreenVisibility: Int32,
        let vibrationEnabled: Bool,
        let sound: CString,
        let lightEnabled: Bool,
        let lightColor: Int32,
        let vibrationValues: CArrI64,
        let enableded: Bool
    ) {}

    func free() {
        unsafe {
            LibC.free(desc)
            LibC.free(sound)
            if (!vibrationValues.head.isNull()) {
                LibC.free(vibrationValues.head)
            }
        }
    }
}

@C
struct CArrayNotificationSlotsV2 {
    CArrayNotificationSlotsV2(
        let head: CPointer<CNotificationSlotV2>,
        let size: Int64
    ) {}

    func free() {
        if (head.isNotNull()) {
            unsafe {
                for (i in 0..size) {
                    head.read(i).free()
                }
                LibC.free<CNotificationSlotV2>(head)
            }
        }
    }
}
