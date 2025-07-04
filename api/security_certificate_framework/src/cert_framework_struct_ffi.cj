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

import std.math.numeric.BigInt

@C
struct CfEncodingBlob {
    CfEncodingBlob(
        let data: CPointer<Byte>,
        let len: UIntNative,
        let encodingFormat: UInt32
    ) {}

    init() {
        this.data = CPointer()
        this.len = 0
        this.encodingFormat = 0
    }

    func toEncodingBlob(needFree!: Bool = false): EncodingBlob {
        let arr = Array<Byte>(Int64(this.len), repeat: 0)
        unsafe {
            let cph = acquireArrayRawData(arr)
            memcpy_s(cph.pointer, this.len, this.data, this.len)
            releaseArrayRawData(cph)
        }
        if (needFree) {
            this.free()
        }
        EncodingBlob(arr, this.encodingFormat)
    }

    func free() {
        unsafe { LibC.free(this.data) }
    }
}

@C
struct CfBlob {
    CfBlob(
        let len: UInt32,
        let data: CPointer<Byte>
    ) {}
    init() {
        this.len = 0
        this.data = CPointer()
    }
    func toBigInt(needFree!: Bool = false): BigInt {
        let arr = Array<Byte>(Int64(this.len), repeat: 0)
        unsafe {
            let cph = acquireArrayRawData(arr)
            memcpy_s(cph.pointer, UIntNative(this.len), this.data, UIntNative(this.len))
            releaseArrayRawData(cph)
        }
        if (needFree) {
            this.free()
        }
        BigInt(arr)
    }
    func toEncodingDataBlob(needFree!: Bool = false): EncodingBlob {
        let arr = Array<Byte>(Int64(this.len), repeat: 0)
        unsafe {
            let cph = acquireArrayRawData(arr)
            memcpy_s(cph.pointer, UIntNative(this.len), this.data, UIntNative(this.len))
            releaseArrayRawData(cph)
        }
        if (needFree) {
            this.free()
        }
        EncodingBlob(arr, EncodingFormat.FORMAT_DER)
    }
    func toDataBlob(needFree!: Bool = false): DataBlob {
        let arr = Array<Byte>(Int64(this.len), repeat: 0)
        unsafe {
            let cph = acquireArrayRawData(arr)
            memcpy_s(cph.pointer, UIntNative(this.len), this.data, UIntNative(this.len))
            releaseArrayRawData(cph)
        }
        if (needFree) {
            this.free()
        }
        DataBlob(arr)
    }

    func toStringUtf8(needFree!: Bool = false): String {
        try {
            let arr = Array<Byte>(Int64(this.len), repeat: 0)
            unsafe {
                let cph = acquireArrayRawData(arr)
                memcpy_s(cph.pointer, UIntNative(this.len), this.data, UIntNative(this.len))
                releaseArrayRawData(cph)
            }
            return String.fromUtf8(arr).toString()
        } finally {
            if (needFree) {
                this.free()
            }
        }
    }

    func toStringCstr(needFree!: Bool = false): String {
        try {
            if (this.len == 0) {
                return ""
            }
            let lastChar = unsafe { this.data.read(Int64(this.len - 1)) }
            let actualLen = if (lastChar == 0) {
                // sometimes, data is string-with-null, parse as c-string
                Int64(this.len - 1)
            } else {
                // sometimes, data is string-without-null, parse as Array
                Int64(this.len)
            }
            let arr = Array<Byte>(actualLen, repeat: 0)
            unsafe {
                let cph = acquireArrayRawData(arr)
                memcpy_s(cph.pointer, UIntNative(actualLen), this.data, UIntNative(actualLen))
                releaseArrayRawData(cph)
            }
            return String.fromUtf8(arr).toString()
        } finally {
            if (needFree) {
                this.free()
            }
        }
    }
    func toBytes(needFree!: Bool = false): Array<Byte> {
        let arr = Array<Byte>(Int64(this.len), repeat: 0)
        unsafe {
            let cph = acquireArrayRawData(arr)
            memcpy_s(cph.pointer, UIntNative(this.len), this.data, UIntNative(this.len))
            releaseArrayRawData(cph)
        }
        if (needFree) {
            this.free()
        }
        arr
    }
    func free() {
        unsafe { LibC.free(this.data) }
    }
}

@C
struct CfBlobArray {
    CfBlobArray(
        let data: CPointer<CfBlob>,
        let count: UInt32
    ) {}
    init() {
        this.data = CPointer()
        this.count = 0
    }
    func free() {
        for (i in 0..Int64(this.count)) {
            unsafe { this.data.read(i).free() }
        }
        unsafe { LibC.free(this.data) }
    }
}

@C
struct CfArray {
    CfArray(
        let data: CPointer<CfBlob>,
        let format: UInt32,
        let count: UInt32
    ) {}
    init() {
        this.data = CPointer()
        this.format = 0
        this.count = 0
    }
    func toDataBlobArray(needFree!: Bool = false): Array<DataBlob> {
        let arr = Array<DataBlob>(
            Int64(this.count),
            {i => unsafe { this.data.read(i).toDataBlob(needFree: needFree) }}
        )
        if (needFree) {
            unsafe { LibC.free(this.data) }
        }
        arr
    }
    func toStringUtf8Array(needFree!: Bool = false): Array<String> {
        let arr = Array<String>(
            Int64(this.count),
            {i => unsafe { this.data.read(i).toStringUtf8(needFree: true) }}
        )
        if (needFree) {
            unsafe { LibC.free(this.data) }
        }
        arr
    }
    func toX509CRLEntryArray(needFree!: Bool = false): Array<X509CRLEntry> {
        let arr = Array<X509CRLEntry>(
            Int64(this.count),
            {
                i => unsafe {
                    let ptr = CPointer<HcfX509CrlEntry>(this.data.read(i).data)
                    X509CRLEntry(CjX509CrlEntry(ptr))
                }
            }
        )
        if (needFree) {
            unsafe { LibC.free(this.data) }
        }
        arr
    }
    func free() {
        for (i in 0..Int64(this.count)) {
            unsafe { this.data.read(i).free() }
        }
        unsafe { LibC.free(this.data) }
    }
}

@C
struct HcfCertChainData {
    HcfCertChainData(
        let data: CPointer<Byte>,
        let dataLen: UInt32,
        let count: UInt8,
        let format: UInt32
    ) {}
}
