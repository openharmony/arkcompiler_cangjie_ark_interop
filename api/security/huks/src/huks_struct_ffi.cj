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

package ohos.security.huks

import std.collection.ArrayList
import ohos.base.BusinessException

@C
struct OhosHksBlob {
    OhosHksBlob(
        let size: UInt32,
        let data: CPointer<UInt8>
    ) {}

    unsafe static func malloc(size: UInt32): OhosHksBlob {
        let data = CPointer<UInt8>(calloc(UIntNative(size), 1))
        if (data.isNull()) {
            throw IllegalMemoryException("Out of Memory!")
        }
        return OhosHksBlob(size, data)
    }

    unsafe static func mallocFromBytes(data: Bytes) {
        let tmpData = LibC.malloc<UInt8>(count: data.size)
        if (tmpData.isNull()) {
            throw IllegalMemoryException("Out of Memory!")
        }
        let blob = OhosHksBlob(UInt32(data.size), tmpData)
        let ptr = acquireArrayRawData(data)
        memcpy_s(blob.data, UIntNative(data.size), ptr.pointer, UIntNative(data.size))
        releaseArrayRawData(ptr)
        blob
    }

    unsafe func free() {
        LibC.free(this.data)
    }

    func copyToBytes(): Bytes {
        let data = Array<Byte>(Int64(this.size), repeat: 0)
        unsafe {
            let ptr = acquireArrayRawData(data)
            memcpy_s(ptr.pointer, UIntNative(this.size), this.data, UIntNative(this.size))
            releaseArrayRawData(ptr)
        }
        data
    }

    func toString(): String {
        String.fromUtf8(copyToBytes())
    }
}

@C
struct OhosHksParam {
    /**
    struct HksParam {
        uint32_t tag;
        union {
            bool boolParam;
            int32_t int32Param;
            uint32_t uint32Param;
            uint64_t uint64Param;
            struct HksBlob blob;
        };
    };
     */
    OhosHksParam(
        let tag: UInt32,
        let value: OhosHksBlob // offset = 8, because of aligned
    ) {}
}

@C
struct OhosHksParamSet {
    /**
    struct HksParamSet {
    uint32_t paramSetSize;
    uint32_t paramsCnt;
    struct HksParam params[];
    };
     */
    // PLACEHOLDER
    // It‘s an indefinite-length struct and cannot be mapped in Cangjie.
}

const HKS_TAG_TYPE_MASK: UInt32 = 0xF << 28
const HKS_TAG_TYPE_INVALID: UInt32 = 0 << 28
const HKS_TAG_TYPE_INT: UInt32 = 1 << 28
const HKS_TAG_TYPE_UINT: UInt32 = 2 << 28
const HKS_TAG_TYPE_ULONG: UInt32 = 3 << 28
const HKS_TAG_TYPE_BOOL: UInt32 = 4 << 28
const HKS_TAG_TYPE_BYTES: UInt32 = 5 << 28

class HksParamSet {
    var paramSetSize: UInt32
    var paramCnt: UInt32
    // rawbuffer is automatically destructed based on the lifecycle.
    var rawBuffer: CPointer<Byte>
    var paramPtr: CPointer<Byte>

    init(properties: Array<HuksParam>) {
        this.paramCnt = 0
        this.paramSetSize = UInt32(sizeOf<UInt32>() * 2)
        this.rawBuffer = unsafe {
            CPointer<UInt8>(
                calloc(
                    UIntNative(sizeOf<UInt32>() * 2) + UIntNative(sizeOf<OhosHksParam>()) * UIntNative(HKS_PARAM_SET_MAX_CNT),
                    1
                )
            )
        }
        if (this.rawBuffer.isNull()) {
            throw IllegalMemoryException("Out of Memory!")
        }
        this.paramPtr = unsafe { CPointer<Byte>(this.rawBuffer + Int64(this.paramSetSize)) }
        for (p in properties) {
            let tag: UInt32 = p.tag.getValue()
            let maskVal: UInt32 = tag & HKS_TAG_TYPE_MASK
            match {
                case maskVal == HKS_TAG_TYPE_INT => handleInt32(tag, p.value.toInt32())
                case maskVal == HKS_TAG_TYPE_UINT => handleUInt32(tag, p.value.toUInt32())
                case maskVal == HKS_TAG_TYPE_ULONG => handleUInt64(tag, p.value.toUInt64())
                case maskVal == HKS_TAG_TYPE_BOOL => handleBool(tag, p.value.toBool())
                case maskVal == HKS_TAG_TYPE_BYTES => handleBytes(tag, p.value.toBytes())
                case maskVal == HKS_TAG_TYPE_INVALID =>
                    this.clear()
                    throw BusinessException(
                        HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                        "invalid tag type"
                    )
                case _ =>
                    this.clear()
                    throw BusinessException(
                        HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                        "invalid tag type"
                    )
            }
        }
    }

