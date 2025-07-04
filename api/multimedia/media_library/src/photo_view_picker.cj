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

package ohos.multimedia.photo_accesshelper

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import ohos.ability.*

/**
 * PhotoViewPicker Object
 *
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class PhotoViewPicker {
    let context: UIAbilityContext
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public init(gcontext: UIAbilityContext) {
        context = gcontext
    }

    /**
     * Pull up the photo picker based on the selection mode.
     *
     * @param { PhotoSelectOptions } [option] - represents the options provided in select mode.
     * @returns { PhotoSelectResult } Returns the uris for the selected files.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
     * <br>2. Incorrect parameter types; 3. Parameter verification failed.
     * @throws { BusinessException } 13900042 - Unknown error
     * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func select(
        callback: AsyncCallback<PhotoSelectResult>,
        option!: PhotoSelectOptions = PhotoSelectOptions()
    ): Unit {
        spawn {
            var errCode = 0i32
            let cPhotoSelectOptions = CPhotoSelectOptions(option)
            let ret = unsafe {
                FfiPhotoAccessHelperStartPhotoPicker(context.getID(), cPhotoSelectOptions, inout errCode)
            }
            cPhotoSelectOptions.free()
            if (errCode != SUCCESS_CODE) {
                callback(AsyncError(errCode), None)
            } else {
                let result = ret.toPhotoSelectResult()
                ret.free()
                callback(None, result)
            }
        }
    }
}
