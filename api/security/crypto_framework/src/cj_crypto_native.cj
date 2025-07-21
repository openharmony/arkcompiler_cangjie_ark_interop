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

package ohos.security.crypto_framework

import ohos.ffi.*
import std.math.numeric.*

@C
struct HcfBlob {
    HcfBlob(
        let head: CPointer<UInt8>,
        let size: UIntNative
    ) {}

    init(blob: DataBlob) {
        unsafe {
            if (blob.data.size == 0) {
                this.head = CPointer<UInt8>()
                this.size = 0
            } else {
                let arr = blob.data
                this.head = safeMalloc<UInt8>(count: arr.size)
                this.size = UIntNative(arr.size)
                let cp = acquireArrayRawData(arr)
                memcpy_s(this.head, this.size, cp.pointer, this.size)
                releaseArrayRawData(cp)
            }
        }
    }

    init(arr: Array<UInt8>) {
        unsafe {
            if (arr.size == 0) {
                this.head = CPointer<UInt8>()
                this.size = 0
            } else {
                this.head = safeMalloc<UInt8>(count: arr.size)
                this.size = UIntNative(arr.size)
                let cp = acquireArrayRawData(arr)
                memcpy_s(this.head, this.size, cp.pointer, this.size)
                releaseArrayRawData(cp)
            }
        }
    }

    func toDataBlob(): DataBlob {
        unsafe {
            if (this.size == 0) {
                return DataBlob([])
            } else {
                let arr = Array<UInt8>(Int64(this.size), repeat: 0)
                let cp = acquireArrayRawData(arr)
                memcpy_s(cp.pointer, UIntNative(this.size), this.head, UIntNative(this.size))
                releaseArrayRawData(cp)
                return DataBlob(arr)
            }
        }
    }

    func free(): Unit {
        unsafe { LibC.free<UInt8>(head) }
    }
}

@C
struct CParamsSpec {
    CParamsSpec(
        let iv: HcfBlob,
        let add: HcfBlob,
        let authTag: HcfBlob
    ) {}
}

@C
struct HcfBigInteger {
    HcfBigInteger(
        let data: CPointer<UInt8>,
        let len: UInt32
    ) {}

    init(value: BigInt) {
        let digits = value.toBytes()
        digits.reverse()
        unsafe {
            if (digits.size == 0) {
                this.data = CPointer<UInt8>()
                this.len = 0
            } else {
                this.data = safeMalloc<UInt8>(count: digits.size)
                this.len = UInt32(digits.size)
                let cp = acquireArrayRawData(digits)
                memcpy_s(this.data, UIntNative(this.len), cp.pointer, UIntNative(this.len))
                releaseArrayRawData(cp)
            }
        }
    }

    func toArray(): Array<UInt8> {
        if (data.isNull()) {
            return []
        }
        let arr = Array<UInt8>(Int64(len), repeat: 0)
        unsafe {
            let cp = acquireArrayRawData(arr)
            memcpy_s(cp.pointer, UIntNative(this.len), this.data, UIntNative(this.len))
            releaseArrayRawData(cp)
        }
        arr.reverse()
        return arr
    }

    func free(): Unit {
        unsafe { LibC.free(data) }
    }
}
