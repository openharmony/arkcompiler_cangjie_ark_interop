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

package ohos.accessibility

import std.deriving.*
import ohos.hilog.*
import ohos.ffi.*
import std.sync.Mutex
import std.sync.AtomicBool
import std.collection.ArrayList
import std.collection.HashMap
import ohos.labels.*
import ohos.base.*

const LOG_CORE: UInt32 = 0
const LOG_TAG_DOMAIN_ID_ACC: UInt32 = 0xD001D05
let ACC_LOG = HilogChannel(LOG_CORE, LOG_TAG_DOMAIN_ID_ACC, "cj_accessibility_ffi")

/**
 * Indicates the info of events.
 *
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public class EventInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var `type`: EventType
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var windowUpdateType: ?WindowUpdateType
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var bundleName: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var componentType: ?String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var pageId: ?Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var description: ?String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var triggerAction: Action
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var textMoveUnit: ?TextMoveUnit
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var contents: ?Array<String>
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var lastContent: ?String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var beginIndex: ?Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var currentIndex: ?Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var endIndex: ?Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var itemCount: ?Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var elementId: ?Int64
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var textAnnouncedForAccessibility: ?String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public var customId: ?String

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public init(`type`!: EventType, bundleName!: String, triggerAction!: Action) {
        var cEventInfo: CEventInfo
        var errorCode = SUCCESS_CODE
        let cType = unsafe { LibC.mallocCString(`type`.value) }
        let cBundleName = unsafe { LibC.mallocCString(bundleName) }
        let cTriggerAction = unsafe { LibC.mallocCString(triggerAction.value) }
        unsafe {
            cEventInfo = FfiAccEventInfoInit(
                cType,
                cBundleName,
                cTriggerAction,
                inout errorCode
            )
            LibC.free(cType)
            LibC.free(cBundleName)
            LibC.free(cTriggerAction)
        }
        checkRet(errorCode, "[Accessibility] FfiAccEventInfoInit")
        this.`type` = EventType.parse(cEventInfo.type_.toString())
        this.windowUpdateType = WindowUpdateType.parse(cEventInfo.windowUpdateType_.toString())
        this.bundleName = cEventInfo.bundleName_.toString()
        this.componentType = cEventInfo.componentType_.toString()
        this.pageId = cEventInfo.pageId_
        this.description = cEventInfo.description_.toString()
        this.triggerAction = Action.parse(cEventInfo.triggerAction_.toString())
        this.textMoveUnit = TextMoveUnit.parse(cEventInfo.textMoveUnit_.toString())
        this.contents = cEventInfo.contents_.toStringArray()
        this.lastContent = cEventInfo.lastContent_.toString()
        this.beginIndex = cEventInfo.beginIndex_
        this.currentIndex = cEventInfo.currentIndex_
        this.endIndex = cEventInfo.endIndex_
        this.itemCount = cEventInfo.itemCount_
        this.elementId = cEventInfo.elementId_
        this.textAnnouncedForAccessibility = cEventInfo.textAnnouncedForAccessibility_.toString()
        this.customId = cEventInfo.customId_.toString()
        cEventInfo.free()
    }
}
