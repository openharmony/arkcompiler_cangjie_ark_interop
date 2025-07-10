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

import ohos.base.*
import ohos.ffi.*
import std.collection.ArrayList

foreign {
    func FfiAccIsOpenAccessibility(errorCode: CPointer<Int32>): Bool

    func FfiAccIsOpenTouchGuide(errorCode: CPointer<Int32>): Bool

    func FfiAccIsScreenReaderOpen(errorCode: CPointer<Int32>): Bool

    func FfiAccGetAccessibilityExtensionList(cAbilityType: CString, cStateType: CString, errorCode: CPointer<Int32>): CArrAccessibilityAbilityInfo

    func FfiAccEventInfoInit(ctype: CString, cBundleName: CString, cTrigger: CString, errorCode: CPointer<Int32>): CEventInfo

    func FfiAccSendAccessibilityEvent(event: CEventInfo, errorCode: CPointer<Int32>): Unit

    func FfiAccOn(cbType: CString, id: Int64, errorCode: CPointer<Int32>): Unit
}

@C
struct CAccessibilityAbilityInfo {
    var id_: CString = CString(CPointer())
    var name_: CString = CString(CPointer())
    var bundleName_: CString = CString(CPointer())
    var targetBundleNames_: CArrString = CArrString(CPointer<CString>(), 0)
    var abilityTypes_: CArrString = CArrString(CPointer<CString>(), 0)
    var capabilities_: CArrString = CArrString(CPointer<CString>(), 0)
    var description_: CString = CString(CPointer())
    var eventTypes_: CArrString = CArrString(CPointer<CString>(), 0)
    var needHide_: Bool = false
    var label_: CString = CString(CPointer())

    func free() {
        unsafe {
            LibC.free(id_)
            LibC.free(name_)
            LibC.free(bundleName_)
            targetBundleNames_.free()
            abilityTypes_.free()
            capabilities_.free()
            LibC.free(description_)
            eventTypes_.free()
            LibC.free(label_)
        }
    }
}

@C
struct CArrAccessibilityAbilityInfo {
    CArrAccessibilityAbilityInfo(let head: CPointer<CAccessibilityAbilityInfo>, let size: Int64) {}
    
    func free() {
        unsafe {
            if (head.isNotNull()) {
                for (i in 0..size) {
                    head.read(i).free()
                }
                LibC.free<CAccessibilityAbilityInfo>(head)
            }
        }
    }
}

@C
struct CEventInfo {
    var type_: CString = CString(CPointer())
    var windowUpdateType_: CString = CString(CPointer())
    var bundleName_: CString = CString(CPointer())
    var componentType_: CString = CString(CPointer())
    var pageId_: Int32
    var description_: CString = CString(CPointer())
    var triggerAction_: CString = CString(CPointer())
    var textMoveUnit_: CString = CString(CPointer())
    var contents_: CArrString = CArrString(CPointer<CString>(), 0)
    var lastContent_: CString = CString(CPointer())
    var beginIndex_: Int32
    var currentIndex_: Int32
    var endIndex_: Int32
    var itemCount_: Int32
    var elementId_: Int64
    var textAnnouncedForAccessibility_: CString = CString(CPointer())
    var customId_: CString = CString(CPointer())

    init(data: EventInfo) {
        try {
            unsafe {
                this.type_ = LibC.mallocCString(data.`type`.value)
                this.windowUpdateType_ = LibC.mallocCString(data.windowUpdateType?.value ?? "")
                this.bundleName_ = LibC.mallocCString(data.bundleName)
                this.componentType_ = LibC.mallocCString(data.componentType ?? "")
                this.pageId_ = data.pageId ?? 0
                this.description_ = LibC.mallocCString(data.description ?? "")
                this.triggerAction_ = LibC.mallocCString(data.triggerAction.value)
                this.textMoveUnit_ = LibC.mallocCString(data.textMoveUnit?.value ?? "char")
                this.contents_ = toArrayCString(data.contents ?? Array<String>())
                this.lastContent_ = LibC.mallocCString(data.lastContent ?? "")
                this.beginIndex_ = data.beginIndex ?? 0
                this.currentIndex_ = data.currentIndex ?? 0
                this.endIndex_ = data.endIndex ?? 0
                this.itemCount_ = data.itemCount ?? 0
                this.elementId_ = data.elementId ?? 0
                this.textAnnouncedForAccessibility_ = LibC.mallocCString(data.textAnnouncedForAccessibility ?? "")
                this.customId_ = LibC.mallocCString(data.customId ?? "")
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(type_)
                LibC.free(windowUpdateType_)
                LibC.free(bundleName_)
                LibC.free(componentType_)
                LibC.free(description_)
                LibC.free(triggerAction_)
                LibC.free(textMoveUnit_)
                LibC.free(lastContent_)
                LibC.free(textAnnouncedForAccessibility_)
                LibC.free(customId_)
                contents_.free()
            }
            throw BusinessException(ERR_PARAMETER_ERROR, e.toString())
        }
    }
    func free() {
        unsafe {
            LibC.free(type_)
            LibC.free(windowUpdateType_)
            LibC.free(bundleName_)
            LibC.free(componentType_)
            LibC.free(description_)
            LibC.free(triggerAction_)
            LibC.free(textMoveUnit_)
            LibC.free(lastContent_)
            LibC.free(textAnnouncedForAccessibility_)
            LibC.free(customId_)
            contents_.free()
        }
    }
}
