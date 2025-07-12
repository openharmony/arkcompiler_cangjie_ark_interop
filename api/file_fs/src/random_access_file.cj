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

/**
 * Provides APIs for randomly reading and writing a stream. Before invoking any API of RandomAccessFile,
 * you need to use createRandomAccessFile() to create a RandomAccessFile instance.
 *
 * @relation export interface RandomAccessFileOptions
 */
@!APILevel[
    21,
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

    /**
     * FD of the file.
     *
     * @relation readonly fd: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop fd: Int32 {
        get() {
            unsafe { FfiOHOSRandomAccessFileGetFd(getID()) }
        }
    }

    /**
     * Offset pointer to the RandomAccessFile instance.
     *
     * @relation readonly filePointer: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public prop filePointer: Int64 {
        get() {
            unsafe { FfiOHOSRandomAccessFileGetFPointer(getID()) }
        }
    }

    /**
     * Sets the file offset pointer.
     *
     * @relation setFilePointer(filePointer: number): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func setFilePointer(fp: Int64): Unit {
        unsafe { FfiOHOSRandomAccessFileSetFilePointerSync(getID(), fp) }
        return
    }

    /**
     * Closes this RandomAccessFile instance.
     *
     * @relation close(): void;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func close(): Unit {
        unsafe { FfiOHOSRandomAccessFileClose(getID()) }
        return
    }

    /**
     * Write randomAccessFile.
     *
     * @throws { BusinessException } 13900001 - Operation not permitted
     * @throws { BusinessException } 13900004 - Interrupted system call
     * @throws { BusinessException } 13900005 - I/O error
     * @throws { BusinessException } 13900008 - Bad file descriptor
     * @throws { BusinessException } 13900010 - Try again
     * @throws { BusinessException } 13900013 - Bad address
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 13900024 - File too large
     * @throws { BusinessException } 13900025 - No space left on device
     * @throws { BusinessException } 13900034 - Operation would block
     * @throws { BusinessException } 13900041 - Quota exceeded
     * @throws { BusinessException } 13900042 - Unknown error
     * @relation writeSync(buffer: ArrayBuffer | string, options?: WriteOptions): number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.File.FileIO"
    ]
    public func write(buffer: String, writeOptions!: WriteOptions = WriteOptions()): Int64 {
        let arr = unsafe { buffer.rawData() }
        write(arr, writeOptions: writeOptions)
    }

    /**
     * Write randomAccessFile.
     *
     * @throws { BusinessException } 13900001 - Operation not permitted
     * @throws { BusinessException } 13900004 - Interrupted system call
     * @throws { BusinessException } 13900005 - I/O error
     * @throws { BusinessException } 13900008 - Bad file descriptor
     * @throws { BusinessException } 13900010 - Try again
     * @throws { BusinessException } 13900013 - Bad address
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 13900024 - File too large
     * @throws { BusinessException } 13900025 - No space left on device
     * @throws { BusinessException } 13900034 - Operation would block
     * @throws { BusinessException } 13900041 - Quota exceeded
     * @throws { BusinessException } 13900042 - Unknown error
     * @relation writeSync(buffer: ArrayBuffer | string, options?: WriteOptions): number;
     */
    @!APILevel[
        21,
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
     * Reads data from a file.
     *
     * @throws { BusinessException } 13900004 - Interrupted system call
     * @throws { BusinessException } 13900005 - I/O error
     * @throws { BusinessException } 13900008 - Bad file descriptor
     * @throws { BusinessException } 13900010 - Try again
     * @throws { BusinessException } 13900013 - Bad address
     * @throws { BusinessException } 13900019 - Is a directory
     * @throws { BusinessException } 13900020 - Invalid argument
     * @throws { BusinessException } 13900034 - Operation would block
     * @throws { BusinessException } 13900042 - Unknown error
     * @throws { BusinessException } 13900044 - Network is unreachable
     * @relation readSync(buffer: ArrayBuffer, options?: ReadOptions): number;
     */
    @!APILevel[
        21,
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
