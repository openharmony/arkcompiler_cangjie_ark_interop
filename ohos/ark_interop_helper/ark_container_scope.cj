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

package ohos.ark_interop_helper

foreign func ARKTS_GetCurrentContainerId(): Int32

foreign func ARKTS_CreateContainerScope(id: Int32): CPointer<Unit>

foreign func ARKTS_DestroyContainerScope(scope: CPointer<Unit>): Unit

foreign func ARKTS_EnterContainerScope(scope: CPointer<Unit>): Unit

foreign func ARKTS_ExitContainerScope(scope: CPointer<Unit>): Unit

class ContainerScope {
    static func currentId(): Int32 {
        return unsafe { ARKTS_GetCurrentContainerId() }
    }

    private let handle_: CPointer<Unit>

    init() {
        handle_ = unsafe { ARKTS_CreateContainerScope(currentId()) }
    }

    init(id: Int32) {
        handle_ = unsafe { ARKTS_CreateContainerScope(id) }
    }

    ~init() {
        unsafe { ARKTS_DestroyContainerScope(handle_) }
    }

    func inScope<T>(_: Int32, callback: () -> T): T {
        let _ = unsafe { ARKTS_EnterContainerScope(handle_) }
        let result = callback()
        unsafe { ARKTS_ExitContainerScope(handle_) }
        return result
    }
}
