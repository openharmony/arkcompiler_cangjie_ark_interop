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
 * Indicates the info of accessibility.
 *
 * @typedef AccessibilityAbilityInfo
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public class AccessibilityAbilityInfo {
    let id_: String
    let name_: String
    let bundleName_: String
    let targetBundleNames_: Array<String>
    let abilityTypes_: Array<AbilityType>
    let capabilities_: Array<Capability>
    let description_: String
    let eventTypes_: Array<EventType>
    let needHide_: Bool
    let label_: String

    init(cInfo: CAccessibilityAbilityInfo) {
        id_ = cInfo.id_.toString()
        name_ = cInfo.name_.toString()
        bundleName_ = cInfo.bundleName_.toString()
        description_ = cInfo.description_.toString()
        needHide_ = cInfo.needHide_
        label_ = cInfo.label_.toString()
        // array
        unsafe {
            targetBundleNames_ = cInfo.targetBundleNames_.toStringArray()
            abilityTypes_ = cArr2cjArr<CString, AbilityType>(cInfo.abilityTypes_.size, cInfo.abilityTypes_.head,
                {cstr => AbilityType.parse(cstr.toString())})
            capabilities_ = cArr2cjArr<CString, Capability>(cInfo.capabilities_.size, cInfo.capabilities_.head,
                {cstr => Capability.parse(cstr.toString())})
            eventTypes_ = cArr2cjArr<CString, EventType>(cInfo.eventTypes_.size, cInfo.eventTypes_.head,
                {cstr => EventType.parse(cstr.toString())})
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public prop id: String {
        get() {
            return this.id_
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public prop name: String {
        get() {
            return this.name_
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public prop bundleName: String {
        get() {
            return this.bundleName_
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public prop targetBundleNames: Array<String> {
        get() {
            return this.targetBundleNames_
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public prop abilityTypes: Array<AbilityType> {
        get() {
            return this.abilityTypes_
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public prop capabilities: Array<Capability> {
        get() {
            return this.capabilities_
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public prop description: String {
        get() {
            return this.description_
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public prop eventTypes: Array<EventType> {
        get() {
            return this.eventTypes_
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public prop needHide: Bool {
        get() {
            return this.needHide_
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Core"
    ]
    public prop label: String {
        get() {
            return this.label_
        }
    }
}

/**
 * Indicates the style of captions.
 *
 * @typedef CaptionsStyle
 * @syscap SystemCapability.BarrierFree.Accessibility.Hearing
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
]
public class CaptionsStyle {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
    ]
    public CaptionsStyle(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
        ]
        public var fontFamily: CaptionsFontFamily,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
        ]
        public var fontScale: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
        ]
        public var fontColor: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
        ]
        public var fontEdgeType: CaptionsFontEdgeType,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
        ]
        public var backgroundColor: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.BarrierFree.Accessibility.Hearing"
        ]
        public var windowColor: UInt32
    ) {}
}

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

/**
 * Indicates the point of the gesture.
 *
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public class GesturePoint {
    var positionX: Float32
    var positionY: Float32
    init(x: Float32, y: Float32) {
        positionX = x
        positionY = y
    }
}

/**
 * Indicates the path of the gesture.
 *
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public class GesturePath {
    var points: Array<GesturePoint>
    var durationTime: Int64
    init(p: Array<GesturePoint>, time: Int64) {
        this.points = p
        this.durationTime = time
    }
}

/**
 * Checks whether accessibility ability is enabled.
 *
 * @returns { Bool } Returns true if the accessibility is enabled; returns false otherwise.
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 * @atomicservice
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public func isOpenAccessibility(): Bool {
    var errorCode = SUCCESS_CODE
    var isOpenAcc: Bool
    unsafe { isOpenAcc = FfiAccIsOpenAccessibility(inout errorCode) }
    checkRet(errorCode, "[Accessibility] isOpenAccessibility")
    return isOpenAcc
}

/**
 * Checks touch browser ability (which is used by talkback) is enabled.
 *
 * @returns { Bool } Returns true if the touch browser is enabled; returns false otherwise.
 * @syscap SystemCapability.BarrierFree.Accessibility.Vision
 * @atomicservice
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Vision"
]
public func isOpenTouchGuide(): Bool {
    var errorCode = SUCCESS_CODE
    var isOpenTouch: Bool
    unsafe { isOpenTouch = FfiAccIsOpenTouchGuide(inout errorCode) }
    checkRet(errorCode, "[Accessibility] isOpenTouchGuide")
    return isOpenTouch
}

/**
 * Checks screen reader ability (which is used by talkback) is enabled.
 * @returns { Bool } Returns true if the screen reader is enabled; return false otherwise.
 * @syscap syscap SystemCapability.BarrierFree.Accessibility.Vision
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Vision"
]
public func isScreenReaderOpen(): Bool {
    var errorCode = SUCCESS_CODE
    var isScreenOpen: Bool
    unsafe { isScreenOpen = FfiAccIsScreenReaderOpen(inout errorCode) }
    checkRet(errorCode, "[Accessibility] isOpenTouchGuide")
    return isScreenOpen
}

/**
 * Queries the list of accessibility abilities.
 *
 * @param { AbilityType } abilityType The type of the accessibility ability. {@code AbilityType} eg.spoken
 * @param { AbilityState } stateType The state of the accessibility ability.  {@code AbilityState} eg.installed
 * @returns { Promise<Array<AccessibilityAbilityInfo>> } Returns the list of abilityInfos.
 * @throws { BusinessError } 401 - Input parameter error. Possible causes:
 *     1. Mandatory parameters are left unspecified;
 *     2. Incorrect parameter types;
 *     3. Parameter verification failed.
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public func getAccessibilityExtensionList(abilityType: AbilityType, stateType: AbilityState): Array<AccessibilityAbilityInfo> {
    var errorCode = SUCCESS_CODE
    var accExtensionList: Array<AccessibilityAbilityInfo> = Array<AccessibilityAbilityInfo>()
    try (
        cAbilityType = unsafe { LibC.mallocCString(abilityType.value).asResource() },
        cStateType = unsafe { LibC.mallocCString(stateType.value).asResource()}
    ) {
        let cAccExtensionList = unsafe {
            FfiAccGetAccessibilityExtensionList(cAbilityType.value, cStateType.value, inout errorCode)
        }
        accExtensionList = cAccExtensionList.toArrAccessibilityAbilityInfo()
        cAccExtensionList.free()
        checkRet(errorCode, "[Accessibility] getAccessibilityExtensionList")
    }
    return accExtensionList
}

/**
 * Send accessibility event.
 *
 * @param { EventInfo } event The object of the accessibility {@code EventInfo} .
 * @returns { Promise<void> } Returns {@code true} if success ; returns {@code false} otherwise.
 * @throws { BusinessError } 401 - Input parameter error. Possible causes:
 *     1. Mandatory parameters are left unspecified;
 *     2. Incorrect parameter types;
 *     3. Parameter verification failed.
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public func sendAccessibilityEvent(event: EventInfo): Unit {
    var errorCode = SUCCESS_CODE
    unsafe {
        var cEvent: CEventInfo = CEventInfo(event)
        FfiAccSendAccessibilityEvent(cEvent, inout errorCode)
        cEvent.free()
        checkRet(errorCode, "[Accessibility] sendAccessibilityEvent")
    }
}

private let MAP_MUTEX = Mutex()
private let LIST_MUTEX = Mutex()
private let CALLBACK_MAP = HashMap<AccCallBackType, ArrayList<CallbackObject>>()
private let REGISTER_MAP = HashMap<AccCallBackType, AtomicBool>(
    [(ACCCALLBACKTYPE_ACCESSIBILITYSTATECHANGE, AtomicBool(false)),
        (ACCCALLBACKTYPE_TOUCHGUIDESTATECHANGE, AtomicBool(false))])

/**
 * Register the observe of the accessibility state changed.
 *
 * @param { AccCallBackType } type state event type.
 * @param { Callback<Bool> } callback Asynchronous callback interface.
 * @throws { BusinessError } 401 - Input parameter error. Possible causes:
 *     1. Mandatory parameters are left unspecified;
 *     2. Incorrect parameter types;
 *     3. Parameter verification failed.
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public func on(`type`: AccCallBackType, callback: Callback1Argument<Bool>): Unit {
    if (REGISTER_MAP[`type`].compareAndSwap(false, true)) {
        register(`type`, argWrapper1(`type`))
    } else {
        if (findCallbackObject(`type`, callback) >= 0) {
            ACC_LOG.info("The ${`type`} is registered, no need to re-registered")
            return
        }
    }
    synchronized(MAP_MUTEX) {
        CALLBACK_MAP.addIfAbsent(`type`, ArrayList<CallbackObject>())
        synchronized(LIST_MUTEX) {
            CALLBACK_MAP[`type`].add(callback)
        }
    }
}

private func register(callbackType: AccCallBackType, id: Int64) {
    synchronized(MAP_MUTEX) {
        try (cbType = unsafe { LibC.mallocCString(callbackType.value).asResource() }) {
            var errorCode = SUCCESS_CODE
            unsafe { FfiAccOn(cbType.value, id, inout errorCode) }
            checkRet(errorCode, "[Accessibility] register")
        }
    }
}

private func argWrapper1(callbackType: AccCallBackType): Int64 {
    let wrapper = {
        ctype: Bool =>
        let cjType: Bool = ctype
        let callbackList = synchronized(MAP_MUTEX) {
            CALLBACK_MAP.get(callbackType) ?? ArrayList<CallbackObject>()
        }
        for (caller in callbackList) {
            (caller as Callback1Argument<Bool>)?.invoke(cjType)
        }
    }
    let registerCall = Callback1Param<Bool, Unit>(wrapper)
    registerCall.getID()
}

private func findCallbackObject(callbackType: AccCallBackType, callback: CallbackObject, remove!: Bool = false): Int64 {
    let callbackList = CALLBACK_MAP.get(callbackType) ?? return -1
    for (idx in 0..callbackList.size) {
        if (refEq(callback, callbackList[idx])) {
            if (remove) {
                callbackList.remove(at: idx)
            }
            return idx
        }
    }
    return -1
}

/**
 * Unregister the observe of the accessibility state changed.
 *
 * @param { AccCallBackType } type state event type
 * @param { Callback<Bool> } callback Asynchronous callback interface.
 * @throws { BusinessError } 401 - Input parameter error. Possible causes:
 *     1. Mandatory parameters are left unspecified;
 *     2. Incorrect parameter types;
 *     3. Parameter verification failed.
 * @syscap SystemCapability.BarrierFree.Accessibility.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.BarrierFree.Accessibility.Core"
]
public func off(`type`: AccCallBackType): Unit {
    if (!CALLBACK_MAP.contains(`type`)) {
        return
    }
    CALLBACK_MAP[`type`].clear()
    return
}
