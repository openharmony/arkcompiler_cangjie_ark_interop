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

package ohos.file_picker

import ohos.ffi.*
import std.collection.*
import ohos.base.*
import ohos.ability.*

type StageContext = CPointer<Unit>

@C
struct CPickerResult {
    CPickerResult(
        let resultCode: Int32,
        let userSuffixIndex: Int32,
        let isOriginal: Bool,
        let ability_params_stream: CArrString,
        let uriArr: CArrString,
        let photoUris: CArrString
    ) {}

    func toCj(): PickerResult {
        PickerResult(
            resultCode,
            userSuffixIndex,
            isOriginal,
            ability_params_stream.toStringArray(),
            uriArr.toStringArray(),
            photoUris.toStringArray()
        )
    }

    func free(): Unit {
        ability_params_stream.free()
        uriArr.free()
        photoUris.free()
    }
}

foreign func FfiOHOSFilePickerModalPicker(context: StageContext, config: WantHandle, windowName: CString,
    callback: Int64): Int32

func modalPicker(context: UIAbilityContext, config: Want, windowName: ?String, callback: (PickerResult) -> Unit): Unit {
    let ctx = getStageContext(context)
    let hd = config.createWantHandle()
    let wrapper = {
        cpickerResult: CPickerResult =>
        callback(cpickerResult.toCj())
        cpickerResult.free()
    }
    let regCall = Callback1Param<CPickerResult, Unit>(wrapper)
    let wName = if (let Some(name) <- windowName) {
        unsafe { LibC.mallocCString(name) }
    } else {
        CString(CPointer<UInt8>())
    }
    let err = unsafe { FfiOHOSFilePickerModalPicker(ctx, hd, wName, regCall.getID()) }
    unsafe { Want.releaseWantHandle(hd) }
    unsafe { LibC.free(wName) }
    if (err != SUCCESS_CODE) {
        throw BusinessException(err, ERROR_CODE_MAP.get(err) ?? ERROR_CODE_MAP[ErrCode.RESULT_ERROR])
    }
}
