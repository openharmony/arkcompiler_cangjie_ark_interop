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

package ohos.asset_store

import std.collection.*

/**
 * typedef struct {
 *     uint32_t tag;
 *     Asset_Value value;
 * } AssetAttr;
 */
@C
struct AssetAttr {
    AssetAttr(
        let tag: UInt32,
        let value: AssetBlob
    ) {}

    init(param: AssetParam) {
        this(param.getTag(), param.getValue())
    }
}

/**
 * typedef struct {
 *     uint32_t count;
 *     AssetAttr *attrs;
 * } AssetResult;
 */
@C
struct AssetResult {
    AssetResult(
        let count: UInt32,
        let attrs: CPointer<AssetAttr>
    ) {}
}

/**
 * typedef struct {
 *     uint32_t count;
 *     AssetResult *results;
 * } AssetResultSet;
 */
@C
struct AssetResultSet {
    let count: UInt32 = 0
    let results: CPointer<AssetResult> = CPointer()
    AssetResultSet() {}
}

/*
 * typedef union {
 *     bool boolean;
 *     uint32_t u32;
 *     AssetBlob blob;
 * } Asset_Value;
 *
 * typedef struct {
 *     uint32_t size;
 *     uint8_t *data;
 * } AssetBlob;
 */
@C
struct AssetBlob {
    // union. AssetBlob can hold both 'bool' and 'uint32'
    AssetBlob(
        let size: UInt32,
        let data: CPointer<UInt8>
    ) {}

    init() {
        this.size = 0
        this.data = CPointer()
    }

    init(bool: Bool) {
        // init with bool
        match (Endian.Platform) {
            case Endian.Little => size = if (bool) {
                1
            } else {
                0
            }
            case Endian.Big => size = if (bool) {
                0x01000000
            } else {
                0x00000000
            }
        }
        data = CPointer()
    }

    func toBool() {
        // read bool from union
        match (Endian.Platform) {
            case Endian.Little => this.size != 0
            case Endian.Big => (this.size & 0x01000000) != 0
        }
    }

    init(u32: UInt32) {
        // init with uint32
        this.size = u32
        data = CPointer()
    }

    func toUInt32() {
        // read uint32 from union
        this.size
    }

    init(bytes: Array<Byte>) {
        size = UInt32(bytes.size)
        data = LibC.malloc<Byte>(count: bytes.size)
        if (data.isNull()) {
            throw IllegalMemoryException("Out of Memory!")
        }
        unsafe {
            let ptr = acquireArrayRawData(bytes)
            memcpy_s(data, UIntNative(size), ptr.pointer, UIntNative(size))
            releaseArrayRawData(ptr)
        }
    }

    unsafe func clearAndFree() {
        memset_s(this.data, UIntNative(this.size), 0, UIntNative(this.size))
        LibC.free(this.data)
    }

    func toBytes(): Bytes {
        let ret = Array<Byte>(Int64(this.size), repeat: 0)
        unsafe {
            let ptr = acquireArrayRawData(ret)
            memcpy_s(ptr.pointer, UIntNative(this.size), this.data, UIntNative(this.size))
            releaseArrayRawData(ptr)
        }
        ret
    }
}
