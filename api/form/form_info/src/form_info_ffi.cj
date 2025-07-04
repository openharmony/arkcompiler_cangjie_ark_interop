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

package ohos.form.form_info

import std.collection.HashMap
import ohos.ffi.{CArrI32, CArrUI32, cArr2cjArr}

@C
protected struct CFormFilter {
    protected CFormFilter(protected let moduleName: CString) {}
}

@C
protected struct CFormCustomizeData {
    protected CFormCustomizeData(
        protected let name: CString,
        protected let value: CString
    ) {}
}

@C
protected struct CArrCFormCustomizeData {
    protected CArrCFormCustomizeData(
        protected let head: CPointer<CFormCustomizeData>,
        protected let size: Int64
    ) {}
}

@C
protected struct CFormInfo {
    protected CFormInfo(
        protected let bundleName: CString,
        protected let moduleName: CString,
        protected let abilityName: CString,
        protected let name: CString,
        protected let displayName: CString,
        protected let displayNameId: UInt32,
        protected let description: CString,
        protected let descriptionId: UInt32,
        protected let formType: Int32,
        protected let jsComponentName: CString,
        protected let colorMode: Int32,
        protected let isDefault: Bool,
        protected let updateEnabled: Bool,
        protected let formVisibleNotify: Bool,
        protected let scheduledUpdateTime: CString,
        protected let formConfigAbility: CString,
        protected let updateDuration: Int32,
        protected let defaultDimension: Int32,
        protected let supportDimensions: CArrI32,
        protected let customizeData: CArrCFormCustomizeData,
        protected let isDynamic: Bool,
        protected let transparencyEnabled: Bool,
        protected let supportedShapes: CArrI32,
        protected let previewImages: CArrUI32,
        protected let enableBlurBackground: Bool,
        protected let renderingMode: Int32
    ) {}
}

protected func cFormInfo2FormInfo(cFormInfo: CFormInfo): FormInfo {
    let cSupportDimensionsSize = cFormInfo.supportDimensions.size
    let cSupportDimensionsHead = cFormInfo.supportDimensions.head
    let cjSupportDimensions = unsafe {
        cArr2cjArr<Int32, Int32>(cSupportDimensionsSize, cSupportDimensionsHead) {
            i => i
        }
    }
    let cSupportedShapesSize = cFormInfo.supportedShapes.size
    let cSupportedShapesHead = cFormInfo.supportedShapes.head
    let cjSupportedShapes = unsafe {
        cArr2cjArr<Int32, Int32>(cSupportedShapesSize, cSupportedShapesHead) {
            i => i
        }
    }
    let cPreviewImagesSize = cFormInfo.previewImages.size
    let cPreviewImagesHead = cFormInfo.previewImages.head
    let cjPreviewImages = unsafe {
        cArr2cjArr<UInt32, UInt32>(cPreviewImagesSize, cPreviewImagesHead) {
            i => i
        }
    }
    let cCustomizeDataSize = cFormInfo.customizeData.size
    let cCustomizeDataHead = cFormInfo.customizeData.head
    let cjCustomizeData = if (cCustomizeDataSize == 0 || cCustomizeDataHead.isNull()) {
        HashMap<String, String>(0)
    } else {
        HashMap<String, String>(cCustomizeDataSize) {
            i => unsafe {
                let cFormCustomizeData = cCustomizeDataHead.read(i)
                (cFormCustomizeData.name.toString(), cFormCustomizeData.value.toString())
            }
        }
    }
    return FormInfo(
        cFormInfo.bundleName.toString(),
        cFormInfo.moduleName.toString(),
        cFormInfo.abilityName.toString(),
        cFormInfo.name.toString(),
        cFormInfo.displayName.toString(),
        cFormInfo.displayNameId,
        cFormInfo.description.toString(),
        cFormInfo.descriptionId,
        cFormInfo.formType,
        cFormInfo.jsComponentName.toString(),
        cFormInfo.colorMode,
        cFormInfo.isDefault,
        cFormInfo.updateEnabled,
        cFormInfo.formVisibleNotify,
        cFormInfo.scheduledUpdateTime.toString(),
        cFormInfo.formConfigAbility.toString(),
        cFormInfo.updateDuration,
        cFormInfo.defaultDimension,
        cjSupportDimensions,
        cjCustomizeData,
        cFormInfo.isDynamic,
        cFormInfo.transparencyEnabled,
        cjSupportedShapes
    )
}

@C
protected struct CArrCFormInfo {
    protected CArrCFormInfo(
        protected let head: CPointer<CFormInfo>,
        protected let size: Int64
    ) {}
}
