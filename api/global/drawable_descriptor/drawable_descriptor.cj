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

protected package ohos.drawable_descriptor

import ohos.ffi.*
import ohos.base.*
import ohos.labels.*
import ohos.hilog.*

let RES_LOG = HilogChannel(0, 0xD001E00, "CJ-ResourceManager")
/**
 * Use the DrawableDescriptor class to get drawable image.
 *
 * @relation export declare class DrawableDescriptor
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.ArkUI.ArkUI.Full"
]
public class DrawableDescriptor <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
        RES_LOG.info("DrawableDescriptor construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }
}
