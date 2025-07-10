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

package ohos.common_event_manager

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

foreign {
    func CJ_GetCode(id: Int64): RetDataI32

    func CJ_SetCode(id: Int64, code: Int32): Int32

    func CJ_GetData(id: Int64): RetDataCString

    func CJ_SetData(id: Int64, data: CString): Int32

    func CJ_SetCodeAndData(id: Int64, code: Int32, data: CString): Int32

    func CJ_IsOrderedCommonEvent(id: Int64): RetDataBool

    func CJ_IsStickyCommonEvent(id: Int64): RetDataBool

    func CJ_AbortCommonEvent(id: Int64): Int32

    func CJ_ClearAbortCommonEvent(id: Int64): Int32

    func CJ_GetAbortCommonEvent(id: Int64): RetDataBool

    func CJ_GetSubscribeInfo(id: Int64): RetDataI64

    func CJ_FinishCommonEvent(id: Int64): Int32
}

/**
 * The CommonEventSubscriber module provides APIs for describing the common event subscriber.
 * @relation export interface CommonEventSubscriber
 */
@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Notification.CommonEvent"
]
public class CommonEventSubscriber <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
}
