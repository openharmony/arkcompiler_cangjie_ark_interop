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

package ohos.running_lock

import ohos.base.*
import ohos.ffi.*

foreign {
    func FfiOHOSRunningLockHold(id: Int64, timeout: Int32, ret: CPointer<Int32>): Unit

    func FfiOHOSRunningLockIsHolding(id: Int64, ret: CPointer<Int32>): Bool

    func FfiOHOSRunningLockUnhold(id: Int64, ret: CPointer<Int32>): Unit

    func FfiOHOSRunningLockIsSupported(num_type: Int32, ret: CPointer<Int32>): Bool

    func FfiOHOSRunningLockCreate(name: CString, num_type: Int32, ret: CPointer<Int32>): Int64
}
