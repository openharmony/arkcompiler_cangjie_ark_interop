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

package ohos.ability

import ohos.base.*
import ohos.image.{CPackingOptionV2, PackingOption, PixelMap}
import ohos.labels.*

foreign {
    func FFIPhotoExtAbilityGetContext(extAbility: ExtAbilityHandle, id: CPointer<Int64>): Int32

    func FFIPhotoExtCtxSaveEditedContentWithUri(id: Int64, uri: CString, wantHandle: WantHandle): Int32

    func FFIPhotoExtCtxSaveEditedContentWithImage(id: Int64, imageId: Int64, cOption: CPackingOptionV2,
        wantHandle: WantHandle): Int32
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AppExtension.PhotoEditorExtension"
]
public class PhotoEditorExtensionContext <: ExtensionContext {
    init(id: Int64) {
        super(id)
    }

    /*
     * @brief saveEditedContentWithUri(uri: string): Promise<AbilityResult>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AppExtension.PhotoEditorExtension"
    ]
    public func saveEditedContentWithUri(uri: String): AbilityResult {
        unsafe {
            let wantHandle = Want().createWantHandle()
            var errorCode: Int32 = 0
            try (cUri = LibC.mallocCString(uri).asResource()) {
                errorCode = FFIPhotoExtCtxSaveEditedContentWithUri(getID(), cUri.value, wantHandle)
            }
            let result = AbilityResult(errorCode, Want(wantHandle))
            Want.releaseWantHandle(wantHandle)
            checkCodeAndThrow(errorCode)
            return result
        }
    }

    /*
     * @brief saveEditedContentWithImage(pixeMap: image.PixelMap, option: image.PackingOption): Promise<AbilityResult>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AppExtension.PhotoEditorExtension"
    ]
    public func saveEditedContentWithImage(pixelMap: PixelMap, option: PackingOption): AbilityResult {
        unsafe {
            let wantHandle = Want().createWantHandle()
            let cOption = try {
                CPackingOptionV2(option)
            } catch (e: Exception) {
                Want.releaseWantHandle(wantHandle)
                throw e
            }
            var errorCode = FFIPhotoExtCtxSaveEditedContentWithImage(getID(), pixelMap.getID(), cOption, wantHandle)
            cOption.free()
            let result = AbilityResult(errorCode, Want(wantHandle))
            Want.releaseWantHandle(wantHandle)
            checkCodeAndThrow(errorCode)
            return result
        }
    }
}
