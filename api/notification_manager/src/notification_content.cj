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

import ohos.labels.*
import ohos.ffi.*
import ohos.image.*
import ohos.base.*

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationContent {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var notificationContentType: ContentType
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var normal: Option<NotificationBasicContent> = None
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var longText: Option<NotificationLongTextContent> = None
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var multiLine: Option<NotificationMultiLineContent> = None
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var picture: Option<NotificationPictureContent> = None
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var systemLiveView: Option<NotificationSystemLiveViewContent> = None

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        notificationContentType: ContentType,
        normal!: Option<NotificationBasicContent> = None,
        longText!: Option<NotificationLongTextContent> = None,
        multiLine!: Option<NotificationMultiLineContent> = None
    ) {
        this.notificationContentType = notificationContentType
        this.normal = normal
        this.longText = longText
        this.multiLine = multiLine
    }

    func toCNotificationContent(): CNotificationContent {
        unsafe {
            var cContent = CNotificationContent()
            cContent.notificationContentType = notificationContentType.getValue()
            try {
                if (let Some(content) <- normal) {
                    cContent.normal = safeMalloc<CNotificationBasicContent>()
                    cContent.normal.write(content.toCNotificationBasicContent())
                }

                if (let Some(text) <- longText) {
                    cContent.longText = safeMalloc<CNotificationLongTextContent>()
                    cContent.longText.write(text.toCNotificationLongTextContent())
                }

                if (let Some(line) <- multiLine) {
                    cContent.multiLine = safeMalloc<CNotificationMultiLineContent>()
                    cContent.multiLine.write(line.toCNotificationMultiLineContent())
                }

                if (let Some(pic) <- picture) {
                    cContent.picture = safeMalloc<CNotificationPictureContent>()
                    cContent.picture.write(pic.toCNotificationPictureContent())
                }

                if (let Some(sys) <- systemLiveView) {
                    cContent.systemLiveView = safeMalloc<CNotificationSystemLiveViewContent>()
                    cContent.systemLiveView.write(sys.toCNotificationSystemLiveViewContent())
                }
            } catch (e: Exception) {
                cContent.free()
                throw e
            }

            return cContent
        }
    }
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public open class NotificationBasicContent {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var title: String
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var text: String
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var additionalText: String = ""
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var lockscreenPicture: Option<PixelMap> = None

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        title: String,
        text: String
    ) {
        this.title = title
        this.text = text
    }

    func toCNotificationBasicContent(): CNotificationBasicContent {
        var basicContent = CNotificationBasicContent()
        if (let Some(pix) <- lockscreenPicture) {
            basicContent.lockscreenPicture = pix.getID()
        }
        try {
            unsafe {
                basicContent.title = LibC.mallocCString(title)
                basicContent.text = LibC.mallocCString(text)
                basicContent.additionalText = LibC.mallocCString(additionalText)
            }
        } catch (e: Exception) {
            basicContent.free()
            throw e
        }
        return basicContent
    }
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationLongTextContent <: NotificationBasicContent {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var longText: String
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var briefText: String
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var expandedTitle: String

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        title: String,
        text: String,
        longText: String,
        briefText: String,
        expandedTitle: String
    ) {
        super(title, text)
        this.longText = longText
        this.briefText = briefText
        this.expandedTitle = expandedTitle
    }

    func toCNotificationLongTextContent(): CNotificationLongTextContent {
        var longTxtContent = CNotificationLongTextContent()
        if (let Some(pix) <- lockscreenPicture) {
            longTxtContent.lockscreenPicture = pix.getID()
        }
        try {
            unsafe {
                longTxtContent.title = LibC.mallocCString(title)
                longTxtContent.text = LibC.mallocCString(text)
                longTxtContent.additionalText = LibC.mallocCString(additionalText)
                longTxtContent.longText = LibC.mallocCString(longText)
                longTxtContent.briefText = LibC.mallocCString(briefText)
                longTxtContent.expandedTitle = LibC.mallocCString(expandedTitle)
            }
        } catch (e: Exception) {
            longTxtContent.free()
            throw e
        }
        return longTxtContent
    }
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationMultiLineContent <: NotificationBasicContent {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var briefText: String
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var longTitle: String
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var lines: Array<String>

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        title: String,
        text: String,
        briefText: String,
        longTitle: String,
        lines: Array<String>
    ) {
        super(title, text)
        this.briefText = briefText
        this.longTitle = longTitle
        this.lines = lines
    }

    func toCNotificationMultiLineContent(): CNotificationMultiLineContent {
        var multiLineContent = CNotificationMultiLineContent()
        if (let Some(pix) <- lockscreenPicture) {
            multiLineContent.lockscreenPicture = pix.getID()
        }
        try {
            unsafe {
                multiLineContent.title = LibC.mallocCString(title)
                multiLineContent.text = LibC.mallocCString(text)
                multiLineContent.additionalText = LibC.mallocCString(additionalText)
                multiLineContent.briefText = LibC.mallocCString(briefText)
                multiLineContent.longTitle = LibC.mallocCString(longTitle)
                multiLineContent.lines = toArrayCString(lines)
            }
        } catch (e: Exception) {
            multiLineContent.free()
            throw e
        }
        return multiLineContent
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationPictureContent <: NotificationBasicContent {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var briefText: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var expandedTitle: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var picture: PixelMap

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(
        title: String,
        text: String,
        briefText: String,
        expandedTitle: String,
        picture: PixelMap
    ) {
        super(title, text)
        this.briefText = briefText
        this.expandedTitle = expandedTitle
        this.picture = picture
    }

    func toCNotificationPictureContent(): CNotificationPictureContent {
        var pictureContent = CNotificationPictureContent()
        if (let Some(pix) <- lockscreenPicture) {
            pictureContent.lockscreenPicture = pix.getID()
        }
        pictureContent.picture = picture.getID()
        try {
            unsafe {
                pictureContent.title = LibC.mallocCString(title)
                pictureContent.text = LibC.mallocCString(text)
                pictureContent.additionalText = LibC.mallocCString(additionalText)
                pictureContent.briefText = LibC.mallocCString(briefText)
                pictureContent.expandedTitle = LibC.mallocCString(expandedTitle)
            }
        } catch (e: Exception) {
            pictureContent.free()
            throw e
        }
        return pictureContent
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationSystemLiveViewContent <: NotificationBasicContent {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var typeCode: Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var capsule: Option<NotificationCapsule> = None
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var button: Option<NotificationButton> = None
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var time: Option<NotificationTime> = None
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public var progress: Option<NotificationProgress> = None

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public init(title: String, text: String, typeCode: Int32) {
        super(title, text)
        this.typeCode = typeCode
    }

    func toCNotificationSystemLiveViewContent(): CNotificationSystemLiveViewContent {
        var sysLiveViewContent = CNotificationSystemLiveViewContent()
        if (let Some(pix) <- lockscreenPicture) {
            sysLiveViewContent.lockscreenPicture = pix.getID()
        }
        sysLiveViewContent.typeCode = typeCode
        try {
            unsafe {
                sysLiveViewContent.title = LibC.mallocCString(title)
                sysLiveViewContent.text = LibC.mallocCString(text)
                sysLiveViewContent.additionalText = LibC.mallocCString(additionalText)
                sysLiveViewContent.capsule = if (let Some(capsule) <- capsule) {
                    capsule.toCNotificationCapsule()
                } else {
                    NotificationCapsule().toCNotificationCapsule()
                }
                sysLiveViewContent.button = if (let Some(button) <- button) {
                    button.toCNotificationButton()
                } else {
                    NotificationButton().toCNotificationButton()
                }
                if (let Some(time) <- time) {
                    sysLiveViewContent.time = time.toCNotificationTime()
                }
                if (let Some(progress) <- progress) {
                    sysLiveViewContent.progress = progress.toCNotificationProgress()
                }
            }
        } catch (e: Exception) {
            sysLiveViewContent.free()
            throw e
        }
        return sysLiveViewContent
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationCapsule {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public NotificationCapsule(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public var title!: String = "",
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public var icon!: Option<PixelMap> = None,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public var backgroundColor!: String = ""
    ) {}

    func toCNotificationCapsule(): CNotificationCapsule {
        var capsule = CNotificationCapsule()
        if (let Some(v) <- icon) {
            capsule.icon = v.getID()
        }
        try {
            unsafe {
                capsule.title = LibC.mallocCString(title)
                capsule.backgroundColor = LibC.mallocCString(backgroundColor)
            }
        } catch (e: Exception) {
            capsule.free()
            throw e
        }
        return capsule
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationButton {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public NotificationButton(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public var names!: Array<String> = [],
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public var icons!: Array<PixelMap> = []
    ) {}

    func toCNotificationButton(): CNotificationButton {
        var button = CNotificationButton()
        try {
            let convert = {p: PixelMap => p.getID()}
            unsafe {
                button.names = toArrayCString(names)
                button.icons = CArrI64(cjArr2CArr<PixelMap, Int64>(icons, convert), icons.size)
            }
        } catch (e: Exception) {
            button.free()
            throw e
        }
        return button
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationTime {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public NotificationTime(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public var initialTime!: Int32 = 0,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public var isCountDown!: Bool = false,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public var isPaused!: Bool = false,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public var isInTitle!: Bool = false
    ) {}

    func toCNotificationTime(): CNotificationTime {
        CNotificationTime(initialTime, isCountDown, isPaused, isInTitle)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.Notification"
]
public class NotificationProgress {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Notification.Notification"
    ]
    public NotificationProgress(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public var maxValue!: Int32 = 0,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public var currentValue!: Int32 = 0,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Notification.Notification"
        ]
        public var isPercentage!: Bool = false
    ) {}

    func toCNotificationProgress(): CNotificationProgress {
        CNotificationProgress(maxValue, currentValue, isPercentage)
    }
}
