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

package ohos.cert_manager

import ohos.base.BusinessException

extend Bytes {
    func toCmBlob() {
        if (this.size == 0) {
            throw BusinessException(ErrorCode.PARAM_ERROR, "Invalid input parameter.")
        }
        let data = LibC.malloc<Byte>(count: this.size)
        if (data.isNull()) {
            throw IllegalMemoryException("Out of Memory!")
        }
        unsafe {
            let cph = acquireArrayRawData(this)
            memcpy_s(data, UIntNative(this.size), cph.pointer, UIntNative(this.size))
            releaseArrayRawData(cph)
        }
        CmBlob(UInt32(this.size), data)
    }
}

extend String {
    func toCmBlob() {
        let data = LibC.malloc<Byte>(count: this.size + 1)
        if (data.isNull()) {
            throw IllegalMemoryException("Out of Memory!")
        }
        unsafe {
            let cph = acquireArrayRawData(this.toArray())
            memcpy_s(data, UIntNative(this.size), cph.pointer, UIntNative(this.size))
            releaseArrayRawData(cph)
            data.write(this.size, 0)
        }
        CmBlob(UInt32(this.size + 1), data)
    }
}