    func handleInt32(tag: UInt32, val: Option<Int32>) {
        match (val) {
            case Some(i32) =>
                if (!this.write(tag, i32)) {
                    this.clear()
                    throw BusinessException(
                        HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                        "properties too big"
                    )
                }
            case _ =>
                this.clear()
                throw BusinessException(
                    HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                    "tag type and value mismatch"
                )
        }
    }

    func handleUInt32(tag: UInt32, val: Option<UInt32>) {
        match (val) {
            case Some(u32) =>
                if (!this.write(tag, u32)) {
                    this.clear()
                    throw BusinessException(
                        HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                        "properties too big"
                    )
                }
            case _ =>
                this.clear()
                throw BusinessException(
                    HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                    "tag type and value mismatch"
                )
        }
    }

    func handleUInt64(tag: UInt32, val: Option<UInt64>) {
        match (val) {
            case Some(u64) =>
                if (!this.write(tag, u64)) {
                    this.clear()
                    throw BusinessException(
                        HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                        "properties too big"
                    )
                }
            case _ =>
                this.clear()
                throw BusinessException(
                    HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                    "tag type and value mismatch"
                )
        }
    }

    func handleBool(tag: UInt32, val: Option<Bool>) {
        match (val) {
            case Some(bool) =>
                if (!this.write(tag, bool)) {
                    this.clear()
                    throw BusinessException(
                        HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                        "properties too big"
                    )
                }
            case _ =>
                this.clear()
                throw BusinessException(
                    HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                    "tag type and value mismatch"
                )
        }
    }

    func handleBytes(tag: UInt32, val: Option<Bytes>) {
        match (val) {
            case Some(bs) =>
                if (!this.write(tag, bs)) {
                    this.clear()
                    throw BusinessException(
                        HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                        "properties too big"
                    )
                }
            case _ =>
                this.clear()
                throw BusinessException(
                    HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                    "tag type and value mismatch"
                )
        }
    }

    func write<T>(tag: UInt32, data: T): Bool where T <: CType {
        if (this.paramCnt + 1 > HKS_PARAM_SET_MAX_CNT) {
            return false
        }
        if (this.paramSetSize + UInt32(sizeOf<OhosHksParam>()) > HKS_PARAM_SET_MAX_SIZE) {
            return false
        }
        unsafe {
            CPointer<UInt32>(this.paramPtr).write(tag)
            CPointer<T>(this.paramPtr + 8).write(data)
            this.paramPtr += Int64(sizeOf<OhosHksParam>())
        }
        this.paramCnt += 1
        this.paramSetSize += UInt32(sizeOf<OhosHksParam>())
        true
    }

    func write(tag: UInt32, data: Bytes): Bool {
        let prepareSize = if (data.isEmpty()) {
            1
        } else {
            data.size
        }
        if (this.paramSetSize + UInt32(sizeOf<OhosHksParam>()) + UInt32(prepareSize) > HKS_PARAM_SET_MAX_SIZE) {
            return false
        }
        let blob: OhosHksBlob = if (data.isEmpty()) {
            // if content is empty, write a null byte
            let byte = LibC.malloc<UInt8>()
            let _blob = OhosHksBlob(1, byte)
            unsafe { _blob.data.write(0) }
            _blob
        } else {
            let blobData = LibC.malloc<UInt8>(count: data.size)
            if (blobData.isNull()) {
                throw IllegalMemoryException("Out of Memory!")
            }
            let _blob = OhosHksBlob(UInt32(data.size), blobData)
            unsafe {
                let src = acquireArrayRawData(data)
                memcpy_s(_blob.data, UIntNative(_blob.size), src.pointer, UIntNative(data.size))
                releaseArrayRawData(src)
            }
            _blob
        }
        this.paramSetSize += blob.size
        // No error occurs during the write operation. The memory is reclaimed after HksParamSet is destructed.
        return write(tag, blob)
    }

    func toPointer(): CPointer<OhosHksParamSet> {
        unsafe {
            CPointer<UInt32>(this.rawBuffer).write(this.paramSetSize)
            CPointer<UInt32>(this.rawBuffer + Int64(sizeOf<UInt32>())).write(this.paramCnt)
            let ptr: CPointer<OhosHksParam> = CPointer<OhosHksParam>(this.rawBuffer + Int64(sizeOf<UInt32>() * 2))
            var offset = Int64(sizeOf<UInt32>() * 2 + UIntNative(this.paramCnt) * sizeOf<OhosHksParam>())
            for (i in 0..Int64(this.paramCnt)) {
                let param: OhosHksParam = ptr.read(i)
                if ((param.tag & HKS_TAG_TYPE_MASK) == HKS_TAG_TYPE_BYTES) {
                    memcpy_s(
                        this.rawBuffer + offset,
                        UIntNative(Int64(UInt32(sizeOf<UInt32>() * 2) + UInt32(sizeOf<OhosHksParam>()) *
                            HKS_PARAM_SET_MAX_CNT) - offset),
                        param.value.data,
                        UIntNative(param.value.size)
                    )
                    offset += Int64(param.value.size)
                }
            }
        }

        return CPointer<OhosHksParamSet>(this.rawBuffer)
    }

