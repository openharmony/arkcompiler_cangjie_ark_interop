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

package ohos.file_fs

import ohos.ffi.*
import ohos.base.*
import ohos.labels.*
import std.collection.*

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.File.FileIO"
]
public class RandomAccessFile <: RemoteDataLite {
    init(instanceId: Int64) {
        super(instanceId)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop fd: Int32 {
        get() {
            unsafe { FfiOHOSRandomAccessFileGetFd(getID()) }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop filePointer: Int64 {
        get() {
            unsafe { FfiOHOSRandomAccessFileGetFPointer(getID()) }
        }
    }

    /**
     *  @brief setFilePointer(): void
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func setFilePointer(fp: Int64): Unit {
        unsafe { FfiOHOSRandomAccessFileSetFilePointerSync(getID(), fp) }
        return
    }

    /**
     *  @brief close(): void
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func close(): Unit {
        unsafe { FfiOHOSRandomAccessFileClose(getID()) }
        return
    }

    /**
     *  @brief writeSync(buffer: ArrayBuffer | string,
     *                   options?: { offset?: number; length?: number; encoding?: string; }): number
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func write(buffer: String, writeOptions!: WriteOptions = WriteOptions()): Int64 {
        let arr = unsafe { buffer.rawData() }
        write(arr, writeOptions: writeOptions)
    }

    /**
     *  @brief writeSync(buffer: ArrayBuffer | string,
     *                   options?: { offset?: number; length?: number; encoding?: string; }): number
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func write(buffer: Array<Byte>, writeOptions!: WriteOptions = WriteOptions()): Int64 {
        let writeLen: UIntNative = writeOptions.length ?? UIntNative(buffer.size)
        if (writeLen > UIntNative(buffer.size)) {
            throw BusinessException(INVALID_ARGS_CODE, "Invalid argument")
        }
        var writeBytes: Int64 = 0
        unsafe {
            let cBuffer = acquireArrayRawData(buffer)
            let cValue = FfiOHOSRandomAccessFileWrite(getID(), cBuffer.pointer, writeLen, writeOptions.offset ?? 0)
            releaseArrayRawData(cBuffer)
            if (cValue.code != SUCCESS_CODE) {
                FS_LOG.error(getErrorInfo(cValue.code))
                throw BusinessException(cValue.code, getErrorInfo(cValue.code))
            }
            writeBytes = cValue.data
        }
        return writeBytes
    }

    /**
     *  @brief readSync(buffer: ArrayBuffer, options?: { offset?: number; length?: number; }): number
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func read(buffer: Array<Byte>, readOptions!: ReadOptions = ReadOptions()): Int64 {
        let cValue: RetDataI64
        if (buffer.size == 0) {
            return 0
        }
        let cBuffer = safeMalloc<Byte>(count: buffer.size)
        if (readOptions.length.isNone()) {
            cValue = unsafe {
                FfiOHOSRandomAccessFileRead(getID(), cBuffer, UIntNative(buffer.size), readOptions.offset ?? 0)
            }
        } else {
            cValue = unsafe {
                FfiOHOSRandomAccessFileRead(getID(), cBuffer, readOptions.length.getOrThrow(), readOptions.offset ?? 0)
            }
        }
        for (index in 0..cValue.data) {
            let ch = unsafe { cBuffer.read(index) }
            buffer[index] = ch
        }
        unsafe { LibC.free(cBuffer) }
        if (cValue.code != SUCCESS_CODE) {
            FS_LOG.error(getErrorInfo(cValue.code))
            throw BusinessException(cValue.code, getErrorInfo(cValue.code))
        }
        return cValue.data
    }
}
