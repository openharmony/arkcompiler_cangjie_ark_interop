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

protected package ohos.common_event_subscribe_info

import ohos.ffi.CArrString

foreign {
    func CJ_SetPermission(id: Int64, value: CString): Unit

    func CJ_SetDeviceId(id: Int64, value: CString): Unit

    func CJ_SetUserId(id: Int64, value: Int32): Unit

    func CJ_SetPriority(id: Int64, value: Int32): Unit

    func CJ_SetBundleName(id: Int64, value: CString): Unit

    func CJ_GetPermission(id: Int64): CString

    func CJ_GetDeviceId(id: Int64): CString

    func CJ_GetUserId(id: Int64): Int32

    func CJ_GetPriority(id: Int64): Int32

    func CJ_GetBundleName(id: Int64): CString

    func CJ_GetEvents(id: Int64): CArrString

    func CJ_CreateCommonEventSubscribeInfo(event: CArrString): Int64
}
