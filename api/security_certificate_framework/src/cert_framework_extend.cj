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

package ohos.cert

import ohos.ffi.safeMalloc
import ohos.base.BusinessException
import std.math.numeric.BigInt

extend Bytes {
    func toCfBlob() {
        unsafe {
            if (this.size == 0) {
                throw BusinessException(CertResult.INVALID_PARAMS, "Invalid input parameter.")
            }
            let data = safeMalloc<Byte>(count: this.size)
            let cph = acquireArrayRawData(this)
            memcpy_s(data, UIntNative(this.size), cph.pointer, UIntNative(this.size))
            releaseArrayRawData(cph)
            CfBlob(UInt32(this.size), data)
        }
    }
    func mallocCfBlob() {
        unsafe {
            let ret = safeMalloc<CfBlob>()
            try {
                ret.write(this.toCfBlob())
            } catch (e: Exception) {
                LibC.free(ret)
                throw e
            }
            ret
        }
    }
}

extend Array<Bytes> {
    func toBlobArray() {
        if (this.size == 0) {
            throw BusinessException(CertResult.INVALID_PARAMS, "Invalid input parameter.")
        }
        unsafe {
            let ret = safeMalloc<CfBlob>(count: this.size)
            for (i in 0..this.size) {
                try {
                    ret.write(this[i].toCfBlob())
                } catch (e: Exception) {
                    for (j in 0..i) {
                        ret.read(j).free()
                    }
                    LibC.free(ret)
                    throw e
                }
            }
            CfBlobArray(ret, UInt32(this.size))
        }
    }
    func mallocBlobArray() {
        unsafe {
            let ret = safeMalloc<CfBlobArray>()
            try {
                ret.write(this.toBlobArray())
            } catch (e: Exception) {
                LibC.free(ret)
                throw e
            }
            ret
        }
    }
}

extend String {
    func toCfBlob() {
        unsafe {
            let data = safeMalloc<Byte>(count: this.size + 1)
            let cph = acquireArrayRawData(this.toArray())
            memcpy_s(data, UIntNative(this.size), cph.pointer, UIntNative(this.size))
            releaseArrayRawData(cph)
            data.write(this.size, 0)
            CfBlob(UInt32(this.size + 1), data)
        }
    }
    func mallocCfBlob() {
        unsafe {
            let ret = safeMalloc<CfBlob>()
            try {
                ret.write(this.toCfBlob())
            } catch (e: Exception) {
                LibC.free(ret)
                throw e
            }
            ret
        }
    }
}

extend BigInt {
    func toCfBlob(): CfBlob {
        unsafe {
            let bs = this.toBytes()
            let data = safeMalloc<Byte>(count: bs.size)
            let cph = acquireArrayRawData(bs)
            memcpy_s(data, UIntNative(bs.size), cph.pointer, UIntNative(bs.size))
            releaseArrayRawData(cph)
            CfBlob(UInt32(bs.size), data)
        }
    }
    func mallocCfBlob() {
        unsafe {
            let ret = safeMalloc<CfBlob>()
            try {
                ret.write(this.toCfBlob())
            } catch (e: Exception) {
                LibC.free(ret)
                throw e
            }
            ret
        }
    }
}

extend Array<String> {
    func toCfArray(): CfArray {
        if (this.size == 0) {
            throw BusinessException(CertResult.INVALID_PARAMS, "Invalid input parameter.")
        }
        unsafe {
            let cptr = safeMalloc<CfBlob>(count: this.size)
            for (i in 0..this.size) {
                cptr.write(i, this[i].toCfBlob())
            }
            CfArray(cptr, EncodingFormat.FORMAT_DER, UInt32(this.size))
        }
    }
    func mallocCfArray() {
        unsafe {
            let ret = safeMalloc<CfArray>()
            try {
                ret.write(this.toCfArray())
            } catch (e: Exception) {
                LibC.free(ret)
                throw e
            }
            ret
        }
    }
}