    ~init() {
        if (this.rawBuffer.isNotNull()) {
            HksParamSet.clearInner(this.rawBuffer, this.paramCnt)
        }
    }

    func clear() {
        clearInner(this.rawBuffer, this.paramCnt)
        this.rawBuffer = CPointer() // set to null, avoid double free in ~init
    }

    static func clearInner(rawBuffer: CPointer<Byte>, paramCnt: UInt32) {
        unsafe {
            let ptr: CPointer<OhosHksParam> = CPointer<OhosHksParam>(rawBuffer + Int64(sizeOf<UInt32>() * 2))
            for (i in 0..Int64(paramCnt)) {
                let param: OhosHksParam = ptr.read(i)
                if ((param.tag & HKS_TAG_TYPE_MASK) == HKS_TAG_TYPE_BYTES) {
                    param.value.free()
                }
            }
            LibC.free(rawBuffer)
        }
    }
}

class ReadOnlyHksParamSet {
    let rawBuffer: CPointer<Byte>

    init(paramSetSize: UInt32) {
        this.rawBuffer = LibC.malloc<Byte>(count: Int64(paramSetSize))
        if (rawBuffer.isNull()) {
            throw IllegalMemoryException("Out of Memory!")
        }
        unsafe { CPointer<UInt32>(this.rawBuffer).write(paramSetSize) }
    }

    func collectData(): Array<HuksParam> {
        unsafe {
            let paramSetSize: UInt32 = CPointer<UInt32>(this.rawBuffer).read()
            let paramCnt: UInt32 = CPointer<UInt32>(this.rawBuffer + Int64(sizeOf<UInt32>())).read()
            var ptr: CPointer<OhosHksParam> = CPointer<OhosHksParam>(this.rawBuffer + Int64(sizeOf<UInt32>()) * 2)

            let ret = ArrayList<HuksParam>(Int64(paramCnt))

            for (_ in 0..Int64(paramCnt)) {
                let tag = CPointer<UInt32>(ptr).read()
                let dataPtr = CPointer<Byte>(ptr) + 8 // offset = 8
                let maskVal: UInt32 = tag & HKS_TAG_TYPE_MASK
                match {
                    case maskVal == HKS_TAG_TYPE_INT =>
                        let i32 = CPointer<Int32>(dataPtr).read()
                        ret.add(HuksParam(HuksTag.parse(tag), HuksParamValue.Int32Value(i32)))
                    case maskVal == HKS_TAG_TYPE_UINT =>
                        let u32 = CPointer<UInt32>(dataPtr).read()
                        ret.add(HuksParam(HuksTag.parse(tag), HuksParamValue.Uint32Value(u32)))
                    case maskVal == HKS_TAG_TYPE_ULONG =>
                        let u64 = CPointer<UInt64>(dataPtr).read()
                        ret.add(HuksParam(HuksTag.parse(tag), HuksParamValue.Uint64Value(u64)))
                    case maskVal == HKS_TAG_TYPE_BOOL =>
                        let bool = CPointer<Bool>(dataPtr).read()
                        ret.add(HuksParam(HuksTag.parse(tag), HuksParamValue.BooleanValue(bool)))
                    case maskVal == HKS_TAG_TYPE_BYTES =>
                        let bytes = CPointer<OhosHksBlob>(dataPtr).read().copyToBytes()
                        ret.add(HuksParam(HuksTag.parse(tag), HuksParamValue.BytesValue(bytes)))
                    case maskVal == HKS_TAG_TYPE_INVALID => throw BusinessException(
                        HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                        "invalid tag type"
                    )
                    case _ => throw BusinessException(
                        HuksExceptionErrCode.HuksErrCodeIllegalArgument.getValue(),
                        "invalid tag type"
                    )
                }
                ptr += 1
            }
            ret.toArray()
        }
    }

    func toPointer(): CPointer<OhosHksParamSet> {
        return CPointer<OhosHksParamSet>(this.rawBuffer)
    }

    ~init() {
        unsafe {
            LibC.free(this.rawBuffer)
        }
    }
}

@C
struct OhosHksCertChain {
    OhosHksCertChain(
        let certs: CPointer<OhosHksBlob>,
        let certsCount: UInt32
    ) {}
}

@C
struct OhosHksResult {
    OhosHksResult(
        let errorCode: Int32,
        let errorMsg: CString,
        let data: CPointer<UInt8>
    ) {}
}
